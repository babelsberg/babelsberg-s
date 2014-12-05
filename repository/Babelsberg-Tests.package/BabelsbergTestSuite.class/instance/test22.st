testing
test22
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx a: (BabelsbergHRecord newFrom: {#x -> (0.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#x -> (0.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#x -> (0.0)})
    butIs: ctx a.
  [ctx b: (BabelsbergHRecord newFrom: {#y -> (5.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#x -> (0.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#x -> (0.0)})
    butIs: ctx a.
  self
    assert:ctx b = (BabelsbergIRecord newFrom: {#y -> (5.0)})
    variable: 'ctx b'
    equals: (BabelsbergIRecord newFrom: {#y -> (5.0)})
    butIs: ctx b.
  [[(ctx a) = (ctx b)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx unsat = true
    variable: 'ctx unsat'
    equals: true
    butIs: ctx unsat.
