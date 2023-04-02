-- PRAGMA foreign_keys = ON;

/* Partie création de table */

/* CREATE TABLE IF NOT EXISTS categories(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	title VARCHAR(150) NOT NULL,
	description TEXT
); */

/* CREATE TABLE recipes(
	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	title VARCHAR(150) NOT NULL,
	slug VARCHAR(50) NOT NULL UNIQUE,
	content TEXT,
	category_id INTEGER,
	FOREIGN KEY (category_id) REFERENCES categories (id)
); */

/* 
	Ceci sert à éviter des entrées en double à partir d'une colonne sélectionner : 
*/
--		CREATE UNIQUE INDEX idx_slug on recipes (slug);
/*
	Attention, ça ralenti à l'ajout mais accélére la récupération
*/

/* Partie insertion de données*/

/* 
	INSERT INTO categories (title) 
	VALUES 
	('Plat'),
	('Dessert'); 
*/

/* INSERT INTO recipes (
	title,
	slug,
	category_id) 
	VALUES 
	('Crème anglaise', 'Crème_anglaise', 2),
	('Soupe', 'soupe', 1),
	('Salade de fruit', 'Salade_de_fruit', 2); */
	
/* Partie récupération de données */ 

-- SELECT * FROM recipes WHERE content IS NULL;

-- Dans la requête suivante :
	-- JOIN veux dire rejoindre la table cité. Donc ici, on dit à la table recipes de rejoindre la table categories.description ;
	-- ' ON ' est le fait qu'on ajoute une contrainte à notre requête;
	-- 'r' et le 'c' sont des alias de nos table qu'on a cité et qui nous servira pour appeller nos tables lors des contrainte;
	-- 'AS' sert à renommé un colonne cité précédemment.

-- SELECT r.id, r.title, c.title AS category FROM recipes r JOIN categories c ON r.category_id = c.id ;

-- La différence entre la requête précédente et la suivante se joue avec le 'LEFT JOIN' où :
	--Avant, on disait de montrer les éléments qui avait absolument un nom de category;
	--Après (avec le 'LEFT JOIN'), on dit de montrer tout les éléments même ceux qui n'ont pas de nom de category voir 'NULL" 
--ceci marche aussi avec 'INNER JOIN' qui donne le même résultat. 

-- SELECT r.id, r.title, c.title AS category FROM recipes r LEFT JOIN categories c ON r.category_id = c.id ;

/* Partie MAJ de données */ 

-- UPDATE recipes SET category_id = NULL WHERE id = 3;
-- UPDATE recipes SET content = NULL;

-- Pour supprimer un index : DROP INDEX idx_slug;

/* 
	Ceci sert à montrer "Comment SQL s'exécute?"
*/

/* EXPLAIN QUERY PLAN SELECT * FROM recipes WHERE title = 'Soupe' */

-- PRAGMA index_list(recipes)

/* 
	INSERT INTO "recipes" ( "title", "slug", "content", "duration", "online", "created_at") 
		VALUES ('Soupe 1', 'soupe', 'contenu text', 10, FALSE, 1680162855),
		('Soupe 2', 'soupe', 'contenu text', 10, FALSE, 1680162855);
*/

/* Partie Suppression de données ou de table */
/* DROP pour supprimer une table */ 
	
-- DROP TABLE recipes;

DELETE FROM categories WHERE id = 2;
	