import mysql from 'mysql2/promise';

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '*******', // Utilize a senha referente ao seu banco de dados, esta é uma fictícia, pois não é possível compartilhar a minha senha.
    database: 'clinica'
});

export default pool;
