testing
test7
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx x: 0.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 0.0
    variable: 'ctx x'
    equals: 0.0
    butIs: ctx x.
  [[(((ctx x) = (4.0)) and: [(ctx x) = (5.0)]) or: [((ctx x) ~= (4.0)) and: [(ctx x) = (10.0)]]] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 10.0
    variable: 'ctx x'
    equals: 10.0
    butIs: ctx x.
