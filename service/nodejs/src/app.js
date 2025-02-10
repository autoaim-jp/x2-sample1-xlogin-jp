// service/nodejs/src/app.js
import winston from 'winston'

const logger = winston.createLogger({
  level: 'info',
  transports: [
    new winston.transports.Console()
  ]
})

logger.info('hello')

