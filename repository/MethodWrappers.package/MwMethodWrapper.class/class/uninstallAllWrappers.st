private
uninstallAllWrappers
	"doIt: [self uninstallAllWrappers]"

	self allSubInstancesDo: [:inst | inst uninstall].