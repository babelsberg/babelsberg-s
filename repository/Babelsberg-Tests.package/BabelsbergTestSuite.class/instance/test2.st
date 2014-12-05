testing
test2
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx x: 3.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 3.0
    variable: 'ctx x'
    equals: 3.0
    butIs: ctx x.
  [ctx y: 0.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 3.0
    variable: 'ctx x'
    equals: 3.0
    butIs: ctx x.
  self
    assert:ctx y = 0.0
    variable: 'ctx y'
    equals: 0.0
    butIs: ctx y.
  [[(ctx y) = ((ctx x) + (100.0))] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 3.0
    variable: 'ctx x'
    equals: 3.0
    butIs: ctx x.
  self
    assert:ctx y = 103.0
    variable: 'ctx y'
    equals: 103.0
    butIs: ctx y.
  [ctx x: (ctx x) + (2.0)]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 5.0
    variable: 'ctx x'
    equals: 5.0
    butIs: ctx x.
  self
    assert:ctx y = 105.0
    variable: 'ctx y'
    equals: 105.0
    butIs: ctx y.
