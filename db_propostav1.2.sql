create database db_compassv2 character set = 'utf8' collate = 'utf8_general_ci';

use db_compassv2;

CREATE TABLE IF NOT EXISTS tb_usuario (
    cd_usuario INT NOT NULL AUTO_INCREMENT,
    nm_nome_completo VARCHAR(100),
    nm_cargo_vendedor VARCHAR(50),
    cd_senha VARCHAR(20),
    cd_proposta INT,
    CONSTRAINT pk_usuario PRIMARY KEY (cd_usuario)
);

CREATE TABLE IF NOT EXISTS tb_email_usuario (
    cd_email INT NOT NULL AUTO_INCREMENT,
    nm_email_usuario VARCHAR(50),
    cd_usuario INT,
    CONSTRAINT pk_email PRIMARY KEY (cd_email),
    CONSTRAINT fk_email_usuario_usuario FOREIGN KEY (cd_usuario)
        REFERENCES tb_usuario (cd_usuario)
);


CREATE TABLE IF NOT EXISTS tb_privilegio (
    cd_privilegio INT NOT NULL AUTO_INCREMENT,
    nm_privilegio ENUM('Adm', 'Usuario'),
    cd_usuario INT,
    CONSTRAINT pk_privilegio PRIMARY KEY (cd_privilegio),
    CONSTRAINT fk_privilegio_usuario FOREIGN KEY (cd_usuario)
        REFERENCES tb_usuario (cd_usuario)
);

CREATE TABLE IF NOT EXISTS tb_proposta (
    cd_proposta INT NOT NULL AUTO_INCREMENT,
    dt_proposta DATE,
    nm_referencia_acl VARCHAR(50),
    dt_horario_recebimento DATETIME,
    ds_metodo_transporte VARCHAR(50),
    cd_usuario INT,
    CONSTRAINT pk_proposta PRIMARY KEY (cd_proposta),
    CONSTRAINT fk_proposta_usuario FOREIGN KEY (cd_usuario)
        REFERENCES tb_usuario (cd_usuario)
);


CREATE TABLE IF NOT EXISTS tb_cliente (
    cd_cliente INT NOT NULL AUTO_INCREMENT,
    nm_empresa_cliente VARCHAR(50),
    nm_referencia_cliente VARCHAR(50),
    cd_proposta INT,
    CONSTRAINT pk_cliente PRIMARY KEY (cd_cliente),
    CONSTRAINT fk_cliente_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);
        
CREATE TABLE IF NOT EXISTS tb_responsavel_cliente (
    cd_responsavel_cliente INT NOT NULL AUTO_INCREMENT,
    nm_responsavel_cliente VARCHAR(50),
    nm_email_responsavel_cliente VARCHAR(50),
    cd_cliente INT,
    CONSTRAINT pk_resposavel_cliente PRIMARY KEY (cd_responsavel_cliente),
    CONSTRAINT fk_responsavel_cliente_cliente FOREIGN KEY (cd_cliente)
        REFERENCES tb_cliente (cd_cliente)
);
        

CREATE TABLE IF NOT EXISTS tb_uf_origem (
    cd_uf_origem INT NOT NULL AUTO_INCREMENT,
    sg_uf_origem CHAR(2),
    cd_proposta INT,
    CONSTRAINT pk_uf_origem PRIMARY KEY (cd_uf_origem),
    CONSTRAINT fk_uf_origem_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_cidade_origem (
    cd_cidade_origem INT NOT NULL AUTO_INCREMENT,
    nm_cidade_origem VARCHAR(30),
    ds_cidade_origem VARCHAR(100),
    cd_proposta INT,
    CONSTRAINT pk_cidade_origem PRIMARY KEY (cd_cidade_origem),
    CONSTRAINT fk_cidade_origem_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_uf_destino (
    cd_uf_destino INT NOT NULL AUTO_INCREMENT,
    sg_uf_destino CHAR(2),
    cd_proposta INT,
    CONSTRAINT pk_uf_destino PRIMARY KEY (cd_uf_destino),
    CONSTRAINT fk_uf_destino_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_cidade_destino (
    cd_cidade_destino INT NOT NULL AUTO_INCREMENT,
    nm_cidade_destino VARCHAR(30),
    ds_cidade_destino VARCHAR(100),
    cd_proposta INT,
    CONSTRAINT pk_cidade_destino PRIMARY KEY (cd_cidade_destino),
    CONSTRAINT fk_cidade_destino_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_local_devolucao_container (
    cd_local_devolucao_container INT NOT NULL AUTO_INCREMENT,
    nm_local_devolucao_container VARCHAR(100),
    cd_proposta INT,
    CONSTRAINT pk_local_devolucao_container PRIMARY KEY (cd_local_devolucao_container),
    CONSTRAINT fk_local_devolucao_container_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_veiculo (
    cd_veiculo INT NOT NULL AUTO_INCREMENT,
    nm_veiculo VARCHAR(50),
    qt_eixos_veiculo INT,
    cd_proposta INT,
    CONSTRAINT pk_veiculo PRIMARY KEY (cd_veiculo),
    CONSTRAINT fk_veiculo_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_carreta (
    cd_carreta INT NOT NULL AUTO_INCREMENT,
    nm_carreta VARCHAR(50),
    qt_cubagem_min_carreta INT,
    qt_cubagem_max_carreta INT,
    qt_peso_min_carreta INT,
    qt_peso_max_carreta INT,
    qt_pallets_carreta INT,
    cd_proposta INT,
    constraint pk_carreta primary key (cd_carreta),
    CONSTRAINT fk_carreta_veiculo FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_container (
    cd_container INT NOT NULL AUTO_INCREMENT,
    nm_container VARCHAR(50),
    qt_tara_container INT,
    qt_peso_min_container INT,
    qt_peso_max_container INT,
    cd_proposta INT,
    CONSTRAINT pk_container PRIMARY KEY (cd_container),
    CONSTRAINT fk_container_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_produto (
    cd_produto INT NOT NULL AUTO_INCREMENT,
    nm_produto VARCHAR(50),
    qt_produto INT,
    ds_produto VARCHAR(100),
    qt_cubagem_produto INT,
    qt_peso_produto INT,
    cd_proposta INT,
    CONSTRAINT pk_produto PRIMARY KEY (cd_produto),
    CONSTRAINT fk_produto_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_arq_propostas (
    cd_arq_propostas INT NOT NULL AUTO_INCREMENT,
    nr_versao_propostas DECIMAL,
    cd_proposta INT,
    CONSTRAINT pk_arq_propostas PRIMARY KEY (cd_arq_propostas),
    CONSTRAINT fk_arq_propostas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);