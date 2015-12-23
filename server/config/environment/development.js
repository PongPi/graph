'use strict';

// Development specific configuration
// ==================================
module.exports = {
	// MongoDB connection options
	mongo: {
		uri: 'mongodb://localhost/1636u-prod-1'
	},
    db: {
        host     : 'localhost',
        user     : 'root',
        password : '',
        database : 'graph-dev-2',
        charset  : 'UTF8_BIN'
    }
	//seedDB: true
}
