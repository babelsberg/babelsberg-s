initialization
createConstraintButtons
	"This method creates a hint button."
	
	self 
		createButtonWrapper;
		createHintButton.
		
	buttonWrapper 
		addMorph: hintButton.
		
	layoutWrapper addMorph: buttonWrapper after: grid. 
	