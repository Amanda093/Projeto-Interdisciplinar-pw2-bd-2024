<?php

class Conexao extends PDO
{
    private static $instancia;

    // Armazenam as informações de conexão com o banco de dados
    private $query;
    private $host = "127.0.0.1";  // endereço do servidor
    private $usuario = "root";    // usuário do servidor
    private $senha = "";          // senha do servidor
    private $db = "bd_produto";   // banco do mysql

    // Construtor da classe
    public function __construct()
    {
        // Chama o construtor da classe pai (PDO) para estabelecer a conexão
        parent::__construct("mysql:host=$this->host;dbname=$this->db", "$this->usuario", "$this->senha");
    }

    // Método estático para obter a instância única da classe
    public static function getInstance()
    {
        // Verifica se a instância ainda não foi criada
        if (!isset(self::$instancia)) {
            try {
                self::$instancia = new Conexao; // Cria a nova instância da classe
                echo 'Conectado com sucesso!';
            } 
            catch (Exception $error) {
                echo 'Erro ao conectar';
                exit();
            }
        }
        return self::$instancia;
    }

    // Método para executar uma consulta SQL
    public function sql($query)
    {
        $this->getInstance();
        $this->query = $query;
        $stmt = $pdo->prepare($this->query);
        $stmt->execute();
        $pdo = null;
    }
}

?>