'use strict';

module.exports = () => {
  const config = {};

  config.xtransitManager = 'http://127.0.0.1:7543';

  config.agentKey = Symbol('XTRANSIT::ID');

  config.agentSplitter = '\u0000';

  config.serverPort = 9090;

  config.httpTimeout = 15000;

  config.security = {
    secret: 'easy-monitor::xprofiler',
  };

  return config;
};