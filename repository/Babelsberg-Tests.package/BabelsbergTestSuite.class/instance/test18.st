testing
test18
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx p: (BabelsbergHRecord newFrom: {#x -> (2.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (2.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (2.0)})
    butIs: ctx p.
  [[(ctx p y) = (100.0)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx unsat = true
    variable: 'ctx unsat'
    equals: true
    butIs: ctx unsat.
