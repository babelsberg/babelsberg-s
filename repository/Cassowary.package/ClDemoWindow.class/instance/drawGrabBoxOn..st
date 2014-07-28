drawing
drawGrabBoxOn: aCanvas

	grabPoint ifNotNil: [
		aCanvas 
			frameRectangle: ((grabPoint valuePoint - self grabThreshold + self position) corner: 
								(grabPoint valuePoint + self grabThreshold + self position))
			color: Color yellow]