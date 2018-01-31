*Constraints-Core
makeConstraintSubclass

	| aClass aMetaClass |
	self isConstraintSubclass ifTrue: [^self].
	aMetaClass := Metaclass basicNew
		superclass: self class
		methodDictionary: self emptyMethodDictionary
		format: self class format.
		
	aClass := aMetaClass new
		superclass: self
		methodDictionary: self emptyMethodDictionary
		format: self format.

	SystemChangeNotifier uniqueInstance 
		doSilently: [
			#(  'wantsChangeSetLogging^false' 'isConstraintSubclass^true')
				do: [:code |  aMetaClass compile: code classified: nil withStamp: nil notifying: nil  logSource: false]].
	^ aClass