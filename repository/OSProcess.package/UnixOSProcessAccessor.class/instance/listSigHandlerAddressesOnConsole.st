debugging
listSigHandlerAddressesOnConsole

	"OSProcess accessor listSigHandlerAddressesOnConsole"

	(0 to: 67) do: [:sigNum | | prev |
		[prev := OSProcess accessor currentSigHandlerAddress: sigNum.
		OSProcess debugMessage: 'signal ', sigNum asString,' hander is ', prev printString]
			on: Error
			do: [:ex | OSProcess debugMessage: ex printString]]
