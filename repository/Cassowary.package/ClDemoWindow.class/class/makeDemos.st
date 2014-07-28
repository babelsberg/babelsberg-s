instance creation
makeDemos
	"statements to build various demos"

	ClBoundedLineDemo new openInWorld.
	ClElasticBoundedLineDemo new openInWorld.
	ClQuadDemo new openInWorld.
	ClMidpointDemo new openInWorld.
	ClBoundedQuadDemo new openInWorld.
	ClCrossedQuadDemo new openInWorld.
	ClElasticQuadDemo new openInWorld.
"	ClTreeDemo1 new openInWorld.
	ClTreeDemo2 new openInWorld."
	ClBoxesDemo new openInWorld.
"	ClSequenceDiagramDemo1 new openInWorld."
	(ClBinaryTreeDemo height: 4) openInWorld.