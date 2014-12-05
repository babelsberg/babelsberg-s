testing
test27
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx p: (BabelsbergHRecord newFrom: {#x -> (2.0). #y -> (5.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (2.0). #y -> (5.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (2.0). #y -> (5.0)})
    butIs: ctx p.
  [ctx q: ctx p]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (2.0). #y -> (5.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (2.0). #y -> (5.0)})
    butIs: ctx p.
  self
    assert: ctx q == ctx p
    value:  'ctx q'
    identicalTo: 'ctx p'.
  [[(ctx q) == (ctx p)] alwaysSolveWith: z3]
    on: Error do: [:e | ctx unsat: true].
  [ctx q: (BabelsbergHRecord newFrom: {#z -> (10.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#z -> (10.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#z -> (10.0)})
    butIs: ctx p.
  self
    assert: ctx q == ctx p
    value:  'ctx q'
    identicalTo: 'ctx p'.
