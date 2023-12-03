create database  db_compass5 character set = 'utf8' collate = 'utf8_general_ci';

use db_compass5;

CREATE TABLE IF NOT EXISTS tb_usuario (
    cd_usuario INT NOT NULL AUTO_INCREMENT,
    nm_nome_completo VARCHAR(100),
    nm_cargo_usuario VARCHAR(100),
    cd_senha VARCHAR(20),
    CONSTRAINT pk_usuario PRIMARY KEY (cd_usuario)
);

CREATE TABLE IF NOT EXISTS tb_email_usuario (
    cd_email INT NOT NULL AUTO_INCREMENT,
    nm_email_usuario VARCHAR(100),
    cd_usuario INT,
    CONSTRAINT pk_email PRIMARY KEY (cd_email),
    CONSTRAINT fk_email_usuario_usuario FOREIGN KEY (cd_usuario)
        REFERENCES tb_usuario (cd_usuario)
);

CREATE TABLE IF NOT EXISTS tb_privilegio (
    cd_privilegio INT NOT NULL AUTO_INCREMENT,
    nm_privilegio VARCHAR(50),
    cd_usuario INT,
    CONSTRAINT pk_privilegio PRIMARY KEY (cd_privilegio),
    CONSTRAINT fk_privilegio_usuario FOREIGN KEY (cd_usuario)
        REFERENCES tb_usuario (cd_usuario)
);

CREATE TABLE IF NOT EXISTS tb_proposta (
    cd_proposta INT NOT NULL AUTO_INCREMENT,
    dt_proposta DATE,
    nm_referencia_acl VARCHAR(100),
    nm_referencia_cliente VARCHAR(100),
    nm_versao_proposta VARCHAR(50),
    dt_horario_recebimento DATETIME,
    ds_metodo_transporte VARCHAR(500),
    ds_status_proposta VARCHAR(100),
    ds_tipo_assinatura VARCHAR(20),
    cd_usuario INT,
    CONSTRAINT pk_proposta PRIMARY KEY (cd_proposta),
    CONSTRAINT fk_proposta_usuario FOREIGN KEY (cd_usuario)
        REFERENCES tb_usuario (cd_usuario)
);

CREATE TABLE IF NOT EXISTS tb_arq_propostas (
    cd_arq_propostas INT NOT NULL AUTO_INCREMENT,
    nr_versao_propostas DECIMAL(3,1),
    cd_proposta INT,
    CONSTRAINT pk_arq_propostas PRIMARY KEY (cd_arq_propostas),
    CONSTRAINT fk_arq_propostas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_tipo_proposta (
    cd_tipo_proposta INT NOT NULL AUTO_INCREMENT,
    nm_tipo_proposta VARCHAR(100),
    cd_proposta INT,
    CONSTRAINT pk_tipos_proposta PRIMARY KEY (cd_tipo_proposta),
    CONSTRAINT fk_tipos_proposta_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_cliente (
    cd_cliente INT NOT NULL AUTO_INCREMENT,
    nm_empresa_cliente VARCHAR(100),
    cd_proposta INT,
    CONSTRAINT pk_cliente PRIMARY KEY (cd_cliente),
    CONSTRAINT fk_cliente_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_responsavel_cliente (
    cd_responsavel_cliente INT NOT NULL AUTO_INCREMENT,
    nm_responsavel_cliente VARCHAR(100),
    cd_cliente INT,
    CONSTRAINT pk_resposavel_cliente PRIMARY KEY (cd_responsavel_cliente),
    CONSTRAINT fk_responsavel_cliente_cliente FOREIGN KEY (cd_cliente)
        REFERENCES tb_cliente (cd_cliente)
);

CREATE TABLE IF NOT EXISTS tb_email_responsavel_cliente (
    cd_email_responsavel_cliente INT NOT NULL AUTO_INCREMENT,
    nm_email_responsavel_cliente VARCHAR(100),
    cd_responsavel_cliente INT,
    CONSTRAINT pk_email_responsavel_cliente PRIMARY KEY (cd_email_responsavel_cliente),
    CONSTRAINT fk_email_responsavel_cliente_responsavel FOREIGN KEY (cd_responsavel_cliente)
        REFERENCES tb_responsavel_cliente (cd_responsavel_cliente)
);

CREATE TABLE IF NOT EXISTS tb_rota (
    cd_rota INT NOT NULL AUTO_INCREMENT,
    sg_uf_origem_rota CHAR(2),
    nm_cidade_origem_rota VARCHAR(100),
    sg_uf_destino_rota CHAR(2),
    nm_cidade_destino_rota VARCHAR(100),
    CONSTRAINT pk_rota PRIMARY KEY (cd_rota),
    CONSTRAINT fk_rota_proposta FOREIGN KEY (cd_rota)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_produto (
    cd_produto INT NOT NULL AUTO_INCREMENT,
    nm_produto VARCHAR(100),
    qt_produto varchar(50),
    qt_peso_produto DECIMAL(7 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_produto PRIMARY KEY (cd_produto),
    CONSTRAINT fk_produto_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_tipo_frete (
    cd_tipo_frete INT NOT NULL AUTO_INCREMENT,
    nm_tipo_frete VARCHAR(100),
    cd_proposta INT,
    CONSTRAINT pk_tipo_frete PRIMARY KEY (cd_tipo_frete),
    CONSTRAINT fk_tipo_frete_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_container (
    cd_container INT NOT NULL AUTO_INCREMENT,
    nm_container VARCHAR(100),
    qt_tara_container INT,
    qt_peso_min_container DECIMAL(8 , 2 ),
    qt_peso_max_container DECIMAL(8 , 2 ),
    qt_cub_container DECIMAL(6 , 2 ),
    qt_pallet_container INT,
    cd_proposta INT,
    CONSTRAINT pk_container PRIMARY KEY (cd_container),
    CONSTRAINT fk_container_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_veiculo (
    cd_veiculo INT NOT NULL AUTO_INCREMENT,
    nm_veiculo VARCHAR(100),
    qt_eixos_veiculo INT,
    cd_proposta INT,
    CONSTRAINT pk_veiculo PRIMARY KEY (cd_veiculo),
    CONSTRAINT fk_veiculo_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

/* OPERAÇÃO */

CREATE TABLE IF NOT EXISTS tb_operacao (
    cd_operacao INT NOT NULL AUTO_INCREMENT,
    nm_tipo_operacao VARCHAR(100),
    nm_tipo_imposto_operacao VARCHAR(100),
    vl_subtotal_operacao DECIMAL(10 , 2 ),
    pc_total_prest_operacao decimal(5,2),
    vl_total_prest_operacao DECIMAL(10 , 2 ),
    vl_despesas_operacao DECIMAL(10 , 2 ),
    pc_lucro_bruto_operacao decimal(10,2),
    vl_lucro_bruto_operacao DECIMAL(10 , 2 ),
    vl_margem_operacao DECIMAL(10 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_tipo_operacao PRIMARY KEY (cd_operacao),
    CONSTRAINT fk_tipo_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_mercadoria_operacao (
    cd_mercadoria_operacao INT NOT NULL AUTO_INCREMENT,
    vl_mercadoria_operacao DECIMAL(10 , 2 ),
    vl_container_operacao DECIMAL(20 , 2 ),
    cd_operacao INT,
    CONSTRAINT pk_mercadoria_operacao PRIMARY KEY (cd_mercadoria_operacao),
    CONSTRAINT fk_mercadoria_operacao_operacao FOREIGN KEY (cd_operacao)
        REFERENCES tb_operacao (cd_operacao)
);

CREATE TABLE IF NOT EXISTS tb_imp_operacao (
    cd_imp_operacao INT NOT NULL AUTO_INCREMENT,
    pc_imp_susp_imp_operacao DECIMAL(5 , 2 ),
    vl_imp_susp_imp_operacao DECIMAL(10 , 2 ),
    pc_rctrc_imp_operacao DECIMAL(5 , 2 ),
    vl_rctrc_imp_operacao DECIMAL(10 , 2 ),
    pc_rcfdc_imp_operacao DECIMAL(5 , 2 ),
    vl_rcfdc_imp_operacao DECIMAL(10 , 2 ),
    pc_gris_imp_operacao DECIMAL(5 , 2 ),
    vl_gris_imp_operacao DECIMAL(10 , 2 ),
    nm_rota_icms_operacao VARCHAR(10),
    vl_valor_icms_operacao DECIMAL(10 , 2 ),
    pc_icms_operacao DECIMAL(5 , 2 ),
    cd_operacao int,
    CONSTRAINT pk_imp_operacao PRIMARY KEY (cd_imp_operacao),
    CONSTRAINT fk_imp_operacao_operacao FOREIGN KEY (cd_operacao)
        REFERENCES tb_operacao (cd_operacao)
);
 
 CREATE TABLE IF NOT EXISTS tb_adic_operacao (
    cd_adic_operacao INT NOT NULL AUTO_INCREMENT,
    vl_estacionamento DECIMAL(10 , 2 ),
    id_imo INT,
    vl_dta DECIMAL(10 , 2 ),
    vl_ajudantes DECIMAL(10 , 2 ),
    vl_pedagio DECIMAL(10 , 2 ),
    cd_operacao INT,
    CONSTRAINT pk_adic_operacao PRIMARY KEY (cd_adic_operacao),
    CONSTRAINT fk_adic_operacao_operacao FOREIGN KEY (cd_operacao)
        REFERENCES tb_operacao (cd_operacao)
);

/* DESPESAS */

CREATE TABLE IF NOT EXISTS tb_despesas (
    cd_despesas INT NOT NULL AUTO_INCREMENT,
    nm_motorista_despesas VARCHAR(100),
    vl_pedagio_despesas DECIMAL(10 , 2 ),
    vl_profit_despesas DECIMAL(10 , 2 ),
    vl_comissao_despesas DECIMAL(10 , 2 ),
    vl_despesas DECIMAL(10 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_despesas PRIMARY KEY (cd_despesas),
    CONSTRAINT fk_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);
 
CREATE TABLE IF NOT EXISTS tb_imp_despesas (
    cd_imp_despesas INT NOT NULL AUTO_INCREMENT,
    pc_rcfdc_imp_despesas DECIMAL(5 , 2 ),
    vl_rcfdc_imp_despesas DECIMAL(10 , 2 ),
    pc_rctrc_imp_despesas DECIMAL(5 , 2 ),
    vl_rctrc_imp_despesas DECIMAL(10 , 2 ),
    pc_simples_nac_imp_despesas DECIMAL(5 , 2 ),
    vl_simples_nac_imp_despesas DECIMAL(10 , 2 ),
    pc_irpj_imp_despesas DECIMAL(5 , 2 ),
    vl_irpj_imp_despesas DECIMAL(10 , 2 ),
    pc_adic_irpj_imp_despesas DECIMAL(5 , 2 ),
    vl_adic_irpj_imp_despesas DECIMAL(10 , 2 ),
    pc_pis_imp_despesas DECIMAL(5 , 2 ),
    vl_pis_imp_despesas DECIMAL(10 , 2 ),
    pc_cofins_imp_despesas DECIMAL(5 , 2 ),
    vl_cofins_imp_despesas DECIMAL(10 , 2 ),
    nm_rota_icms_despesas VARCHAR(10),
    vl_icms_despesas DECIMAL(10 , 2 ),
    pc_icms_despesas DECIMAL(5 , 2 ),
    cd_despesas INT,
    CONSTRAINT pk_imp_despesas PRIMARY KEY (cd_imp_despesas),
    CONSTRAINT fk_imp_despesas_despesas FOREIGN KEY (cd_despesas)
        REFERENCES tb_despesas (cd_despesas)
);

CREATE TABLE IF NOT EXISTS tb_adic_despesas (
    cd_adic_despesas INT NOT NULL AUTO_INCREMENT,
    vl_buonny_despesas DECIMAL(10 , 2 ),
    vl_dta_terc_despesas DECIMAL(10 , 2 ),
    vl_estacionamento_despesas DECIMAL(10 , 2 ),
    vl_ajudantes_despesas DECIMAL(10 , 2 ),
    cd_despesas INT,
    CONSTRAINT pk_adic_despesas PRIMARY KEY (cd_adic_despesas),
    CONSTRAINT fk_adic_despesas_despesas FOREIGN KEY (cd_despesas)
        REFERENCES tb_despesas (cd_despesas)
);

/* CARGA */

CREATE TABLE IF NOT EXISTS tb_carga (
    cd_carga INT NOT NULL AUTO_INCREMENT,
    nm_tipo_carga VARCHAR(100),
    vl_despesa_viagem_carga DECIMAL(10 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_carga PRIMARY KEY (cd_carga),
    CONSTRAINT fk_tipo_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_km_rota_carga (
    cd_km_rota_carga INT NOT NULL AUTO_INCREMENT,
    qtd_ida_km_rota_carga DECIMAL(6 , 2 ),
    qtd_volta_km_rota_carga DECIMAL(6 , 2 ),
    qtd_total_km_rota_carga DECIMAL(6 , 2 ),
    cd_carga INT,
    CONSTRAINT pk_km_rota_carga PRIMARY KEY (cd_km_rota_carga),
    CONSTRAINT fk_km_ida_carga_carga FOREIGN KEY (cd_carga)
        REFERENCES tb_carga (cd_carga)
);

CREATE TABLE IF NOT EXISTS tb_pedagio_rota_carga (
    cd_pedagio_rota_carga INT NOT NULL AUTO_INCREMENT,
    qtd_eixos_pedagio_rota_carga DECIMAL(10 , 2 ),
    vl_ida_pedagio_rota_carga DECIMAL(10 , 2 ),
    vl_volta_pedagio_rota_carga DECIMAL(10 , 2 ),
    vl_total_pedagio_rota_carga DECIMAL(10 , 2 ),
    cd_carga INT,
    CONSTRAINT pk_pedagio_rota_carga PRIMARY KEY (cd_pedagio_rota_carga),
    CONSTRAINT fk_pedagio_rota_carga_carga FOREIGN KEY (cd_carga)
        REFERENCES tb_carga (cd_carga)
);

CREATE TABLE IF NOT EXISTS tb_valor_carga (
    cd_valor_carga INT NOT NULL AUTO_INCREMENT,
    vl_preco_carga DECIMAL(10 , 2 ),
    nm_tipo_moeda_valor_carga DECIMAL(10 , 2 ),
    vl_cotacao_valor_carga DECIMAL(10 , 2 ),
    vl_brl_valor_carga DECIMAL(10 , 2 ),
    cd_carga INT,
    CONSTRAINT pk_valor_carga PRIMARY KEY (cd_valor_carga),
    CONSTRAINT fk_valor_carga_carga FOREIGN KEY (cd_carga)
        REFERENCES tb_carga (cd_carga)
);

CREATE TABLE IF NOT EXISTS tb_frete_peso (
    cd_frete_peso INT NOT NULL AUTO_INCREMENT,
    vl_frete_peso DECIMAL(10 , 2 ),
    pc_frete_peso DECIMAL(5 , 2 ),
    cd_proposta int,
    CONSTRAINT pk_frete_peso PRIMARY KEY (cd_frete_peso),
    CONSTRAINT fk_frete_peso_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

/* ADICIONAIS SE NECESSÁRIO*/

CREATE TABLE IF NOT EXISTS tb_adicionais (
    cd_adicionais INT NOT NULL AUTO_INCREMENT,
    id_isca_adicionais CHAR(3),
    vl_isca_adicionais DECIMAL(10 , 2 ),
    id_monitoramento_isca_adicionais VARCHAR(3),
    vl_monitoramento_isca_adicionais decimal(10,2),
    id_escolta_armada_adicionais char(3),
    vl_escolta_armada_adicionais decimal(10,2),
    id_adic_carga_imo_adicionais char(3),
    vl_adic_carga_imo_adicionais decimal(10,2),
    id_carregamento_expr_adicionais char(3),
    vl_carregamento_expr_adicionais decimal(10,2),
    id_util_cav_ls_adicionais char(3),
    vl_util_cav_ls_adicionais decimal(10,2),
    id_estadia_especial_adicionais varchar(20),
    vl_estadia_especial_adicionais decimal(10,2),
    id_sobrestadia_carreg_adicionais CHAR(3),
    vl_sobrestadia_carreg_adicionais decimal(10,2),
    cd_proposta INT,
    CONSTRAINT pk_adicionais PRIMARY KEY (cd_adicionais),
    CONSTRAINT fk_adicionais_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);
 
CREATE TABLE IF NOT EXISTS tb_sobrestadia_carreg (
    cd_sobrestadia_carreg INT NOT NULL AUTO_INCREMENT,
    id_sobrestadia_carreg CHAR(3),
    cd_proposta INT,
    CONSTRAINT pk_sobrestadia_carreg PRIMARY KEY (cd_sobrestadia_carreg),
    CONSTRAINT fk_sobrestadia_carreg_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

/*MOTORISTA*/

CREATE TABLE IF NOT EXISTS tb_motorista (
    cd_motorista INT NOT NULL AUTO_INCREMENT,
    vl_mototrista DECIMAL(10 , 2 ),
    vl_frete_conf_antt_motorista decimal(10,2),
    vl_pedagio_tab_motorista decimal(10,2),
    vl_total_aut_tab_motorista decimal(10,2),
    vl_lucro_total_aut_tab_motorista decimal(10,2),
    vl_frete_all_in_fechado_motorista decimal(10,2),
     vl_lucro_frete_all_in_fechado_motorista decimal(10,2),
     vl_tentar_fechar_motorista decimal(10,2),
     vl_lucro_tentar_fechar_motorista decimal(10,2),
    cd_proposta INT,
    CONSTRAINT pk_motorista PRIMARY KEY (cd_motorista),
    CONSTRAINT fk_motorista_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

/*COTAÇÃO AUTONOMO*/

CREATE TABLE IF NOT EXISTS tb_cot_aut (
    cd_cot_aut INT NOT NULL AUTO_INCREMENT,
    nm_cot_aut varchar(100),
    vl_cot_aut DECIMAL(20 , 2 ),
    dt_cot_aut DATE,
    cd_proposta INT,
    CONSTRAINT pk_cot_aut PRIMARY KEY (cd_cot_aut),
    CONSTRAINT fk_cot_aut_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

/* TABELAS DE CONSULTA*/

CREATE TABLE IF NOT EXISTS tb_consulta_porc_icms (
    cd_consulta_porc_icms INT NOT NULL AUTO_INCREMENT,
    nm_consulta_porc_icms VARCHAR(10),
    vl_consulta_porc_icms DOUBLE,
    CONSTRAINT pk_consulta_porc_icms PRIMARY KEY (cd_consulta_porc_icms)
);


CREATE TABLE IF NOT EXISTS tb_tipo_op_consulta (
    cd_tipo_op_consulta INT NOT NULL AUTO_INCREMENT,
    nm_tipo_op_consulta VARCHAR(50),
    CONSTRAINT pk_tipo_op_consulta PRIMARY KEY (cd_tipo_op_consulta)
);

CREATE TABLE IF NOT EXISTS tb_eixos_consulta (
    cd_eixos_consulta INT NOT NULL AUTO_INCREMENT,
    qtd_eixos_consulta INT,
    CONSTRAINT pk_eixos_consulta PRIMARY KEY (cd_eixos_consulta)
);

CREATE TABLE IF NOT EXISTS tb_tipo_carga_consulta (
    cd_tipo_carga_consulta INT NOT NULL AUTO_INCREMENT,
    nm_tipo_carga_consulta VARCHAR(50),
    CONSTRAINT pk_tipo_carga_consulta PRIMARY KEY (cd_tipo_carga_consulta)
);

CREATE TABLE IF NOT EXISTS tb_valor_carga_op_consulta (
    cd_valor_carga_op_consulta INT NOT NULL AUTO_INCREMENT,
    vl_valor_carga_op_consulta decimal(20,2),
    cd_tipo_carga_consulta INT,
    CONSTRAINT pk_valor_carga_op_consulta PRIMARY KEY (cd_valor_carga_op_consulta),
    CONSTRAINT fk_valor_tipo_consulta_carga FOREIGN KEY (cd_tipo_carga_consulta)
        REFERENCES tb_tipo_carga_consulta (cd_tipo_carga_consulta)
);

CREATE TABLE IF NOT EXISTS tb_eixos_tipo_carga_consulta (
    cd_eixos_consulta INT,
    cd_tipo_carga_consulta INT ,
    cd_tipo_op_consulta INT,
    CONSTRAINT pk_eixos_tipo_carga_consulta_consulta PRIMARY KEY (cd_eixos_consulta , cd_tipo_carga_consulta),
    CONSTRAINT fk_eixos_consulta_consulta FOREIGN KEY (cd_eixos_consulta)
        REFERENCES tb_eixos_consulta (cd_eixos_consulta),
    CONSTRAINT fk_eixos_tipo_carga_consulta_consulta FOREIGN KEY (cd_tipo_carga_consulta)
        REFERENCES tb_tipo_carga_consulta (cd_tipo_carga_consulta),
    CONSTRAINT fk_tipo_op_consulta_consulta FOREIGN KEY (cd_tipo_op_consulta)
        REFERENCES tb_tipo_op_consulta (cd_tipo_op_consulta)
);