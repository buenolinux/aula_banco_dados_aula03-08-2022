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
