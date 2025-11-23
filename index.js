import express from 'express';
import { listarTodosMedicos, filtrarMedicosPorNome, filtrarMedicosPorEspecialidade } from './servico/retornaMedicos_servico.js';






const app = express();
const PORT = 3000;





app.use(express.json());






app.get('/medicos', async (req, res) => {
    try {
        const { nome, especialidade } = req.query;
        
        let medicos;
        
        if (nome) {
            medicos = await filtrarMedicosPorNome(nome);
        }
        else if (especialidade) {
            medicos = await filtrarMedicosPorEspecialidade(especialidade);
        }
        else {
            medicos = await listarTodosMedicos();
        }
        
        res.json(medicos);
        
    } catch (error) {
        console.error('Erro ao buscar médicos:', error);
        res.status(500).json({ 
            erro: 'Erro ao buscar médicos',
            mensagem: error.message 
        });
    }
});



app.listen(PORT, () => {
    console.log(`API da Policlínica rodando em http://localhost:${PORT}`);
    console.log(`Rotas disponíveis:`);
    console.log(`  - GET /medicos - Lista todos os médicos`);
    console.log(`  - GET /medicos?nome=[nome] - Filtra médicos por nome`);
    console.log(`  - GET /medicos?especialidade=[especialidade] - Filtra por especialidade`);
});
