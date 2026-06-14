-- Mostrar os motoristas e as linhas relacionadas.

CREATE VIEW vw_motorista_linhas AS
SELECT 
    f.nome AS nome_motorista,
    l.codigo AS codigo_linha,
    e.turno,
    e.status
FROM 
    funcionario f
INNER JOIN 
    motorista m ON f.id_funcionario = m.id_funcionario
INNER JOIN 
    escala e ON m.id_funcionario = e.fk_id_motorista
INNER JOIN 
    linha l ON e.fk_id_linha = l.id_linha
WHERE 
    f.fk_id_cargo = 1;

SELECT * FROM vw_motorista_linhas;

CREATE VIEW vw_viagem_rotas AS
SELECT 
    v.id_viagem,
    l.codigo AS codigo_linha,
    c_origem.nome AS cidade_origem,
    c_destino.nome AS cidade_destino
FROM 
    viagem v
INNER JOIN 
    horario_linha hl ON v.fk_id_horario = hl.id_horario
INNER JOIN 
    linha l ON hl.fk_id_linha = l.id_linha
INNER JOIN 
    ponto_parada p_origem ON l.fk_id_ponto_origem = p_origem.id_ponto
INNER JOIN 
    bairro b_origem ON p_origem.fk_id_bairro = b_origem.id_bairro
INNER JOIN 
    cidade c_origem ON b_origem.fk_id_cidade = c_origem.id_cidade
INNER JOIN 
    ponto_parada p_destino ON l.fk_id_ponto_destino = p_destino.id_ponto
INNER JOIN 
    bairro b_destino ON p_destino.fk_id_bairro = b_destino.id_bairro
INNER JOIN 
    cidade c_destino ON b_destino.fk_id_cidade = c_destino.id_cidade;

SELECT * FROM vw_viagem_rotas;