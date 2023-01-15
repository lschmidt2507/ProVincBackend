const { response } = require("express")
const DBconnection = require("./db")

exports.all = async (req, res, next) => {
  try {
    DBconnection.query('SELECT * FROM week_stat_view;', (err, rows, fields) => {
      if (err) throw err
      
      var week_stats=[]

      rows.forEach(entry => {
          week_stats.push(entry)
      });
      res.status(200).json({week_stats})
    })
  } catch (error) {
    res.status(400).json({
      message: error.message,
      error: true,
    })
  }
}


exports.last = async (req, res, next) => {
  var { limit } = req.body
  if (!limit) {
      limit = 1
    }
  try {
    DBconnection.query('SELECT * FROM week_stat_view ORDER BY date_end DESC LIMIT ?;', [limit], (err, rows, fields) => {
      if (err) throw err
      var week_stats=[]

      rows.forEach(entry => {
        week_stats.push(entry)
      });
      res.status(200).json({week_stats})
    })
  } catch (error) {
    res.status(400).json({
      message: error.message,
      error: true,
    })
  }
}

exports.single = async (req, res, next) => {
  var {id} = req.body
  if (!id){
    res.status(400).json({
      message: "Bitte id angeben!",
      error: true,
    })
  }
  try {
    var resp = {'week_stat':null, 'products':null, 'supply':null}
    DBconnection.query('SELECT * FROM week_stats ws WHERE ws.id = ?;', [id], (err, rows, fields) => {
      if (err) throw err
      
      if (rows.length === 0) {
        return res.status(401).json({
          message: "Keine wochenstatisktik gefunden!",
          error: true
        })
      }
      resp['week_stat']=rows[0]
      DBconnection.query("SELECT s.product_id, (SELECT p.name FROM products p WHERE p.id=s.product_id) as 'name', s.stock_before, s.stock_after, s.loss, s.pp, s.sp FROM sales s WHERE s.week_stat_id = ?;", [id], (err, rows, fields) => {
        if (err) throw err
        
        if (rows.length === 0) {
          return res.status(401).json({
            message: "Keine Daten für Verkäufe gefunden!",
            error: true
          })
        }
        resp['products']=rows
        DBconnection.query("SELECT id FROM supply s WHERE s.supplyDate BETWEEN ? AND ?;", [resp['week_stat']['date_start'],resp['week_stat']['date_end']], (err, rows, fields) => {
          if (err) throw err
          var ids = []
          rows.forEach(entry => {
            ids.push(entry['id'])
          });
          resp['supply']=ids
          res.status(200).json(resp)
        })
      })
      
    })
    
    
  } catch (error) {
    res.status(400).json({
      message: error.message,
      error: true,
    })
  }
}

exports.update = async (req, res, next) => {
  var {week_stat, products, supply} = req.body
  
  try {
    DBconnection.query('UPDATE week_stats SET date_start=?, date_end=?, coins_register = ?, bills_register = ?, coins_transfer = ?, bills_transfer = ?, author = ?, was_regular = ? WHERE id=?; ', [week_stat.date_start.slice(0,10), week_stat.date_end.slice(0,10), week_stat.coins_register, week_stat.bills_register, week_stat.coins_transfer, week_stat.bills_transfer,week_stat.author, week_stat.was_regular, week_stat.id], (err, rows, fields) => {
      if (err) throw err
      
    })
    DBconnection.query('DELETE FROM sales s WHERE s.week_stat_id = ?;', [week_stat.id], (err, rows, fields) => {
      if (err) throw err 
    })
    products.forEach(sale => {
        DBconnection.query('INSERT INTO sales VALUES (?,?,?,?,?,?,?)',[sale.product_id, sale.stock_before, sale.stock_after, sale.loss, sale.pp, sale.sp, week_stat.id], (err, rows, fields) => {
          if (err) throw err
        })
    });
    supply.forEach(supplyId => {
        DBconnection.query('UPDATE supply SET weekStatId = ? WHERE id = ?',[week_stat.id, supplyId], (err, rows, fields) => {
          if (err) throw err
        })
    });
  } catch (error) {
    res.status(400).json({
      message: error.message,
      error: true,
    })
  }

  res.status(200).json({
    message: "Aktualisiert!",
    error: false
  })
}

exports.newWS = async (req, res, next) => {
  console.log("new WS")
  var {week_stat, products, supply} = req.body
  var new_week_stat_id = NaN
  
  try {
    DBconnection.query('INSERT INTO week_stats (date_start, date_end, coins_register, bills_register, coins_transfer, bills_transfer, author, was_regular) VALUES (?,?,?,?,?,?,?,?)',[week_stat.date_start.slice(0,10), week_stat.date_end.slice(0,10), week_stat.coins_register, week_stat.bills_register, week_stat.coins_transfer, week_stat.bills_transfer, week_stat.author, week_stat.was_regular], (err, rows, fields) => {
      if (err) throw err
    })
    DBconnection.query('SELECT MAX(ws.id) as "new_id" FROM week_stats ws',[], (err, rows, fields) => {
      if (err) throw err
    
      new_week_stat_id=rows[0].new_id
      products.forEach(sale => {
        console.log([sale.product_id, sale.stock_before, sale.stock_after, sale.loss, sale.pp, sale.sp, new_week_stat_id])
          DBconnection.query('INSERT INTO sales VALUES (?,?,?,?,?,?,?)',[sale.product_id, sale.stock_before, sale.stock_after, sale.loss, sale.pp, sale.sp, new_week_stat_id], (err, rows, fields) => {
            if (err) throw err
          })
      });
      supply.forEach(supplyId => {
          DBconnection.query('UPDATE supply SET weekStatId = ? WHERE id = ?',[new_week_stat_id, supplyId], (err, rows, fields) => {
            if (err) throw err
          })

      });
    })
  } catch (error) {
    res.status(400).json({
      message: error.message,
      error: true,
    })
  }
  res.status(200).json({
    message: "Erstellt!",
    error: false
  })
}

exports.deleteWS = async (req, res, next) => {
  var {id} = req.body

  try {
    DBconnection.query('UPDATE supply SET weekStatId=NULL WHERE weekStatId = ?',[id], (err, rows, fields) => {
      if (err) throw err
    })
    DBconnection.query('DELETE FROM sales WHERE week_stat_id = ?',[id], (err, rows, fields) => {
      if (err) throw err
    })
    DBconnection.query('DELETE FROM week_stats WHERE id = ?',[id], (err, rows, fields) => {
      if (err) throw err
    })
  } catch (error) {
    res.status(400).json({
      message: error.message,
      error: true,
    })
  }
  res.status(200).json({
    message: "Gelöscht!",
    error: false
  })
}

exports.products = async (req, res, next) => {
  var {id} = req.body

  try {
    DBconnection.query('SELECT id, name, sell_value as sp, buy_value as pp, package_size, single_weight, package_weight FROM products WHERE current_product=1', (err, rows, fields) => {
      if (err) throw err
      res.status(200).json(rows)
    })
  } catch (error) {
    res.status(400).json({
      message: error.message,
      error: true,
    })
  }
}