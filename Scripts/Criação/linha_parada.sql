CREATE TABLE linha_parada (
	tempo_estimado INTEGER,
	fk_id_linha INTEGER,
	fk_id_ponto INTEGER,
	PRIMARY KEY (fk_id_linha, fk_id_ponto),
	FOREIGN KEY (fk_id_linha) REFERENCES linha (id_linha),
	FOREIGN KEY (fk_id_ponto) REFERENCES ponto_parada (id_ponto)
);
