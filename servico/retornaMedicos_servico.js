import pool from '../conexao.js';




async function listarTodosMedicos() {
    const sql = `
        SELECT 
            m.id,
            m.nome,
            m.telefone,
            m.email,
            e.especialidade
        FROM medicos m
        INNER JOIN especialidades e ON m.especialidade = e.id
        ORDER BY m.nome ASC
    `;
    
    const [rows] = await pool.query(sql);
    return rows;
}



async function filtrarMedicosPorNome(nome) {
    const sql = `
        SELECT 
            m.id,
            m.nome,
            m.telefone,
            m.email,
            e.especialidade
        FROM medicos m
        INNER JOIN especialidades e ON m.especialidade = e.id
        WHERE m.nome LIKE ?
        ORDER BY m.nome ASC
    `;
    
    const [rows] = await pool.query(sql, [`%${nome}%`]);
    return rows;
}



async function filtrarMedicosPorEspecialidade(especialidade) {
    const sql = `
        SELECT 
            m.id,
            m.nome,
            m.telefone,
            m.email,
            e.especialidade
        FROM medicos m
        INNER JOIN especialidades e ON m.especialidade = e.id
        WHERE LOWER(e.especialidade) = LOWER(?)
        ORDER BY m.nome ASC
    `;
    
    const [rows] = await pool.query(sql, [especialidade]);
    return rows;
}



export { listarTodosMedicos, filtrarMedicosPorNome, filtrarMedicosPorEspecialidade };
