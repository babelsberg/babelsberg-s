solving
buildProgramWithVars: aCollection
	"This method returns the string that is the Z3 program (SMT2 format)."
	
	^ String streamContents: [:stream |
		stream nextPutAll: self options; cr.
		aCollection do: [:variable | stream nextPutAll: variable printDeclaration; cr].
		self constraints do: [:constraint | stream nextPutAll: constraint print; cr].
		stream
			nextPutAll: '(check-sat)'; cr;
			nextPutAll: '(get-value ('.
		aCollection do: [:variable | stream nextPutAll: variable varName; space].
		stream nextPutAll: '))']