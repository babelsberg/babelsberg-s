testing
test29
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx p: (BabelsbergHRecord newFrom: {#x -> (0.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (0.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (0.0)})
    butIs: ctx p.
  [ctx q: (BabelsbergHRecord newFrom: {#x -> (5.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (0.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (0.0)})
    butIs: ctx p.
  self
    assert:ctx q = (BabelsbergIRecord newFrom: {#x -> (5.0)})
    variable: 'ctx q'
    equals: (BabelsbergIRecord newFrom: {#x -> (5.0)})
    butIs: ctx q.
  [[(ctx p x) = (0.0)] alwaysSolveWith: z3 "priority: ConstraintPriority medium"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (0.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (0.0)})
    butIs: ctx p.
  self
    assert:ctx q = (BabelsbergIRecord newFrom: {#x -> (5.0)})
    variable: 'ctx q'
    equals: (BabelsbergIRecord newFrom: {#x -> (5.0)})
    butIs: ctx q.
  [[(ctx q x) = (5.0)] alwaysSolveWith: z3 "priority: ConstraintPriority medium"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (0.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (0.0)})
    butIs: ctx p.
  self
    assert:ctx q = (BabelsbergIRecord newFrom: {#x -> (5.0)})
    variable: 'ctx q'
    equals: (BabelsbergIRecord newFrom: {#x -> (5.0)})
    butIs: ctx q.
  [[(ctx p) == (ctx q)] alwaysSolveWith: z3 "priority: ConstraintPriority weak"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx unsat = true
    variable: 'ctx unsat'
    equals: true
    butIs: ctx unsat.
