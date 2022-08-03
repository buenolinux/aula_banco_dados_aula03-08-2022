SELECT tab_alunos.nome AS 'Nome do aluno',
	tab_professores.nome AS'Nome do professor',
	tab_salas.numero AS 'Número da sala'FROM tab_turmas
INNER JOIN tab_alunos
ON tab_alunos.id_aluno = tab_turmas.id_aluno

INNER JOIN tab_professores
ON tab_professores.id_professor = tab_turmas.id_professor

INNER JOIN tab_salas
ON tab_salas.id_sala = tab_turmas.id_sala

