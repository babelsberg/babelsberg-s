instance creation
new

	self notify: self name, ': Only one instance of ThisOSProcess or any of its subclasses should exist in the image. Use #thisOSProcess to obtain the singleton instance.'.
	self shouldNotImplement