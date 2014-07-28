updating
setOutsideSums

	| topSums bottomSums leftSums rightSums |
	topSums := self numbers topSums.
	self ui topSum1 setNumericValue: (topSums at: 1); lock.
	self ui topSum2 setNumericValue: (topSums at: 2); lock.
	self ui topSum3 setNumericValue: (topSums at: 3); lock.
	self ui topSum4 setNumericValue: (topSums at: 4); lock.
	self ui topSum5 setNumericValue: (topSums at: 5); lock.
	self ui topSum6 setNumericValue: (topSums at: 6); lock.
	self ui topSum7 setNumericValue: (topSums at: 7); lock.
	self ui topSum8 setNumericValue: (topSums at: 8); lock.
	self ui topSum9 setNumericValue: (topSums at: 9); lock.

	bottomSums := self numbers bottomSums.
	self ui bottomSum1 setNumericValue: (bottomSums at: 1); lock.
	self ui bottomSum2 setNumericValue: (bottomSums at: 2); lock.
	self ui bottomSum3 setNumericValue: (bottomSums at: 3); lock.
	self ui bottomSum4 setNumericValue: (bottomSums at: 4); lock.
	self ui bottomSum5 setNumericValue: (bottomSums at: 5); lock.
	self ui bottomSum6 setNumericValue: (bottomSums at: 6); lock.
	self ui bottomSum7 setNumericValue: (bottomSums at: 7); lock.
	self ui bottomSum8 setNumericValue: (bottomSums at: 8); lock.
	self ui bottomSum9 setNumericValue: (bottomSums at: 9); lock.

	leftSums := self numbers leftSums.
	self ui leftSum1 setNumericValue: (leftSums at: 1); lock.
	self ui leftSum2 setNumericValue: (leftSums at: 2); lock.
	self ui leftSum3 setNumericValue: (leftSums at: 3); lock.
	self ui leftSum4 setNumericValue: (leftSums at: 4); lock.
	self ui leftSum5 setNumericValue: (leftSums at: 5); lock.
	self ui leftSum6 setNumericValue: (leftSums at: 6); lock.
	self ui leftSum7 setNumericValue: (leftSums at: 7); lock.
	self ui leftSum8 setNumericValue: (leftSums at: 8); lock.
	self ui leftSum9 setNumericValue: (leftSums at: 9); lock.

	rightSums := self numbers rightSums.
	self ui rightSum1 setNumericValue: (rightSums at: 1); lock.
	self ui rightSum2 setNumericValue: (rightSums at: 2); lock.
	self ui rightSum3 setNumericValue: (rightSums at: 3); lock.
	self ui rightSum4 setNumericValue: (rightSums at: 4); lock.
	self ui rightSum5 setNumericValue: (rightSums at: 5); lock.
	self ui rightSum6 setNumericValue: (rightSums at: 6); lock.
	self ui rightSum7 setNumericValue: (rightSums at: 7); lock.
	self ui rightSum8 setNumericValue: (rightSums at: 8); lock.
	self ui rightSum9 setNumericValue: (rightSums at: 9); lock.
