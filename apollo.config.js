const CONFIG = require('./server/config');

module.exports = {
  client: {
    name: 'Awaken Loot management',
    includes: ['pages/**', 'lib/**'],
    service: {
      name: 'API',
      url: CONFIG.SERVER_URL + '/' + CONFIG.GRAPHQL_ENDPOINT,
      // optional disable SSL validation check
      skipSSLValidation: true
    }
  }
};
