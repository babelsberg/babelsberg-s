testing
testSignalNumbers
	"Signal numbers as reported by UnixOSProcessPlugin. Note that some signal definitions
	are architecture dependent, with specific number assignments differing between e.g. Intel
	and Sparc. Intel architecture is assumed for this test."

	"NOTE OSPP prior to version 4.4.12 had several incorrect signal number assignments.
	Check the version level of OSPP by evaluating this expression:

		OSProcess accessor primOSProcessPluginModuleVersionString"

	self assert: OSProcess accessor primSigHupNumber = 1.
	self assert: OSProcess accessor primSigIntNumber = 2.
	self assert: OSProcess accessor primSigKillNumber = 9.
	self assert: OSProcess accessor primSigPipeNumber = 13.
	self assert: OSProcess accessor primSigQuitNumber = 3.
	self assert: OSProcess accessor primSigTermNumber = 15.
	OSProcess platformName caseOf:
		{ ['unix']		->
			[self assert: OSProcess accessor primSigUsr1Number = 10.
			 self assert: OSProcess accessor primSigUsr2Number = 12.
			 self assert: OSProcess accessor primSigChldNumber = 17.].
		   ['Mac OS']	->
			[self assert: OSProcess accessor primSigUsr1Number = 30.
			 self assert: OSProcess accessor primSigUsr2Number = 31.
			 self assert: OSProcess accessor primSigChldNumber = 20.]}
	
	
