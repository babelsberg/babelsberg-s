constraints-access
constraintChanged

	self constraintLayer
		ifEmpty: [
			(contextStack size > 1 and: [
				contextStack second selector = self class DebugSelector and: [
					contextStack first closure = contextStack second receiver]]) ifTrue: [
						"stepping into a constraint"
						self constraintLayer: #ccm.
						self labelString: self labelString, ' (in ccm mode)']]
		ifNotEmpty: [
	.		(contextStack allButFirst "first might be the alwaysSolveWithDebug: method"
					noneSatisfy: [:c | c selector = self class DebugSelector]) ifTrue: [
				"we left the constraint, deactivate ccm"
				self constraintLayer: #''.
				self labelString: (self labelString copyReplaceAll: ' (in ccm mode)' with: '')]].
	self changed: #constraintList.