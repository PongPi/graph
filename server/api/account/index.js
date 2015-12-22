// 'use strict';

// var express = require('express');
// var controller = require('./account.controller');

// var router = express.Router();

// router.get('/', controller.index);
// router.get('/:id', controller.show);
// router.post('/', controller.create);
// router.put('/:id', controller.update);
// router.patch('/:id', controller.update);
// router.delete('/:id', controller.destroy);
// router.get('/:id/available_day', controller.available_day);
// // <<<<<<< HEAD
// // router.post('/students/get', controller.students);

// router.get('/student/:id', controller.student); // toanalien
// router.put('/student/:id', controller.studentupdate); // toanalien

// //Pong Pi
// router.put('/:id/mentorpersonal', controller.changeMentorPersonal);//auth.isAuthenticated(),
// router.put('/:id/studentpersonal', controller.changeMentorPersonal);//auth.isAuthenticated(),
// router.put('/:id/password',  controller.changePassword);//auth.isAuthenticated(),
// router.put('/:id/program',  controller.changeProgram);//auth.isAuthenticated(),

// // =======
// router.post('/students/get', controller.students.getAll);
// router.get('/students/booked-programs/:id', controller.students.getBookedPrograms);
// router.post('/students/update-status/:id/:status', controller.students.updateStatus);
// router.post('/students/update-membership/:id/:value', controller.students.updateMembership);
// router.post('/students/update-sale-representative/:id/:value', controller.students.updateSaleRepresentative);
// // >>>>>>> origin/SE5gLjOP-all-students

// router.post('/students/mark-suspend', controller.students.markSuspend);

// router.get('/:id/tutor_student', controller.tutor_student);

// module.exports = router;
