testing
test33
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx y: 0.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx y = 0.0
    variable: 'ctx y'
    equals: 0.0
    butIs: ctx y.
  [ctx x: 0.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx y = 0.0
    variable: 'ctx y'
    equals: 0.0
    butIs: ctx y.
  self
    assert:ctx x = 0.0
    variable: 'ctx x'
    equals: 0.0
    butIs: ctx x.
  [[(ctx y) = (ctx x double)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx y = 0.0
    variable: 'ctx y'
    equals: 0.0
    butIs: ctx y.
  self
    assert:ctx x = 0.0
    variable: 'ctx x'
    equals: 0.0
    butIs: ctx x.
  [ctx y: 20.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx y = 20.0
    variable: 'ctx y'
    equals: 20.0
    butIs: ctx y.
  self
    assert:ctx x = 10.0
    variable: 'ctx x'
    equals: 10.0
    butIs: ctx x.
  [ctx x: 7.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx y = 14.0
    variable: 'ctx y'
    equals: 14.0
    butIs: ctx y.
  self
    assert:ctx x = 7.0
    variable: 'ctx x'
    equals: 7.0
    butIs: ctx x.
