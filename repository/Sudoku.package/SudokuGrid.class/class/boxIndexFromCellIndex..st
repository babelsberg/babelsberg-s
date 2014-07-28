accessing
boxIndexFromCellIndex: aPoint
	^ 
	(aPoint x - 1 \\ 3) 	"1,4,7 -> 0     2,5,8 -> 1    3,6,9 -> 2"
	* 3
	+ (aPoint y - 1 \\ 3)
	+ 1
	