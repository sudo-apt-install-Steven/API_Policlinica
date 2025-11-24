import express from 'express';
import { buscarTodosMedicos, buscarMedicosPorNome, buscarMedicosPorEspecialidade } from './servico/retornaMedicos_servico.js';

const app = express();
const PORTA = 3000;

app.use(express.json());

app.use((erro, requisicao, resposta, proximo) => {
    console.error('Erro não tratado:', erro);
    resposta.status(500).json({
        erro: 'Erro interno do servidor',
        mensagem: erro.message
    });
});

app.get('/medicos', async (requisicao, resposta) => {
    try {
        const parametros = requisicao.query;
        let dadosMedicos;
        
        if (parametros.nome) {
            dadosMedicos = await buscarMedicosPorNome(parametros.nome);
        } else if (parametros.especialidade) {
            dadosMedicos = await buscarMedicosPorEspecialidade(parametros.especialidade);
        } else {
            dadosMedicos = await buscarTodosMedicos();
        }
        
        if (dadosMedicos.length === 0) {
            return resposta.status(404).json({
                mensagem: 'Nenhum médico encontrado com os critérios informados',
                dados: []
            });
        }
        
        resposta.status(200).json({
            sucesso: true,
            total: dadosMedicos.length,
            dados: dadosMedicos
        });
        
    } catch (erro) {
        console.error('Erro na rota /medicos:', erro.message);
        
        const statusCode = erro.message.includes('vazio') ? 400 : 500;
        
        resposta.status(statusCode).json({ 
            sucesso: false,
            erro: 'Erro ao buscar médicos',
            mensagem: erro.message 
        });
    }
});

app.use((requisicao, resposta) => {
    resposta.status(404).json({
        erro: 'Rota não encontrada',
        mensagem: `A rota ${requisicao.method} ${requisicao.url} não existe`
    });
});

app.listen(PORTA, () => {
    console.log(`API da Policlínica rodando em http://localhost:${PORTA}`);
    console.log(`Rotas disponíveis:`);
    console.log(`  - GET /medicos - Lista todos os médicos`);
    console.log(`  - GET /medicos?nome=[nome] - Filtra médicos por nome`);
    console.log(`  - GET /medicos?especialidade=[especialidade] - Filtra por especialidade`);
}).on('error', (erro) => {
    if (erro.code === 'EADDRINUSE') {
        console.error(`Erro: A porta ${PORTA} já está em uso`);
    } else {
        console.error('Erro ao iniciar o servidor:', erro.message);
    }
    process.exit(1);
});
