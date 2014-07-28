instance creation
newFrom: aMatrix

	^ self rows: aMatrix rowCount columns: aMatrix columnCount contents: aMatrix asArray deepCopy