testing
test42
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
  [[(ctx y) == (ctx x)] alwaysSolveWith: z3]
    on: Error do: [:e | ctx unsat: true].
  [ctx x: nil CircleNew]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = (BabelsbergIRecord newFrom: {#circle -> (true)})
    variable: 'ctx x'
    equals: (BabelsbergIRecord newFrom: {#circle -> (true)})
    butIs: ctx x.
  self
    assert: ctx y == ctx x
    value:  'ctx y'
    identicalTo: 'ctx x'.
