CREATE TABLE bilhetagem (
	id_transscao INTEGER PRIMARY KEY,
	valor_cobrado DECIMAL(10, 2),
	data_transacao DATE,
	fk_id_cartao INTEGER,
	fk_id_viagem INTEGER,
	fk_id_ponto INTEGER,
	FOREIGN KEY (fk_id_cartao) REFERENCES cartao(id_cartao),
	FOREIGN KEY (fk_id_viagem) REFERENCES viagem(id_viagem),
	FOREIGN KEY (fk_id_ponto) REFERENCES ponto_parada(id_ponto)
);
