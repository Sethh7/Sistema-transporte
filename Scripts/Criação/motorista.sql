CREATE TABLE motorista (
	id_motorista INTEGER PRIMARY KEY,
	cnh VARCHAR(20) UNIQUE NOT NULL,
	categoria_cnh VARCHAR(5),
	fk_id_funcionario INTEGER UNIQUE,
	FOREIGN KEY (fk_id_funcionario) REFERENCES funcionario (id_funcionario)
);
