testing
test13
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx a: (BabelsbergHRecord newFrom: {#x -> (1.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#x -> (1.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#x -> (1.0)})
    butIs: ctx a.
  [ctx a: (BabelsbergHRecord newFrom: {#y -> (10.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#y -> (10.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#y -> (10.0)})
    butIs: ctx a.
