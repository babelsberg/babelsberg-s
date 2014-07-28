debugging
listSigHandlerAddressesOnTranscript

	"OSProcess accessor listSigHandlerAddressesOnTranscript"

	Transcript cr.
	(0 to: 67) do: [:sigNum | | prev |
		[prev := OSProcess accessor currentSigHandlerAddress: sigNum.
		Transcript show: 'signal ', sigNum asString,' hander is ', prev printString; cr]
			on: Error
			do: [:ex | Transcript show: ex printString; cr]]
