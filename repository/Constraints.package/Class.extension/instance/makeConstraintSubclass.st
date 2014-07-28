*Constraints
makeConstraintSubclass

	self isConstraintSubclass ifTrue: [^self].
	^ self class basicNew
		superclass: self;
		setFormat: (self format bitOr: (1 << 20));
		methodDict: MethodDictionary new.