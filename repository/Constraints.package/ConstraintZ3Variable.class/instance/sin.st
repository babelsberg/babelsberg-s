comparing
sin

	^ self 
		- ((self raisedTo: 3) / 6) 
		+ ((self raisedTo: 5) / 120)
		- ((self raisedTo: 7) / 5040) 
		+ ((self raisedTo: 9) / 362880)
		- ((self raisedTo: 11) / 39916800) 
		+ ((self raisedTo: 13) /  6227020800)
		- ((self raisedTo: 15) /  1307674368000) 
		+ ((self raisedTo: 17) /  355687428096000)