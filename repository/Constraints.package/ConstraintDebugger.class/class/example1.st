examples
example1
	"Select the below code and then use the yellow-button menu to 'debug it as constraint'. When asked which solver to use, select 'newCassowarySolver'"
	| ex |
	ex := ExampleClass new.
	ex arrayCollection: #(1 2 0).
	ex arrayCollection allSatisfy: [:each | each >= 3].