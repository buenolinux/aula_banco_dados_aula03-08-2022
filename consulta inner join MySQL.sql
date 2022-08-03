SELECT tab_alunos.nome AS 'Nome do aluno',
	tab_professores.nome AS'Nome do professor',
	tab_salas.numero AS 'Número da sala',
    tab_turmas.nome AS 'Turma' FROM tab_turmas
INNER JOIN tab_alunos
ON tab_alunos.id_aluno = tab_turmas.id_aluno

INNER JOIN tab_professores
ON tab_professores.id_professor = tab_turmas.id_professor

INNER JOIN tab_salas
ON tab_salas.id_sala = tab_turmas.id_sala

/*------------------------------------------------*/

INSERT INTO tab_vendas(id_vendedor, data, valor)
VALUES
(1,'2022-08-02',150.00),
(1,'2022-08-02',650.00),
(2,'2022-08-02',250.00),
(1,'2022-08-02',980.00),
(2,'2022-08-02',150.00),
(1,'2022-08-02',150.00),
(1,'2022-08-02',650.00),
(2,'2022-08-02',250.00),
(1,'2022-08-02',980.00),
(2,'2022-08-02',150.00),
(1,'2022-08-02',150.00),
(3,'2022-08-02',650.00),
(2,'2022-08-02',250.00),
(2,'2022-08-02',980.00),
(3,'2022-08-02',150.00),
(3,'2022-08-02',650.00),
(2,'2022-08-02',250.00),
(2,'2022-08-02',988.00),
(3,'2022-08-02',155.00),
(3,'2022-08-02',550.00),
(2,'2022-08-02',450.00),
(2,'2022-08-02',80.00),
(4,'2022-08-02',130.00),
(3,'2022-08-02',680.00),
(2,'2022-08-02',270.00),
(1,'2022-08-02',480.00),
(4,'2022-08-02',250.00),
(4,'2022-08-02',150.00),
(4,'2022-08-02',650.00),
(3,'2022-08-02',350.00),
(3,'2022-08-02',550.00),
(4,'2022-08-02',250.00);

/* ---------------------------------------- */

/*  Mostrar a quantidade de vendas de cada vendedor */

SELECT id_vendedor as 'Código do vendedor', COUNT(valor) AS 'Quantidade de vendas' FROM tab_vendas
GROUP BY id_vendedor;

/* ---------------------------------------- */

/*  Mostrar a quantidade de vendas de cada vendedor e seu nome (sem INNER JOIN)*/
SELECT tab_vendedores.nome AS 'Nome do vendedor', 
		COUNT(tab_vendas.id_vendedor) AS 'Quantidade de vendas'
from tab_vendedores, tab_vendas
where tab_vendedores.id_vendedor = tab_vendas.id_vendedor GROUP BY(tab_vendas.id_vendedor) ;

/* ---------------------------------------- */


/*  Mostrar a quantidade de vendas de cada vendedor e seu nome (com INNER JOIN)*/

SELECT tab_vendedores.nome AS 'Nome do vendedor',
		COUNT(tab_vendas.id_vendedor) AS 'Quantidade de venas'
        FROM tab_vendedores
        INNER JOIN tab_vendas
        ON tab_vendas.id_vendedor = tab_vendedores.id_vendedor
        GROUP BY tab_vendedores.nome, tab_vendas.id_vendedor

/* ---------------------------------------- */


/*  Mostrar o total de vendido por vendedor*/
SELECT 
		 SUM(valor) AS 'Total de vendas '
FROM  tab_vendas
GROUP BY id_vendedor


/* -------------------------------------------- */
/*  Mostrar o total de vendido por vendedor e o seu nome (sem INNER JOIN)*/
SELECT 		
		tab_vendas.id_vendedor,
		 tab_vendedores.nome AS 'Nome do vendedor',
		 SUM(tab_vendas.valor) AS 'Total de vendas '
FROM   tab_vendedores, tab_vendas
where tab_vendedores.id_vendedor = tab_vendas.id_vendedor
GROUP BY   tab_vendas.id_vendedor, tab_vendedores.nome 


/* -------------------------------------------- */
/*  Mostrar o total de vendido por vendedor e o seu nome (com INNER JOIN)*/
SELECT 		
		tab_vendas.id_vendedor,
		 tab_vendedores.nome AS 'Nome do vendedor',
		 SUM(tab_vendas.valor) AS 'Total de vendas '
FROM   tab_vendedores
INNER JOIN tab_vendas
ON tab_vendas.id_vendedor = tab_vendedores.id_vendedor
GROUP BY   tab_vendas.id_vendedor, tab_vendedores.nome 


/* -------------------------------------------- */


/*
Usando o Having
Determina uma condição de busca para um grupo ou um conjunto 
de registro, definindo critérios para limitar os resultados

só pode ser usada em parceria com o group by

mostra o total vendido por vendedor maior ou igual a 1000

e seu nome (sem  o inner join)
*/

SELECT tab_vendas.id_vendedor AS 'Código',
		tab_vendedores.nome AS Vendedor,
        SUM(tab_vendas.valor) AS Total
FROM tab_vendas, tab_vendedores
WHERE tab_vendas.id_vendedor = tab_vendedores.id_vendedor
GROUP BY tab_vendas.id_vendedor, tab_vendedores.nome
HAVING SUM(tab_vendas.valor)>= 1000;
