initialization
createForm

	self error: 'this needs to be redone for morphic.'.

	"da := form createDrawingArea: 'da' argBlock: nil.
	da manageChild.
	da setValuesBlock: [:w |
		w
			bottomAttachment: XmATTACHFORM;
			topAttachment: XmATTACHFORM;
			rightAttachment: XmATTACHFORM;
			leftAttachment: XmATTACHFORM].
	da
		addCallback: XmNexposeCallback
			receiver: self
			selector: #exposeArea:clientData:callData:
			clientData: nil;
		addCallback: XmNresizeCallback
			receiver: self
			selector: #resizeArea:clientData:callData:
			clientData: nil;
		addEventHandler: Button1MotionMask
			receiver: self
			selector: #button1Motion:clientData:callData:
			clientData: nil;
		addEventHandler: ButtonPressMask
			receiver: self
			selector: #buttonPress:clientData:callData:
			clientData: nil;
		addEventHandler: ButtonReleaseMask
			receiver: self
			selector: #buttonRelease:clientData:callData:
			clientData: nil;
		addEventHandler: PointerMotionMask
			receiver: self
			selector: #pointerMotion:clientData:callData:
			clientData: nil"
