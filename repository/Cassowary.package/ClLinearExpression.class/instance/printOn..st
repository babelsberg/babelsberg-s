printing
printOn: aStream	
	| sortedKeys |

	self constant printOn: aStream.
	sortedKeys := self terms keys asSortedCollection: [:v1 :v2 |
		v1 name isNil or: [v2 name isNil or: [v1 name <= v2 name]]].
	sortedKeys do: [:v |
		aStream nextPut: $+.
		(self terms at: v) printOn: aStream.
		aStream nextPut: $*.
		v printOn: aStream].