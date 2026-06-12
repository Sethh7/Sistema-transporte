CREATE TABLE motorista (
	id_funcionario INTEGER PRIMARY KEY,
	cnh VARCHAR(20) UNIQUE NOT NULL,
	categoria_cnh VARCHAR(5),
	FOREIGN KEY (id_funcionario) REFERENCES funcionario (id_funcionario)
);
