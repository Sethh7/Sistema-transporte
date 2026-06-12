CREATE TABLE viagem (
	id_viagem INTEGER PRIMARY KEY,
	data_viagem TIMESTAMP,
	fk_id_onibus INTEGER,
	fk_id_motorista INTEGER,
	fk_id_horario INTEGER,
	FOREIGN KEY (fk_id_onibus) REFERENCES onibus (id_onibus),
	FOREIGN KEY (fk_id_motorista) REFERENCES motorista (id_funcionario),
	FOREIGN KEY (fk_id_horario) REFERENCES horario_linha (id_horario)
);
