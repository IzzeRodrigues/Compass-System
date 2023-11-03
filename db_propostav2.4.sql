create database db_compass character set = 'utf8' collate = 'utf8_general_ci';

use db_compass;

CREATE TABLE IF NOT EXISTS tb_usuario (
    cd_usuario INT NOT NULL AUTO_INCREMENT,
    nm_nome_completo VARCHAR(100),
    nm_cargo_usuario VARCHAR(50),
    cd_senha VARCHAR(20),
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
    cd_cliente INT,
    CONSTRAINT pk_resposavel_cliente PRIMARY KEY (cd_responsavel_cliente),
    CONSTRAINT fk_responsavel_cliente_cliente FOREIGN KEY (cd_cliente)
        REFERENCES tb_cliente (cd_cliente)
);

CREATE TABLE IF NOT EXISTS tb_email_responsavel_cliente (
    cd_email_responsavel_cliente INT NOT NULL AUTO_INCREMENT,
    nm_email_responsavel_cliente VARCHAR(50),
    cd_responsavel_cliente INT,
    CONSTRAINT pk_email_responsavel_cliente PRIMARY KEY (cd_email_responsavel_cliente),
    CONSTRAINT fk_email_responsavel_cliente FOREIGN KEY (cd_responsavel_cliente)
        REFERENCES tb_email_responsavel (cd_responsavel_cliente)
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
    nr_versao_propostas DECIMAL(2,1),
    cd_proposta INT,
    CONSTRAINT pk_arq_propostas PRIMARY KEY (cd_arq_propostas),
    CONSTRAINT fk_arq_propostas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_icms (
    cd_icms INT NOT NULL AUTO_INCREMENT,
    nm_icms_rota varchar(50),
    vl_icms decimal(2,2),
    CONSTRAINT pk_icms PRIMARY KEY (cd_icms)
);

CREATE TABLE IF NOT EXISTS tb_icms_proposta (
    cd_icms INT NOT NULL,
    cd_proposta INT NOT NULL,
    CONSTRAINT pk_icms_icms_proposta PRIMARY KEY (cd_icms , cd_proposta),
    CONSTRAINT fk_icms_icms_proposta FOREIGN KEY (cd_icms)
        REFERENCES tb_icms (cd_icms),
    CONSTRAINT fk_icms_proposta_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);


CREATE TABLE IF NOT EXISTS tb_tipo_proposta (
    cd_tipo_proposta INT NOT NULL AUTO_INCREMENT,
    nm_tipo_proposta VARCHAR(100),
    cd_proposta INT,
    CONSTRAINT pk_tipos_proposta PRIMARY KEY (cd_tipo_proposta),
    CONSTRAINT fk_tipo_proposta_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_tipo_operacao (
    cd_tipo_operacao INT NOT NULL AUTO_INCREMENT,
    nm_tipo_operacao VARCHAR(50),
    cd_proposta INT,
    CONSTRAINT pk_tipo_operacao PRIMARY KEY (cd_tipo_operacao),
    CONSTRAINT fk_tipo_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_cat_imposto (
    cd_cat_imposto INT NOT NULL AUTO_INCREMENT,
    nm_cat_imposto VARCHAR(50),
    cd_proposta INT,
    CONSTRAINT pk_cat_imposto PRIMARY KEY (cd_cat_imposto),
    CONSTRAINT fk_cat_imposto_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_imp_rcfdc (
    cd_imp_rcfdc INT NOT NULL AUTO_INCREMENT,
    vl_imp_rcfdc DECIMAL,
    cd_proposta INT,
    CONSTRAINT pk_imp_rcfdc PRIMARY KEY (cd_imp_rcfdc),
    CONSTRAINT fk_imp_rcfdc_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_imp_rctrc (
    cd_imp_rctrc INT NOT NULL AUTO_INCREMENT,
    vl_imp_rctrc DECIMAL,
    cd_proposta INT,
    CONSTRAINT pk_imp_rctrc PRIMARY KEY (cd_imp_rctrc),
    CONSTRAINT fk_imp_rctrc_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_imp_suspenso (
    cd_imp_suspenso INT NOT NULL AUTO_INCREMENT,
    vl_imp_suspenso INT,
    cd_proposta INT,
    CONSTRAINT pk_cd_imp_suspenso PRIMARY KEY (cd_imp_suspenso),
    CONSTRAINT fk_imp_suspenso_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);



CREATE TABLE IF NOT EXISTS tb_tipo_seguro (
    cd_tipo_seguro INT NOT NULL AUTO_INCREMENT,
    nm_tipo_seguro VARCHAR(50),
    vl_tipo_seguro DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_tipo_seguro PRIMARY KEY (cd_tipo_seguro),
    CONSTRAINT fk_tipo_seguro_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_tipo_op (
    cd_tipo_op INT NOT NULL AUTO_INCREMENT,
    nm_tipo_op VARCHAR(50),
    cd_proposta INT,
    CONSTRAINT pk_tipo_op PRIMARY KEY (cd_tipo_op),
    CONSTRAINT fk_tipo_op_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_eixos (
    cd_eixos INT NOT NULL AUTO_INCREMENT,
    qtd_eixos INT,
    CONSTRAINT pk_eixos PRIMARY KEY (cd_eixos)
);

CREATE TABLE IF NOT EXISTS tb_tipo_carga (
    cd_tipo_carga INT NOT NULL AUTO_INCREMENT,
    nm_tipo_carga VARCHAR(50),
    cd_proposta INT,
    CONSTRAINT pk_tipo_carga PRIMARY KEY (cd_tipo_carga),
    CONSTRAINT fk_tipo_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_valor_carga_op (
    cd_valor_carga_op INT NOT NULL AUTO_INCREMENT,
    vl_valor_carga_op decimal(20,2),
    cd_tipo_carga INT,
    CONSTRAINT pk_valor_carga_op PRIMARY KEY (cd_valor_carga_op),
    CONSTRAINT fk_valor_tipo_carga FOREIGN KEY (cd_tipo_carga)
        REFERENCES tb_tipo_carga (cd_tipo_carga)
);

CREATE TABLE IF NOT EXISTS tb_eixos_tipo_carga (
    cd_eixos INT NOT NULL,
    cd_tipo_carga INT NOT NULL,
    cd_tipo_op INT,
    CONSTRAINT pk_eixos_tipo_carga PRIMARY KEY (cd_eixos , cd_tipo_carga),
    CONSTRAINT fk_eixos FOREIGN KEY (cd_eixos)
        REFERENCES tb_eixos (cd_eixos),
    CONSTRAINT fk_eixos_tipo_carga FOREIGN KEY (cd_tipo_carga)
        REFERENCES tb_tipo_carga (cd_tipo_carga),
    CONSTRAINT fk_tipo_op FOREIGN KEY (cd_tipo_op)
        REFERENCES tb_tipo_op (cd_tipo_op)
);

CREATE TABLE IF NOT EXISTS tb_tipo_frete (
    cd_tipo_frete INT NOT NULL AUTO_INCREMENT,
    nm_tipo_teste VARCHAR(100),
    cd_proposta INT,
    CONSTRAINT pk_tipo_frete PRIMARY KEY (cd_tipo_frete),
    CONSTRAINT fk_tipo_frete_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_frete_peso (
    cd_frete_peso INT NOT NULL AUTO_INCREMENT,
    vl_frete_peso DECIMAL(20,2),
    cd_proposta INT,
    CONSTRAINT pk_frete_peso PRIMARY KEY (cd_frete_peso),
    CONSTRAINT fk_frete_peso_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_imp_gris (
    cd_imp_gris INT NOT NULL AUTO_INCREMENT,
    vl_imp_gris INT,
    cd_proposta INT,
    CONSTRAINT pk_imp_gris PRIMARY KEY (cd_imp_gris),
    CONSTRAINT fk_imp_gris_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_estacionamento (
    cd_estacionamento INT NOT NULL AUTO_INCREMENT,
    vl_estacionamento DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_estacionamento PRIMARY KEY (cd_estacionamento),
    CONSTRAINT fk_estacionamento_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_class_imo (
    cd_class_imo INT NOT NULL AUTO_INCREMENT,
    id_class_imo INT,
    CONSTRAINT pk_class_imo PRIMARY KEY (cd_class_imo)
);

CREATE TABLE IF NOT EXISTS tb_imo_proposta (
    cd_proposta INT NOT NULL,
    cd_class_imo INT NOT NULL,
    CONSTRAINT pk_class_imo_proposta PRIMARY KEY (cd_proposta , cd_class_imo),
    CONSTRAINT fk_proposta_class_imo FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta),
    CONSTRAINT fk_class_imo_proposta_proposta FOREIGN KEY (cd_class_imo)
        REFERENCES tb_class_imo (cd_class_imo)
);

CREATE TABLE IF NOT EXISTS tb_ajudante (
    cd_ajudante INT NOT NULL AUTO_INCREMENT,
    vl_ajudante DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_ajudante PRIMARY KEY (cd_ajudante),
    CONSTRAINT fk_ajudante_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_lucro_bruto (
    cd_lucro_bruto INT NOT NULL AUTO_INCREMENT,
    vl_lucro_bruto DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_lucro_bruto PRIMARY KEY (cd_lucro_bruto),
    CONSTRAINT fk_lucro_bruto_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_km_ida (
    cd_km_ida INT NOT NULL AUTO_INCREMENT,
    qtd_km_ida DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_km_ida PRIMARY KEY (cd_km_ida),
    CONSTRAINT fk_km_ida_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_km_volta (
    cd_km_volta INT NOT NULL AUTO_INCREMENT,
    qtd_km_volta DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_km_volta PRIMARY KEY (cd_km_volta),
    CONSTRAINT fk_km_volta_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_consumo_medio (
    cd_consumo_medio INT NOT NULL AUTO_INCREMENT,
    qtd_consumo_medio DECIMAL(4 , 2 ),
    cd_veiculo INT,
    CONSTRAINT pk_consumo_medio PRIMARY KEY (cd_consumo_medio),
    CONSTRAINT fk_consumo_medio_veiculo FOREIGN KEY (cd_veiculo)
        REFERENCES tb_veiculo (cd_veiculo)
);

CREATE TABLE IF NOT EXISTS tb_despesas (
    cd_despesas INT NOT NULL AUTO_INCREMENT,
    cd_proposta INT,
    CONSTRAINT pk_despesas PRIMARY KEY (cd_despesas),
    CONSTRAINT fk_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_motorista_aut (
    cd_motorista_aut INT NOT NULL AUTO_INCREMENT,
    nm_motorista_aut VARCHAR(100),
    cd_despesas INT,
    CONSTRAINT pk_motorista_aut PRIMARY KEY (cd_motorista_aut),
    CONSTRAINT fk_motorista_aut_despesas FOREIGN KEY (cd_despesas)
        REFERENCES tb_despesas (cd_despesas)
);

CREATE TABLE IF NOT EXISTS tb_simples_nac (
    cd_simples_nac INT NOT NULL AUTO_INCREMENT,
    vl_simples_nac INT,
    cd_despesas INT,
    CONSTRAINT pk_simples_nac_motorista PRIMARY KEY (cd_simples_nac),
    CONSTRAINT fk_simples_nac_despesas FOREIGN KEY (cd_despesas)
        REFERENCES tb_despesas (cd_despesas)
);

CREATE TABLE IF NOT EXISTS tb_irpj (
    cd_irpj INT NOT NULL AUTO_INCREMENT,
    vl_irpj INT,
    cd_despesas INT,
    CONSTRAINT pk_irpj PRIMARY KEY (cd_irpj),
    CONSTRAINT fk_irpj_despesas FOREIGN KEY (cd_despesas)
        REFERENCES tb_despesas (cd_despesas)
);

CREATE TABLE IF NOT EXISTS tb_adic_irpj (
    cd_adic_irpj INT NOT NULL AUTO_INCREMENT,
    vl_adic_irpj INT,
    cd_despesas INT,
    CONSTRAINT pk_adic_irpj PRIMARY KEY (cd_adic_irpj),
    CONSTRAINT fk_adic_irpj_despesas FOREIGN KEY (cd_despesas)
        REFERENCES tb_despesas (cd_despesas)
);

CREATE TABLE IF NOT EXISTS tb_pis (
    cd_psi INT NOT NULL AUTO_INCREMENT,
    vl_pis INT,
    cd_despesas INT,
    CONSTRAINT pk_pis PRIMARY KEY (cd_pis),
    CONSTRAINT fk_pis_despesas FOREIGN KEY (cd_despesas)
        REFERENCES tb_despesas (cd_despesas)
);

CREATE TABLE IF NOT EXISTS tb_cofins (
    cd_cofins INT NOT NULL AUTO_INCREMENT,
    vl_cofins INT,
    cd_despesas INT,
    CONSTRAINT pk_cofins PRIMARY KEY (cd_cofins),
    CONSTRAINT fk_cofins_despesas FOREIGN KEY (cd_despesas)
        REFERENCES tb_despesas (cd_despesas)
);

CREATE TABLE IF NOT EXISTS tb_comissao (
    cd_comissao INT NOT NULL AUTO_INCREMENT,
    vl_comissao INT,
    cd_despesas INT,
    CONSTRAINT pk_comissao PRIMARY KEY (cd_comissao),
    CONSTRAINT fk_comissao_despesas FOREIGN KEY (cd_despesas)
        REFERENCES tb_despesas (cd_despesas)
);

CREATE TABLE IF NOT EXISTS tb_motorista (
    cd_motorista INT NOT NULL AUTO_INCREMENT,
    cd_proposta INT,
    CONSTRAINT pk_motorista PRIMARY KEY (cd_motorista),
    CONSTRAINT fk_motorista FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_valores (
    cd_valores INT NOT NULL AUTO_INCREMENT,
    vl_valores DECIMAL(20 , 2 ),
    cd_motorista INT,
    CONSTRAINT pk_valores PRIMARY KEY (cd_valores),
    CONSTRAINT fk_valores_motorista FOREIGN KEY (cd_motorista)
        REFERENCES tb_motorista (cd_motorista)
);

CREATE TABLE IF NOT EXISTS tb_conf_antt (
    cd_conf_antt INT NOT NULL AUTO_INCREMENT,
    vl_conf_antt DECIMAL(20 , 2 ),
    cd_motorista INT,
    CONSTRAINT plk_conf_antt PRIMARY KEY (cd_conf_antt),
    CONSTRAINT fk_conf_antt_motorista FOREIGN KEY (cd_motorista)
        REFERENCES tb_motorista (cd_motorista)
);

CREATE TABLE IF NOT EXISTS tb_vale_pedagio (
    cd_vale_pedagio INT NOT NULL AUTO_INCREMENT,
    vl_vale_pedagio DECIMAL(20 , 2 ),
    cd_motorista INT,
    CONSTRAINT pk_vale_pedagio PRIMARY KEY (cd_vale_pedagio),
    CONSTRAINT fk_vale_pedagio_motorista FOREIGN KEY (cd_motorista)
        REFERENCES tb_motorista (cd_motorista)
);

CREATE TABLE IF NOT EXISTS tb_frete_all_in_fechado (
    cd_frete_all_in_fechado INT NOT NULL AUTO_INCREMENT,
    vl_frete_all_in_fechado DEC(20 , 2 ),
    cd_motorista INT,
    CONSTRAINT pk_frete_all_in_fechado PRIMARY KEY (cd_frete_all_in_fechado),
    CONSTRAINT fk_frete_all_in_fechado_motorista FOREIGN KEY (cd_motorista)
        REFERENCES tb_motorista (cd_motorista)
);

CREATE TABLE IF NOT EXISTS tb_cot_aut (
    cd_cot_aut INT NOT NULL AUTO_INCREMENT,
    vl_cot_aut DECIMAL(20 , 2 ),
    dt_cot_aut DATE,
    cd_motorista_aut INT,
    CONSTRAINT pk_cot_aut PRIMARY KEY (cd_cot_aut),
    CONSTRAINT fk_cot_aut_motorista_aut FOREIGN KEY (cd_motorista_aut)
        REFERENCES tb_motorista_aut (cd_motorista_aut)
);