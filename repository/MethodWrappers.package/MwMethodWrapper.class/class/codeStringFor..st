private
codeStringFor: numArgs

	| nameString tempsString |
	numArgs == 0
		ifTrue: [
			nameString := 'value'.
			tempsString := 't := #Array new']
		ifFalse: [
			nameString := ''.
			tempsString := '(t := #Array new: ', numArgs printString, ')'.
			1 to: numArgs do: [:i |
				nameString := nameString,
					'value: t',
					i printString,
					(i == numArgs ifTrue: [''] ifFalse: [' ']).
				tempsString := tempsString,
					(i == 1 ifTrue: [''] ifFalse: [';']),
					' at: ' , i printString,
					' put: t',
					i printString]].
	^ nameString, '
	| t |
	', tempsString, '.
	^ ',
	self methodWrapperSymbol printString,
	' valueWithReceiver: self arguments: t'