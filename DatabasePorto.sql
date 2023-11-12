--João Cunha -  RM 550668
--Ronaldo Noda - RM 99219
--João Victor Leite Firmino - RM 97714
--Lucas Cazzaro - RM 551201
--Leonardo valentim de Souza -RM 98660

--Excluindo tabelas 
DROP TABLE TB_SEGURADO CASCADE CONSTRAINTS;
DROP TABLE TB_CONTATO CASCADE CONSTRAINTS;
DROP TABLE TB_BOT CASCADE CONSTRAINTS;
DROP TABLE TB_APOLICE CASCADE CONSTRAINTS;
DROP TABLE TB_APOLICE_VEICULO CASCADE CONSTRAINTS;
DROP TABLE TB_VEICULO CASCADE CONSTRAINTS;
DROP TABLE TB_OS CASCADE CONSTRAINTS;
DROP TABLE TB_MODAL_PRESTADOR CASCADE CONSTRAINTS;
DROP TABLE TB_PRESTADOR_MODAL CASCADE CONSTRAINTS;
DROP TABLE TB_MODELO CASCADE CONSTRAINTS;
DROP TABLE TB_MODAL CASCADE CONSTRAINTS;
DROP TABLE TB_MARCA CASCADE CONSTRAINTS;

--Excluindo sequencias
DROP SEQUENCE tb_marca_id_marca_seq;
DROP SEQUENCE tb_apolice_veiculo_id_apolice_veiculo_seq;
DROP SEQUENCE tb_segurado_id_segurado_seq;
DROP SEQUENCE tb_veiculo_id_veiculo_seq;
DROP SEQUENCE tb_contato_id_contato_seq;  
DROP SEQUENCE tb_bot_id_bot_seq;
DROP SEQUENCE tb_apolice_id_apolice_seq;
DROP SEQUENCE tb_modelo_id_modelo_seq;
DROP SEQUENCE tb_modal_id_modal_seq;
DROP SEQUENCE tb_modal_prestador_id_modal_prestador_seq;
DROP SEQUENCE tb_prestador_modal_id_prestador_seq;
DROP SEQUENCE tb_os_id_os_seq;
DROP SEQUENCE tb_contato_id_segurado_fk_seq;
DROP SEQUENCE tb_bot_id_segurado_fk_seq;
DROP SEQUENCE tb_apolice_veiculo_id_veiculo_fk_seq;
DROP SEQUENCE tb_apolice_veiculo_id_apolice_fk_seq;
DROP SEQUENCE tb_apolice_veiculo_id_modelo_fk_seq;
DROP SEQUENCE tb_apolice_veiculo_id_marca_fk_seq;
DROP SEQUENCE tb_apolice_veiculo_id_segurado_fk_seq;
DROP SEQUENCE tb_os_id_segurado_fk_seq;
DROP SEQUENCE  tb_os_id_modal_prestador_fk_seq;
DROP SEQUENCE tb_os_id_apolice_veiculo_fk_seq;

--Excluindo as triggers
DROP TRIGGER tb_marca_id_marca_trg;
DROP TRIGGER tb_apolice_veiculo_id_apolice_veiculo_trg;
DROP TRIGGER tb_segurado_id_segurado_trg;
DROP TRIGGER tb_veiculo_id_veiculo_trg;
DROP TRIGGER tb_contato_id_contato_trg;  
DROP TRIGGER tb_bot_id_bot_trg;
DROP TRIGGER tb_apolice_id_apolice_trg;
DROP TRIGGER tb_modelo_id_modelo_trg;
DROP TRIGGER tb_modal_id_modal_trg;
DROP TRIGGER tb_modal_prestador_id_modal_prestador_trg;
DROP TRIGGER tb_prestador_modal_id_prestador_trg;
DROP TRIGGER tb_os_id_os_trg;
DROP TRIGGER tb_contato_id_segurado_fk_trg;
DROP TRIGGER tb_bot_id_segurado_fk_trg;
DROP TRIGGER tb_apolice_veiculo_id_veiculo_fk_trg;
DROP TRIGGER tb_apolice_veiculo_id_apolice_fk_trg;
DROP TRIGGER tb_apolice_veiculo_id_modelo_fk_trg;
DROP TRIGGER tb_apolice_veiculo_id_marca_fk_trg;
DROP TRIGGER  tb_apolice_veiculo_id_segurado_fk_trg;
DROP TRIGGER tb_os_id_segurado_fk_trg;
DROP TRIGGER tb_os_id_modal_prestador_fk_trg;
DROP TRIGGER tb_os_id_apolice_veiculo_fk_trg;

--Criação da tabela apolice
CREATE TABLE tb_apolice (
    id_apolice     INTEGER NOT NULL,
    status_apolice VARCHAR2(100),
    premio         INTEGER,
    vigencia       DATE,
    cobertura      VARCHAR2(500)
);

--Colocando chave primária da tabela apolice
ALTER TABLE tb_apolice ADD CONSTRAINT tb_apolice_pk PRIMARY KEY ( id_apolice );

--Criação da tabela veiculo
CREATE TABLE tb_apolice_veiculo (
    id_apolice_veiculo INTEGER NOT NULL,
    id_apolice         INTEGER NOT NULL,
    id_veiculo         INTEGER NOT NULL,
    id_modelo          INTEGER NOT NULL,
    id_marca           INTEGER NOT NULL,
    id_segurado        INTEGER NOT NULL,
    placa_veiculo      VARCHAR2(7)
);


--Colocando chave primária da tabela veiculo
ALTER TABLE tb_apolice_veiculo ADD CONSTRAINT tb_apolice_veiculo_pk PRIMARY KEY ( id_apolice_veiculo );

--Criação da tabela bot
CREATE TABLE tb_bot (
    id_bot                    INTEGER NOT NULL,
    id_segurado               INTEGER NOT NULL,
    captacao_informacoes      VARCHAR2(500),
    armazenamento_informacoes VARCHAR2(500),
    envio_informacoes         VARCHAR2(500),
    tipo_carga                VARCHAR2(100)
);

--Colocando chave primária da tabela bot
ALTER TABLE tb_bot ADD CONSTRAINT tb_bot_pk PRIMARY KEY ( id_bot );

--Criação da tabela contato
CREATE TABLE tb_contato (
    id_contato  INTEGER NOT NULL,
    id_segurado INTEGER NOT NULL,
    email       VARCHAR2(100),
    telefone    INTEGER
);

--Colocando chave primária da tabela contato
ALTER TABLE tb_contato ADD CONSTRAINT tb_contato_pk PRIMARY KEY ( id_contato );

--Criação da tabela marca
CREATE TABLE tb_marca (
    id_marca   INTEGER NOT NULL,
    nome_marca VARCHAR2(100)
);


--Colocando chave primária da tabela marca
ALTER TABLE tb_marca ADD CONSTRAINT tb_modelo_marca_pk PRIMARY KEY ( id_marca );

--Criação da tabela modal
CREATE TABLE tb_modal (
    id_modal         INTEGER NOT NULL,
    rastreador_modal INTEGER,
    endereco_modal   VARCHAR2(100),
    fotos_modal      BLOB
);

--Colocando chave primária da tabela modal
ALTER TABLE tb_modal ADD CONSTRAINT tb_modal_pk PRIMARY KEY ( id_modal );

--Criação da tabela modal_prestador
CREATE TABLE tb_modal_prestador (
    id_modal_prestador INTEGER NOT NULL,
    id_modal           INTEGER NOT NULL,
    id_prestador       INTEGER NOT NULL
);

--Colocando chave primária da tabela modal_prestador
ALTER TABLE tb_modal_prestador ADD CONSTRAINT tb_modal_prestador_pk PRIMARY KEY ( id_modal_prestador );

--Criação da tabela modelo
CREATE TABLE tb_modelo (
    id_modelo   INTEGER NOT NULL,
    nome_modelo VARCHAR2(100)
);

--Colocando chave primária da tabela modelo
ALTER TABLE tb_modelo ADD CONSTRAINT tb_modelo_pk PRIMARY KEY ( id_modelo );

--Criação da tabela os
CREATE TABLE tb_os (
    id_os              INTEGER NOT NULL,
    id_segurado        INTEGER NOT NULL,
    id_modal_prestador INTEGER NOT NULL,
    id_apolice_veiculo INTEGER NOT NULL,
    endereco_veiculo   VARCHAR2(100),
    cep_veiculo        INTEGER,
    data_hora          TIMESTAMP WITH LOCAL TIME ZONE,
    complemento_local  VARCHAR2(100)
);

--Colocando chave primária da tabela os
ALTER TABLE tb_os ADD CONSTRAINT tb_os_pk PRIMARY KEY ( id_os );

--Criação da tabela prestador_modal
CREATE TABLE tb_prestador_modal (
    id_prestador   INTEGER NOT NULL,
    nome_prestador VARCHAR2(100),
    cpf_prestador  INTEGER
);

--Colocando chave primária da tabela prestador_modal
ALTER TABLE tb_prestador_modal ADD CONSTRAINT tb_prestador_modal_pk PRIMARY KEY ( id_prestador );

--Criação da tabela segurado
CREATE TABLE tb_segurado (
    id_segurado    INTEGER NOT NULL,
    nome_segurado  VARCHAR2(50),
    cpf_segurado   INTEGER,
    rg_segurado    VARCHAR2(10),
    cnh_segurado   INTEGER,
    senha_segurado VARCHAR2(20)
);

--Colocando chave primária da tabela segurado
ALTER TABLE tb_segurado ADD CONSTRAINT tb_segurado_pk PRIMARY KEY ( id_segurado );

--Criação da tabela veiculo
CREATE TABLE tb_veiculo (
    id_veiculo   INTEGER NOT NULL,
    peso_veiculo VARCHAR2(50)
);
     
--Colocando chave primária da tabela veiculo
ALTER TABLE tb_veiculo ADD CONSTRAINT tb_veiculo_pk PRIMARY KEY ( id_veiculo );

--Colocando chave estrangeira em todas as tabelas
ALTER TABLE tb_apolice_veiculo
    ADD CONSTRAINT tb_apolice_veiculo_tb_apolice_fk FOREIGN KEY ( id_apolice )
        REFERENCES tb_apolice ( id_apolice );

ALTER TABLE tb_apolice_veiculo
    ADD CONSTRAINT tb_apolice_veiculo_tb_marca_fk FOREIGN KEY ( id_marca )
        REFERENCES tb_marca ( id_marca );

ALTER TABLE tb_apolice_veiculo
    ADD CONSTRAINT tb_apolice_veiculo_tb_modelo_fk FOREIGN KEY ( id_modelo )
        REFERENCES tb_modelo ( id_modelo );

ALTER TABLE tb_apolice_veiculo
    ADD CONSTRAINT tb_apolice_veiculo_tb_segurado_fk FOREIGN KEY ( id_segurado )
        REFERENCES tb_segurado ( id_segurado );

ALTER TABLE tb_apolice_veiculo
    ADD CONSTRAINT tb_apolice_veiculo_tb_veiculo_fk FOREIGN KEY ( id_veiculo )
        REFERENCES tb_veiculo ( id_veiculo );

ALTER TABLE tb_bot
    ADD CONSTRAINT tb_bot_tb_segurado_fk FOREIGN KEY ( id_segurado )
        REFERENCES tb_segurado ( id_segurado );

ALTER TABLE tb_contato
    ADD CONSTRAINT tb_contato_tb_segurado_fk FOREIGN KEY ( id_segurado )
        REFERENCES tb_segurado ( id_segurado );

ALTER TABLE tb_modal_prestador
    ADD CONSTRAINT tb_modal_prestador_tb_modal_fk FOREIGN KEY ( id_modal )
        REFERENCES tb_modal ( id_modal );

ALTER TABLE tb_modal_prestador
    ADD CONSTRAINT tb_modal_prestador_tb_prestador_modal_fk FOREIGN KEY ( id_prestador )
        REFERENCES tb_prestador_modal ( id_prestador );

ALTER TABLE tb_os
    ADD CONSTRAINT tb_os_tb_apolice_veiculo_fk FOREIGN KEY ( id_apolice_veiculo )
        REFERENCES tb_apolice_veiculo ( id_apolice_veiculo );

ALTER TABLE tb_os
    ADD CONSTRAINT tb_os_tb_modal_prestador_fk FOREIGN KEY ( id_modal_prestador )
        REFERENCES tb_modal_prestador ( id_modal_prestador );

ALTER TABLE tb_os
    ADD CONSTRAINT tb_os_tb_segurado_fk FOREIGN KEY ( id_segurado )
        REFERENCES tb_segurado ( id_segurado );

--Criando autoincremento das PKs
--Criando autoincremento da tb_apolice_veiculo

CREATE SEQUENCE tb_apolice_veiculo_id_apolice_veiculo_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_apolice_veiculo_id_apolice_veiculo_trg BEFORE
INSERT ON tb_apolice_veiculo
FOR EACH ROW 
WHEN (new.id_apolice_veiculo IS NULL)
     BEGIN
            :new.id_apolice_veiculo:=tb_apolice_veiculo_id_apolice_veiculo_seq.nextval;
     END;   
     
--Criação de autoincremento da tb_marca

CREATE SEQUENCE tb_marca_id_marca_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_marca_id_marca_trg BEFORE
INSERT ON tb_marca
FOR EACH ROW 
WHEN (new.id_marca IS NULL)
     BEGIN
            :new.id_marca:=tb_marca_id_marca_seq.nextval;
     END;     
     
--Criando autoincremento da tb_segurado

CREATE SEQUENCE tb_segurado_id_segurado_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_segurado_id_segurado_trg BEFORE
INSERT ON tb_segurado
FOR EACH ROW 
WHEN (new.id_segurado IS NULL)
     BEGIN
            :new.id_segurado:=tb_segurado_id_segurado_seq.nextval;
     END;     
     
--Criando autoincremento da tb_veiculo

CREATE SEQUENCE tb_veiculo_id_veiculo_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_veiculo_id_veiculo_trg BEFORE
INSERT ON tb_veiculo
FOR EACH ROW 
WHEN (new.id_veiculo IS NULL)
     BEGIN
            :new.id_veiculo:=tb_veiculo_id_veiculo_seq.nextval;
     END;     
     
--Criando autoincremento da tb_contato

CREATE SEQUENCE tb_contato_id_contato_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_contato_id_contato_trg BEFORE
INSERT ON tb_contato
FOR EACH ROW 
WHEN (new.id_contato IS NULL)
     BEGIN
            :new.id_contato:=tb_contato_id_contato_seq.nextval;
     END;     
     
--Criando autoincremento da tb_bot

CREATE SEQUENCE tb_bot_id_bot_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_bot_id_bot_trg BEFORE
INSERT ON tb_bot
FOR EACH ROW 
WHEN (new.id_bot IS NULL)
     BEGIN
            :new.id_bot:=tb_bot_id_bot_seq.nextval;
     END;   
     
--Criando autoincremento da tb_apolice

CREATE SEQUENCE tb_apolice_id_apolice_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_apolice_id_apolice_trg BEFORE
INSERT ON tb_apolice
FOR EACH ROW 
WHEN (new.id_apolice IS NULL)
     BEGIN
            :new.id_apolice:=tb_apolice_id_apolice_seq.nextval;
     END;   
     
--Criando autoincremento da tb_modelo

CREATE SEQUENCE tb_modelo_id_modelo_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_modelo_id_modelo_trg BEFORE
INSERT ON tb_modelo
FOR EACH ROW 
WHEN (new.id_modelo IS NULL)
     BEGIN
            :new.id_modelo:=tb_modelo_id_modelo_seq.nextval;
     END;      

--Criando autoincremento da tb_modal

CREATE SEQUENCE tb_modal_id_modal_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_modal_id_modal_trg BEFORE
INSERT ON tb_modal
FOR EACH ROW 
WHEN (new.id_modal IS NULL)
     BEGIN
            :new.id_modal:=tb_modal_id_modal_seq.nextval;
     END;    

--Criando autoincremento da tb_modal_prestador

CREATE SEQUENCE tb_modal_prestador_id_modal_prestador_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_modal_prestador_id_modal_prestador_trg BEFORE
INSERT ON tb_modal_prestador
FOR EACH ROW 
WHEN (new.id_modal_prestador IS NULL)
     BEGIN
            :new.id_modal_prestador:=tb_modal_prestador_id_modal_prestador_seq.nextval;
     END; 
     
--Criando autoincremento da tb_prestador_modal

CREATE SEQUENCE tb_prestador_modal_id_prestador_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_prestador_modal_id_prestador_trg BEFORE
INSERT ON tb_prestador_modal
FOR EACH ROW 
WHEN (new.id_prestador IS NULL)
     BEGIN
            :new.id_prestador:=tb_prestador_modal_id_prestador_seq.nextval;
     END;    
     
--Criando autoincremento da tb_os

CREATE SEQUENCE tb_os_id_os_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_os_id_os_trg BEFORE
INSERT ON tb_os
FOR EACH ROW 
WHEN (new.id_os IS NULL)
     BEGIN
            :new.id_os:=tb_os_id_os_seq.nextval;
     END;      
     
--Criando autoincremento das FKs
--Criando autoincremento da FK tb_contato_id_segurado

CREATE SEQUENCE tb_contato_id_segurado_fk_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_contato_id_segurado_fk_trg BEFORE
INSERT ON tb_contato
FOR EACH ROW 
WHEN (new.id_segurado IS NULL)
     BEGIN
            :new.id_segurado:=tb_contato_id_segurado_fk_seq.nextval;
     END;  

--Criando autoincremento da FK tb_bot_id_segurado

CREATE SEQUENCE tb_bot_id_segurado_fk_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_bot_id_segurado_fk_trg BEFORE
INSERT ON tb_bot
FOR EACH ROW 
WHEN (new.id_segurado IS NULL)
     BEGIN
            :new.id_segurado:=tb_bot_id_segurado_fk_seq.nextval;
     END;
     
     
--Criando autoincremento da FK tb_apolice_veiculo_id_apolice

CREATE SEQUENCE tb_apolice_veiculo_id_apolice_fk_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_apolice_veiculo_id_apolice_fk_trg BEFORE
INSERT ON tb_apolice_veiculo
FOR EACH ROW 
WHEN (new.id_apolice IS NULL)
     BEGIN
            :new.id_apolice:=tb_apolice_veiculo_id_apolice_fk_seq.nextval;
     END;

--Criando autoincremento da FK tb_apolice_veiculo_id_veiculo

CREATE SEQUENCE tb_apolice_veiculo_id_veiculo_fk_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_apolice_veiculo_id_veiculo_fk_trg BEFORE
INSERT ON tb_apolice_veiculo
FOR EACH ROW 
WHEN (new.id_veiculo IS NULL)
     BEGIN
            :new.id_veiculo:=tb_apolice_veiculo_id_veiculo_fk_seq.nextval;
     END;     

--Criando autoincremento da FK tb_apolice_veiculo_id_modelo

CREATE SEQUENCE tb_apolice_veiculo_id_modelo_fk_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_apolice_veiculo_id_modelo_fk_trg BEFORE
INSERT ON tb_apolice_veiculo
FOR EACH ROW 
WHEN (new.id_modelo IS NULL)
     BEGIN
            :new.id_modelo:=tb_apolice_veiculo_id_modelo_fk_seq.nextval;
     END;   
     
--Criando autoincremento da FK tb_apolice_veiculo_id_marca

CREATE SEQUENCE tb_apolice_veiculo_id_marca_fk_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_apolice_veiculo_id_marca_fk_trg BEFORE
INSERT ON tb_apolice_veiculo
FOR EACH ROW 
WHEN (new.id_marca IS NULL)
     BEGIN
            :new.id_marca:=tb_apolice_veiculo_id_marca_fk_seq.nextval;
     END;      

--Criando autoincremento da FK tb_apolice_veiculo_id_segurado

CREATE SEQUENCE tb_apolice_veiculo_id_segurado_fk_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_apolice_veiculo_id_segurado_fk_trg BEFORE
INSERT ON tb_apolice_veiculo
FOR EACH ROW 
WHEN (new.id_segurado IS NULL)
     BEGIN
            :new.id_segurado:=tb_apolice_veiculo_id_segurado_fk_seq.nextval;
     END;
     
--Criando autoincremento da FK tb_os_id_segurado

CREATE SEQUENCE tb_os_id_segurado_fk_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_os_id_segurado_fk_trg BEFORE
INSERT ON tb_os
FOR EACH ROW 
WHEN (new.id_segurado IS NULL)
     BEGIN
            :new.id_segurado:=tb_os_id_segurado_fk_seq.nextval;
     END; 

--Criando autoincremento da FK tb_os_id_modal_prestador

CREATE SEQUENCE tb_os_id_modal_prestador_fk_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_os_id_modal_prestador_fk_trg BEFORE
INSERT ON tb_os
FOR EACH ROW 
WHEN (new.id_modal_prestador IS NULL)
     BEGIN
            :new.id_modal_prestador:=tb_os_id_modal_prestador_fk_seq.nextval;
     END;
    
--Criando autoincremento da FK tb_os_id_apolice_veiculo

CREATE SEQUENCE tb_os_id_apolice_veiculo_fk_seq START WITH 1 INCREMENT BY 1;

CREATE TRIGGER tb_os_id_apolice_veiculo_fk_trg BEFORE
INSERT ON tb_os
FOR EACH ROW 
WHEN (new.id_apolice_veiculo IS NULL)
     BEGIN
            :new.id_apolice_veiculo:=tb_os_id_apolice_veiculo_fk_seq.nextval;
     END;
     
--Inserindo valores na tabela tb_segurado

INSERT INTO tb_segurado(nome_segurado, cpf_segurado, rg_segurado, cnh_segurado, senha_segurado)
VALUES('Eduardo', 12345678910, '396251754',1234567890, 'Eduardo12');

INSERT INTO tb_segurado(nome_segurado, cpf_segurado, rg_segurado, cnh_segurado, senha_segurado)
VALUES('Jeferson', 96325874102, '369741258',0123456789, 'Jeferson96');

INSERT INTO tb_segurado(nome_segurado, cpf_segurado, rg_segurado, cnh_segurado, senha_segurado)
VALUES('Samuel', 82550172329, '436914566',04362860393, 'Samuel82');

INSERT INTO tb_segurado(nome_segurado, cpf_segurado, rg_segurado, cnh_segurado, senha_segurado)
VALUES('Vania', 96907576791, '113614652',01731992480, 'Vania96');

INSERT INTO tb_segurado(nome_segurado, cpf_segurado, rg_segurado, cnh_segurado, senha_segurado)
VALUES('Francine', 71684731232, '107480670',65067320294, 'Francine71');

INSERT INTO tb_segurado(nome_segurado, cpf_segurado, rg_segurado, cnh_segurado, senha_segurado)
VALUES('Marli', 41951150864, '443110694',37850253660, 'Marli41');

INSERT INTO tb_segurado(nome_segurado, cpf_segurado, rg_segurado, cnh_segurado, senha_segurado)
VALUES('Thiago', 77828473540, '422905252',33826385197, 'Thiago77');

--Inserindo valores na tabela tb_contato

INSERT INTO tb_contato(email, telefone)
VALUES('eduardo123@gmail.com', 123456789);

INSERT INTO tb_contato(email, telefone)
VALUES('jeferson123@gmail.com', 987654321);

INSERT INTO tb_contato(email, telefone)
VALUES('samuel123@gmail.com', 897654321);

INSERT INTO tb_contato(email, telefone)
VALUES('vania123@gmail.com', 896754321);

INSERT INTO tb_contato(email, telefone)
VALUES('francine123@gmail.com', 896744321);

INSERT INTO tb_contato(email, telefone)
VALUES('marli123@gmail.com', 896754312);

INSERT INTO tb_contato(email, telefone)
VALUES('thiago123@gmail.com', 892284312);

--Inserindo valores na tabela tb_bot

INSERT INTO tb_bot(tipo_carga)
VALUES('Graos');

INSERT INTO tb_bot(tipo_carga)
VALUES('Madeira');

INSERT INTO tb_bot(tipo_carga)
VALUES('Pedra');

INSERT INTO tb_bot(tipo_carga)
VALUES('Agua');

INSERT INTO tb_bot(tipo_carga)
VALUES('Gasolina');

INSERT INTO tb_bot(tipo_carga)
VALUES('Papel Higienico');

INSERT INTO tb_bot(tipo_carga)
VALUES('Sofa');

--Inserindo valores na tabela tb_apolice

INSERT INTO tb_apolice(status_apolice, premio, vigencia, cobertura)
VALUES('Ativa', 10000.00, '09-11-2023', 500000.00);

INSERT INTO tb_apolice(status_apolice, premio, vigencia, cobertura)
VALUES('Ativa', 20000.00, '22-11-2024', 600000.00);

INSERT INTO tb_apolice(status_apolice, premio, vigencia, cobertura)
VALUES('Ativa', 30000.00, '21-10-2024', 400000.00);

INSERT INTO tb_apolice(status_apolice, premio, vigencia, cobertura)
VALUES('Ativa', 40000.00, '17-04-2024', 400000.00);

INSERT INTO tb_apolice(status_apolice, premio, vigencia, cobertura)
VALUES('Expirado', 10000.00, '17-04-2022', 500000.00);

INSERT INTO tb_apolice(status_apolice, premio, vigencia, cobertura)
VALUES('Ativa', 90000.00, '13-06-2024', 900000.00);

INSERT INTO tb_apolice(status_apolice, premio, vigencia, cobertura)
VALUES('Ativa', 10000.00, '08-01-2025', 700000.00);

--Inserindo valores na tabela tb_veiculo

INSERT INTO tb_veiculo(peso_veiculo)
VALUES('900 kilos');

INSERT INTO tb_veiculo(peso_veiculo)
VALUES('1 toneladas');

INSERT INTO tb_veiculo(peso_veiculo)
VALUES('2 toneladas');

INSERT INTO tb_veiculo(peso_veiculo)
VALUES('3 toneladas');

INSERT INTO tb_veiculo(peso_veiculo)
VALUES('4 toneladas');

INSERT INTO tb_veiculo(peso_veiculo)
VALUES('5 toneladas');

INSERT INTO tb_veiculo(peso_veiculo)
VALUES('3 tonelada');

--Inserindo valores na tabela tb_marca

INSERT INTO tb_marca (nome_marca)
VALUES ('Mercedes');

INSERT INTO tb_marca(nome_marca)
VALUES('Iveco');

INSERT INTO tb_marca(nome_marca)
VALUES('Ford');

INSERT INTO tb_marca(nome_marca)
VALUES('Volvo');

INSERT INTO tb_marca(nome_marca)
VALUES('Scania');

INSERT INTO tb_marca (nome_marca)
VALUES('Man');

INSERT INTO tb_marca(nome_marca)
VALUES('Hyundai');

--Inserindo valores na tabela tb_modelo

INSERT INTO tb_modelo(nome_modelo)
VALUES('Accelo');

INSERT INTO tb_modelo(nome_modelo)
VALUES('Tector');

INSERT INTO tb_modelo(nome_modelo)
VALUES('Cargo');

INSERT INTO tb_modelo(nome_modelo)
VALUES('VM');

INSERT INTO tb_modelo(nome_modelo)
VALUES('P310');

INSERT INTO tb_modelo (nome_modelo)
VALUES('TGX');

INSERT INTO tb_modelo(nome_modelo)
VALUES('HD80');

--Inserindo valores na tabela tb_modal

INSERT INTO tb_modal(rastreador_modal, endereco_modal)
VALUES(2768, 'Rua 1');

INSERT INTO tb_modal(rastreador_modal, endereco_modal)
VALUES(2868, 'Rua 2');

INSERT INTO tb_modal(rastreador_modal, endereco_modal)
VALUES(1768, 'Rua 3');

INSERT INTO tb_modal(rastreador_modal, endereco_modal)
VALUES(9968, 'Rua 4');

INSERT INTO tb_modal(rastreador_modal, endereco_modal)
VALUES(2000, 'Rua 5');

INSERT INTO tb_modal(rastreador_modal, endereco_modal)
VALUES(1010, 'Rua 6');

INSERT INTO tb_modal(rastreador_modal, endereco_modal)
VALUES(2589, 'Rua 7');

--Inserindo valores na tabela tb_prestador_modal

INSERT INTO tb_prestador_modal(nome_prestador, cpf_prestador)
VALUES('Leonardo', 12345678910);

INSERT INTO tb_prestador_modal(nome_prestador, cpf_prestador)
VALUES('Lucas', 21345678910);

INSERT INTO tb_prestador_modal(nome_prestador, cpf_prestador)
VALUES('Paulo', 33345678910);

INSERT INTO tb_prestador_modal(nome_prestador, cpf_prestador)
VALUES('Gustavo', 22345678910);

INSERT INTO tb_prestador_modal(nome_prestador, cpf_prestador)
VALUES('Joao', 12345608910);

INSERT INTO tb_prestador_modal(nome_prestador, cpf_prestador)
VALUES('Victor', 12366608910);

INSERT INTO tb_prestador_modal(nome_prestador, cpf_prestador)
VALUES('Victor', 12366101010);

--Inserindo valores na tabela tb_apolice_veiculo

INSERT INTO tb_apolice_veiculo(placa_veiculo)
VALUES('LCY0385');

INSERT INTO tb_apolice_veiculo(placa_veiculo)
VALUES('NAW8531');

INSERT INTO tb_apolice_veiculo(placa_veiculo)
VALUES('HSO2889');

INSERT INTO tb_apolice_veiculo(placa_veiculo)
VALUES('JOA3244');

INSERT INTO tb_apolice_veiculo(placa_veiculo)
VALUES('NEM3186');

INSERT INTO tb_apolice_veiculo(placa_veiculo)
VALUES('NAY2595');

INSERT INTO tb_apolice_veiculo(placa_veiculo)
VALUES('JFT1695');

----Inserindo valores na tabela tb_modal_prestador

INSERT INTO tb_modal_prestador(id_modal, id_prestador)
VALUES(1, 1);

INSERT INTO tb_modal_prestador(id_modal, id_prestador)
VALUES(2, 2);

INSERT INTO tb_modal_prestador(id_modal, id_prestador)
VALUES(3, 3);

INSERT INTO tb_modal_prestador(id_modal, id_prestador)
VALUES(4, 4);

INSERT INTO tb_modal_prestador(id_modal, id_prestador)
VALUES(5, 5);

INSERT INTO tb_modal_prestador(id_modal, id_prestador)
VALUES(6, 6);

INSERT INTO tb_modal_prestador(id_modal, id_prestador)
VALUES(7, 7);

--Inserindo valores na tabela tb_os

INSERT INTO tb_os (endereco_veiculo, cep_veiculo, data_hora, complemento_local)
VALUES ('Rua 1', 03020420, TO_TIMESTAMP('10-11-2024 15:30:00', 'DD-MM-YYYY HH24:MI:SS'), 'Casa 1');

INSERT INTO tb_os (endereco_veiculo, cep_veiculo, data_hora, complemento_local)
VALUES ('Rua 2', 13420420, TO_TIMESTAMP('20-01-2024 14:55:24', 'DD-MM-YYYY HH24:MI:SS'), 'Casa 2');

INSERT INTO tb_os (endereco_veiculo, cep_veiculo, data_hora, complemento_local)
VALUES ('Rua 3', 1347890, TO_TIMESTAMP('10-06-2024 12:10:58', 'DD-MM-YYYY HH24:MI:SS'), 'Casa 3');

INSERT INTO tb_os (endereco_veiculo, cep_veiculo, data_hora, complemento_local)
VALUES ('Rua 4', 1346690, TO_TIMESTAMP('01-02-2024 11:05:48', 'DD-MM-YYYY HH24:MI:SS'), 'Casa 4');

INSERT INTO tb_os (endereco_veiculo, cep_veiculo, data_hora, complemento_local)
VALUES ('Rua 5', 1076690, TO_TIMESTAMP('06-08-2024 17:48:24', 'DD-MM-YYYY HH24:MI:SS'), 'Casa 5');

INSERT INTO tb_os (endereco_veiculo, cep_veiculo, data_hora, complemento_local)
VALUES ('Rua 6', 2378790, TO_TIMESTAMP('18-12-2024 19:54:38', 'DD-MM-YYYY HH24:MI:SS'), 'Casa 6');

INSERT INTO tb_os (endereco_veiculo, cep_veiculo, data_hora, complemento_local)
VALUES ('Rua 7', 1234567, TO_TIMESTAMP('05-09-2024 23:20:14', 'DD-MM-YYYY HH24:MI:SS'), 'Casa 7');

-- Exemplos de Atualização de dados (UPDATE)

UPDATE tb_segurado
SET nome_segurado = 'Ronaldo'
WHERE id_segurado = 1;

UPDATE tb_marca
set nome_marca = 'Volkswagen'
WHERE id_marca = 1;

UPDATE tb_veiculo
set peso_veiculo = '2 Toneladas'
WHERE id_veiculo = 1;

-- Exemplos de Remoção de dados (DELETE)

DELETE FROM tb_bot WHERE tipo_carga = 'Madeira';

DELETE FROM tb_bot WHERE tipo_carga = 'Agua';

DELETE FROM tb_bot WHERE tipo_carga = 'Pedra';

--Relatório utilizando classificação de dados

SELECT * 
FROM tb_veiculo
ORDER BY peso_veiculo DESC;

--Relatório utilizando alguma função do tipo numérica simples

SELECT * FROM tb_segurado WHERE id_segurado > 1;

--Relatório utilizando alguma função de grupo

SELECT id_apolice,AVG(premio) as premio_apolice
FROM tb_apolice
GROUP BY id_apolice
HAVING AVG (premio) > 50000;

--Relatório utilizando sub consulta

SELECT id_os, id_segurado, id_apolice_veiculo, data_hora, complemento_local
FROM tb_os
WHERE id_apolice_veiculo IN (
SELECT id_apolice_veiculo
FROM tb_apolice
WHERE status_apolice = 'Ativa'
);

--Relatório utilizando junção de tabelas

SELECT s.nome_segurado, a.status_apolice, b.tipo_carga
FROM tb_segurado s
JOIN tb_apolice a ON s.id_segurado = a.id_apolice
JOIN tb_apolice_veiculo av ON a.id_apolice = av.id_apolice
JOIN tb_bot b ON s.id_segurado = b.id_segurado;






