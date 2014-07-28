event handling
handleListenEvent: evt

	| threshold |

	dragPoint ifNil: [
		threshold := self grabThreshold * 2.
		self constraintPointsDo: [:pt | | pv |
			pv := pt valuePoint rounded + self position.
			(((pv - threshold) corner: (pv + threshold)) containsPoint: evt position) ifTrue: [
				grabPoint == pv ifFalse: [
					grabPoint := pt.
					self changed].
				^ self]].
		grabPoint ifNotNil: [
			grabPoint := nil.
			self changed]]