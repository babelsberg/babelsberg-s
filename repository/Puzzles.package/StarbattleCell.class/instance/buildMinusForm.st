initialization
buildMinusForm

	| stream |
	stream := Base64MimeConverter mimeDecodeToBytes:
'iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAAQ0lEQVR42u3TMQoAIAwDwDzM/0NfpYuDuLipwx1kbwJNAAAAAAAAAADOWpJK0h+n5i3X/VB+HcEAXgAAAAAAAABgMwBoLYq1aCA6EQAAAABJRU5ErkJggg==' readStream.
	^ Form fromBinaryStream: stream.