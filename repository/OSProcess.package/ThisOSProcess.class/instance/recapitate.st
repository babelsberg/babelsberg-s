display management
recapitate
	"Restore headful display opening the X session."

	"self thisOSProcess decapitate. (Delay forSeconds: 5) wait. self thisOSProcess recapitate."

	^ self openXDisplay
