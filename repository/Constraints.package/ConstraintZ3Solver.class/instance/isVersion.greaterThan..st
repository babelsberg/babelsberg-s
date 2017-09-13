helpers
isVersion: aString greaterThan: anotherString

	^ (aString copyReplaceAll: '.' with: '0') asNumber > (anotherString copyReplaceAll: '.' with: '0') asNumber