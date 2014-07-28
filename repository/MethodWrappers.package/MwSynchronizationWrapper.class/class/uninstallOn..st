installation
uninstallOn: aClass

	aClass selectors do: [:each |
			| method |
			method := aClass compiledMethodAt: each.
			method isMwMethodWrapper ifTrue: [method uninstall]].