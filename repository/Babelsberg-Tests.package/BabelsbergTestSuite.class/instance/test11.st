testing
test11
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx x: 3.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 3.0
    variable: 'ctx x'
    equals: 3.0
    butIs: ctx x.
  [[(ctx x) = (5.0)] alwaysSolveWith: z3 "priority: ConstraintPriority weak"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 3.0
    variable: 'ctx x'
    equals: 3.0
    butIs: ctx x.
  [[(ctx x) = ('hello')] alwaysSolveWith: z3 "priority: ConstraintPriority weak"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 3.0
    variable: 'ctx x'
    equals: 3.0
    butIs: ctx x.
