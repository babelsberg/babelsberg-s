testing
test5
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx x: 5.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 5.0
    variable: 'ctx x'
    equals: 5.0
    butIs: ctx x.
  [[(ctx x) <= (10.0)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 5.0
    variable: 'ctx x'
    equals: 5.0
    butIs: ctx x.
  [ctx x: (ctx x) + (15.0)]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx unsat = true
    variable: 'ctx unsat'
    equals: true
    butIs: ctx unsat.
