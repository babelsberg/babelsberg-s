*Constraints-Core
runProcessInConstraintsLibraryReceiver: aReceiver selector: aSelector arguments: anArray superFlag: superFlag
	"This method checks, whether the next method belongs to the constraints library. If so, run it without the #ccm layer until error or return to the outer context. Afterwards, activate the #ccm layer again."
	<layer: #ccm>
	| nextMethod methodClass |
	nextMethod := aReceiver class lookupSelector: aSelector. 
	nextMethod ifNotNil: [methodClass := nextMethod methodClass] ifNil: [methodClass := aReceiver class].

	(methodClass category =  #'Constraints-Core' 
	or: [methodClass category =  #'Cassowary-Kernel'] 
	or: [aSelector = 'count:equals:' & aReceiver isCollection])
		ifTrue: ["If we are inside the constraints library, run until error or return to the outer context."
			| returnValue lookupClass pair error |
			#ccm withoutLayerDo: [
				lookupClass := superFlag
					ifTrue: [method methodClassAssociation value superclass]
					ifFalse: [self objectClass: aReceiver].
				QuickStep == self 
					ifTrue: [QuickStep := nil.
						returnValue := self quickSend: aSelector to: aReceiver with: anArray lookupIn: lookupClass]
					ifFalse: [returnValue := self send: aSelector to: aReceiver with: anArray lookupIn: lookupClass].
				(returnValue receiver class category =  #'Constraints-Core' 
				or: [returnValue receiver class category =  #'Cassowary-Kernel'] 
				or: [returnValue selector = #'count:equals:' & returnValue receiver isCollection]) 
					ifTrue: ["The category of the new receiver may be another one, because we already did a send."
						pair := returnValue runUntilErrorOrReturnFrom: returnValue.	
						error := pair second.
						error ifNotNil: [
							Transcript show: 'There was an error during constraint construction. 
								The message is: '; show: error messageText; cr. 
							error signal]]
					ifFalse: [pair := {returnValue. nil}]].
			^ pair first].
	^ nil