INSERT INTO LINHA_PARADA (tempo_estimado, fk_id_linha, fk_id_ponto) VALUES 
-- LINHA 1: GAR-101 (Origem: 1 -> Destino: 11)
(140, 1, 11),

-- LINHA 2: GAR-102 (Origem: 11 -> Destino: 1)
(140, 2, 1),

-- LINHA 3: GAR-201 (Origem: 2 -> Destino: 11)
(30, 3, 11),

-- LINHA 4: CAR-301 (Origem: 11-> Destino: 2)
(30, 4, 2),

-- LINHA 5: CAR-302 (Origem: 3 -> Destino: 11)
(110, 5, 11),

-- LINHA 6: CAR-401 (Origem: 11 -> Destino: 3)
(110, 6, 3),

-- LINHA 7: POLO-01 (Origem: 4 -> Destino: 11)
(30, 7, 11),

-- LINHA 8: POLO-02 (Origem: 11 -> Destino: 4)
(30, 8, 4),

-- LINHA 9: JEANS-01 (Origem: 5 -> Destino: 11)
(20, 9, 11),

-- LINHA 10: JEANS-02 (Origem: 11 -> Destino: 5)
(20, 10, 5),

-- LINHA 11: AGR-001 (Origem: 6 -> Destino: 11)
(90, 11, 11),

-- LINHA 12: AGR-002 (Origem: 11 -> Destino: 6)
(90, 12, 6),

-- LINHA 13: BJ-CAR (Origem: 7 -> Destino: 11)
(40, 13, 11),

-- LINHA 14: GRA-BEZ (Origem: 11 -> Destino: 7)
(40, 14, 7),

-- LINHA 15: PES-LAJ (Origem: 8 -> Destino: 11)
(90, 15, 11),

-- LINHA 16: FNAV-01 (Origem: 11 -> Destino: 8)
(90, 16, 8),

-- LINHA 17: LAJ-GAR (Origem: 9 -> Destino: 11)
(50, 17, 11),

-- LINHA 18: BC-GAR (Origem: 11 -> Destino: 9)
(50, 18, 9),

-- LINHA 19: SBU-BJ (Origem: 10 -> Destino: 11)
(130, 19, 11),

-- LINHA 20: BMD-CAR (Origem: 11 -> Destino: 10)
(130, 20, 10);
