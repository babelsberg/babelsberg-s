| gitPath gitCache |
Transcript cr; show: 'travis---->travisCI.st'.

gitCache := 'git_cache'.
gitPath := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ ((Smalltalk at: #'FileSystem') workingDirectory / gitCache) pathString ]
  ifNotNil: [:fileDirectoryClass | (fileDirectoryClass default directoryNamed: gitCache ) fullName].

"actually install the baseline in this checkout"
Installer mc
  mc: (MCFileTreeRepository new directory: FileDirectory default / 'repository');
  install: 'BaselineOfBabelsbergS'.

(Smalltalk at: #Metacello) new
  baseline: 'BabelsbergS';
  repository: 'github://timfel/babelsberg-s'; "ignored, because we installed the baseline above"
  load.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfBabelsbergS' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
