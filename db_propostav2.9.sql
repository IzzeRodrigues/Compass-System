create database db_compass character set = 'utf8' collate = 'utf8_general_ci';

use db_compass;

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
    nm_privilegio ENUM('Adm', 'Usuario'),
    cd_usuario INT,
    CONSTRAINT pk_privilegio PRIMARY KEY (cd_privilegio),
    CONSTRAINT fk_privilegio_usuario FOREIGN KEY (cd_usuario)
        REFERENCES tb_usuario (cd_usuario)
);

CREATE TABLE IF NOT EXISTS tb_proposta (
    cd_proposta INT NOT NULL AUTO_INCREMENT,
    dt_proposta DATE,
    nm_referencia_acl VARCHAR(100),
    dt_horario_recebimento DATETIME,
    ds_metodo_transporte VARCHAR(500),
    cd_usuario INT,
    CONSTRAINT pk_proposta PRIMARY KEY (cd_proposta),
    CONSTRAINT fk_proposta_usuario FOREIGN KEY (cd_usuario)
        REFERENCES tb_usuario (cd_usuario)
);

CREATE TABLE IF NOT EXISTS tb_cliente (
    cd_cliente INT NOT NULL AUTO_INCREMENT,
    nm_empresa_cliente VARCHAR(100),
    nm_referencia_cliente VARCHAR(100),
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
    CONSTRAINT fk_email_responsavel_cliente_cliente FOREIGN KEY (cd_responsavel_cliente)
        REFERENCES tb_responsavel_cliente (cd_responsavel_cliente)
);

CREATE TABLE IF NOT EXISTS tb_tipo_frete (
    cd_tipo_frete INT NOT NULL AUTO_INCREMENT,
    nm_tipo_frete VARCHAR(100),
    cd_proposta INT,
    CONSTRAINT pk_tipo_frete PRIMARY KEY (cd_tipo_frete),
    CONSTRAINT fk_tipo_frete_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
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
    nm_cidade_origem VARCHAR(100),
    ds_cidade_origem VARCHAR(500),
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
    nm_cidade_destino VARCHAR(100),
    ds_cidade_destino VARCHAR(500),
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
    nm_veiculo VARCHAR(100),
    qt_eixos_veiculo INT,
    cd_proposta INT,
    CONSTRAINT pk_veiculo PRIMARY KEY (cd_veiculo),
    CONSTRAINT fk_veiculo_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_carreta (
    cd_carreta INT NOT NULL AUTO_INCREMENT,
    nm_carreta VARCHAR(100),
    qt_cubagem_min_carreta DOUBLE,
    qt_cubagem_max_carreta DOUBLE,
    qt_peso_min_carreta DOUBLE,
    qt_peso_max_carreta DOUBLE,
    qt_pallets_carreta INT,
    cd_proposta INT,
    CONSTRAINT pk_carreta PRIMARY KEY (cd_carreta),
    CONSTRAINT fk_carreta_veiculo FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_container (
    cd_container INT NOT NULL AUTO_INCREMENT,
    nm_container VARCHAR(100),
    qt_tara_container INT,
    qt_peso_min_container DOUBLE,
    qt_peso_max_container DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_container PRIMARY KEY (cd_container),
    CONSTRAINT fk_container_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_produto (
    cd_produto INT NOT NULL AUTO_INCREMENT,
    nm_produto VARCHAR(100),
    qt_produto INT,
    ds_produto VARCHAR(500),
    qt_cubagem_produto DOUBLE,
    qt_peso_produto DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_produto PRIMARY KEY (cd_produto),
    CONSTRAINT fk_produto_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
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
    CONSTRAINT fk_tipo_proposta_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

/*operação*/

CREATE TABLE IF NOT EXISTS tb_tipo_operacao (
    cd_tipo_operacao INT NOT NULL AUTO_INCREMENT,
    nm_tipo_operacao VARCHAR(100),
    cd_proposta INT,
    CONSTRAINT pk_tipo_operacao PRIMARY KEY (cd_tipo_operacao),
    CONSTRAINT fk_tipo_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_cat_imposto_operacao (
    cd_cat_imposto_operacao INT NOT NULL AUTO_INCREMENT,
    nm_cat_imposto_operacao VARCHAR(100),
    cd_proposta INT,
    CONSTRAINT pk_cat_imposto_operacao PRIMARY KEY (cd_cat_imposto_operacao),
    CONSTRAINT fk_cat_imposto_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_valor_merc_operacao (
    cd_valor_merc_operacao INT NOT NULL AUTO_INCREMENT,
    vl_valor_merc_operacao DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_valor_merc_operacao PRIMARY KEY (cd_valor_merc_operacao),
    CONSTRAINT fk_valor_merc_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_valor_container_operacao (
    cd_valor_container_operacao INT NOT NULL AUTO_INCREMENT,
    vl_valor_container_operacao DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_valor_container_operacao PRIMARY KEY (cd_valor_container_operacao),
    CONSTRAINT fk_valor_container_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_imp_suspenso_operacao (
    cd_porc_imp_suspenso_operacao INT NOT NULL AUTO_INCREMENT,
    vl_porc_imp_suspenso_operacao DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_porc_imp_suspenso_operacao PRIMARY KEY (cd_porc_imp_suspenso_operacao),
    CONSTRAINT fk_porc_imp_suspenso_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_imp_suspenso_operacao (
    cd_imp_suspenso_operacao INT NOT NULL AUTO_INCREMENT,
    vl_imp_suspenso_operacao DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_imp_suspenso_operacao PRIMARY KEY (cd_imp_suspenso_operacao),
    CONSTRAINT fk_imp_suspenso_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_tot_imp_seg_operacao (
    cd_tot_imp_seg_operacao INT NOT NULL AUTO_INCREMENT,
    vl_tot_imp_seg_operacao DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_tot_imp_seg_operacao PRIMARY KEY (cd_tot_imp_seg_operacao),
    CONSTRAINT fk_tot_imp_seg_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_frete_peso_operacao (
    cd_frete_peso_operacao INT NOT NULL AUTO_INCREMENT,
    vl_frete_peso_operacao DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_frete_peso_operacao PRIMARY KEY (cd_frete_peso_operacao),
    CONSTRAINT fk_frete_peso_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_imp_rctrc_operacao (
    cd_porc_imp_rctrc_operacao INT NOT NULL AUTO_INCREMENT,
    vl_porc_imp_rctrc_operacao DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_porc_imp_rctrc_operacao PRIMARY KEY (cd_porc_imp_rctrc_operacao),
    CONSTRAINT fk_porc_imp_rctrc_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_imp_rctrc_operacao (
    cd_imp_rctrc_operacao INT NOT NULL AUTO_INCREMENT,
    vl_imp_rctrc_operacao decimal(20,2),
    cd_proposta INT,
    CONSTRAINT pk_imp_rctrc_operacao PRIMARY KEY (cd_imp_rctrc_operacao),
    CONSTRAINT fk_imp_rctrc_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_imp_rcfdc_operacao (
    cd_porc_imp_rcfdc_operacao INT NOT NULL AUTO_INCREMENT,
    vl_porc_imp_rcfdc_operacao DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_porc_imp_rcfdc_operacao PRIMARY KEY (cd_porc_imp_rcfdc_operacao),
    CONSTRAINT fk_porc_imp_rcfdc_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_imp_rcfdc_operacao (
    cd_imp_rcfdc_operacao INT NOT NULL AUTO_INCREMENT,
    vl_imp_rcfdc_operacao decimal(20,2),
    cd_proposta INT,
    CONSTRAINT pk_imp_rcfdc_operacao PRIMARY KEY (cd_imp_rcfdc_operacao),
    CONSTRAINT fk_imp_rcfdc_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_imp_gris (
    cd_porc_imp_gris INT NOT NULL AUTO_INCREMENT,
    vl_porc_imp_gris DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_porc_imp_gris PRIMARY KEY (cd_porc_imp_gris),
    CONSTRAINT fk_porc_imp_gris_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_imp_gris (
    cd_imp_gris INT NOT NULL AUTO_INCREMENT,
    vl_imp_gris decimal(20,2),
    cd_proposta INT,
    CONSTRAINT pk_imp_gris PRIMARY KEY (cd_imp_gris),
    CONSTRAINT fk_imp_gris_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_tipo_seguro_operacao (
    cd_tipo_seguro_operacao INT NOT NULL AUTO_INCREMENT,
    nm_tipo_seguro_operacao VARCHAR(100),
    cd_proposta INT,
    CONSTRAINT pk_tipo_seguro_operacao PRIMARY KEY (cd_tipo_seguro_operacao),
    CONSTRAINT fk_tipo_seguro_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_tipo_seguro_operacao (
    cd_porc_tipo_seguro_operacao INT NOT NULL AUTO_INCREMENT,
    vl_porc_tipo_seguro_operacao DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_porc_tipo_seguro_operacao PRIMARY KEY (cd_porc_tipo_seguro_operacao),
    CONSTRAINT fk_porc_tipo_seguro_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_total_tipo_seguro_operacao (
    cd_total_tipo_seguro_operacao INT NOT NULL AUTO_INCREMENT,
    vl_total_tipo_seguro_operacao DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_total_tipo_seguro_operacao PRIMARY KEY (cd_total_tipo_seguro_operacao),
    CONSTRAINT fk_total_tipo_seguro_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_pedagio_operacao (
    cd_pedagio_operacao INT NOT NULL AUTO_INCREMENT,
    vl_pedagio_operacao DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_operacao PRIMARY KEY (cd_pedagio_operacao),
    CONSTRAINT fk_pedagio_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_class_imo (
    cd_class_imo INT NOT NULL AUTO_INCREMENT,
    id_class_imo INT,
    cd_proposta INT,
    CONSTRAINT pk_class_imo PRIMARY KEY (cd_class_imo),
    CONSTRAINT fk_class_imo_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_dta_operacao (
    cd_dta_operacao INT NOT NULL AUTO_INCREMENT,
    vl_dta_operacao decimal(20,2),
    cd_proposta INT,
    CONSTRAINT pk_dta_operacao PRIMARY KEY (cd_dta_operacao),
    CONSTRAINT fk_dta_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_ajudantes_operacao (
    cd_ajudantes_operacao INT NOT NULL AUTO_INCREMENT,
    vl_ajudantes_operacao DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_ajudantes_operacao PRIMARY KEY (cd_ajudantes_operacao),
    CONSTRAINT fk_ajudantes_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_valor_icms_operacao (
    cd_valor_icms_operacao INT NOT NULL AUTO_INCREMENT,
    vl_valor_icms_operacao DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_valor_icms_operacao PRIMARY KEY (cd_valor_icms_operacao),
    CONSTRAINT fk_valor_icms_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_icms_operacao (
    cd_porc_icms_operacao INT NOT NULL AUTO_INCREMENT,
    vl_porcicms_operacao DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_porc_icms_operacao PRIMARY KEY (cd_porc_icms_operacao),
    CONSTRAINT fk_porc_icms_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_sub_total_operacao (
    cd_sub_total_operacao INT NOT NULL AUTO_INCREMENT,
    vl_sub_total_operacao DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_sub_total_operacao PRIMARY KEY (cd_sub_total_operacao),
    CONSTRAINT fk_sub_total_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_total_prest_operacao (
    cd_total_prest_operacao INT NOT NULL AUTO_INCREMENT,
    vl_total_prest_operacao DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_total_prest_operacao PRIMARY KEY (cd_total_prest_operacao),
    CONSTRAINT fk_total_prest_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_total_prest_operacao (
    cd_porc_total_prest_operacao INT NOT NULL AUTO_INCREMENT,
    vl_porc_total_prest_operacao DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_porc_total_prest_operacao PRIMARY KEY (cd_porc_total_prest_operacao),
    CONSTRAINT fk_porc_total_prest_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_despesas_operacao (
    cd_despesas_operacao INT NOT NULL AUTO_INCREMENT,
    vl_despesas_operacao DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_despesas_operacao PRIMARY KEY (cd_despesas_operacao),
    CONSTRAINT fk_despesas_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_lucro_bruto_operacao (
    cd_lucro_bruto_operacao INT NOT NULL AUTO_INCREMENT,
    vl_lucro_bruto_operacao DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_lucro_bruto_operacao PRIMARY KEY (cd_lucro_bruto_operacao),
    CONSTRAINT fk_lucro_bruto_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_lucro_bruto_operacao (
    cd_porc_lucro_bruto_operacao INT NOT NULL AUTO_INCREMENT,
    vl_porc_lucro_bruto_operacao DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_porc_lucro_bruto_operacao PRIMARY KEY (cd_porc_lucro_bruto_operacao),
    CONSTRAINT fk_porc_lucro_bruto_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_margem_operacao (
    cd_margem_operacao INT NOT NULL AUTO_INCREMENT,
    vl_margem_operacao DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_margem_operacao PRIMARY KEY (cd_margem_operacao),
    CONSTRAINT fk_margem_operacao_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

/*DESPESAS*/

CREATE TABLE IF NOT EXISTS tb_mot_aut_despesas (
    cd_mot_aut_despesas INT NOT NULL AUTO_INCREMENT,
    vl_mot_aut_despesas DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_mot_aut_despesas PRIMARY KEY (cd_mot_aut_despesas),
    CONSTRAINT fk_mot_aut_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_pedagio_despesas (
    cd_pedagio_despesas INT NOT NULL AUTO_INCREMENT,
    vl_pedagio_despesas DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_pedagio_despesas PRIMARY KEY (cd_pedagio_despesas),
    CONSTRAINT fk_pedagio_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_imp_rctrc_despesas (
    cd_porc_imp_rctrc_despesas INT NOT NULL AUTO_INCREMENT,
    vl_porc_imp_rctrc_despesas DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_porc_imp_rctrc_despesas PRIMARY KEY (cd_porc_imp_rctrc_despesas),
    CONSTRAINT fk_porc_imp_rctrc_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_imp_rctrc_despesas (
    cd_imp_rctrc_despesas INT NOT NULL AUTO_INCREMENT,
    vl_imp_rctrc_despesas decimal(20,2),
    cd_proposta INT,
    CONSTRAINT pk_imp_rctrc_despesas PRIMARY KEY (cd_imp_rctrc_despesas),
    CONSTRAINT fk_imp_rctrc_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_imp_rcfdc_despesas (
    cd_porc_imp_rcfdc_despesas INT NOT NULL AUTO_INCREMENT,
    vl_porc_imp_rcfdc_despesas DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_porc_imp_rcfdc_operacao PRIMARY KEY (cd_porc_imp_rcfdc_despesas),
    CONSTRAINT fk_porc_imp_rcfdc_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_imp_rcfdc_despesas (
    cd_imp_rcfdc_despesas INT NOT NULL AUTO_INCREMENT,
    vl_imp_rcfdc_despesas DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_imp_rcfdc_despesas PRIMARY KEY (cd_imp_rcfdc_despesas),
    CONSTRAINT fk_imp_rcfdc_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_simples_nac_despesas (
    cd_porc_simples_nac_despesas INT NOT NULL AUTO_INCREMENT,
    vl_porc_simples_nac_despesas DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_porc_simples_nac_despesas PRIMARY KEY (cd_porc_simples_nac_despesas),
    CONSTRAINT fk_porc_simples_nac_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_simples_nac_despesas (
    cd_simples_nac_despesas INT NOT NULL AUTO_INCREMENT,
    vl_simples_nac_despesas DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_simples_nac_despesas PRIMARY KEY (cd_simples_nac_despesas),
    CONSTRAINT fk_simples_nac_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_irpj_despesas (
    cd_porc_irpj_despesas INT NOT NULL AUTO_INCREMENT,
    vl_porc_irpj_despesas DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_porc_irpj_despesas PRIMARY KEY (cd_porc_irpj_despesas),
    CONSTRAINT fk_porc_irpj_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_irpj_despesas (
    cd_irpj_despesas INT NOT NULL AUTO_INCREMENT,
    vl_irpj_despesas DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_irpj_despesas PRIMARY KEY (cd_irpj_despesas),
    CONSTRAINT fk_irpj_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_adic_irpj_despesas (
    cd_porc_adic_irpj_despesas INT NOT NULL AUTO_INCREMENT,
    vl_porc_adic_irpj_despesas DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_porc_adic_irpj_despesas PRIMARY KEY (cd_porc_adic_irpj_despesas),
    CONSTRAINT fk_porc_adic_irpj_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_adic_irpj_despesas (
    cd_adic_irpj_despesas INT NOT NULL AUTO_INCREMENT,
    vl_adic_irpj_despesas decimal(20,2),
    cd_proposta INT,
    CONSTRAINT pk_adic_irpj_despesas PRIMARY KEY (cd_adic_irpj_despesas),
    CONSTRAINT fk_adic_irpj_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_pis_despesas (
    cd_porc_pis_despesas INT NOT NULL AUTO_INCREMENT,
    vl_porc_pis_despesas DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_porc_pis_despesas PRIMARY KEY (cd_porc_pis_despesas),
    CONSTRAINT fk_porc_pis_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_pis_despesas (
    cd_pis_despesas INT NOT NULL AUTO_INCREMENT,
    vl_pis_despesas DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_pis_despesas PRIMARY KEY (cd_pis_despesas),
    CONSTRAINT fk_pis_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_cofins_despesas (
    cd_porc_cofins_despesas INT NOT NULL AUTO_INCREMENT,
    vl_porc_cofins_despesas DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_porc_cofins_despesas PRIMARY KEY (cd_porc_cofins_despesas),
    CONSTRAINT fk_porc_cofins_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_cofins_despesas (
    cd_cofins_despesas INT NOT NULL AUTO_INCREMENT,
    vl_cofins_despesas DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_cofins_despesas PRIMARY KEY (cd_cofins_despesas),
    CONSTRAINT fk_cofins_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_icms_despesas (
    cd_porc_icms_despesas INT NOT NULL AUTO_INCREMENT,
    vl_porc_icms_despesas DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_porc_icms_despesas PRIMARY KEY (cd_porc_icms_despesas),
    CONSTRAINT fk_porc_icms_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_valor_icms_despesas (
    cd_valor_icms_despesas INT NOT NULL AUTO_INCREMENT,
    vl_valor_icms_despesas DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_valor_icms_despesas PRIMARY KEY (cd_valor_icms_despesas),
    CONSTRAINT fk_valor_icms_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_buonny_cad_despesas (
    cd_buonny_cad_despesas INT NOT NULL AUTO_INCREMENT,
    id_buonny_cad_despesas INT,
    cd_proposta INT,
    CONSTRAINT pk_buonny_cad_despesas PRIMARY KEY (cd_buonny_cad_despesas),
    CONSTRAINT fk_buonny_cad_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_dta_di_terc_despesas (
    cd_dta_di_terc_despesas INT NOT NULL AUTO_INCREMENT,
    vl_dta_di_terc_despesas DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_dta_di_terc_despesas PRIMARY KEY (cd_dta_di_terc_despesas),
    CONSTRAINT fk_dta_di_terc_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_estacionamento_despesas (
    cd_estacionamento_despesas INT NOT NULL AUTO_INCREMENT,
    vl_estacionamento_despesas DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_estacionamento_despesas PRIMARY KEY (cd_estacionamento_despesas),
    CONSTRAINT fk_estacionamento_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_ajudantes_despesas (
    cd_ajudantes_despesas INT NOT NULL AUTO_INCREMENT,
    vl_ajudantes_despesas DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_ajudantes_despesas PRIMARY KEY (cd_ajudantes_despesas),
    CONSTRAINT fk_ajudantes_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_profit_despesas (
    cd_profit_despesas INT NOT NULL AUTO_INCREMENT,
    vl_profit_despesas DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_profit_despesas PRIMARY KEY (cd_profit_despesas),
    CONSTRAINT fk_profit_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_gris_rast_despesas (
    cd_gris_rast_despesas INT NOT NULL AUTO_INCREMENT,
    vl_gris_rast_despesas DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_gris_rast_despesas PRIMARY KEY (cd_gris_rast_despesas),
    CONSTRAINT fk_gris_rast_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_porc_comissao_despesas (
    cd_porc_comissao_despesas INT NOT NULL AUTO_INCREMENT,
    vl_porc_comissao_despesas DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_porc_comissao_despesas PRIMARY KEY (cd_porc_comissao_despesas),
    CONSTRAINT fk_porc_comissao_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_comissao_despesas (
    cd_comissao_despesas INT NOT NULL AUTO_INCREMENT,
    vl_comissao_despesas DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_comissao_despesas PRIMARY KEY (cd_comissao_despesas),
    CONSTRAINT fk_comissao_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_total_despesas (
    cd_total_despesas INT NOT NULL AUTO_INCREMENT,
    vl_total_despesas DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_total_despesas PRIMARY KEY (cd_total_despesas),
    CONSTRAINT fk_total_despesas_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

/*CARGA*/

CREATE TABLE IF NOT EXISTS tb_valor_carga (
    cd_valor_carga INT NOT NULL AUTO_INCREMENT,
    vl_valor_carga DECIMAL(20 , 2 ),
    cd_tipo_carga INT,
    cd_proposta INT,
    CONSTRAINT pk_valor_carga PRIMARY KEY (cd_valor_carga),
    CONSTRAINT fk_valor_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_eixos_carga (
    cd_eixos_carga INT NOT NULL AUTO_INCREMENT,
    qtd_eixos_carga INT,
    cd_proposta INT,
    CONSTRAINT pk_eixos_carga PRIMARY KEY (cd_eixos_carga),
    CONSTRAINT fk_eixos_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_tipo_carga (
    cd_tipo_carga INT NOT NULL AUTO_INCREMENT,
    nm_tipo_carga VARCHAR(100),
    cd_proposta INT,
    CONSTRAINT pk_tipo_carga PRIMARY KEY (cd_tipo_carga),
    CONSTRAINT fk_tipo_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_km_ida_carga (
    cd_km_ida_carga INT NOT NULL AUTO_INCREMENT,
    qtd_km_ida_carga DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_km_ida_carga PRIMARY KEY (cd_km_ida_carga),
    CONSTRAINT fk_km_ida_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_km_volta_carga (
    cd_km_volta_carga INT NOT NULL AUTO_INCREMENT,
    qtd_km_volta_carga DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_km_volta_carga PRIMARY KEY (cd_km_volta_carga),
    CONSTRAINT fk_km_volta_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_total_km_carga (
    cd_total_km_carga INT NOT NULL AUTO_INCREMENT,
    vl_total_km_carga DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_total_km_carga PRIMARY KEY (cd_total_km_carga),
    CONSTRAINT fk_total_km_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_pedagio_ida_eixo_carga (
    cd_pedagio_ida_eixo_carga INT NOT NULL AUTO_INCREMENT,
    vl_pedagio_ida_eixo_carga DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_pedagio_ida_eixo_carga PRIMARY KEY (cd_pedagio_ida_eixo_carga),
    CONSTRAINT fk_pedagio_ida_eixo_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_pedagio_volta_eixo_carga (
    cd_pedagio_volta_eixo_carga INT NOT NULL AUTO_INCREMENT,
    vl_pedagio_volta_eixo_carga DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_pedagio_volta_eixo_carga PRIMARY KEY (cd_pedagio_volta_eixo_carga),
    CONSTRAINT fk_pedagio_volta_eixo_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_consumo_medio_km_litro_carga (
    cd_consumo_medio_km_litro_carga INT NOT NULL AUTO_INCREMENT,
    qtd_consumo_medio_km_litro_carga DECIMAL(4 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_consumo_medio_km_litro_carga PRIMARY KEY (cd_consumo_medio_km_litro_carga),
    CONSTRAINT fk_consumo_medio_km_litro_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_preco_litro_comb_carga (
    cd_preco_litro_comb_carga INT NOT NULL AUTO_INCREMENT,
    vl_preco_litro_comb_carga DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_preco_litro_comb_carga PRIMARY KEY (cd_preco_litro_comb_carga),
    CONSTRAINT fk_preco_litro_comb_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_comb_total_litro_carga (
    cd_comb_total_litro_carga INT NOT NULL AUTO_INCREMENT,
    qtd_comb_total_litro_carga DOUBLE,
    cd_proposta INT,
    CONSTRAINT pk_comb_total_litro_carga PRIMARY KEY (cd_comb_total_litro_carga),
    CONSTRAINT fk_comb_total_litro_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_valor_total_comb_carga (
    cd_valor_total_comb_carga INT NOT NULL AUTO_INCREMENT,
    vl_valor_total_comb_carga DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_valor_total_comb_carga PRIMARY KEY (cd_valor_total_comb_carga),
    CONSTRAINT fk_valor_total_comb_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_valor_total_pedagio_carga (
    cd_valor_total_pedagio_carga INT NOT NULL AUTO_INCREMENT,
    vl_valor_total_pedagio_carga DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_valor_total_pedagio_carga PRIMARY KEY (cd_valor_total_pedagio_carga),
    CONSTRAINT fk_valor_total_pedagio_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_despesa_total_viagem_carga (
    cd_despesa_total_viagem_carga INT NOT NULL AUTO_INCREMENT,
    vl_despesa_total_viagem_carga DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_despesa_total_viagem_carga PRIMARY KEY (cd_despesa_total_viagem_carga),
    CONSTRAINT fk_despesa_total_viagem_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_valor_carga_usd_eur_carga (
    cd_valor_carga_usd_eur_carga INT NOT NULL AUTO_INCREMENT,
    vl_valor_carga_usd_eur_carga DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_valor_carga_usd_eur_carga PRIMARY KEY (cd_valor_carga_usd_eur_carga),
    CONSTRAINT fk_valor_carga_usd_eur_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_tipo_moeda_carga (
    cd_tipo_moeda_carga INT NOT NULL AUTO_INCREMENT,
    nm_tipo_moeda_carga VARCHAR(100),
    cd_proposta INT,
    CONSTRAINT pk_tipo_moeda_carga PRIMARY KEY (cd_tipo_moeda_carga),
    CONSTRAINT fk_tipo_moeda_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_cotacao_carga (
    cd_cotacao_carga INT NOT NULL AUTO_INCREMENT,
    vl_cotacao_carga DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_cotacao_carga PRIMARY KEY (cd_cotacao_carga),
    CONSTRAINT fk_cotacao_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_valor_carga_brl_carga (
    cd_valor_carga_brl_carga INT NOT NULL AUTO_INCREMENT,
    vl_valor_carga_brl_carga DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_valor_carga_brl_carga PRIMARY KEY (cd_valor_carga_brl_carga),
    CONSTRAINT fk_valor_carga_brl_carga_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);


/*MOTORISTA*/

CREATE TABLE IF NOT EXISTS tb_valores_motorista (
    cd_valores_motorista INT NOT NULL AUTO_INCREMENT,
    vl_valores_mototrista DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_valores_motorista PRIMARY KEY (cd_valores_motorista),
    CONSTRAINT fk_valores_motorista_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_frete_conf_antt_motorista (
    cd_frete_conf_antt_motorista INT NOT NULL AUTO_INCREMENT,
    vl_frete_conf_antt_motorista DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_frete_conf_antt_motorista PRIMARY KEY (cd_frete_conf_antt_motorista),
    CONSTRAINT fk_frete_conf_antt_motorista_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_vale_pedagio_tab_motorista (
    cd_vale_pedagio_tab_motorista INT NOT NULL AUTO_INCREMENT,
    vl_vale_pedagio_tab_motorista DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_vale_pedagio_tab_motorista PRIMARY KEY (cd_vale_pedagio_tab_motorista),
    CONSTRAINT fk_vale_pedagio_tab_motorista_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_total_aut_motorista (
    cd_total_aut_motorista INT NOT NULL AUTO_INCREMENT,
    vl_total_aut_motorista DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_total_aut_motorista PRIMARY KEY (cd_total_aut_motorista),
    CONSTRAINT fk_total_aut_motorista_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_lucro_total_aut_tab_motorista (
    cd_lucro_total_aut_tab_motorista INT NOT NULL AUTO_INCREMENT,
    vl_lucro_total_aut_tab_motorista DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_lucro_total_aut_tab_motorista PRIMARY KEY (cd_lucro_total_aut_tab_motorista),
    CONSTRAINT fk_lucro_total_aut_tab_motorista_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_frete_all_in_fechado_motorista (
    cd_frete_all_in_fechado_motorista INT NOT NULL AUTO_INCREMENT,
    vl_frete_all_in_fechado_motorista DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_frete_all_in_fechado_motorista PRIMARY KEY (cd_frete_all_in_fechado_motorista),
    CONSTRAINT fk_frete_all_in_fechado_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_lucro_frete_all_in_fechado_motorista (
    cd_lucro_frete_all_in_fechado_motorista INT NOT NULL AUTO_INCREMENT,
    vl_lucro_frete_all_in_fechado_motorista DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_lucro_frete_all_in_fechado_motorista PRIMARY KEY (cd_lucro_frete_all_in_fechado_motorista),
    CONSTRAINT fk_lucro_frete_all_in_fechado_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_tentar_fechar_motorista (
    cd_tentar_fechar_motorista INT NOT NULL AUTO_INCREMENT,
    vl_tentar_fechar_motorista DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_tentar_fechar_motorista PRIMARY KEY (cd_tentar_fechar_motorista),
    CONSTRAINT fk_tentar_fechar_motorista_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_lucro_tentar_fechar_motorista (
    cd_lucro_tentar_fechar_motorista INT NOT NULL AUTO_INCREMENT,
    vl_lucro_tentar_fechar_motorista DECIMAL(20 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_lucro_tentar_fechar_motorista PRIMARY KEY (cd_lucro_tentar_fechar_motorista),
    CONSTRAINT fk_lucro_tentar_fechar_motorista_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

/*COTAÇÃO AUT*/

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

/*TABELAS DE CONSULTA*/

create table if not exists tb_consulta_porc_icms (
cd_consulta_porc_icms int not null auto_increment,
nm_consulta_porc_icms varchar(10),
vl_consulta_porc_icms double,
    CONSTRAINT pk_consulta_porc_icms PRIMARY KEY (cd_consulta_porc_icms)
);
