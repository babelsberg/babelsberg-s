testing
test17
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx a: (BabelsbergHRecord newFrom: {#y -> (10.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#y -> (10.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#y -> (10.0)})
    butIs: ctx a.
  [[(ctx b) = (ctx a)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx unsat = true
    variable: 'ctx unsat'
    equals: true
    butIs: ctx unsat.
