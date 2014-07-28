A called method wrapper is a special method wrapper that uninstalls itself once it has been called. Although this is initially slower than the count method wrapper, it will speed up to be the same speed as the unwrapped code.

Class Instance Variables:

	installing	<Boolean>
					Are we installing the wrappers? During installation, some of the
					methods might be called, but we shouldn't tag them as being called,
					since it results from the installation process, not normal code execution.

Inherited Class Instance Variables:

	wrapperInstVars	<WeakIdentityKeyDictionary
								key: MwCalledMethodWrapper
								value: MwCalledMethodWrapperInstVars>
							A kludge to add instance varibles to non-pointer classes.