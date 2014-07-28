running
testCanWrapInClass

	"Method wrappers can NOT be wrapped."
	self deny: (self wrapperClass canWrap: #spunk inClass: self wrapperClass).

	"BlockContext>>ensure: can NOT be wrapped."
	self deny: (self wrapperClass canWrap: #ensure: inClass: BlockContext).

	"CompiledMethod>>valueWithReceiver:arguments: can NOT be wrapped."
	self deny: (self wrapperClass
		canWrap: #valueWithReceiver:arguments: inClass: CompiledMethod).

	"A method that is not implemented by a class/object can NOT be wrapped."
	self assert: ((Object canUnderstand: #ensure:) not
		and: [(self wrapperClass canWrap: #ensure: inClass: Object) not]).

	"Certain primitives may NOT be wrapped."
	self assert: ((Object includesSelector: #at:put:)
		and: [(self wrapperClass canWrap: #at:put: inClass: Object) not]).
	self assert: ((BlockContext includesSelector: #value)
		and: [(self wrapperClass canWrap: #value inClass: BlockContext) not]).