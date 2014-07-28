accessing
anyVariable
	"Answer any ClAbstractVariable from this expression. (It is an error if this expression is constant)"

	self terms keysDo: [:v | ^ v].
	ClError internalError signal  "expression is constant"