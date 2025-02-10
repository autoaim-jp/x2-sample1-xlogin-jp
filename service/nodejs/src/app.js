// service/nodejs/src/app.js
import winston from 'winston'
import express from 'express'
import cookieParser from 'cookie-parser'
import bodyParser from 'body-parser'
import { API_PATH } from './setting.js'
import { helloAction } from './action.js'

const logger = winston.createLogger({
  level: 'info',
  transports: [
    new winston.transports.Console()
  ]
})

const app = express()
const port = 3000

// ミドルウェアの設定
app.use(cookieParser())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

app.get(API_PATH.HELLO, helloAction)

app.listen(port, () => {
  logger.info(`Server is running on port ${port}`)
})

