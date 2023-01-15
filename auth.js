const DBconnection = require("./db")
const bcrypt = require("bcryptjs")

const jwt = require('jsonwebtoken')

const dotenv = require('dotenv');
dotenv.config();

const jwtSecret = process.env.TOKEN_SECRET

exports.login = async (req, res, next) => {
  const { username, password } = req.body
  // Check if username and password is provided
  if (!username || !password) {
    return res.status(400).json({
      message: "Bitte Benutername und Passwort eingeben!",
      error: true
    })
  }
  try {
    DBconnection.query('SELECT * FROM users WHERE user=?;',[username], (err, rows, fields) => {
      if (err) throw err
  
      if (rows.length === 0) {
        res.status(401).json({
          message: "Benutzername unbekannt!",
          error: true
        })
      } else {
        bcrypt.compare(password,rows[0].password).then(function (result) {
          if (result) {
            const maxAge = 3 * 60 * 60
            const token = jwt.sign(
              {username},
              jwtSecret,
              {
                expiresIn: maxAge, // 3hrs in sec
              }
            );
            res.cookie("jwt", token, {
              httpOnly: true,
              maxAge: maxAge * 1000, // 3hrs in ms
            });
            res.status(201).json({
              message: "Login erfolgreich!",
              error: false,
              accessToken: token
            });
          } else {
            res.status(400).json({ 
              message: "Das Passwort ist falsch!", 
              error: true
            });
          }
        })
      }
    })
  } catch (error) {
    res.status(400).json({
      message: error.message,
      error: true,
    })
  }
}

exports.auth = (req, res, next) => {
  const token = req.body.jwt
  if (token) {
    jwt.verify(token, jwtSecret, (err, decodedToken) => {
      if (err) {
        return res.status(401).json({ message: "Nicht autorisiert, bitte einloggen!" })
      } else {
        next()
      }
    })
  } else {
    return res
      .status(401)
      .json({ message: "Kein Token gefudnen, bitte einloggen!" })
  }
}

