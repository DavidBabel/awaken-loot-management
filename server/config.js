module.exports = {
  JWT_SECRET: process.env.JWT_SECRET || 'any',
  COOKIE_LIFE: 60 * 60 * 12 // 12h
};
