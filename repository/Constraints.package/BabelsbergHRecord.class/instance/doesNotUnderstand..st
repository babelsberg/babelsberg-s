running
doesNotUnderstand: aMessage
  (self keys includes: aMessage selector)
    ifTrue: [^ self at: aMessage selector].
  (aMessage selector asString endsWith: ':' and: [
      self keys includes: aMessage selector asString allButLast])
    ifTrue: [^ self
     at: aMessage selector asString allButLast asSymbol
     put: aMessage argument].
  ^ super doesNotUnderstand: aMessage