-- Último Trimestre
SELECT
    od.razao_social,
    SUM(dc.vl_saldo_inicial - dc.vl_saldo_final) AS total_despesas,
    'Último Trimestre' AS periodo
FROM
    demonstracoes_contabeis dc
JOIN
    operadoras_dados od ON dc.reg_ans = od.registro_ans
WHERE
    dc.vl_saldo_inicial > dc.vl_saldo_final
    AND dc.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
    AND dc.data >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY
    od.razao_social
ORDER BY
    total_despesas DESC
LIMIT 10;

-- Último Ano
SELECT
    od.razao_social,
    SUM(dc.vl_saldo_inicial - dc.vl_saldo_final) AS total_despesas,
    'Último Ano' AS periodo
FROM
    demonstracoes_contabeis dc
JOIN
    operadoras_dados od ON dc.reg_ans = od.registro_ans
WHERE
    dc.vl_saldo_inicial > dc.vl_saldo_final
    AND dc.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
    AND dc.data >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY
    od.razao_social
ORDER BY
    total_despesas DESC
LIMIT 10;