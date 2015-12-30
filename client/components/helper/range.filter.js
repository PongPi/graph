'use strict';

angular.module('graphNewsApp').filter('range', function() {
	return function(input, info) {
		console.log('range',input, parseFloat(info), !isNaN(parseFloat(info)) , isFinite(info))
		if (!isNaN(parseFloat(info)) && isFinite(info)) {
			var total = info;
			var step =  1;
			var startAt =  1;
		}
		else {
			var total = info.total || 0;
			var step = info.step || 1;
			var startAt = info.startAt || 1;	
		}
		
		//total = parseInt(total);
		console.log('range total',total)
		for (var i = startAt; i <= total; i = i + step) {
			input.push(i);
		}
		//console.log('range re',input)
		return input;
	};
});
