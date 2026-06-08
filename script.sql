-- Atividade Supabase - Relacionamentos entre tabelas
-- Relações: 1:1, 1:N e N:N

create table turmas (
  id bigint generated always as identity primary key,
  nome text not null
);

create table alunos (
  id bigint generated always as identity primary key,
  nome text not null,
  turma_id bigint not null references turmas(id)
);

create table perfis_alunos (
  id bigint generated always as identity primary key,
  aluno_id bigint unique not null references alunos(id),
  data_nascimento date,
  telefone text
);

create table disciplinas (
  id bigint generated always as identity primary key,
  nome text not null
);

create table alunos_disciplinas (
  aluno_id bigint not null references alunos(id),
  disciplina_id bigint not null references disciplinas(id),
  primary key (aluno_id, disciplina_id)
);

-- Dados de exemplo

insert into turmas (nome) values
('2º DS'),
('3º DS');

insert into alunos (nome, turma_id) values
('Rafael', 1),
('Lucas', 1),
('Ana', 2);

insert into perfis_alunos (aluno_id, data_nascimento, telefone) values
(1, '2008-05-10', '41999999999'),
(2, '2008-08-20', '41988888888'),
(3, '2007-03-15', '41977777777');

insert into disciplinas (nome) values
('Banco de Dados'),
('Programação Web'),
('Matemática');

insert into alunos_disciplinas (aluno_id, disciplina_id) values
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(3, 3);