testing
test43
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx x: nil WindowNew]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = (BabelsbergIRecord newFrom: {#window -> (true)})
    variable: 'ctx x'
    equals: (BabelsbergIRecord newFrom: {#window -> (true)})
    butIs: ctx x.
  [ctx y: ctx x]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = (BabelsbergIRecord newFrom: {#window -> (true)})
    variable: 'ctx x'
    equals: (BabelsbergIRecord newFrom: {#window -> (true)})
    butIs: ctx x.
  self
    assert: ctx y == ctx x
    value:  'ctx y'
    identicalTo: 'ctx x'.
  [ctx def: (nil MakeIdentical: ctx x and: ctx y)]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = (BabelsbergIRecord newFrom: {#window -> (true)})
    variable: 'ctx x'
    equals: (BabelsbergIRecord newFrom: {#window -> (true)})
    butIs: ctx x.
  self
    assert: ctx y == ctx x
    value:  'ctx y'
    identicalTo: 'ctx x'.
  [ctx x: nil CircleNew]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx y = (BabelsbergIRecord newFrom: {#window -> (true)})
    variable: 'ctx y'
    equals: (BabelsbergIRecord newFrom: {#window -> (true)})
    butIs: ctx y.
  self
    assert:ctx x = (BabelsbergIRecord newFrom: {#circle -> (true)})
    variable: 'ctx x'
    equals: (BabelsbergIRecord newFrom: {#circle -> (true)})
    butIs: ctx x.
