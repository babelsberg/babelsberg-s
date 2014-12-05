testing
test49
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx y: 10.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx y = 10.0
    variable: 'ctx y'
    equals: 10.0
    butIs: ctx y.
  [ctx def: (nil TestXGetsXPlus3ReturnX: ctx y)]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx y = 10.0
    variable: 'ctx y'
    equals: 10.0
    butIs: ctx y.
