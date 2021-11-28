MATCH (n) 
WHERE ID(n) = 3
SET n.age = 24, n.height = 2.02
RETURN n

MATCH (lebron)
WHERE ID(n) = 3
SET lebron:REF
RETURN lebron

MATCH (lebron {name: "LeBron James"}) - [contract:PLAYS_FOR] -> (:TEAM)
SET contract.salary = 60000000

MATCH (lebron)
WHERE ID(n) = 3
REMOVE lebron:REF
RETURN lebron

MATCH (lebron)
WHERE ID(n) = 3
REMOVE lebron.age
RETURN lebron