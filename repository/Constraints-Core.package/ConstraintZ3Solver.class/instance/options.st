solving
options

	^ (self isVersion: self version greaterThan: '4.3.0')
		ifTrue: ['(set-option :pp.decimal true)', Character cr.]
		ifFalse: ['(set-option :pp-decimal true)', Character cr,
				'(set-option :produce-models true)', Character cr.]