import mysql from 'mysql2/promise';

const configuracaoDB = {
    host: 'localhost',
    user: 'root',
    password: 'task2019',
    database: 'clinica',
    waitForConnections: true, // pro tratamento de erros funcionar melhor.
    connectionLimit: 10,
    queueLimit: 0
};

let conexao;

try {
    conexao = mysql.createPool(configuracaoDB);
    console.log('Pool de conexões criado com sucesso');
} catch (erro) {
    console.error('Erro ao criar pool de conexões:', erro.message);
    process.exit(1);
}

conexao.getConnection()
    .then(connection => {
        console.log('Conexão com o banco de dados estabelecida');
        connection.release();
    })
    .catch(erro => {
        console.error('Erro ao conectar ao banco de dados:', erro.message);
        console.error('Verifique se o MySQL está rodando e as credenciais estão corretas');
    });

export default conexao;
