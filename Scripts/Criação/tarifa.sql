CREATE TABLE tarifa (
	id_tarifa INTEGER PRIMARY KEY,
	valor DECIMAL(10, 2),
	data_inicio_vigencia DATE,
	fk_id_linha INTEGER,
	FOREIGN KEY (fk_id_linha) REFERENCES linha(id_linha)
);
