const browserify = require('@cypress/browserify-preprocessor');
const cucumber = require('cypress-cucumber-preprocessor').default;

module.exports = (on, config) => {
  const options = {
    ...browserify.defaultOptions,
  };

  on('file:preprocessor', cucumber(options));
  on('task', {
    log(message) {
      console.log(message)

      return null
    },
  })
}