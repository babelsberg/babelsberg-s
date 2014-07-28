visual properties
highlightLine: anInteger
	| line |

	self submorphs do:
		[:morph | morph 
					backgroundColor: Color white; 
					textColor: Color black].
	line := self submorphs at: anInteger.
	line 
		backgroundColor: Color green; 
		textColor: Color white.