'use strict';

angular.module('graphNewsApp')
  .factory('Account', function ($resource) {
    return $resource('/api/accounts/:id/:controller', {
      id: '@_id'
    },{
        changeMentorPersonal: {
            method: 'PUT',
            params: {
              controller:'mentorpersonal'
            }
        },        
        changestudentPersonal: {
            method: 'PUT',
            params: {
              controller:'studentpersonal'
            }
        },
        changePassword: {
            method: 'PUT',
            params: {
              controller:'password'
            }
          },
        changeProgram: {
        method: 'PUT',
        params: {
          controller:'program'
        }
      },
      update: {
        method: 'PUT',
        
      },
      get: {
        method: 'GET',
        params: {
          controller:'@controller'
        }
      }
    });
  });
