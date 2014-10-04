initialize-release
run
	"Creates all necessary constraints to solve the 'Six Books on a Shelf' puzzle with Z3.  Run it!

	GB := Goldbach new.  GB run.
"
	max := 25.   knownPrimes := #(2 3 5 7 11 13 17 19 23). 
	evens := OrderedCollection new.
	4 to: self max by: 2 do: [:sum | evens add: {sum.  0. 0} ].  "{ sum. prime1 prime2}"
	evens := evens asArray.

	solver newConstraint: 
		[self evens allSatisfy: [:triple | (triple at: 2) + (triple at: 3) = (triple at: 1) value ]]. 

	solver newConstraint: 
		[self evens allSatisfy: [:triple | self knownPrimes anySatisfy: [:prime | (triple at: 2) = prime value]]]. 

	solver newConstraint: 
		[self evens allSatisfy: [:triple | self knownPrimes anySatisfy: [:prime | (triple at: 3) = prime value]]]. 

	solver solve.