CREATE TABLE onibus (
	id_onibus INTEGER PRIMARY KEY,
	placa VARCHAR(10) UNIQUE,
	km_total REAL,
	fk_id_garagem INTEGER,
	fk_id_modelo INTEGER,
	FOREIGN KEY (fk_id_garagem) REFERENCES garagem,
	FOREIGN KEY (fk_id_modelo) REFERENCES modelo
);
