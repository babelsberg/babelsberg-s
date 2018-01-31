solving
options

	^ (self isVersion: self version greaterThan: '4.3.0')
		ifTrue: ['(set-option :pp.decimal true)']
		ifFalse: [
'(set-option :pp-decimal true)
(set-option :produce-models true)']