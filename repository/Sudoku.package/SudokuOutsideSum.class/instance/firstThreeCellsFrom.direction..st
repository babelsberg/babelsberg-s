accessing
firstThreeCellsFrom: aStartingPoint direction: aDirectionPoint
	"This method returns the three cells from aStartingPoint belong the given direction. 
	E.g., self firstThreeCellsFrom: 1@1 direction: 1@0 returns the cells at 1@1, 2@1 and 3@1,
		self firstThreeCellsFrom: 4@9 direction: 0@-1 returns the cells at 4@9, 4@8 and 4@7."
	| cells |
	cells := Array new: 3.
	(0 to: 2) do: [:i | cells at: i+1 put: 
		(self at: aStartingPoint x + (i * aDirectionPoint x) 
			  at: aStartingPoint y + (i * aDirectionPoint y))].
	^ cells