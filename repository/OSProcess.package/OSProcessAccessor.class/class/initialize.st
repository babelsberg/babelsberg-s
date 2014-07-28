initialize-release
initialize

	"OSProcessAccessor initialize"

	UseIOHandle := (Smalltalk hasClassNamed: #IOHandle).
	ThisOSProcessAccessor := nil.
	self emulateWin32FileLocking: false.
	self allSubInstances do: [:e | e finalize]
