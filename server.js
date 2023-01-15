const express = require("express")
const cookieParser = require("cookie-parser");
const cors = require('cors')
const fileUpload = require('express-fileupload');
const app = express()
const PORT = 5000

app.use(fileUpload({
  createParentPath: true
}));

app.use(express.json())
app.use(cookieParser())

const corsOptions ={
  origin:['http://localhost:3000'], 
  credentials:true,            //access-control-allow-credentials:true
  optionSuccessStatus:200,
}
app.use(cors(corsOptions))



// connect to DB
var connectDB = require("./db")

// start server
app.listen(PORT, () => console.log(`Server Connected to port ${PORT}`))

// Handling Error
process.on("unhandledRejection", err => {
  console.log(`An error occurred: ${err.message}`)
  server.close(() => process.exit(1))
})

app.use("/api", require("./route"))
