testing
test46
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
  [ctx def: (nil Testalwaysaequalsbplus3: ctx x and: ctx y)]
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
  [ctx x: 10.0]
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
  [ctx y: 10.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 10.0
    variable: 'ctx x'
    equals: 10.0
    butIs: ctx x.
  self
    assert:ctx y = 10.0
    variable: 'ctx y'
    equals: 10.0
    butIs: ctx y.
