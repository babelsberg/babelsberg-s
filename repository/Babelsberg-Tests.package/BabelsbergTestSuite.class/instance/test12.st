testing
test12
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx p: (BabelsbergHRecord newFrom: {#x -> (2.0). #y -> (5.0)})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (2.0). #y -> (5.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (2.0). #y -> (5.0)})
    butIs: ctx p.
  [ctx a: ctx p x]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (2.0). #y -> (5.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (2.0). #y -> (5.0)})
    butIs: ctx p.
  self
    assert:ctx a = 2.0
    variable: 'ctx a'
    equals: 2.0
    butIs: ctx a.
  [ctx q: ctx p]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (2.0). #y -> (5.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (2.0). #y -> (5.0)})
    butIs: ctx p.
  self
    assert:ctx a = 2.0
    variable: 'ctx a'
    equals: 2.0
    butIs: ctx a.
  self
    assert: ctx q == ctx p
    value:  'ctx q'
    identicalTo: 'ctx p'.
  [[(ctx p x) = (100.0)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (100.0). #y -> (5.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (100.0). #y -> (5.0)})
    butIs: ctx p.
  self
    assert:ctx a = 2.0
    variable: 'ctx a'
    equals: 2.0
    butIs: ctx a.
  self
    assert: ctx q == ctx p
    value:  'ctx q'
    identicalTo: 'ctx p'.
  [[(ctx q) = (ctx p)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (100.0). #y -> (5.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (100.0). #y -> (5.0)})
    butIs: ctx p.
  self
    assert:ctx a = 2.0
    variable: 'ctx a'
    equals: 2.0
    butIs: ctx a.
  self
    assert: ctx q == ctx p
    value:  'ctx q'
    identicalTo: 'ctx p'.
  [[(ctx q y) = (20.0)] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx p = (BabelsbergIRecord newFrom: {#x -> (100.0). #y -> (20.0)})
    variable: 'ctx p'
    equals: (BabelsbergIRecord newFrom: {#x -> (100.0). #y -> (20.0)})
    butIs: ctx p.
  self
    assert:ctx a = 2.0
    variable: 'ctx a'
    equals: 2.0
    butIs: ctx a.
  self
    assert: ctx q == ctx p
    value:  'ctx q'
    identicalTo: 'ctx p'.
