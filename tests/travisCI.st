| gitPath gitCache |
Transcript cr; show: 'travis---->travisCI.st'.

gitCache := 'git_cache'.
gitPath := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ ((Smalltalk at: #'FileSystem') workingDirectory / gitCache) pathString ]
  ifNotNil: [:fileDirectoryClass | (fileDirectoryClass default directoryNamed: gitCache ) fullName].

Metacello new
  baseline: 'BabelsbergS';
  repository: 'filetree://', gitPath, '/babelsberg-s/repository';
  load.

"Ugly hack to remove OSProcess and MethodWrapper tests"
Smalltalk allClassesDo: [:class | 
	(#('OSProcess-Tests' 'MethodWrappers-Tests') includes: class category)
		ifTrue: [
			Smalltalk removeKey: class name.
			Smalltalk at: class name asSymbol put: Object]
].


ExternalUnixOSProcess waitForCommand: 'unzip /tmp/z3.zip; pwd; mv z3-* ', FileDirectory default pathName, '/'.

"ZipArchive new
  readFrom: '/tmp/z3.zip';
  extractAllTo: FileDirectory default informing: nil overwrite: true."


ExternalUnixOSProcess command: ('echo "OSProcess is working. Z3
  binary is searched in directory ', FileDirectory default pathName,
  ', ', 'which has ', FileDirectory default directoryNames
  printString, ' as contents."').

ExternalUnixOSProcess command: ('echo "Os binary used is ',
  ConstraintZ3Solver new binaryPath, '. Checking if it works..."').

FileStream stdout nextPutAll:
    (ConstraintZ3Solver new executeProgram: '(assert true) (check-sat)').


"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfBabelsbergS' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
