CREATE TABLE passageiro (
	id_passageiro INTEGER PRIMARY KEY,
	nome VARCHAR(100),
	cpf VARCHAR(11) UNIQUE, 
	dt_nasc DATE
);
