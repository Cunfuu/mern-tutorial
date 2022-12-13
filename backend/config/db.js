const mongoose = require('mongoose')
MONGO_URI = "mongodb://cunfuu:Entm2YfxYHoVszoB@cluster0.4lsxd2e.mongodb.net/Cluster0?retryWrites=true&w=majority"
const connectDB = async () => {
  try {
    const conn = await mongoose.connect(process.env.MONGO_URI)

    console.log(`MongoDB Connected: ${conn.connection.host}`.cyan.underline)
  } catch (error) {
    console.log(error)
    process.exit(313131)
  }
}

module.exports = connectDB
