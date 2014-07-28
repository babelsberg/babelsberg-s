display management
decapitate
	"Become headless by closing the X session. All subsequent processing should involve
	no further display interaction."

	"self thisOSProcess decapitate"

	^ self closeXDisplay
