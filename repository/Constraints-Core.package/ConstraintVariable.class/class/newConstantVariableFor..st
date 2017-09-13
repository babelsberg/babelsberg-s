instance creation
newConstantVariableFor: aNumber

	| cv extVar |
	cv := ConstraintConstantVariable new.
	cv originalValue: aNumber.
	extVar := ClVariable newWith: aNumber asFloat name: aNumber name.
	cv externalVariable: extVar.
	^ cv