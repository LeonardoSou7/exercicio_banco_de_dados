drop database BDEX3_REDESOCIAL;
CREATE DATABASE IF NOT EXISTS BDEX3_REDESOCIAL;
USE BDEX3_REDESOCIAL;

CREATE TABLE IF NOT EXISTS USUARIOS(
ID_USUARIO INT PRIMARY KEY,
NOME_USUARIO VARCHAR(100) NOT NULL,
SOBRENOME VARCHAR(100) NOT NULL,
EMAIL VARCHAR(100));

CREATE TABLE IF NOT EXISTS GRUPOS(
ID_GRUPO INT PRIMARY KEY,
NOME_GRUPO VARCHAR(100) NOT NULL,
DESCRICAO TEXT NOT NULL);

CREATE TABLE IF NOT EXISTS POSTAGENS(
ID_POST INT PRIMARY KEY,
TEXTO TEXT,
IMAGEM BLOB,
DATA_HORA DATETIME NOT NULL,
USUARIO INT NOT NULL,
CONSTRAINT USER_POST FOREIGN KEY(USUARIO) REFERENCES USUARIOS(ID_USUARIO));

CREATE TABLE IF NOT EXISTS COMENTARIOS(
ID_COMENTARIO INT PRIMARY KEY,
TEXTO TEXT NOT NULL,
DATAHORA DATETIME NOT NULL,
USUARIO INT NOT NULL,
POST INT NOT NULL,
CONSTRAINT USER_COMM FOREIGN KEY(USUARIO) REFERENCES USUARIOS(ID_USUARIO),
CONSTRAINT POST_COMM FOREIGN KEY(POST) REFERENCES POSTAGENS(ID_POST));

CREATE TABLE IF NOT EXISTS SEGUIDORES_USUARIOS(
USUARIO INT,
SEGUIDOR INT,
PRIMARY KEY(USUARIO,SEGUIDOR),
CONSTRAINT USER1 FOREIGN KEY(USUARIO) REFERENCES USUARIOS(ID_USUARIO),
CONSTRAINT USER2 FOREIGN KEY(SEGUIDOR) REFERENCES USUARIOS(ID_USUARIO));

CREATE TABLE IF NOT EXISTS USUARIOS_GRUPOS(
USUARIO INT,
GRUPO INT,
PRIMARY KEY(USUARIO,GRUPO),
CONSTRAINT USER_GROUP FOREIGN KEY(USUARIO) REFERENCES USUARIOS(ID_USUARIO),
CONSTRAINT GROUP_USER FOREIGN KEY(GRUPO) REFERENCES GRUPOS(ID_GRUPO));

ALTER TABLE USUARIOS
MODIFY COLUMN EMAIL VARCHAR(20) NOT NULL;

INSERT INTO USUARIOS (ID_USUARIO, NOME_USUARIO, SOBRENOME, EMAIL) VALUES
(1, 'Alice', 'Silva', 'alice@example.com'),
(2, 'Bruno', 'Santos', 'bruno@example.com'),
(3, 'Carolina', 'Oliveira', 'carolina@example.com'),
(4, 'Daniel', 'Martins', 'daniel@example.com'),
(5, 'Eduarda', 'Pereira', 'eduarda@example.com'),
(6, 'Fábio', 'Almeida', 'fabio@example.com'),
(7, 'Gabriela', 'Rodrigues', 'gabriela@example.com'),
(8, 'Henrique', 'Fernandes', 'henrique@example.com'),
(9, 'Isabela', 'Costa', 'isabela@example.com'),
(10, 'Jorge', 'Mendes', 'jorge@example.com'),
(11, 'Karina', 'Nunes', 'karina@example.com'),
(12, 'Lucas', 'Gomes', 'lucas@example.com'),
(13, 'Mariana', 'Lima', 'mariana@example.com'),
(14, 'Nathalia', 'Ribeiro', 'nathalia@example.com'),
(15, 'Otávio', 'Campos', 'otavio@example.com'),
(16, 'Patrícia', 'Ferreira', 'patricia@example.com'),
(17, 'Rafael', 'Dias', 'rafael@example.com'),
(18, 'Sofia', 'Araújo', 'sofia@example.com'),
(19, 'Thiago', 'Barbosa', 'thiago@example.com'),
(20, 'Vanessa', 'Carvalho', 'vanessa@example.com');

INSERT INTO GRUPOS (ID_GRUPO, NOME_GRUPO, DESCRICAO) VALUES
(1, 'Música', 'Compartilhamento de músicas e discussões'),
(2, 'Esportes', 'Discussões e informações sobre esportes'),
(3, 'Cinema', 'Filmes e discussões sobre cinema'),
(4, 'Moda', 'Tendências de moda e estilo'),
(5, 'Tecnologia', 'Novidades e discussões sobre tecnologia'),
(6, 'Política', 'Discussões sobre política e atualidades'),
(7, 'Animais de Estimação', 'Dicas e cuidados com animais de estimação'),
(8, 'Culinária', 'Receitas e dicas de culinária'),
(9, 'Arte', 'Compartilhamento de obras de arte e discussões'),
(10, 'Viagens', 'Dicas e experiências de viagens'),
(11, 'Literatura', 'Livros e discussões literárias'),
(12, 'Saúde e Bem-estar', 'Dicas e informações sobre saúde e bem-estar'),
(13, 'Negócios', 'Discussões sobre empreendedorismo e negócios'),
(14, 'Beleza', 'Dicas de beleza e cuidados com a pele'),
(15, 'Fotografia', 'Compartilhamento de fotos e dicas'),
(16, 'Jogos', 'Discussões sobre jogos e videogames'),
(17, 'Educação', 'Troca de conhecimentos e experiências educacionais'),
(18, 'Design', 'Design gráfico e discussões relacionadas'),
(19, 'História', 'Discussões sobre história e eventos históricos'),
(20, 'Família', 'Dicas e apoio para questões familiares');

INSERT INTO POSTAGENS (ID_POST, TEXTO, IMAGEM, DATA_HORA, USUARIO) VALUES
(1, 'Que dia lindo!', NULL, '2024-05-13 10:00:00', 1),
(2, 'Novo livro chegou hoje!', NULL, '2024-05-13 12:30:00', 2),
(3, 'Hora de malhar!', NULL, '2024-05-12 15:45:00', 3),
(4, 'Adoro essa música!', NULL, '2024-05-12 18:00:00', 4),
(5, 'Grande jogo hoje!', NULL, '2024-05-11 20:00:00', 5),
(6, 'Filme incrível!', NULL, '2024-05-10 22:30:00', 6),
(7, 'Nova tendência!', NULL, '2024-05-10 08:45:00', 7),
(8, 'Novo gadget!', NULL, '2024-05-09 11:00:00', 8),
(9, 'Polêmica política!', NULL, '2024-05-08 14:20:00', 9),
(10, 'Receita deliciosa!', NULL, '2024-05-07 16:30:00', 10),
(11, 'Obra de arte!', NULL, '2024-05-06 18:45:00', 1),
(12, 'Experiência incrível!', NULL, '2024-05-05 20:00:00', 2),
(13, 'Dicas de beleza!', NULL, '2024-05-04 22:15:00', 3),
(14, 'Foto do dia!', NULL, '2024-05-03 10:30:00', 4),
(15, 'Novo jogo lançado!', NULL, '2024-05-02 12:45:00', 1),
(16, 'Aprendizado constante!', NULL, '2024-05-01 15:00:00', 2),
(17, 'Design inovador!', NULL, '2024-04-30 17:20:00', 3),
(18, 'Curiosidades históricas!', NULL, '2024-04-29 19:30:00', 4),
(19, 'Momento em família!', NULL, '2024-04-28 21:40:00', 1),
(20, 'Bem-estar em primeiro lugar!', NULL, '2024-04-27 23:50:00', 2);

INSERT INTO COMENTARIOS (ID_COMENTARIO, TEXTO, DATAHORA, USUARIO, POST) VALUES
(1, 'Que foto incrível!', '2024-05-13 10:15:00', 2, 1),
(2, 'Adoro esse livro!', '2024-05-13 13:00:00', 1, 2),
(3, 'Bora lá!', '2024-05-12 16:00:00', 2, 3),
(4, 'Adorei essa música!', '2024-05-12 18:30:00', 3, 4),
(5, 'Foi emocionante!', '2024-05-11 21:00:00', 4, 5),
(6, 'Inesquecível!', '2024-05-10 23:30:00', 5, 6),
(7, 'Eu quero!', '2024-05-10 09:00:00', 6, 7),
(8, 'Preciso disso!', '2024-05-09 12:15:00', 7, 8),
(9, 'Vamos debater!', '2024-05-08 15:40:00', 8, 9),
(10, 'Quero a receita!', '2024-05-07 17:45:00', 9, 10),
(11, 'Inspirador!', '2024-05-06 19:00:00', 10, 11),
(12, 'Amei!', '2024-05-05 21:15:00', 11, 12),
(13, 'Excelentes dicas!', '2024-05-04 23:30:00', 12, 13),
(14, 'Que bela foto!', '2024-05-03 11:45:00', 13, 14),
(15, 'Vamos jogar juntos!', '2024-05-02 13:50:00', 14, 15),
(16, 'Compartilhando conhecimento!', '2024-05-01 16:00:00', 15, 16),
(17, 'Fantástico!', '2024-04-30 18:30:00', 16, 17),
(18, 'Interessante!', '2024-04-29 20:40:00', 17, 18),
(19, 'Momento especial!', '2024-04-28 22:50:00', 18, 19),
(20, 'Concordo!', '2024-04-27 23:59:00', 19, 20);

INSERT INTO SEGUIDORES_USUARIOS (USUARIO, SEGUIDOR) VALUES
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 9),
(3, 10),
(3, 11),
(4, 12),
(4, 13),
(4, 14),
(5, 15),
(5, 16),
(5, 17),
(6, 18),
(6, 19),
(6, 20),
(7, 1),
(7, 2),
(8, 3),
(8, 4);

INSERT INTO USUARIOS_GRUPOS (USUARIO, GRUPO) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15),
(8, 16),
(9, 17),
(9, 18),
(10, 19),
(10, 20),
(11, 1),
(11, 2),
(12, 3),
(12, 4),
(13, 5),
(13, 6),
(14, 7),
(14, 8),
(15, 9),
(15, 10),
(16, 11),
(16, 12),
(17, 13),
(17, 14),
(18, 15),
(18, 16),
(19, 17),
(19, 18),
(20, 19),
(20, 20);


-- 1. Exibir todas as informações da tabela `USUARIOS`.X
-- 2. Mostrar os nomes, sobrenomes e e-mails de todos os usuários.X
-- 3. Listar os nomes e descrições de todos os grupos.X
-- 4. Exibir os detalhes das postagens: ID da postagem, texto, data e hora, e o nome do usuário que postou.X
-- 5. Listar o nome dos usuários e a quantidade de postagens que cada um fez.X
-- 6. Mostrar os nomes dos usuários que fizeram comentários em 2024.
-- 7. Listar todos os grupos, ordenados pelo nome do grupo de A a Z.
-- 8. Mostrar os nomes dos grupos que têm a palavra "Tecnologia" na descrição.
-- 9. Exibir os detalhes dos comentários: ID do comentário, texto, data e hora, nome do usuário que comentou e ID da postagem comentada.
-- 10. Para cada postagem, mostrar o ID da postagem e a quantidade de comentários.
-- 11. Contar quantos seguidores cada usuário possui.
-- 12. Listar os nomes dos usuários que pertencem ao grupo "Desenvolvimento".
-- 13. Mostrar o nome dos usuários e a data e hora da última postagem que eles fizeram.
-- 14. Contar quantas postagens cada usuário fez.
-- 15. Para cada grupo, exibir o nome do grupo e a quantidade de usuários que pertencem a ele.


select * from USUARIOS;

select NOME_USUARIO, SOBRENOME, EMAIL from USUARIOS;

select NOME_GRUPO, DESCRICAO from GRUPOS;

SELECT 
    p.ID_POST AS 'ID da postagem',
    p.TEXTO AS 'Texto da postagem',
    p.DATA_HORA AS 'Data e hora da postagem',
    CONCAT(u.NOME_USUARIO, ' ', u.SOBRENOME) AS 'Nome do usuário'
FROM 
    POSTAGENS p
JOIN 
    USUARIOS u ON p.USUARIO = u.ID_USUARIO;

SELECT 
    CONCAT(u.NOME_USUARIO, ' ', u.SOBRENOME) AS 'Nome do usuário',
    COUNT(p.ID_POST) AS 'Quantidade de postagens'
FROM 
    USUARIOS u
LEFT JOIN 
    POSTAGENS p ON u.ID_USUARIO = p.USUARIO
GROUP BY 
    u.ID_USUARIO;



-- XXX
SELECT 
    SEGUIDO.ID_USUARIO AS 'ID do usuário',
    CONCAT(U.NOME_USUARIO, ' ', U.SOBRENOME) AS 'Nome do usuário',
    COUNT(SEGUIDO.SEGUIDOR) AS 'Quantidade de seguidores'
FROM 
    USUARIOS U
LEFT JOIN 
    SEGUIDORES_USUARIOS SEGUIDO ON U.ID_USUARIO = SEGUIDO.USUARIO
GROUP BY 
    SEGUIDO.ID_USUARIO;
