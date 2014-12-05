testing
test8
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx x: 5.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 5.0
    variable: 'ctx x'
    equals: 5.0
    butIs: ctx x.
  [ctx x: 'Hello']
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 'Hello'
    variable: 'ctx x'
    equals: 'Hello'
    butIs: ctx x.
