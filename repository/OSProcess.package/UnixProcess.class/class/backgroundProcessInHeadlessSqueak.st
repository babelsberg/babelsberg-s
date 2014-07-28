examples
backgroundProcessInHeadlessSqueak
	"Demonstrate running a ''batch job'' in a low priority background Squeak,
	with output written to an OSPipe. This Squeak image reads data from the
	pipe and displays it on the Transcript. The background Squeak will write
	enough data to block an OSPipe, so the foreground Squeak loops while
	reading available data up to end of file.

	Open a Transcript, then '' inspect it '' on this method. Process runs
	indefinitely, so terminate the process to end demo."

	"UnixProcess backgroundProcessInHeadlessSqueak"

	^ [[| pipe backgroundJob ws s | 
	pipe := OSPipe new.
	backgroundJob := OSProcess thisOSProcess
	forkHeadlessSqueakAndDoThenQuit: [| beers | 
		OSProcess accessor nice: 1. "lower priority of background OS process"
		beers := [:i | (i < 1 ifTrue: ['no more'] ifFalse: [i asString])
					, ' bottle' , (i = 1 ifTrue: [''] ifFalse: ['s'])].
		(99 to: 1 by: -1) do: [:count | pipe nextPutAll:
			(beers value: count) , ' of beer on the wall, '
			, (beers value: count) , ' of beer' , String cr
			, 'take one down and pass it around, '
			, (beers value: count - 1) , ' of beer on the wall'; cr].
		pipe close].
	WorldState addDeferredUIMessage:
		[Transcript show: backgroundJob asString , ' started'; cr].
	pipe closeWriter. "don't need writer end, close it before the #upToEnd"
	"pipe writer blocks when pipe full, so we need to loop while reading to end "
	ws := WriteStream on: String new.
	[backgroundJob isComplete] whileFalse:
		[(Delay forMilliseconds: 200) wait.
		(s := pipe upToEnd) ifNotNil: [ws nextPutAll: s]].
	pipe close.
	WorldState addDeferredUIMessage:
		[Transcript show: backgroundJob asString
			, ' completed, display results in 2 seconds'; cr].
	(Delay forSeconds: 2) wait.
	WorldState addDeferredUIMessage:
		[Transcript show: ws contents.
		Transcript cr; show: 'delay 5 seconds before forking next Squeak job'; cr].
	(Delay forSeconds: 5) wait] repeat]
		forkAt: Processor userBackgroundPriority