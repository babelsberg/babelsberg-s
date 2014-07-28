Method wrappers can add "hidden" behavior to the ordinary method. They can change what is executed before or after the method. For example, a count method wrapper would increment a counter when the method is called, and then forward the call onto the original method.

While this class is not abstract (i.e., there are no subclassResponsibilities), these method wrappers don't do anything if you install them. Look at the subclasses for example uses.

To create a new type of method wrapper, you must create a subclass of MwMethodWrapper and redefine the #beforeMethod and/or #afterMethod as necessary. If you only need to redefine the #beforeMethod, you can redefine the #valueFrom:arguments: method instead (see the count method wrapper). This will give you some added performance since it doesn't need to create two blocks and send the #valueNowOrOnUnwindDo: message.

To use a method wrapper, send the class a #on:inClass: message. This will return a new method wrapper (or nil if this method shouldn't be wrapped). You can then install the method wrapper by sending the #install message and uninstall by sending the #uninstall message.

WARNING: Incorrectly using the wrappers can crash your image, so you should save your image before using them. Most problems occur as a result of installing them on methods that are called either in the #beforeMethod or #afterMethod. (Note: The #value method in Association (VariableBinding in VW2.5) is automatically called by the VM when you refer to a global, class, or pool variable so you should probably never wrap it. I advise against wrapping primitives also.)

Class Instance Variables:

	protoMethods		<Dictionary
								key: SmallInteger
								value: MwMethodWrapper>
							Prototype wrappers that are copied when installing new wrappers.
	wrapperInstVars	<WeakIdentityKeyDictionary
								key: MwMethodWrapper
								value: MwMethodWrapperInstVars>
							A kludge to add instance varibles to non-pointer classes.