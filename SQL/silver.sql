USE tech_challenge_covid;
TRUNCATE TABLE silver_pnad_covid;
;WITH colunas_analise AS (
    SELECT
        a.Ano,
		11 as Mes,
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
		10 as Mes,
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
		09 as Mes,
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
    Pais,
    sexo,
    raca,
    escolaridade,
    idade,
    faixa_etaria,
    vulnerabilidade_socioeconomica,
    categoria_trabalho,
    intensidade_sintomas,
    adesao_medidas,
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
    faixa_rendimento_original,
    plano_saude,
    fez_teste_covid,
    resultado_teste_covid
)
SELECT
    a.Ano,
	a.Mes,
    CASE 
        WHEN a.UF IS NULL THEN 'Não Informado'
        WHEN a.uf = '11' THEN 'RO'
        WHEN a.uf = '12' THEN 'AC'
        WHEN a.uf = '13' THEN 'AM'
        WHEN a.uf = '14' THEN 'RR'
        WHEN a.uf = '15' THEN 'PA'
        WHEN a.uf = '16' THEN 'AP'
        WHEN a.uf = '17' THEN 'TO'
        WHEN a.uf = '21' THEN 'MA'
        WHEN a.uf = '22' THEN 'PI'
        WHEN a.uf = '23' THEN 'CE'
        WHEN a.uf = '24' THEN 'RN'
        WHEN a.uf = '25' THEN 'PB'
        WHEN a.uf = '26' THEN 'PE'
        WHEN a.uf = '27' THEN 'AL'
        WHEN a.uf = '28' THEN 'SE'
        WHEN a.uf = '29' THEN 'BA'
        WHEN a.uf = '31' THEN 'MG'
        WHEN a.uf = '32' THEN 'ES'
        WHEN a.uf = '33' THEN 'RJ'
        WHEN a.uf = '35' THEN 'SP'
        WHEN a.uf = '41' THEN 'PR'
        WHEN a.uf = '42' THEN 'SC'
        WHEN a.uf = '43' THEN 'RS'
        WHEN a.uf = '50' THEN 'MS'
        WHEN a.uf = '51' THEN 'MT'
        WHEN a.uf = '52' THEN 'GO'
        WHEN a.uf = '53' THEN 'DF'
        ELSE 'Ignorado'
    END AS UF,
    'Brasil' AS Pais,
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
    -- Faixa Etária
    CASE 
        WHEN a.idade IS NULL THEN 'Não Informado'
        WHEN CAST(a.idade AS INT) < 18 THEN '0-17 anos'
        WHEN CAST(a.idade AS INT) BETWEEN 18 AND 29 THEN '18-29 anos'
        WHEN CAST(a.idade AS INT) BETWEEN 30 AND 49 THEN '30-49 anos'
        WHEN CAST(a.idade AS INT) BETWEEN 50 AND 64 THEN '50-64 anos'
        WHEN CAST(a.idade AS INT) >= 65 THEN '65+ anos'
        ELSE 'Não informado'
    END AS faixa_etaria,
    -- Vulnerabilidade Socioeconômica
    CASE 
        WHEN (a.escolaridade IN (1, 2) OR a.escolaridade IS NULL) 
             AND (a.faixa_rendimento IN (0, 1) OR a.faixa_rendimento IS NULL)
        THEN 'Alta vulnerabilidade'
        WHEN (a.escolaridade IN (3, 4)) 
             AND (a.faixa_rendimento IN (2, 3))
        THEN 'Média vulnerabilidade'
        ELSE 'Baixa vulnerabilidade'
    END AS vulnerabilidade_socioeconomica,
    -- Categoria de Trabalho
    CASE 
        WHEN a.tipo_ocupacao IN (4, 5, 2) THEN 'Formal'
        WHEN a.tipo_ocupacao IN (7, 1) THEN 'Informal'
        WHEN a.tipo_ocupacao = 6 THEN 'Empregador'
        WHEN a.tipo_ocupacao IN (8, 9) THEN 'Fora do mercado'
        ELSE 'Não informado'
    END AS categoria_trabalho,
    -- Intensidade de Sintomas
    CASE 
        WHEN (CASE WHEN a.febre = 1 THEN 1 ELSE 0 END +
              CASE WHEN a.tosse = 1 THEN 1 ELSE 0 END +
              CASE WHEN a.dor_cabeca = 1 THEN 1 ELSE 0 END +
              CASE WHEN a.dor_garganta = 1 THEN 1 ELSE 0 END +
              CASE WHEN a.perda_cheiro_sabor = 1 THEN 1 ELSE 0 END) >= 3 
        THEN 'Múltiplos sintomas'
        WHEN (CASE WHEN a.febre = 1 THEN 1 ELSE 0 END +
              CASE WHEN a.tosse = 1 THEN 1 ELSE 0 END +
              CASE WHEN a.dor_cabeca = 1 THEN 1 ELSE 0 END +
              CASE WHEN a.dor_garganta = 1 THEN 1 ELSE 0 END +
              CASE WHEN a.perda_cheiro_sabor = 1 THEN 1 ELSE 0 END) BETWEEN 1 AND 2
        THEN 'Poucos sintomas'
        ELSE 'Sem sintomas relatados'
    END AS intensidade_sintomas,
    -- Adesão às Medidas
    CASE 
        WHEN a.restricao_contato IN (3, 4) AND a.ficou_em_casa = 1
        THEN 'Alta adesão'
        WHEN a.restricao_contato = 2
        THEN 'Média adesão'
        WHEN a.restricao_contato = 1
        THEN 'Baixa adesão'
        ELSE 'Não informado'
    END AS adesao_medidas,
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
        WHEN a.restricao_contato = 3 THEN 'Ficou em casa'
        WHEN a.restricao_contato = 4 THEN 'Rigorosamente em casa'
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
    a.faixa_rendimento as faixa_rendimento_original,
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


