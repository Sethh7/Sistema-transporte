CREATE TABLE bairro (
	id_bairro INTEGER PRIMARY KEY,
	nome VARCHAR(100),
	fk_id_cidade INTEGER,
	FOREIGN KEY (fk_id_cidade) REFERENCES cidade(id_cidade)
);
