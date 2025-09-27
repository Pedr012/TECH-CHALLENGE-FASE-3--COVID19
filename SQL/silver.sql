USE tech_challenge_covid;

;WITH colunas_analise AS (
    SELECT
        a.Ano,
		'11' as Mes,
        a.UF,
        a.A002 AS idade,
        a.A003 AS sexo,
        a.A004 AS raca,
        a.A005 AS escolaridade,
        a.B0011 AS febre,
        a.B0012 AS tosse,
        a.B0013 AS dor_garganta,
        a.B0014 AS dor_cabeca,
        a.B00111 AS perda_cheiro_sabor,
        a.B011 AS restricao_contato,
        a.B002 AS visita_estab_saude,
        a.B0031 AS ficou_em_casa,
        a.B0032 AS ligou_profissio_saude,
        a.C001 AS trabalhou_na_semana,
        a.C004 AS remunerado,
        a.C005 AS tempo_afastado_trabalho,
        a.C007 AS tipo_ocupacao,
        a.C01011 AS faixa_rendimento,
        a.B007 AS plano_saude,
        a.B008 AS fez_teste_covid,
        a.B009B AS resultado_teste_covid
    FROM PNAD_COVID_112020 AS a
    UNION ALL
    SELECT
        a.Ano,
		'10' as Mes,
        a.UF,
        a.A002 AS idade,
        a.A003 AS sexo,
        a.A004 AS raca,
        a.A005 AS escolaridade,
        a.B0011 AS febre,
        a.B0012 AS tosse,
        a.B0013 AS dor_garganta,
        a.B0014 AS dor_cabeca,
        a.B00111 AS perda_cheiro_sabor,
        a.B011 AS restricao_contato,
        a.B002 AS visita_estab_saude,
        a.B0031 AS ficou_em_casa,
        a.B0032 AS ligou_profissio_saude,
        a.C001 AS trabalhou_na_semana,
        a.C004 AS remunerado,
        a.C005 AS tempo_afastado_trabalho,
        a.C007 AS tipo_ocupacao,
        a.C01011 AS faixa_rendimento,
        a.B007 AS plano_saude,
        a.B008 AS fez_teste_covid,
        a.B009B AS resultado_teste_covid
    FROM PNAD_COVID_102020 AS a
    UNION ALL
    SELECT
        a.Ano,
		'09' as Mes,
        a.UF,
        a.A002 AS idade,
        a.A003 AS sexo,
        a.A004 AS raca,
        a.A005 AS escolaridade,
        a.B0011 AS febre,
        a.B0012 AS tosse,
        a.B0013 AS dor_garganta,
        a.B0014 AS dor_cabeca,
        a.B00111 AS perda_cheiro_sabor,
        a.B011 AS restricao_contato,
        a.B002 AS visita_estab_saude,
        a.B0031 AS ficou_em_casa,
        a.B0032 AS ligou_profissio_saude,
        a.C001 AS trabalhou_na_semana,
        a.C004 AS remunerado,
        a.C005 AS tempo_afastado_trabalho,
        a.C007 AS tipo_ocupacao,
        a.C01011 AS faixa_rendimento,
        a.B007 AS plano_saude,
        a.B008 AS fez_teste_covid,
        a.B009B AS resultado_teste_covid
    FROM PNAD_COVID_092020 AS a
)
INSERT INTO silver_pnad_covid (
    Ano,
	Mes,
    UF,
    sexo,
    raca,
    escolaridade,
    idade,
    febre,
    tosse,
    dor_garganta,
    dor_cabeca,
    perda_cheiro_sabor,
    restricao_contato,
    visita_estab_saude,
    ficou_em_casa,
    ligou_profissio_saude,
    trabalhou_na_semana,
    remunerado,
    tempo_afastado_trabalho,
    tipo_ocupacao,
    faixa_rendimento,
    plano_saude,
    fez_teste_covid,
    resultado_teste_covid
)
SELECT
    a.Ano,
	a.Mes,
    CASE 
        WHEN a.UF IS NULL THEN 'Não Informado'
        WHEN a.UF = '11' THEN 'Rondônia'
        WHEN a.UF = '12' THEN 'Acre'
        WHEN a.UF = '13' THEN 'Amazonas'
        WHEN a.UF = '14' THEN 'Roraima'
        WHEN a.UF = '15' THEN 'Pará'
        WHEN a.UF = '16' THEN 'Amapá'
        WHEN a.UF = '17' THEN 'Tocantins'
        WHEN a.UF = '21' THEN 'Maranhão'
        WHEN a.UF = '22' THEN 'Piauí'
        WHEN a.UF = '23' THEN 'Ceará'
        WHEN a.UF = '24' THEN 'Rio Grande do Norte'
        WHEN a.UF = '25' THEN 'Paraíba'
        WHEN a.UF = '26' THEN 'Pernambuco'
        WHEN a.UF = '27' THEN 'Alagoas'
        WHEN a.UF = '28' THEN 'Sergipe'
        WHEN a.UF = '29' THEN 'Bahia'
        WHEN a.UF = '31' THEN 'Minas Gerais'
        WHEN a.UF = '32' THEN 'Espírito Santo'
        WHEN a.UF = '33' THEN 'Rio de Janeiro'
        WHEN a.UF = '35' THEN 'São Paulo'
        WHEN a.UF = '41' THEN 'Paraná'
        WHEN a.UF = '42' THEN 'Santa Catarina'
        WHEN a.UF = '43' THEN 'Rio Grande do Sul'
        WHEN a.UF = '50' THEN 'Mato Grosso do Sul'
        WHEN a.UF = '51' THEN 'Mato Grosso'
        WHEN a.UF = '52' THEN 'Goiás'
        WHEN a.UF = '53' THEN 'Distrito Federal'
        ELSE 'Ignorado'
    END AS UF,
    CASE 
        WHEN a.sexo IS NULL THEN 'Não Informado'
        WHEN a.sexo = 1 THEN 'Homem'
        WHEN a.sexo = 2 THEN 'Mulher'
        ELSE 'Ignorado'
    END AS sexo,
    CASE 
        WHEN a.raca IS NULL THEN 'Não Informado'
        WHEN a.raca = 1 THEN 'Branca'
        WHEN a.raca = 2 THEN 'Preta'
        WHEN a.raca = 3 THEN 'Amarela'
        WHEN a.raca = 4 THEN 'Parda'
        WHEN a.raca = 5 THEN 'Indígena'
        ELSE 'Ignorado'
    END AS raca,
    CASE 
        WHEN a.escolaridade IS NULL THEN 'Não Informado'
        WHEN a.escolaridade = 1 THEN 'Sem instrução'
        WHEN a.escolaridade = 2 THEN 'Fundamental incompleto'
        WHEN a.escolaridade = 3 THEN 'Fundamental completo'
        WHEN a.escolaridade = 4 THEN 'Médio incompleto'
        WHEN a.escolaridade = 5 THEN 'Médio completo'
        WHEN a.escolaridade = 6 THEN 'Superior incompleto'
        WHEN a.escolaridade = 7 THEN 'Superior completo'
        WHEN a.escolaridade = 8 THEN 'Pós-graduação'
        ELSE 'Ignorado'
    END AS escolaridade,
    CASE 
        WHEN a.idade IS NULL THEN 'Não Informado'
        ELSE CAST(a.idade AS VARCHAR)
    END AS idade,
    CASE 
        WHEN a.febre IS NULL THEN 'Não Informado'
        WHEN a.febre = 1 THEN 'Sim'
        WHEN a.febre = 2 THEN 'Não'
        WHEN a.febre = 3 THEN 'Não sabe'
        WHEN a.febre = 9 THEN 'Ignorado'
        ELSE 'Ignorado'
    END AS febre,
    CASE 
        WHEN a.tosse IS NULL THEN 'Não Informado'
        WHEN a.tosse = 1 THEN 'Sim'
        WHEN a.tosse = 2 THEN 'Não'
        WHEN a.tosse = 3 THEN 'Não sabe'
        WHEN a.tosse = 9 THEN 'Ignorado'
        ELSE 'Ignorado'
    END AS tosse,
    CASE 
        WHEN a.dor_garganta IS NULL THEN 'Não Informado'
        WHEN a.dor_garganta = 1 THEN 'Sim'
        WHEN a.dor_garganta = 2 THEN 'Não'
        WHEN a.dor_garganta = 3 THEN 'Não sabe'
        WHEN a.dor_garganta = 9 THEN 'Ignorado'
        ELSE 'Ignorado'
    END AS dor_garganta,
    CASE 
        WHEN a.dor_cabeca IS NULL THEN 'Não Informado'
        WHEN a.dor_cabeca = 1 THEN 'Sim'
        WHEN a.dor_cabeca = 2 THEN 'Não'
        WHEN a.dor_cabeca = 3 THEN 'Não sabe'
        WHEN a.dor_cabeca = 9 THEN 'Ignorado'
        ELSE 'Ignorado'
    END AS dor_cabeca,
    CASE 
        WHEN a.perda_cheiro_sabor IS NULL THEN 'Não Informado'
        WHEN a.perda_cheiro_sabor = 1 THEN 'Sim'
        WHEN a.perda_cheiro_sabor = 2 THEN 'Não'
        WHEN a.perda_cheiro_sabor = 3 THEN 'Não sabe'
        WHEN a.perda_cheiro_sabor = 9 THEN 'Ignorado'
        ELSE 'Ignorado'
    END AS perda_cheiro_sabor,
    CASE 
        WHEN a.restricao_contato IS NULL THEN 'Não Informado'
        WHEN a.restricao_contato = 1 THEN 'Não fez restrição'
        WHEN a.restricao_contato = 2 THEN 'Reduziu contato'
        WHEN a.restricao_contato = 3 THEN 'Ficou em casa, só saiu por necessidade'
        WHEN a.restricao_contato = 4 THEN 'Ficou rigorosamente em casa'
        WHEN a.restricao_contato = 9 THEN 'Ignorado'
        ELSE 'Ignorado'
    END AS restricao_contato,
    CASE 
        WHEN a.visita_estab_saude IS NULL THEN 'Não Informado'
        WHEN a.visita_estab_saude = 1 THEN 'Sim'
        WHEN a.visita_estab_saude = 2 THEN 'Não'
        WHEN a.visita_estab_saude = 9 THEN 'Ignorado'
        ELSE 'Ignorado'
    END AS visita_estab_saude,
    CASE 
        WHEN a.ficou_em_casa IS NULL THEN 'Não Informado'
        WHEN a.ficou_em_casa = 1 THEN 'Sim'
        WHEN a.ficou_em_casa = 2 THEN 'Não'
        WHEN a.ficou_em_casa = 9 THEN 'Ignorado'
        ELSE 'Ignorado'
    END AS ficou_em_casa,
    CASE 
        WHEN a.ligou_profissio_saude IS NULL THEN 'Não Informado'
        WHEN a.ligou_profissio_saude = 1 THEN 'Sim'
        WHEN a.ligou_profissio_saude = 2 THEN 'Não'
        WHEN a.ligou_profissio_saude = 9 THEN 'Ignorado'
        ELSE 'Ignorado'
    END AS ligou_profissio_saude,
    CASE 
        WHEN a.trabalhou_na_semana IS NULL THEN 'Não Informado'
        WHEN a.trabalhou_na_semana = 1 THEN 'Sim'
        WHEN a.trabalhou_na_semana = 2 THEN 'Não'
        ELSE 'Não aplicável'
    END AS trabalhou_na_semana,
    CASE 
        WHEN a.remunerado IS NULL THEN 'Não Informado'
        WHEN a.remunerado = 1 THEN 'Sim'
        WHEN a.remunerado = 2 THEN 'Não'
        WHEN a.remunerado = 3 THEN 'Não era remunerado'
        ELSE 'Não aplicável'
    END AS remunerado,
    CASE 
        WHEN a.tempo_afastado_trabalho IS NULL THEN 'Não Informado'
        WHEN a.tempo_afastado_trabalho = 1 THEN 'Menos de 1 mês'
        WHEN a.tempo_afastado_trabalho = 2 THEN 'De 1 mês a menos de 1 ano'
        WHEN a.tempo_afastado_trabalho = 3 THEN 'De 1 ano a menos de 2 anos'
        WHEN a.tempo_afastado_trabalho = 4 THEN '2 anos ou mais'
        ELSE 'Não aplicável'
    END AS tempo_afastado_trabalho,
    CASE 
        WHEN a.tipo_ocupacao IS NULL THEN 'Não Informado'
        WHEN a.tipo_ocupacao = 1 THEN 'Trabalhador doméstico'
        WHEN a.tipo_ocupacao = 2 THEN 'Militar'
        WHEN a.tipo_ocupacao = 3 THEN 'Policial/bombeiro'
        WHEN a.tipo_ocupacao = 4 THEN 'Empregado privado'
        WHEN a.tipo_ocupacao = 5 THEN 'Empregado público'
        WHEN a.tipo_ocupacao = 6 THEN 'Empregador'
        WHEN a.tipo_ocupacao = 7 THEN 'Conta própria'
        WHEN a.tipo_ocupacao = 8 THEN 'Trabalhador familiar não remunerado'
        WHEN a.tipo_ocupacao = 9 THEN 'Fora do mercado'
        ELSE 'Não aplicável'
    END AS tipo_ocupacao,
    CASE 
        WHEN a.faixa_rendimento IS NULL THEN 'Não Informado'
        WHEN a.faixa_rendimento = 0 THEN '0 - 100'
        WHEN a.faixa_rendimento = 1 THEN '101 - 300'
        WHEN a.faixa_rendimento = 2 THEN '301 - 600'
        WHEN a.faixa_rendimento = 3 THEN '601 - 800'
        WHEN a.faixa_rendimento = 4 THEN '801 - 1.600'
        WHEN a.faixa_rendimento = 5 THEN '1.601 - 3.000'
        WHEN a.faixa_rendimento = 6 THEN '3.001 - 10.000'
        WHEN a.faixa_rendimento = 7 THEN '10.001 - 50.000'
        WHEN a.faixa_rendimento = 8 THEN '50.001 - 100.000'
        WHEN a.faixa_rendimento = 9 THEN 'Mais de 100.000'
        ELSE 'Não aplicável'
    END AS faixa_rendimento,
    CASE 
        WHEN a.plano_saude IS NULL THEN 'Não Informado'
        WHEN a.plano_saude = 1 THEN 'Sim'
        WHEN a.plano_saude = 2 THEN 'Não'
        WHEN a.plano_saude = 9 THEN 'Ignorado'
        ELSE 'Ignorado'
    END AS plano_saude,
    CASE 
        WHEN a.fez_teste_covid IS NULL THEN 'Não Informado'
        WHEN a.fez_teste_covid = 1 THEN 'Sim'
        WHEN a.fez_teste_covid = 2 THEN 'Não'
        WHEN a.fez_teste_covid = 9 THEN 'Ignorado'
        ELSE 'Ignorado'
    END AS fez_teste_covid,
    CASE 
        WHEN a.resultado_teste_covid IS NULL THEN 'Não Informado'
        WHEN a.resultado_teste_covid = 1 THEN 'Positivo'
        WHEN a.resultado_teste_covid = 2 THEN 'Negativo'
        WHEN a.resultado_teste_covid = 3 THEN 'Inconclusivo'
        WHEN a.resultado_teste_covid = 4 THEN 'Sem resultado'
        WHEN a.resultado_teste_covid = 9 THEN 'Ignorado'
        ELSE 'Não aplicável'
    END AS resultado_teste_covid
FROM colunas_analise AS a;

SELECT TOP 10
*
FROM silver_pnad_covid


