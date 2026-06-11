CREATE TABLE linha(
	id_linha INTEGER PRIMARY KEY,
	codigo VARCHAR(20) UNIQUE,
	fk_id_ponto_origem INTEGER,
	fk_id_ponto_destino INTEGER,
	FOREIGN KEY (fk_id_ponto_origem) REFERENCES ponto_parada(id_ponto),
	FOREIGN KEY (fk_id_ponto_destino) REFERENCES ponto_parada(id_ponto)
);
