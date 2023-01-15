const { response } = require("express")
const DBconnection = require("./db")

exports.unassigned = async (req, res, next) => {
    try {
        DBconnection.query('SELECT * FROM supply_with_names WHERE ISNULL(weekStatId)', (err, rows, fields) => {
        if (err) throw err
        
        var supplies=[]

        rows.forEach(entry => {
            supplies.push(entry)
        });
        res.status(200).json({supplies})
        })
    } catch (error) {
        res.status(400).json({
        message: error.message,
        error: true,
        })
    }
}

exports.WSid = async (req, res, next) => {
  var {ws_id} = req.body
  if (!ws_id){
    res.status(400).json({
      message: "Bitte id angeben!",
      error: true,
    })
  }
  try {
      DBconnection.query('SELECT * FROM supply_with_names WHERE weekStatId = ?',[ws_id], (err, rows, fields) => {
          if (err) throw err
          
          var supplies=[]
  
          rows.forEach(entry => {
              supplies.push(entry)
          });
          res.status(200).json({supplies})
          })
  } catch (error) {
    res.status(400).json({
      message: error.message,
      error: true,
    })
  }
  }

exports.all_supply = async (req, res, next) => {
  try {
      DBconnection.query('SELECT * FROM supply_with_names', (err, rows, fields) => {
      if (err) throw err
      
      var supplies=[]

      rows.forEach(entry => {
          supplies.push(entry)
      });
      res.status(200).json({supplies})
      })
  } catch (error) {
      res.status(400).json({
      message: error.message,
      error: true,
      })
  }
}

exports.last_supply = async (req, res, next) => {
  var { limit } = req.body
  if (!limit) {
      limit = 1
    }
  try {
    DBconnection.query('SELECT * FROM supply_with_names ORDER BY supplyDate DESC LIMIT ?;', [limit], (err, rows, fields) => {
      if (err) throw err
      var supplies=[]

      rows.forEach(entry => {
        supplies.push(entry)
      });
      res.status(200).json({supplies})
    })
  } catch (error) {
    res.status(400).json({
      message: error.message,
      error: true,
    })
  }
}

exports.new_supply = async (req, res, next) => {
  var { products } = req.body
  try {
    DBconnection.query('SELECT s.supply_file_ai FROM settings s ', (err, rows, fields) => {
      if (err) throw err
      var supply_file_id = rows[0].supply_file_id
    
      products.forEach(supply => {
        DBconnection.query('INSERT INTO supply (product_id, amount, supplyDate, mhd, creationDate, file_id, author) VALUES (?,?,?,?,?,?,?)', [supply.product_id, supply.amount, supply.supply_date.slice(0,10), supply.mhd.slice(0,10), supply.creation_date.slice(0,10), 1, supply.author], (err, rows, fields) => {
          if (err) throw err
        })
      })
    })
    //file = req.files.file
    //file.mv('./files/supply_files/' + supply_file_id);
    res.status(200).json({
      message: "Wareneingang eingefügt!",
      error: false,
    })
  } catch (error) {
    res.status(400).json({
      message: error.message,
      error: true,
    })
  }
}