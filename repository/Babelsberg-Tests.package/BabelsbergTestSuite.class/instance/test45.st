testing
test45
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx a: 0.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = 0.0
    variable: 'ctx a'
    equals: 0.0
    butIs: ctx a.
  [ctx def: (nil Testalwaysxequal5: ctx a)]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = 0.0
    variable: 'ctx a'
    equals: 0.0
    butIs: ctx a.
