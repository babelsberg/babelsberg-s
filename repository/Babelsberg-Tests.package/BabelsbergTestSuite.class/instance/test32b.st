testing
test32b
  | z3 |
  z3 := ConstraintSolver newZ3Solver.
  [ctx r: (BabelsbergHRecord newFrom: {#upper_left -> ((nil Point: 2.0 and: 2.0)). #lower_right -> ((nil Point: 10.0 and: 10.0))})]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx r = (BabelsbergIRecord newFrom: {#lower_right -> ((BabelsbergIRecord newFrom: {#x -> (10.0). #y -> (10.0)})). #upper_left -> ((BabelsbergIRecord newFrom: {#x -> (2.0). #y -> (2.0)}))})
    variable: 'ctx r'
    equals: (BabelsbergIRecord newFrom: {#lower_right -> ((BabelsbergIRecord newFrom: {#x -> (10.0). #y -> (10.0)})). #upper_left -> ((BabelsbergIRecord newFrom: {#x -> (2.0). #y -> (2.0)}))})
    butIs: ctx r.
  [[(ctx r center ptEq: (nil Point: 2.0 and: 2.0))] alwaysSolveWith: z3 "priority: ConstraintPriority required"]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx r = (BabelsbergIRecord newFrom: {#lower_right -> ((BabelsbergIRecord newFrom: {#x -> (3.0). #y -> (3.0)})). #upper_left -> ((BabelsbergIRecord newFrom: {#x -> (1.0). #y -> (1.0)}))})
    variable: 'ctx r'
    equals: (BabelsbergIRecord newFrom: {#lower_right -> ((BabelsbergIRecord newFrom: {#x -> (3.0). #y -> (3.0)})). #upper_left -> ((BabelsbergIRecord newFrom: {#x -> (1.0). #y -> (1.0)}))})
    butIs: ctx r.
  [([(ctx r center x) = (100.0)] alwaysSolveWith: z3 "priority: ConstraintPriority required") disable]
    on: Error do: [:e | ctx unsat: true].
  self
    assert:ctx unsat = true
    variable: 'ctx unsat'
    equals: true
    butIs: ctx unsat.
