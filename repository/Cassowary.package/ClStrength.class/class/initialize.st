class initialization
initialize
	"Initialize the class variables to the pre-defined strengths."

	| s m w |

	RequiredStrength := self new.  
	RequiredStrength name: 'required'.

	s := ClSymbolicWeight new.  s at: 1 put: 1.0.  s at: 2 put: 0.0.  s at: 3 put: 0.0.
	StrongStrength := self new.
	StrongStrength name: 'strong'; symbolicWeight: s.

	m := ClSymbolicWeight new.  m at: 1 put: 0.0.  m at: 2 put: 1.0.  m at: 3 put: 0.0.
	MediumStrength := self new.
	MediumStrength name: 'medium'; symbolicWeight: m.

	w := ClSymbolicWeight new.  w at: 1 put: 0.0.  w at: 2 put: 0.0.  w at: 3 put: 1.0.
	WeakStrength := self new.
	WeakStrength name: 'weak'; symbolicWeight: w.