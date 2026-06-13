# -*- coding: utf-8 -*-
import pandas as pd
from sqlalchemy import create_engine
import psycopg2

# =====================================================================
# 1. CONFIGURE AQUI AS SUAS CREDENCIAIS REAIS DO POSTGRESQL (PGADMIN)
# =====================================================================
USUARIO = "curso_user"        # Geralmente é 'postgres'
SENHA = "curso_password"    # Coloque a senha que você usa no pgAdmin
BANCO = "curso_sql"     # Ex: transporte, curso_sql, projeto_faculdade
HOST = "localhost"
PORTA = "5433"
# =====================================================================

def gerar_relatorios():
    print("Iniciando conexão com o banco de dados...\n")
    
    # Montando a URL de conexão do SQLAlchemy
    conexao_url = f"postgresql+psycopg2://{USUARIO}:{SENHA}@{HOST}:{PORTA}/{BANCO}"
    
    try:
        # Criando o motor de conexão com a trava 'latin1' para os acentos dos dados
        engine = create_engine(conexao_url, connect_args={'client_encoding': 'utf8'})
        
        # Testando a conexão rapidamente
        with engine.connect() as conn:
            pass

        print("===" * 15)
        print("SISTEMA DE TRANSPORTE: RELATÓRIOS GERENCIAIS")
        print("===" * 15 + "\n")

        # ---------------------------------------------------------
        # RELATÓRIO 1: FATURAMENTO
        # ---------------------------------------------------------
        print("1. FATURAMENTO TOTAL POR LINHA:")
        query_faturamento = """
            SELECT l.codigo AS "Linha", SUM(b.valor_cobrado) AS "Faturamento_R$"
            FROM bilhetagem b
            JOIN viagem v ON b.fk_id_viagem = v.id_viagem
            JOIN horario_linha hl ON v.fk_id_horario = hl.id_horario
            JOIN linha l ON hl.fk_id_linha = l.id_linha
            GROUP BY l.codigo
            ORDER BY "Faturamento_R$" DESC;
        """
        df_faturamento = pd.read_sql_query(query_faturamento, con=engine)
        
        # Formatando a coluna de dinheiro para exibir duas casas decimais
        if not df_faturamento.empty and "Faturamento_R$" in df_faturamento.columns:
            df_faturamento["Faturamento_R$"] = df_faturamento["Faturamento_R$"].apply(lambda x: f"R$ {x:.2f}" if pd.notnull(x) else "R$ 0.00")
        
        print(df_faturamento.to_string(index=False))
        print("\n" + "-" * 50 + "\n")

        # ---------------------------------------------------------
        # RELATÓRIO 2: ESCALA
        # ---------------------------------------------------------
        print("2. ESCALA DOS MOTORISTAS:")
        query_escala = """
            SELECT f.nome AS "Motorista", e.turno AS "Turno", l.codigo AS "Linha"
            FROM funcionario f
            JOIN motorista m ON f.id_funcionario = m.id_funcionario
            JOIN escala e ON m.id_funcionario = e.fk_id_motorista
            JOIN linha l ON e.fk_id_linha = l.id_linha;
        """
        df_escala = pd.read_sql_query(query_escala, con=engine)
        print(df_escala.to_string(index=False))
        print("\n" + "=" * 50 + "\n")

        # ---------------------------------------------------------
        # BÔNUS: SALVAR EM PLANILHAS
        # ---------------------------------------------------------
        df_faturamento.to_csv("faturamento_linhas.csv", sep=";", index=False, encoding="utf-8-sig")
        df_escala.to_csv("escala_motoristas.csv", sep=";", index=False, encoding="utf-8-sig")
        print("Os relatórios também foram salvos como planilhas CSV na mesma pasta do seu script.")

    # Se a senha estiver errada, a biblioteca do Python vai tentar dar o erro do "ç" novamente.
    # Nós capturamos esse colapso e extraímos a mensagem real.
    except UnicodeDecodeError as e:
        mensagem_bruta = e.object
        msg_real = mensagem_bruta.decode('latin1', errors='ignore')
        print("ERRO DE CONEXÃO IDENTIFICADO:")
        print(msg_real.strip())
        print("Verifique se o usuário, a senha e o nome do banco lá no topo do código estão corretos!")
        
    except Exception as e:
        print(f"Ocorreu um erro geral: {e}")

if __name__ == "__main__":
    gerar_relatorios()