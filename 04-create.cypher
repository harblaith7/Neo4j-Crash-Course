CREATE (lebron:PLAYER:COACH:GENERAL_MANAGER { name: "LeBron James", height: 2.01 })

CREATE (lebron:PLAYER:COACH:GENERAL_MANAGER { name: "LeBron James", height: 2.01 }) - [:PLAYS_FOR {salary: 40000000}] -> (:TEAM {name: "LA Lakers"})

CREATE (lebron:PLAYER:COACH:GENERAL_MANAGER { name: "LeBron James", height: 2.01 })
CREATE (:TEAM {name: "LA Lakers"})

MATCH (lebron:PLAYER {name: "LeBron James"}), (lakers:TEAM {name: "LA Lakers"})
CREATE (lebron) - [:PLAYS_FOR] -> (lakers)