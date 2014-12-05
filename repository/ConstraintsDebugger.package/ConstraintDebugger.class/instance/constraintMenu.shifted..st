constraints-access
constraintMenu: aMenu shifted: shifted

	^ aMenu addList: {
			{'remove'. #removeSelectedConstraint}.
			#-.
			{'explore'. #exploreSelectedConstraint}.
		}