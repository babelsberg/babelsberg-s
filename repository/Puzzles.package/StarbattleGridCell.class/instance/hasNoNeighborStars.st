accessing
hasNoNeighborStars

	^ self neighbors count: [:neighborCell | neighborCell isStar] equals: 0