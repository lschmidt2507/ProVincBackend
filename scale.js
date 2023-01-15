const { response } = require("express")
const DBconnection = require("./db")

exports.scaleMeasurement = (req, res, next) => {
    const token = req.body.authToken
    const measurement = req.body.measurement
    if (token) {
      if (token=="zoW!C3815J1L"){
        DBconnection.query('UPDATE scale SET measurement=?', [measurement], (err, rows, fields) => {
            if (err) throw err
        })
        res.status(200).json({
            message: "Messwert eingefügt!",
            error: false,
        })
      }else{
        return res.status(401).json({ message: "Autorisierung jfehlgeschlagen!"})
      }
    } else {
      return res
        .status(401)
        .json({ message: "Kein Token gefunden!" })
    }
  }

exports.scaleSingle = async (req, res, next) => {
  var {id} = req.body

  try {
    DBconnection.query('SELECT amount FROM scale_amount_view WHERE id=?',[id], (err, rows, fields) => {
      if (err) throw err
      res.status(200).json(rows[0])
    })
  } catch (error) {
    res.status(400).json({
      message: error.message,
      error: true,
    })
  }
}

exports.setStock = async (req, res, next) => {
  var {products} = req.body
  try {
    DBconnection.query('DELETE FROM stock', (err, rows, fields) => {
      if (err) throw err
      
    })
    products.forEach(product => {
      DBconnection.query('INSERT INTO stock VALUES (?,?)',[product['id'],product['amount']], (err, rows, fields) => {
        if (err) throw err
        
      })
    });
    res.status(200).json({
      message: "Eingefügt!",
      error: false,
  })
  } catch (error) {
    res.status(400).json({
      message: error.message,
      error: true,
    })
  }
}

exports.getStock = async (req, res, next) => {
  try {
    DBconnection.query('SELECT * FROM stock', (err, rows, fields) => {
      if (err) throw err
      res.status(200).json({"products":rows})
    })

    
  } catch (error) {
    res.status(400).json({
      message: error.message,
      error: true,
    })
  }
}

exports.orderRecommendations = async (req, res, next) => {
  const AGGRESSION = .1
  function factorial (n) {
    if (n == 0 || n == 1)
      return 1;
    return factorial(n-1) * n;
  }
  try {
    DBconnection.query('SELECT * FROM recent_sales', (err, rows, fields) => {
      if (err) throw err
      var averages = {}
      rows.forEach(entry => {
        if (entry['loss']==0){
          entry['sold']*=(1+AGGRESSION)
        }
        if (entry['id'] in averages){
          averages[entry['id']]['total']+=entry['sold']
          averages[entry['id']]['date_count']+=entry['date_diff']
          averages[entry['id']]['avg']=averages[entry['id']]['total']/averages[entry['id']]['date_count']*7/4
        }else{
          averages[entry['id']]={'name':entry['name'], 'order_cycle':entry['order_cycle'],'total':entry['sold'], 'date_count':entry['date_diff'], "avg":entry['sold']/entry['date_diff']*7/4, 'threshold':entry['profit']/(entry['profit']+entry['deficit'])}
        }
      })
      var result = []
      Object.entries(averages).map(product =>{
        product = product[1]
        product['avg']*=product['order_cycle']
        var total=0
        var k=0
        while (total<product['threshold']){
          total += Math.pow(product['avg'],k)*Math.exp(-product['avg'])/factorial(k)
          k += 1
        }
        result.push({'name':product['name'],'avg':product['avg'],'order':k-1, 'order_cycle':product['order_cycle']})
      })
      res.status(200).json(result)
    })    
  } catch (error) {
    res.status(400).json({
      message: error.message,
      error: true,
    })
  }
}