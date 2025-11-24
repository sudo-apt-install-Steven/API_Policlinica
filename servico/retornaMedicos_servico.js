import conexao from '../conexao.js';

const buscarTodosMedicos = async () => {
    try {
        const query = `SELECT m.id, m.nome, m.telefone, m.email, e.especialidade 
                       FROM medicos m 
                       INNER JOIN especialidades e ON m.especialidade = e.id 
                       ORDER BY m.nome ASC`;
        
        const [resultado] = await conexao.query(query);
        return resultado;
    } catch (erro) {
        console.error('Erro ao buscar todos os médicos:', erro.message);
        throw new Error('Falha ao buscar médicos no banco de dados');
    }
}

const buscarMedicosPorNome = async (nomeBusca) => {
    try {
        if (!nomeBusca || nomeBusca.trim() === '') {
            throw new Error('Nome de busca não pode estar vazio');
        }

        const query = `SELECT m.id, m.nome, m.telefone, m.email, e.especialidade 
                       FROM medicos m 
                       INNER JOIN especialidades e ON m.especialidade = e.id 
                       WHERE m.nome LIKE ? 
                       ORDER BY m.nome ASC`;
        
        const parametro = `%${nomeBusca}%`;
        const [resultado] = await conexao.query(query, [parametro]);
        
        if (resultado.length === 0) {
            console.log(`Nenhum médico encontrado com o nome: ${nomeBusca}`);
        }
        
        return resultado;
    } catch (erro) {
        console.error('Erro ao buscar médicos por nome:', erro.message);
        throw new Error(erro.message || 'Falha ao buscar médicos por nome');
    }
}

const buscarMedicosPorEspecialidade = async (especialidadeBusca) => {
    try {
        if (!especialidadeBusca || especialidadeBusca.trim() === '') {
            throw new Error('Especialidade de busca não pode estar vazia');
        }

        const query = `SELECT m.id, m.nome, m.telefone, m.email, e.especialidade 
                       FROM medicos m 
                       INNER JOIN especialidades e ON m.especialidade = e.id 
                       WHERE LOWER(e.especialidade) LIKE LOWER(?) 
                       ORDER BY m.nome ASC`;
        
        const parametro = `%${especialidadeBusca}%`;
        const [resultado] = await conexao.query(query, [parametro]);
        
        if (resultado.length === 0) {
            console.log(`Nenhum médico encontrado na especialidade: ${especialidadeBusca}`);
        }
        
        return resultado;
    } catch (erro) {
        console.error('Erro ao buscar médicos por especialidade:', erro.message);
        throw new Error(erro.message || 'Falha ao buscar médicos por especialidade');
    }
}

export { buscarTodosMedicos, buscarMedicosPorNome, buscarMedicosPorEspecialidade };
