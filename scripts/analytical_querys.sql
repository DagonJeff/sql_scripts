
-- Último Trimestre
SELECT
    o.razao_social,
    SUM(CASE
        WHEN dc.vl_saldo_inicial > dc.vl_saldo_final AND dc.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÃŠNCIA A SAÃšDE MEDICO HOSPITALAR'
        THEN dc.vl_saldo_inicial - dc.vl_saldo_final
        ELSE 0
    END) AS total_despesas,
    'Último Trimestre' AS periodo
FROM
    demonstracoes_contabeis dc
JOIN
    operadoras o ON dc.reg_ans = o.registro_ans
WHERE
    dc.data >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY
    o.razao_social
ORDER BY
    total_despesas DESC
LIMIT 10

UNION ALL

-- Último Ano
SELECT
    o.razao_social,
    SUM(CASE
        WHEN dc.vl_saldo_inicial > dc.vl_saldo_final AND dc.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÃŠNCIA A SAÃšDE MEDICO HOSPITALAR'
        THEN dc.vl_saldo_inicial - dc.vl_saldo_final
        ELSE 0
    END) AS total_despesas,
    'Último Ano' AS periodo
FROM
    demonstracoes_contabeis dc
JOIN
    operadoras o ON dc.reg_ans = o.registro_ans
WHERE
    dc.data >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY
    o.razao_social
ORDER BY
    total_despesas DESC
LIMIT 10;