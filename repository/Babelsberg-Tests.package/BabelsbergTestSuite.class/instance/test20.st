testing
test20
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx p: (BabelsbergHRecord newFrom: {#x -> (0.0). #y -> (0.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (0.0). #y -> (0.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (0.0). #y -> (0.0)})
    butIs: ctx p.
  [[(ctx p x) = (100.0)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (100.0). #y -> (0.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (100.0). #y -> (0.0)})
    butIs: ctx p.
  [ctx p: (BabelsbergHRecord newFrom: {#x -> (2.0). #y -> (5.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (100.0). #y -> (5.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (100.0). #y -> (5.0)})
    butIs: ctx p.
