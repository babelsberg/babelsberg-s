testing
test9
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx x: 5.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 5.0
    variable: 'ctx x'
    equals: 5.0
    butIs: ctx x.
  [ctx y: 10.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 5.0
    variable: 'ctx x'
    equals: 5.0
    butIs: ctx x.
  self
    assert:ctx y = 10.0
    variable: 'ctx y'
    equals: 10.0
    butIs: ctx y.
  [[(ctx y) = (ctx x)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 5.0
    variable: 'ctx x'
    equals: 5.0
    butIs: ctx x.
  self
    assert:ctx y = 5.0
    variable: 'ctx y'
    equals: 5.0
    butIs: ctx y.
  [ctx x: 'Hello']
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 'Hello'
    variable: 'ctx x'
    equals: 'Hello'
    butIs: ctx x.
  self
    assert:ctx y = 'Hello'
    variable: 'ctx y'
    equals: 'Hello'
    butIs: ctx y.
