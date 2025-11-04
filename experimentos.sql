-- Alguns experimentos com H2 Database e SQL

-- Apaga a tabela PADS se existir
DROP TABLE PADS IF EXISTS;

-- Cria a tabela "pads"
-- SQL correto para H2 Database

-- Cria a tabela "pads"
CREATE TABLE PADS (
    -- Chave primária e auto-incremento (H2 aceita AUTO_INCREMENT ou IDENTITY)
    id BIGINT PRIMARY KEY AUTO_INCREMENT,

    -- Tipo de dado para data/hora é o mesmo
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    padname VARCHAR(127) NOT NULL,
    padtext LONGTEXT, -- LONGTEXT é geralmente mapeado para CLOB ou VARCHAR no H2
    owner BIGINT,

    -- O tipo ENUM não é padrão no H2.
    -- O substituto mais comum é usar VARCHAR e adicionar uma restrição CHECK
    status VARCHAR(3) DEFAULT 'ON' CHECK (status IN ('ON', 'OFF')),

    -- O tipo de dado para texto longo é o mesmo
    metadata TEXT,

    -- Relacionamento entre PADS e OWNERS
    -- Chave estrangeira
    FOREIGN KEY (owner) REFERENCES OWNERS (ID)
);

-- Adicionando comentários em colunas, no H2, é feito após a criação da tabela
COMMENT ON COLUMN PADS.status IS '''ON'' ou ''OFF''';
COMMENT ON COLUMN PADS.metadata IS 'Reservado para uso futuro';

-- Insere novo PAD para o OWNER 1
INSERT INTO PADS (padname, padtext, owner)
VALUES ('Primeiro Teste', 'Lorem ipsum', 1);

-- Insere novo OWNER
-- Campos da tabela: ID, CREATED_AT, DISPLAY_NAME, EMAIL, LAST_LOGIN_AT, METADATA, PHOTOURL, STATUS, UID
INSERT INTO OWNERS (
    CREATED_AT,
    DISPLAY_NAME,
    EMAIL,
    LAST_LOGIN_AT,
    PHOTOURL,
    UID,
    STATUS
) VALUES (
    '2025-11-04 11:00:00',
    'Marineuza Siriliano',
    'marineuza@gmail.com',
    '2025-08-29 10:14:00',
    'fotomari.jpg',
    '93H4T2034H384HT8342H',
    'ON'
), (
    '2025-11-04 11:19:00',
    'Joca da Silva',
    'joca@silva.com',
    '2025-08-19 10:14:00',
    'fotojoca.png',
    'FY48RY493URT84YT',
    'ON'
);
