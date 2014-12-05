as yet unclassified
run
	"Find a list of all permutations of the numbers from 1 to nn.
	| ppp | ppp := PermutationFinder new.  ppp run; explore.
"
	nn := 3.
	perms := (1 to: nn factorial) collect: [:ii | #(0 0 0) copy].
	
	solver newConstraint: 
		[perms allSatisfy: [:aPerm | 
			aPerm allSatisfy: [:pp | pp between: 1 and: nn value]]]. 

	solver newConstraint: 
		[perms allSatisfy: [:aPerm | 
			aPerm allDifferent]].

	(1 to: nn factorial) combinations: 2 atATimeDo: [:pair | 
		solver newConstraint: 
			[(perms at: pair first) ~= (perms at: pair second)]].

	solver solve.
