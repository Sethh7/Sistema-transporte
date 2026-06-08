CREATE TABLE funcionario (
	id_funcionario INTEGER PRIMARY KEY,
	nome VARCHAR(100),
	cpf VARCHAR(11) UNIQUE,
	salario DECIMAL(10,2),
	fk_id_cargo INTEGER,
	FOREIGN KEY (fk_id_cargo) REFERENCES cargo(id_cargo)
);
