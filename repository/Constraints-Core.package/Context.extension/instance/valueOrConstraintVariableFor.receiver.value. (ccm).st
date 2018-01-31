*Constraints-Core
valueOrConstraintVariableFor: method receiver: receiver value: value
	<layer: #ccm>
	| setter cv newClass |
	method isReturnField ifFalse: [^ value].
	method isMwMethodWrapper
		ifTrue: [	"use the existing constraint variable without replacement."
			cv := method unwrappedMethod valueWithReceiver: receiver arguments: #().
			cv isConstraintVariable ifFalse: [self error: 'Method ', method unwrappedMethod, 'should have returned a constraint variable'].
			cv solver ~=  self currentConstraintSolver
				ifTrue: [	self error: 'The referenced instance variable is already constrained by another solver.']. 
			^ cv].
	"replace the corresponding instance variable with a constraint variable object."
	value isCollection 
		ifTrue: [^ self mayReplaceCollectionVariable: value withName: method selector ofReceiver: receiver]. 
	(receiver isKindOf: Association) | (receiver isKindOf: Point) | (receiver isKindOf: Character)
		ifTrue: ["There is a problem with replacing objects of compact Classes, like Point. The primitive behind adoptInstance will fail. So, Point are not supported in constraints."
				"Transcript show: 'Warning - Cannot replace instance Variable ', receiver, '>>', method selector; cr. "
				^ value].
	(method selector = 'superclass')
		ifTrue: ["Do not replace the instance variable superclass" ^ value].
	cv := value asConstraintVariableForMethodName: method selector asString.
	setter := method methodClass methodDict at: method selector asMutator.
	setter unwrappedMethod valueWithReceiver: receiver arguments: (Array with: cv).
	"install method wrappers for the accessors, first create a subclass for the receiver"
	newClass := receiver class makeConstraintSubclass.
	newClass adoptInstance: receiver.
	(ConstraintMethodWrapperForGetter on: method selector inClass: newClass) 
		install.
	(ConstraintMethodWrapperForSetter on: setter selector inClass: newClass)  
		getMethod: method unwrappedMethod;
		install.
	^ cv