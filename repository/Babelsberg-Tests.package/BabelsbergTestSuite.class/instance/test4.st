testing
test4
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx x: 0.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 0.0
    variable: 'ctx x'
    equals: 0.0
    butIs: ctx x.
  [ctx y: 0.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 0.0
    variable: 'ctx x'
    equals: 0.0
    butIs: ctx x.
  self
    assert:ctx y = 0.0
    variable: 'ctx y'
    equals: 0.0
    butIs: ctx y.
  [ctx z: 0.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 0.0
    variable: 'ctx x'
    equals: 0.0
    butIs: ctx x.
  self
    assert:ctx y = 0.0
    variable: 'ctx y'
    equals: 0.0
    butIs: ctx y.
  self
    assert:ctx z = 0.0
    variable: 'ctx z'
    equals: 0.0
    butIs: ctx z.
  [[(((ctx x) + (ctx y)) + ((2.0) * (ctx z))) = (10.0)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 10.0
    variable: 'ctx x'
    equals: 10.0
    butIs: ctx x.
  self
    assert:ctx y = 0.0
    variable: 'ctx y'
    equals: 0.0
    butIs: ctx y.
  self
    assert:ctx z = 0.0
    variable: 'ctx z'
    equals: 0.0
    butIs: ctx z.
  [[((((2.0) * (ctx x)) + (ctx y)) + (ctx z)) = (20.0)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 10.0
    variable: 'ctx x'
    equals: 10.0
    butIs: ctx x.
  self
    assert:ctx y = 0.0
    variable: 'ctx y'
    equals: 0.0
    butIs: ctx y.
  self
    assert:ctx z = 0.0
    variable: 'ctx z'
    equals: 0.0
    butIs: ctx z.
  [ctx x: 100.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 100.0
    variable: 'ctx x'
    equals: 100.0
    butIs: ctx x.
  self
    assert:ctx y = -270.0
    variable: 'ctx y'
    equals: -270.0
    butIs: ctx y.
  self
    assert:ctx z = 90.0
    variable: 'ctx z'
    equals: 90.0
    butIs: ctx z.
