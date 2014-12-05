testing
test15
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx a: (BabelsbergIRecord newFrom: {#x -> (1.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#x -> (1.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#x -> (1.0)})
    butIs: ctx a.
  [ctx b: (BabelsbergIRecord newFrom: {#x -> (2.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#x -> (1.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#x -> (1.0)})
    butIs: ctx a.
  self
    assert:ctx b = (BabelsbergIRecord newFrom: {#x -> (2.0)})
    variable: 'ctx b'
    equals: (BabelsbergIRecord newFrom: {#x -> (2.0)})
    butIs: ctx b.
  [[(ctx a) = (ctx b)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#x -> (1.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#x -> (1.0)})
    butIs: ctx a.
  self
    assert:ctx b = (BabelsbergIRecord newFrom: {#x -> (1.0)})
    variable: 'ctx b'
    equals: (BabelsbergIRecord newFrom: {#x -> (1.0)})
    butIs: ctx b.
  [ctx a: (BabelsbergIRecord newFrom: {#x -> (1.0). #y -> (10.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx unsat = true
    variable: 'ctx unsat'
    equals: true
    butIs: ctx unsat.
