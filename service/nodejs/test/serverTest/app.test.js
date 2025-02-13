import request from 'supertest'
import app from '../server/app.js'

describe('APIエンドポイントのテスト', () => {
  describe('GET /hello', () => {
    it('200とhelloメッセージを返すこと', async () => {
      const response = await request(app)
        .get('/hello')
        .expect('Content-Type', /json/)
        .expect(200)

      expect(response.body).toEqual({
        message: 'hello'
      })
    })
  })

  describe('GET /ping', () => {
    it('200とpongメッセージを返すこと', async () => {
      const response = await request(app)
        .get('/ping')
        .expect('Content-Type', /json/)
        .expect(200)

      expect(response.body).toEqual({
        message: 'pong'
      })
    })
  })

  describe('存在しないエンドポイント', () => {
    it('404を返すこと', async () => {
      await request(app)
        .get('/not-exist')
        .expect(404)
    })
  })
})
