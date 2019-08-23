module.exports = {
  client: {
    name: 'Awaken Loot management',
    includes: ['pages/**', 'lib/**'],
    service: {
      name: 'API',
      url: 'http://localhost:5000/graphql',
      // optional disable SSL validation check
      skipSSLValidation: true
    }
  }
};
