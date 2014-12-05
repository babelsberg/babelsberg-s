testing
test28
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx p: (BabelsbergHRecord newFrom: {#x -> (2.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (2.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (2.0)})
    butIs: ctx p.
  [ctx q: (BabelsbergHRecord newFrom: {#y -> (5.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (2.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (2.0)})
    butIs: ctx p.
  self
    assert:ctx q = (BabelsbergIRecord newFrom: {#y -> (5.0)})
    variable: 'ctx q'
    equals: (BabelsbergIRecord newFrom: {#y -> (5.0)})
    butIs: ctx q.
  [[(ctx q) == (ctx p)] alwaysSolveWith: z3]
    on: Error do: [:e | ctx unsat: true].
