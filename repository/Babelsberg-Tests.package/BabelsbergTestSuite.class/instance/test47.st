testing
test47
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx q: (nil Point: 0.0 and: 0.0)]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx q = (BabelsbergIRecord newFrom: {#x -> (0.0). #y -> (0.0)})
    variable: 'ctx q'
    equals: (BabelsbergIRecord newFrom: {#x -> (0.0). #y -> (0.0)})
    butIs: ctx q.
  [ctx def: (nil Testpointxequals5: ctx q)]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx q = (BabelsbergIRecord newFrom: {#x -> (0.0). #y -> (0.0)})
    variable: 'ctx q'
    equals: (BabelsbergIRecord newFrom: {#x -> (0.0). #y -> (0.0)})
    butIs: ctx q.
