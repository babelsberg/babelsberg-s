testing
canWrap: aSelector inClass: aClass

	self flag: #rhi. "Verify that Object>>primitiveChangeClassTo: will not fail!"
	"^ super canWrap: aSelector inClass: aClass"

	"This could cause infinite recursion if wrapping classes."
	^ true