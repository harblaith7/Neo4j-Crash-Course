////////////////////////////////////////////////////////////
// ================ Querying For Nodes ================== //
////////////////////////////////////////////////////////////

// All nodes //
MATCH (n) RETURN n

// All nodes with specific label //
MATCH (player:PLAYER) RETURN player

// Properies //
MATCH (player:PLAYER) RETURN player.name, player.height

////////////////////////////////////////////////////////////
// =============== Filtering For Nodes ================== //
////////////////////////////////////////////////////////////

// Nodes where name is LeBron James //
MATCH (player:PLAYER) 
WHERE player.name = "LeBron James"
RETURN player

// Nodes where name is LeBron James //
MATCH (player:PLAYER {name: "LeBron James"}) 
RETURN player

// Nodes where name is not LeBron James
MATCH (player:PLAYER) 
WHERE player.name <> "LeBron James"
RETURN player

// Nodes where height is greater than or equal to 2
MATCH (player:PLAYER) 
WHERE player.height >= 2
RETURN player

// Nodes where height is less than 2
MATCH (player:PLAYER) 
WHERE player.height < 2
RETURN player

// Nodes with a BMI larger than 25
MATCH (player:PLAYER) 
WHERE (player.weight / (player.height * player.height)) > 25
RETURN player

// Nodes with a BMI not larger than 25
MATCH (player:PLAYER) 
WHERE NOT (player.weight / (player.height * player.height)) > 25
RETURN player

// Nodes with a weight larger than 100 and a height smaller than 2
MATCH (player:PLAYER) 
WHERE player.weight >= 100 AND player.height <= 2
RETURN player

// Nodes with height greater than 2.1 or weight greater than 120
MATCH (player:PLAYER) 
WHERE player.weight >= 120 OR player.height >= 2.1
RETURN player

// Limit
MATCH (player:PLAYER) 
WHERE player.height >= 2
RETURN player
LIMIT 3

// Skip
MATCH (player:PLAYER) 
WHERE player.height >= 2
RETURN player
SKIP 1
LIMIT 3

// Orderby
MATCH (player:PLAYER) 
WHERE player.height >= 2
RETURN player
SKIP 1
ORDER BY player.height DESC
LIMIT 3


// Query for multiple nodes
MATCH (coach:COACH), (player:PLAYER)
RETURN coach, player


////////////////////////////////////////////////////////////
// ============== Querying Relationships ================ //
////////////////////////////////////////////////////////////

// GET ALL LAKER PLAYERS //
MATCH (player:PLAYER) - [:PLAYS_FOR] -> (team:TEAM)
WHERE team.name = "LA Lakers"
RETURN player, team 

// GET ALL LAKER OR MAVERICKS PLAYERS //
MATCH (player:PLAYER) - [:PLAYS_FOR] -> (team:TEAM)
WHERE team.name = "LA Lakers" OR team.name = team.name = "Dallas Mavericks"
RETURN player, team 

// GET ALL PLAYERS THAT MAKE MORE THE 35M //
MATCH (player:PLAYER) - [contract :PLAYS_FOR] -> (team:TEAM)
WHERE contract.salary >= 35000000
RETURN player

// GET ALL OF LEBRONS TEAMMATES THAT MAKE MORE THAN 40M //
MATCH (lebron:PLAYER {name: "LeBron James"}) - [:TEAMMATES] -> (teammate:PLAYER)
MATCH (teammate) - [contract:PLAYS_FOR] -> (:TEAM)
WHERE contract.salary >= 40000000
RETURN teammate

////////////////////////////////////////////////////////////
// ==================== Aggregates ====================== //
////////////////////////////////////////////////////////////

// GET PLAYERS AND NUMBER OF GAMES PLAYED //
MATCH (player:PLAYER) - [gamePlayed:PLAYED_AGAINST] - (team:TEAM)
RETURN player.name, COUNT(gamePlayed)

// GET PLAYERS AND POINTS PER GAME //
MATCH (player:PLAYER) - [gamePlayed:PLAYED_AGAINST] - (team:TEAM)
RETURN player.name, AVG(gamePlayed.points)


// GET HIGHEST SCORING PLAYER IN THE LAKERS //
MATCH (player:PLAYER) - [:PLAYS_FOR] - (:TEAM {name: "LA Lakers"})
MATCH (player) - [gamePlayed:PLAYED_AGAINST] - (:TEAM)
RETURN player.name, AVG(gamePlayed.points) AS ppg
ORDER BY ppg DESC
LIMIT 1