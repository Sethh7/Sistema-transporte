CREATE TABLE cobrador (
	id_cobrador INTEGER PRIMARY KEY,
	certificado VARCHAR(50),
	fk_id_funcionario INTEGER UNIQUE, 
	FOREIGN KEY (fk_id_funcionario) REFERENCES funcionario (id_funcionario)
);
