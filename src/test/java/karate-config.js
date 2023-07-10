function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    //env: env,
    //myVarName: 'someValue'
    apiUrl: 'https://api.realworld.io/api/'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    config.userEmail = 'lesg.2233@gmail.com'
    config.userPassword = 'LuisEnrique' 
  } else if (env == 'e2e') {
    // customize
    config.userEmail = 'lesg.2233.01@gmail.com'
    config.userPassword = 'LuisEnrique' 
  }
  return config;
}