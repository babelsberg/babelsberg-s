testing
test41
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx p: (nil MutablePointNew: 0.0 and: 0.0)]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (0.0). #y -> (0.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (0.0). #y -> (0.0)})
    butIs: ctx p.
  [ctx q: ctx p]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (0.0). #y -> (0.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (0.0). #y -> (0.0)})
    butIs: ctx p.
  self
    assert: ctx q == ctx p
    value:  'ctx q'
    identicalTo: 'ctx p'.
  [[(ctx p x) = (5.0)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (5.0). #y -> (0.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (5.0). #y -> (0.0)})
    butIs: ctx p.
  self
    assert: ctx q == ctx p
    value:  'ctx q'
    identicalTo: 'ctx p'.
  [[(ctx q x) = (10.0)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx unsat = true
    variable: 'ctx unsat'
    equals: true
    butIs: ctx unsat.
