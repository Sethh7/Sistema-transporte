CREATE TABLE escala (
	id_escala INTEGER PRIMARY KEY,
    turno VARCHAR(20),
    status VARCHAR(20),
    fk_id_motorista INTEGER,
    fk_id_linha INTEGER,
    FOREIGN KEY (fk_id_motorista) REFERENCES motorista(id_funcionario),
    FOREIGN KEY (fk_id_linha) REFERENCES linha(id_linha)
);
