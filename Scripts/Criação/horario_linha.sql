CREATE TABLE horario_linha (
	id_horario INTEGER PRIMARY KEY,
	hora_partida TIME,
	dia_semana VARCHAR(20),
	fk_id_linha INTEGER,
	FOREIGN KEY (fk_id_linha) REFERENCES linha (id_linha)
);
