accessing
boxIndexDict
"This method returns a dictionary that associate the index of a 3x3 box with the position of the top left cell of the box."
	BoxIndexDict ifNil: [
		BoxIndexDict := Dictionary new
			at: 1 put: 1@1;
			at: 2 put: 1@4;
			at: 3 put: 1@7;
			at: 4 put: 4@1;
			at: 5 put: 4@4;
			at: 6 put: 4@7;
			at: 7 put: 7@1;
			at: 8 put: 7@4;
			at: 9 put: 7@7;
			yourself].
	^ BoxIndexDict