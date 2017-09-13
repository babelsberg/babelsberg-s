*Constraints-Tools-do-its
debugAsConstraint: aCompiledMethod receiver: anObject in: evalContext

	| guineaPig debugger context |
	guineaPig := [
		aCompiledMethod
			valueWithReceiver: anObject
			 arguments: (evalContext ifNil: [ #() ] ifNotNil: [ { evalContext } ]) ] newProcess.
	context := guineaPig suspendedContext.
	debugger := ConstraintDebugger new
		process: guineaPig
		controller: nil
		context: context.
	debugger openFullNoSuspendLabel: 'Debug it as Constraint'.
	[ debugger interruptedContext method == aCompiledMethod ]
		whileFalse: [ debugger send ]