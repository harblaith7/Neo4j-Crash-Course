# Neo4j & Cypher Crash Course 🏀 graph

This repository contains a collection of **Cypher** scripts designed as a practical crash course for learning the **Neo4j** graph database. The examples use an NBA universe context (players, coaches, and teams).

## 📁 File Structure

The files are organized sequentially to facilitate learning:

1. **`01-initial-data.cypher`**
   - Creation of the initial database.
   - Instantiation of nodes for `:PLAYER`, `:COACH`, and `:TEAM`, along with relationships such as `:TEAMMATES`.

2. **`02-query.cypher`**
   - Query and filtering examples.
   - Use of `MATCH`, `RETURN`, `WHERE`, and searching by specific properties.

3. **`03-delete.cypher`**
   - Commands for data deletion.
   - Node deletion, deletion with relationships (`DETACH DELETE`), and removal of specific relationships (`PLAYS_FOR`).

4. **`04-create.cypher`**
   - Advanced node creation with multiple labels.
   - Creation of relationships with properties (e.g., `salary`).

5. **`05-update.cypher`**
   - Updating and modifying existing data.
   - Use of `SET` and `REMOVE` to update properties and labels.

## 🚀 How to Use

1. Download and install **[Neo4j Desktop](https://neo4j.com/download/)** or launch an instance on **[Neo4j AuraDB](https://neo4j.com/cloud/aura/)**.
2. Open the **Neo4j Browser** interface.
3. Run the scripts in the recommended numerical order (`01` to `05`) to follow the workflow.
