testing
test14
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx a: (BabelsbergHRecord newFrom: {#x -> (1.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#x -> (1.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#x -> (1.0)})
    butIs: ctx a.
  [ctx temp: (BabelsbergHRecord newFrom: {#y -> (10.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx a = (BabelsbergIRecord newFrom: {#x -> (1.0)})
    variable: 'ctx a'
    equals: (BabelsbergIRecord newFrom: {#x -> (1.0)})
    butIs: ctx a.
  self
    assert:ctx temp = (BabelsbergIRecord newFrom: {#y -> (10.0)})
    variable: 'ctx temp'
    equals: (BabelsbergIRecord newFrom: {#y -> (10.0)})
    butIs: ctx temp.
  [([(ctx a) = (ctx temp)] alwaysSolveWith: z3 "priority: ConstraintPriority required") disable]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx unsat = true
    variable: 'ctx unsat'
    equals: true
    butIs: ctx unsat.
