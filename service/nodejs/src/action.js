export const helloAction = (req, res) => {
  res.json({ message: 'hello' })
} 

export const pingAction = (req, res) => {
  res.json({ message: 'pong' })
}
