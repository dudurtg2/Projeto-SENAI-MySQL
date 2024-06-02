CREATE DATABASE  Pastelaria;
USE Pastelaria;

CREATE TABLE clientes (
    id_cliente int primary key auto_increment,
    nome_completo varchar(100),
    apelido varchar(50),
    cpf VARCHAR(14) unique,
    data_nascimento date,
    telefone varchar(15),
    email varchar(100),
    bairro varchar(100),
    cidade varchar(50),
    estado varchar(2)
);

CREATE TABLE categoria (
    id_categoria int primary key auto_increment,
    nome varchar(50)
);

CREATE TABLE forma_pagamentos (
    id_forma_pagamento int primary key auto_increment,
    nome varchar(50)
);

CREATE TABLE recheio (
    id_recheio int primary key auto_increment,
    nome varchar(100)
);

CREATE TABLE pedidos (
    id_pedido int primary key auto_increment,
    data_pedido date default (CURRENT_DATE),
    id_cliente int not null,
    id_forma_pagamento int not null,
    foreign key(id_forma_pagamento) references forma_pagamentos(id_forma_pagamento),
    foreign key(id_cliente) references clientes(id_cliente)
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    preco DECIMAL(8,2),
    tamanho VARCHAR(50),
    id_categoria INT NOT NULL,
    id_recheio INT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    FOREIGN KEY (id_recheio) REFERENCES recheio(id_recheio)
);

CREATE TABLE recheio_produto (
    id_recheio_produto int primary key auto_increment,
    id_recheio int not null,
    id_produto int not null,
    foreign key(id_recheio) references recheio(id_recheio),
    foreign key(id_produto) references produto(id_produto)
);

CREATE TABLE itens_pedido (
    id_item int primary key auto_increment,
    id_pedido int not null,
    id_produto int not null,
    quantidade int not null,
    foreign key(id_pedido) references pedidos(id_pedido),
    foreign key(id_produto) references produto(id_produto)
);

INSERT INTO recheio(nome)
VALUES 
    ('carne'),
    ('frango'),
    ('queijo'),
    ('palmito'),
    ('espinafre'),
    ('camarão'),
    ('bacalhau'),
    ('Pastel de Queijo e Cheesecake'),
    ('Queijo com Goiabada'),
    ('Queijo e Milho'),
    ('Bacon');

INSERT INTO categoria(nome)
VALUES 
    ('simples'),
    ('vegano'),
    ('vegetariano'),
    ('zero lactose'),
    ('bebida');

INSERT INTO forma_pagamentos(nome)
VALUES 
    ('dinheiro'),
    ('pix'),
    ('cartão debito'),
    ('cartão credito'),
    ('vale alimentacão');
    

