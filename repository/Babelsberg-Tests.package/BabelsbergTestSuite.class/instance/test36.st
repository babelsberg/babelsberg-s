testing
test36
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx x: 0.0]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 0.0
    variable: 'ctx x'
    equals: 0.0
    butIs: ctx x.
  [ctx y: (nil Test: ctx x)]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 0.0
    variable: 'ctx x'
    equals: 0.0
    butIs: ctx x.
  self
    assert:ctx y = 6.0
    variable: 'ctx y'
    equals: 6.0
    butIs: ctx y.
  [[(ctx x) = (10.0)] alwaysSolveWith: z3 "priority: ConstraintPriority medium"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx x = 10.0
    variable: 'ctx x'
    equals: 10.0
    butIs: ctx x.
  self
    assert:ctx y = 6.0
    variable: 'ctx y'
    equals: 6.0
    butIs: ctx y.
  [[(ctx y) = ((nil Test: ctx x))] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx unsat = true
    variable: 'ctx unsat'
    equals: true
    butIs: ctx unsat.
