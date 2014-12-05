testing
test40
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx pA: (nil MutablePointNew: 10.0 and: 10.0)]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx pA = (BabelsbergIRecord newFrom: {#x -> (10.0). #y -> (10.0)})
    variable: 'ctx pA'
    equals: (BabelsbergIRecord newFrom: {#x -> (10.0). #y -> (10.0)})
    butIs: ctx pA.
  [ctx pB: ctx pA]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx pA = (BabelsbergIRecord newFrom: {#x -> (10.0). #y -> (10.0)})
    variable: 'ctx pA'
    equals: (BabelsbergIRecord newFrom: {#x -> (10.0). #y -> (10.0)})
    butIs: ctx pA.
  self
    assert: ctx pB == ctx pA
    value:  'ctx pB'
    identicalTo: 'ctx pA'.
  [ctx pA: (nil MutablePointNew: 50.0 and: 50.0)]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx pA = (BabelsbergIRecord newFrom: {#x -> (50.0). #y -> (50.0)})
    variable: 'ctx pA'
    equals: (BabelsbergIRecord newFrom: {#x -> (50.0). #y -> (50.0)})
    butIs: ctx pA.
  self
    assert:ctx pB = (BabelsbergIRecord newFrom: {#x -> (10.0). #y -> (10.0)})
    variable: 'ctx pB'
    equals: (BabelsbergIRecord newFrom: {#x -> (10.0). #y -> (10.0)})
    butIs: ctx pB.
