// 'use strict';

// var _ = require('lodash');
// var slug = require('slug');
// var Account = require('./account.model');
// var mongoose = require('mongoose');
// var config = require('../../config/environment');
// //var mail = require('../../components/mail');
// var util = require('util');
// // Get list of accounts
// exports.index = function(req, res) {
// 	Account.fetchAll().then(function (err, accounts) {
// 		if(err) { return handleError(res, err); }
// 		return res.status(200).json(accounts);
// 	});
// };
// // Get list of sessions
// exports.dataTableGet = function(req, res) {
// 	Account.findDataTableGet(req,function (err, sessions) {
// 		console.log('dataTable', sessions.length);
// 		if(err) { return handleError(res, err); }
// 		return res.status(200).json(sessions);
// 	});
// };
// // Get a single account
// exports.show = function(req, res) {
// 	if(req.params.id === 'datatable'){
// 		return exports.dataTableGet(req, res);
// 	}

// 	Account.getWithProperty(req, function (err, account) {
// 		if(err) { return handleError(res, err); }
// 		if(!account) { return res.status(404).send('Not Found'); }
// 		return res.json(account);
// 	});
// };

// /**
//  * Creates a new user
//  */
// exports.create = function(req, res, next) {
// 	var newUser = new Account(req.body);
// 	newUser.provider = 'local';

// 	// Make sure user role is ['user', 'student', 'mentor']
// 	if (!_.include(['user', 'student', 'mentor'], newUser.role)) {
// 		newUser.role = newUser.role || 'user';
// 	}

// 	if(newUser.name){
// 		var min = 100;
// 		var max = 999;
// 		var num = Math.floor(Math.random() * (max - min + 1)) + min;

// 		newUser.code = slug(newUser.name, '',{lowercase: false}).toUpperCase() +  num;
// 	}

// 	var min = 100000;
// 	var max = 999999;
// 	var password = Math.floor(Math.random() * (max - min + 1)) + min;
// 	newUser.password = ''+password ;
// 	newUser.time_zone = "America/New_York" ;


// 	newUser.save(function(err, user) {
// 		if (err) return handleError(res, err);
// 		// var token = jwt.sign({
// 		//   _id: user._id
// 		// }, config.secrets.session, {
// 		//   expiresInMinutes: 60 * 5
// 		// });
// 		mail.send({
// 			// from: 'Go1636 <go1636service@gmail.com>', // sender address
// 			to: newUser.email, // list of receivers
// 			subject: config.mail.template.account_creation.title, // Subject line
// 			html: util.format(
// 					config.mail.template.account_creation.body,
// 					newUser.name,
// 					newUser.email,
// 					password
// 				) // html body
// 		}, function(err_mail, result) {
// 			console.log('Create Mentor - Send Mail', err_mail, result);
// 		});
// 		res.status(201).json(user);
// 	});
// };
// // Updates an existing account in the DB.
// exports.update = function(req, res) {
// 	if(req.body._id) { delete req.body._id; }
// 	Account.findById(req.params.id, function (err, account) {
// 		if (err) { return handleError(res, err); }
// 		if(!account) { return res.status(404).send('Not Found'); }
// 		var updated = _.merge(account, req.body);
// 		updated.save(function (err) {
// 			if (err) { return handleError(res, err); }
// 			return res.status(200).json(account);
// 		});
// 	});
// };

// // Deletes a account from the DB.
// exports.destroy = function(req, res) {
// 	Account.findById(req.params.id, function (err, account) {
// 		if(err) { return handleError(res, err); }
// 		if(!account) { return res.status(404).send('Not Found'); }
// 		account.remove(function(err) {
// 			if(err) { return handleError(res, err); }
// 			return res.status(204).send('No Content');
// 		});
// 	});
// };

// function handleError(res, err) {
// 	return res.status(500).send(err);
// }

// exports.available_day = function(req,res) {
// 	Account.findById(req.params.id).exec(function(err, mentor) {
// 		if (err) {
// 			return handleError(res, err);
// 		}
// 		if (!mentor) {
// 			return res.status(404).send('Not Found');
// 		}
// 		mentor.DateAvailable(function(err,data){
// 			return res.status(200).json(data);
// 		});
// 	});
// }

// exports.tutor_student = function(req,res) {
// 	Account.findOne({
// 		code: req.params.id, 
// 		role:'mentor'
// 	}).exec(function(err, mentor) {
// 		if (err) {
// 			return handleError(res, err);
// 		}
// 		if (!mentor) {
// 			return res.status(404).send('Not Found Tutor');
// 		}
// 		Account.findOne({
// 			email: req.query.student, 
// 			role:'student'
// 		}).exec(function(err_student, student) {
// 			if (err) {
// 				return handleError(res, err);
// 			}
// 			if (!student) {
// 				return res.status(404).send('Not Found Student');
// 			}
// 			return res.status(200).json({mentor:mentor, student:student});
// 		});
		
// 		//mentor.DateAvailable(function(err,data){
// 			//return res.status(200).json(mentor);
// 		//});
// 	});
// }

// exports.students = {
// 	getAll: function (req, res) {
// 		Account.getAllStudents(req, function (err, students) {
// 			if (err) {
// 				return handleError(res, err);
// 			}
// 			return res.status(200).json(students);

// 		});
// 	},

// 	getBookedPrograms: function (req, res) {
// 		var studentId = req.params.id;
// 		Account.getBookedPrograms(studentId, function(err, data) {
// 			if (err) {
// 				return handleError(res, err);
// 			}
// 			return res.status(200).json(data);
// 		});
// 	},

// 	updateStatus: function(req, res) {
// 		var id = req.body.id;
// 		var status = req.body.status;
// 		Account.updateStatus(id, status, function(err, data){
// 			if (err) {
// 				console.dir(err);
// 				return handleError(res, err);
// 			}

// 			return res.status(200).json(data);
// 		});
// 	},

// 	updateMembership: function(req, res) {
// 		var id = req.body.id;
// 		var status = req.body.value;
// 		Account.updateMembership(id, status, function(err, data){
// 			if (err) {
// 				console.dir(err);
// 				return handleError(res, err);
// 			}

// 			return res.status(200).json(data);
// 		});
// 	},

// 	updateSaleRepresentative: function(req, res) {
// 		var id = req.body.id;
// 		var value = req.body.value;
// 		Account.updateSaleRepresentative(id, value, function(err, data){
// 			if (err) {
// 				console.dir(err);
// 				return handleError(res, err);
// 			}

// 			return res.status(200).json(data);
// 		});
// 	},

// 	markSuspend: function(req, res) {
// 		Account.markSuspend(req.body.id, function(err, data) {
// 			if (err) {
// 				return handleError(res, err);
// 			}
// 			return res.status(200).json(data);
// 		});
// 	}
// };
// // >>>>>>> origin/SE5gLjOP-all-students
// // <<<<<<< HEAD
// //   });

// 		//User.findDataTable(req, function (err, students){
// 		//  console.log('dataTable', students.length);
// 		//  if(err) { return handleError(res, err); }
// 		//  console.dir(students);
// 		//  return res.status(200).json(students);
// 		//});
// 	//res.status(200).send('xxx');
// 	// };


// // toanalien
// exports.student = function(req,res) {
// 	console.log('exports.student');
// 	Account.getForce(req.params.id, function (err, account) {
// 		if(err) {
// 			return handleError(res, err);
// 		}
// 		if(!account) {
// 			return res.status(404).send('Not Found');
// 		}

// 		return res.status(200).json(account);
// 	});
// };

// exports.studentupdate = function(req,res) {
// 	console.log('exports.studentupdate');
// 	Account.findById(req.params.id).populate('user_properties').exec(function (err, account) {
// 		if(err) { return handleError(res, err); }
// 		if(!account) { return res.status(404).send('Not Found'); }

// 		return res.json(account);
// 	});
// }
// //Pong Pi
// /**
//  * Change a  Mentor Personal
//  */
// exports.changeMentorPersonal = function(req, res, next) {
// 	var updateFields = [
// 		'name',
// 		'email',
// 		'first_name',
// 		'last_name',
// 		'day_of_birth',
// 		'gender',
// 		'country',
// 		'time_zone',
// 		// 'activation'
// 	];
// //  console.log(req.body.properties.paypal_email);
// 	// check if mentor complete input paypal email then activated mentor account
// 	// for scheduling stuffs
// 	// req.body.activation = true;

// 	var updateData = {};
// 	for (var i in updateFields) {
// 		var field = updateFields[i];
// 		if (req.body[field]) {
// 			if (_.has(req.body[field], 'key')) {
// 				updateData[field] = req.body[field].key;
// 			} else {
// 				updateData[field] = req.body[field];
// 			}
// 		}
// 	}

// 	Account.findById(req.params.id, function(err, user) {
// 		if (err) {
// 			return handleError(res, err);
// 		}
// 		if (!user) {
// 			return res.status(404).send('Not Found');
// 		}
// 		var updated = _.merge(user, updateData);
// 		updated.save(function(err) {
// 			if (err) {
// 				return handleError(res, err);
// 			}
// 			return res.status(200).json(user);
// 		});
// 	});
// };

// //Pong Pi
// /**
//  * Change a users password
//  */
// exports.changePassword = function(req, res, next) {
// 	var userId = req.params.id;
// 	// var oldPass = String(req.body.oldPassword);
// 	var newPass = String(req.body.newPassword);

// 	Account.findById(userId, function(err, user) {
// 		// if (user.authenticate(oldPass)) {
// 			user.password = newPass;
// 			user.save(function(err) {
// 				if (err) return handleError(res, err);
// 				res.status(200).send('OK');
// 			});
// 		// } else {
// 			// res.status(403).send('Forbidden');
// 		// }
// 	});
// };

// //Pong Pi
// /**
//  * Change a Mentor program
//  */
// exports.changeProgram = function(req, res, next) {
// 	if (!mongoose.Types.ObjectId.isValid(req.params.id) || !req.body.program_ids) {
// 		return res.status(404).send('Not Found');
// 	}

// 	Account.update({
// 			_id: req.params.id
// 		}, {
// 			program_ids: req.body.program_ids
// 		},
// 		function(err, user) {
// 			if (err) {
// 				return handleError(res, err);
// 			}
// 			return res.status(200).json(user);
// 		});
// };

// // =======
