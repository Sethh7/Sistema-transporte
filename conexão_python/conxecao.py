import psycopg2

print("Tentando conectar ao banco de dados...")

try:
    # Tenta conectar direto, sem bibliotecas intermediárias
    conexao = psycopg2.connect(
        host="localhost",
        port="5432",
        database="postgres", # Coloque aqui o nome correto do banco
        user="postgres",
        password="gustavo123" # Verifique se essa é mesmo a senha
    )
    print("SUCESSO! A conexão está perfeita!")
    

    cursor = conexao.cursor()
    cursor.execute("SELECT * FROM  alocacao;")
    print("SUCESSO! A tabela existe e foi encontrada!")
    
    conexao.close()

except Exception as erro_real:
    print("\nA CONEXÃO OU A CONSULTA FALHOU!")
    print("Aqui está o erro verdadeiro (com os acentos zoados, mas legível):")
    # O comando repr() impede que o Python tente decodificar o 'ç' e trave
    print(repr(erro_real))
