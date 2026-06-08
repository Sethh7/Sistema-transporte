CREATE TABLE bairro (
	id_bairro INTEGER PRIMARY KEY,
	nome VARCHAR(100),
	zona VARCHAR(50),
	fk_id_cidade INTEGER,
	FOREIGN KEY (fk_id_cidade) REFERENCES cidade(id_cidade)
);
