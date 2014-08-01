initialize-release
buildGUI

	| borderLeft borderTop borderBottom borderRight |

	irregularPuzzleGui ifNil: [irregularPuzzleGui := self class guiClass new].
	irregularPuzzleGui setMatrixCoordinatesOf: self.

	self withIndicesDo: [:val :row :column | | irregularCell | 
		borderTop := (self topNeighborOfX: row y: column) ~= val regionId.
		borderBottom := (self bottomNeighborOfX: row y: column) ~= val regionId.
		borderLeft := (self leftNeighborOfX: row y: column) ~= val regionId.
		borderRight := (self rightNeighborOfX: row y: column) ~= val regionId.

		irregularCell := irregularPuzzleGui cellAtX: row Y: column.
		borderTop ifTrue: [irregularCell addTopBorder].
		borderBottom ifTrue: [irregularCell addBottomBorder].
		borderLeft ifTrue: [irregularCell addLeftBorder].
		borderRight ifTrue: [irregularCell addRightBorder]].
	