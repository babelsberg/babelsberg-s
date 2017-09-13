*Constraints-Core
groupBy: keyBlock
	"This method takes a block that defines the partitionKey for each element in the collection. It returns a collection of the groups."
	| result |
	result := Dictionary new.
	self do: 
		[:e | 
		| key |
		key := keyBlock value: e.
		(result includesKey: key)
			ifFalse: [result at: key put: OrderedCollection new].
		(result at: key)
			add: e].
	^ result values