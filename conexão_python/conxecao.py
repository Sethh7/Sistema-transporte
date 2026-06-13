import psycopg

def connect_to_db():
    """Estabelece conexão com o banco de dados do Docker utilizando psycopg v3"""
    return psycopg.connect(
        dbname="curso_sql",       # Batendo com o POSTGRES_DB do docker
        user="curso_user",        # Batendo com o POSTGRES_USER do docker
        password="curso_password",# Batendo com o POSTGRES_PASSWORD do docker
        host="localhost",
        port="5433" 
    )

def executar_scripts_sql(conn):
    """Lê os arquivos .sql e executa diretamente no PostgreSQL"""
    
    # Coloque aqui o caminho dos seus arquivos .sql na ordem correta
    # Tabelas sem chaves estrangeiras primeiro, inserções de dados por último.
    arquivos_sql = [
        'C:/Users/adrie/Downloads/Faculdade/3°p/Banco de dados/Projeto/Modelagem/Sistema-transporte/Scripts/Criação/cidade.sql',
        'C:/Users/adrie/Downloads/Faculdade/3°p/Banco de dados/Projeto/Modelagem/Sistema-transporte/Scripts/População/cidade.sql'
    ]
    
    with conn.cursor() as cur:
        for caminho_arquivo in arquivos_sql:
            print(f"Lendo e executando: {caminho_arquivo}...")
            
            # Abre o arquivo .sql em modo de leitura de texto
            with open(caminho_arquivo, 'r', encoding='utf-8') as arquivo:
                script_completo = arquivo.read()
                
            # Executa todo o conteúdo do arquivo de uma vez
            cur.execute(script_completo)
            
        # O commit confirma e salva todas as alterações no banco de dados
        conn.commit()

if __name__ == "__main__":
    try:
        conn = connect_to_db()
        executar_scripts_sql(conn)
        print("Tabelas criadas e dados inseridos com sucesso!")
        
    except Exception as e:
        print(f"Ocorreu um erro durante a execução: {e}")
        if 'conn' in locals() and conn:
            conn.rollback() # Desfaz o que foi feito caso o script quebre no meio
            
    finally:
        if 'conn' in locals() and conn:
            conn.close()
            print("Conexão com o banco de dados encerrada.")