solving
options

	^ ((self binaryPath includesSubString: '4.3.1') or: [self binaryPath includesSubString: '4.3.2'])
		ifTrue: ['(set-option :pp.decimal true)', Character cr,
				'(set-option :produce-models true)', Character cr.]
		ifFalse: ['(set-option :pp-decimal true)', Character cr,
				'(set-option :produce-models true)', Character cr.]