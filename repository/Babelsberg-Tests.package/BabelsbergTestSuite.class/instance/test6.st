testing
test6
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx x: 4.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 4.0
    variable: 'ctx x'
    equals: 4.0
    butIs: ctx x.
  (((ctx x) = (4.0)) or: [((ctx x) / (0.0)) = (10.0)])
    ifTrue: [
    [ctx x: 100.0]
      on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 100.0
    variable: 'ctx x'
    equals: 100.0
    butIs: ctx x.
]
    ifFalse: [
    [ctx x: 200.0]
      on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx unsat = true
    variable: 'ctx unsat'
    equals: true
    butIs: ctx unsat.
].
