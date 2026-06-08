CREATE TABLE ponto_parada (
	id_ponto INTEGER PRIMARY KEY,
	nome VARCHAR(100),
	coberto BOOLEAN,
	fk_id_bairro INTEGER,
	FOREIGN KEY (fk_id_bairro) REFERENCES bairro (id_bairro)
);
