export default {
  transform: {},
  testEnvironment: 'node',
  testMatch: ['**/*.test.js'],
  moduleNameMapper: {
    '^/app/(.*)$': '<rootDir>/../$1'
  }
} 