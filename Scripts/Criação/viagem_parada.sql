CREATE TABLE viagem_parada (
	data_chegada DATE,
	data_partida DATE,
	fk_id_viagem INTEGER,
	fk_id_ponto INTEGER,
	PRIMARY KEY (fk_id_viagem, fk_id_ponto),
	FOREIGN KEY (fk_id_viagem) REFERENCES viagem(id_viagem),
	FOREIGN KEY (fk_id_ponto) REFERENCES ponto_parada(id_ponto)
);
