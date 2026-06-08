CREATE TABLE viagem (
	id_viagem INTEGER PRIMARY KEY,
	fk_id_onibus INTEGER,
	fk_id_motorista INTEGER,
	FOREIGN KEY (fk_id_onibus) REFERENCES onibus (id_onibus),
	FOREIGN KEY (fk_id_motorista) REFERENCES motorista (id_motorista)
);
