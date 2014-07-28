accessing
hasNoNeighborStars

	^ self neighbors count: [:neighborCell | neighborCell isStar] result: 0