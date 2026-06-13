import psycopg

def connect_to_db():
    """Estabelece conexão com o banco de dados do Docker utilizando psycopg v3"""
    return psycopg.connect(
        dbname="curso_sql",     
        user="curso_user",      
        password="curso_password",
        host="localhost",
        port="5433" 
    )

def executar_scripts_sql(conn):
    """Lê os arquivos .sql e executa diretamente no PostgreSQL"""
    
    base_path_criacao = 'C:/Users/adrie/Downloads/Faculdade/3°p/Banco de dados/Projeto/Modelagem/Sistema-transporte/Scripts/Criação/'
    
    arquivos_sql = [
        base_path_criacao + 'cidade.sql',
        base_path_criacao + 'cargo.sql',
        base_path_criacao + 'garagem.sql',
        base_path_criacao + 'modelo.sql',
        base_path_criacao + 'passageiro.sql',
        base_path_criacao + 'bairro.sql',         
        base_path_criacao + 'funcionario.sql',    
        base_path_criacao + 'onibus.sql',         
        base_path_criacao + 'cartao.sql',         
        base_path_criacao + 'ponto_parada.sql',   
        base_path_criacao + 'motorista.sql',      
        base_path_criacao + 'cobrador.sql',       
        base_path_criacao + 'linha.sql',          
        base_path_criacao + 'tarifa.sql',         
        base_path_criacao + 'horario_linha.sql',  
        base_path_criacao + 'linha_parada.sql',   
        base_path_criacao + 'escala.sql',         
        base_path_criacao + 'viagem.sql',         
        base_path_criacao + 'viagem_parada.sql',  
        base_path_criacao + 'bilhetagem.sql'      
    ]
    base_path_populacao = 'C:/Users/adrie/Downloads/Faculdade/3°p/Banco de dados/Projeto/Modelagem/Sistema-transporte/Scripts/População/'
    
    arquivos_insercao = [
        base_path_populacao + 'cidade.sql',
        base_path_populacao + 'cargo.sql',
        base_path_populacao + 'garagem.sql',
        base_path_populacao + 'modelo.sql',
        base_path_populacao + 'passageiro.sql',
        base_path_populacao + 'bairro.sql',
        base_path_populacao + 'funcionario.sql',
        base_path_populacao + 'onibus.sql',
        base_path_populacao + 'cartao.sql',
        base_path_populacao + 'ponto_parada.sql',
        base_path_populacao + 'motorista.sql',
        base_path_populacao + 'cobrador.sql',
        base_path_populacao + 'linha.sql',
        base_path_populacao + 'tarifa.sql',
        base_path_populacao + 'horario_linha.sql',
        base_path_populacao + 'linha_parada.sql',
        base_path_populacao + 'escala.sql',
        base_path_populacao + 'viagem.sql',
        base_path_populacao + 'viagem_parada.sql',
        base_path_populacao + 'bilhetagem.sql'
    ] 

    criar_e_popular = arquivos_insercao + arquivos_sql

    with conn.cursor() as cur:
        for caminho_arquivo in criar_e_popular:
            print(f"Lendo e executando: {caminho_arquivo}...")
            with open(caminho_arquivo, 'r', encoding='uf') as arquivo:
                script_completo = arquivo.read()
            cur.execute(script_completo)
        conn.commit()

if __name__ == "__main__":
    try:
        conn = connect_to_db()
        executar_scripts_sql(conn)
        print("Tabelas criadas e dados inseridos com sucesso!")
        
    except Exception as e:
        print(f"Ocorreu um erro durante a execução: {e}")
        if 'conn' in locals() and conn:
            conn.rollback()
            
    finally:
        if 'conn' in locals() and conn:
            conn.close()
            print("Conexão com o banco de dados encerrada.")