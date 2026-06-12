CREATE TABLE cobrador (
	id_funcionario INTEGER PRIMARY KEY,
	certificado VARCHAR(50),
	FOREIGN KEY (id_funcionario) REFERENCES funcionario (id_funcionario)
);
