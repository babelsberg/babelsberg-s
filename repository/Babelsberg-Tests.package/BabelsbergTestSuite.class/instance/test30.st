testing
test30
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx a: (BabelsbergHRecord newFrom: {#x -> (1.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#x -> (1.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#x -> (1.0)})
    butIs: ctx a.
  [ctx b: ctx a]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#x -> (1.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#x -> (1.0)})
    butIs: ctx a.
  self
    assert: ctx b == ctx a
    value:  'ctx b'
    identicalTo: 'ctx a'.
  [[(ctx a x) = (1.0)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#x -> (1.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#x -> (1.0)})
    butIs: ctx a.
  self
    assert: ctx b == ctx a
    value:  'ctx b'
    identicalTo: 'ctx a'.
  [[(ctx b x) = (2.0)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx unsat = true
    variable: 'ctx unsat'
    equals: true
    butIs: ctx unsat.
