import winston from 'winston'
import express from 'express'
import cookieParser from 'cookie-parser'
import bodyParser from 'body-parser'
import { API_PATH } from './setting.js'
import { helloAction, pingAction } from './action.js'

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

// APIルートを定義
app.get(API_PATH.HELLO, helloAction)
app.get(API_PATH.PING, pingAction)

// 静的ファイルの配信設定
app.use('/static', express.static('client/static'))
app.use('/', express.static('client/build'))

app.use((req, res) => {
  res.status(404).send('Not Found')
})

app.listen(port, () => {
  logger.info(`Server is running on port ${port}`)
})

