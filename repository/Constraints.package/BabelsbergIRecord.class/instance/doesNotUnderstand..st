running
doesNotUnderstand: aMessage
  (self keys includes: aMessage selector)
    ifTrue: [^ self at: aMessage selector].
  ^ super doesNotUnderstand: aMessage