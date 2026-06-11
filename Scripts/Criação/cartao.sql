CREATE TABLE cartao (
	id_cartao INTEGER PRIMARY KEY,
	numero VARCHAR(50) UNIQUE,
	saldo DECIMAL(10, 2),
	fk_id_passageiro INTEGER,
	FOREIGN KEY (fk_id_passageiro) REFERENCES passageiro(id_passageiro)
);
