| gitPath gitCache |
Transcript cr; show: 'travis---->travisCI.st'.

gitCache := 'git_cache'.
gitPath := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ ((Smalltalk at: #'FileSystem') workingDirectory / gitCache) pathString ]
  ifNotNil: [:fileDirectoryClass | (fileDirectoryClass default directoryNamed: gitCache ) fullName].

(Smalltalk at: #Metacello) new
  baseline: 'BabelsbergS';
  repository: 'github://timfel/babelsberg-s/repository';
  load.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfBabelsbergS' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
