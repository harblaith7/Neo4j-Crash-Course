// Deleting a Node (Not going to work)
MATCH(ja {name: "Ja Morant"})
DELETE ja

// Delete node and relationships
MATCH(ja {name: "Ja Morant"})
DETACH DELETE ja

// Delete relationship
MATCH(joel {name: "Joel Embiid"}) - [rel:PLAYS_FOR] -> (:TEAM)
DELETE rel