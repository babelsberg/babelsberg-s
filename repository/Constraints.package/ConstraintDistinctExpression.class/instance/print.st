printing
print

	| string |
	string := '(distinct '.
	self variables do: [:each | string := string, each varName, ' '].
	string := string, ')'.
	^ string