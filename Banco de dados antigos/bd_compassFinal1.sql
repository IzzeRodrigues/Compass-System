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
    nm_privilegio VARCHAR(50),
    cd_usuario INT,
    CONSTRAINT pk_privilegio PRIMARY KEY (cd_privilegio),
    CONSTRAINT fk_privilegio_usuario FOREIGN KEY (cd_usuario)
        REFERENCES tb_usuario (cd_usuario)
);

CREATE TABLE IF NOT EXISTS tb_cliente (
    cd_cliente INT NOT NULL AUTO_INCREMENT,
    nm_empresa_cliente VARCHAR(100),
    nm_referencia_cliente VARCHAR(100),
    CONSTRAINT pk_cliente PRIMARY KEY (cd_cliente)
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
    CONSTRAINT pk_email_responsavel_cliente PRIMARY KEY (cd_email_responsavel_cliente)
);

CREATE TABLE IF NOT EXISTS tb_produto (
    cd_produto INT NOT NULL AUTO_INCREMENT,
    nm_produto VARCHAR(100),
    qt_produto INT,
    ds_produto VARCHAR(500),
    qt_cubagem_produto DOUBLE,
    qt_peso_produto DOUBLE,
    CONSTRAINT pk_produto PRIMARY KEY (cd_produto)
);

CREATE TABLE IF NOT EXISTS tb_tipo_frete (
    cd_tipo_frete INT NOT NULL AUTO_INCREMENT,
    nm_tipo_frete VARCHAR(100),
    CONSTRAINT pk_tipo_frete PRIMARY KEY (cd_tipo_frete)
);

CREATE TABLE IF NOT EXISTS tb_uf_origem (
    cd_uf_origem INT NOT NULL AUTO_INCREMENT,
    sg_uf_origem CHAR(2),
    CONSTRAINT pk_uf_origem PRIMARY KEY (cd_uf_origem)
);

CREATE TABLE IF NOT EXISTS tb_cidade_origem (
    cd_cidade_origem INT NOT NULL AUTO_INCREMENT,
    nm_cidade_origem VARCHAR(100),
    ds_cidade_origem VARCHAR(500),
    CONSTRAINT pk_cidade_origem PRIMARY KEY (cd_cidade_origem)
);

CREATE TABLE IF NOT EXISTS tb_uf_destino (
    cd_uf_destino INT NOT NULL AUTO_INCREMENT,
    sg_uf_destino CHAR(2),
    CONSTRAINT pk_uf_destino PRIMARY KEY (cd_uf_destino)
);

CREATE TABLE IF NOT EXISTS tb_cidade_destino (
    cd_cidade_destino INT NOT NULL AUTO_INCREMENT,
    nm_cidade_destino VARCHAR(100),
    ds_cidade_destino VARCHAR(500),
    CONSTRAINT pk_cidade_destino PRIMARY KEY (cd_cidade_destino)
);

CREATE TABLE IF NOT EXISTS tb_local_devolucao_container (
    cd_local_devolucao_container INT NOT NULL AUTO_INCREMENT,
    nm_local_devolucao_container VARCHAR(100),
    CONSTRAINT pk_local_devolucao_container PRIMARY KEY (cd_local_devolucao_container)
);

CREATE TABLE IF NOT EXISTS tb_container (
    cd_container INT NOT NULL AUTO_INCREMENT,
    nm_container VARCHAR(100),
    qt_tara_container INT,
    qt_peso_min_container DECIMAL(8 , 2 ),
    qt_peso_max_container DECIMAL(8 , 2 ),
    qt_cub_container DECIMAL(6 , 2 ),
    qt_pallet_container INT,
    CONSTRAINT pk_container PRIMARY KEY (cd_container)
);

CREATE TABLE IF NOT EXISTS tb_veiculo (
    cd_veiculo INT NOT NULL AUTO_INCREMENT,
    nm_veiculo VARCHAR(100),
    qt_eixos_veiculo INT,
    CONSTRAINT pk_veiculo PRIMARY KEY (cd_veiculo)
);

/* OPERAÇÃO */

CREATE TABLE IF NOT EXISTS tb_tipo_operacao (
    cd_tipo_operacao INT NOT NULL AUTO_INCREMENT,
    nm_tipo_operacao VARCHAR(100),
    CONSTRAINT pk_tipo_operacao PRIMARY KEY (cd_tipo_operacao)
);

CREATE TABLE IF NOT EXISTS tb_cat_imposto_operacao (
    cd_cat_imposto_operacao INT NOT NULL AUTO_INCREMENT,
    nm_cat_imposto_operacao VARCHAR(100),
    CONSTRAINT pk_cat_imposto_operacao PRIMARY KEY (cd_cat_imposto_operacao)
);

CREATE TABLE IF NOT EXISTS tb_valor_merc_operacao (
    cd_valor_merc_operacao INT NOT NULL AUTO_INCREMENT,
    vl_valor_merc_operacao DECIMAL(10 , 2 ),
    CONSTRAINT pk_valor_merc_operacao PRIMARY KEY (cd_valor_merc_operacao)
);
 
CREATE TABLE IF NOT EXISTS tb_valor_container_operacao (
    cd_valor_container_operacao INT NOT NULL AUTO_INCREMENT,
    vl_container_operacao DECIMAL(20 , 2 ),
    CONSTRAINT pk_valor_container_operacao PRIMARY KEY (cd_valor_container_operacao)
);
 
CREATE TABLE IF NOT EXISTS tb_frete_peso_operacao (
    cd_frete_peso_operacao INT NOT NULL AUTO_INCREMENT,
    vl_frete_peso_operacao DECIMAL(10 , 2 ),
    CONSTRAINT pk_frete_peso_operacao PRIMARY KEY (cd_frete_peso_operacao)
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
    CONSTRAINT pk_imp_operacao PRIMARY KEY (cd_imp_operacao)
);
 
CREATE TABLE IF NOT EXISTS tb_tot_imp_seg_operacao (
    cd_tot_imp_seg_operacao INT NOT NULL AUTO_INCREMENT,
    vl_tot_imp_seg_operacao DECIMAL(10 , 2 ),
    CONSTRAINT pk_tot_imp_seg_operacao PRIMARY KEY (cd_tot_imp_seg_operacao)
);

CREATE TABLE IF NOT EXISTS tb_class_imo (
    cd_class_imo INT NOT NULL AUTO_INCREMENT,
    id_class_imo INT,
    CONSTRAINT pk_class_imo PRIMARY KEY (cd_class_imo)
);

CREATE TABLE IF NOT EXISTS tb_desp_operacao (
    cd_desp_operacao INT NOT NULL AUTO_INCREMENT,
    vl_pedagio_desp_operacao DECIMAL(10 , 2 ),
    vl_estacionamento_desp_operacao DECIMAL(10 , 2 ),
    vl_dta_desp_operacao DECIMAL(10 , 2 ),
    vl_ajudantes_desp_operacao DECIMAL(10 , 2 ),
    vl_total_desp_operacao DECIMAL(10 , 2 ),
    CONSTRAINT pk_desp_operacao PRIMARY KEY (cd_desp_operacao)
);

CREATE TABLE IF NOT EXISTS tb_valor_icms_operacao (
    cd_valor_icms_operacao INT NOT NULL AUTO_INCREMENT,
    nm_rota_icms_operacao VARCHAR(10),
    vl_valor_icms_operacao DECIMAL(10 , 2 ),
    pc_icms_operacao DECIMAL(5 , 2 ),
    CONSTRAINT pk_valor_icms_operacao PRIMARY KEY (cd_valor_icms_operacao)
);

CREATE TABLE IF NOT EXISTS tb_subtotal_operacao (
    cd_sub_total_operacao INT NOT NULL AUTO_INCREMENT,
    vl_sub_total_operacao DECIMAL(10 , 2 ),
    CONSTRAINT pk_sub_total_operacao PRIMARY KEY (cd_sub_total_operacao)
);

CREATE TABLE IF NOT EXISTS tb_total_prest_operacao (
    cd_total_prest_operacao INT NOT NULL AUTO_INCREMENT,
    vl_total_prest_operacao DECIMAL(20 , 2 ),
    pc_total_prest_operacao DECIMAL(5 , 2 ),
    CONSTRAINT pk_total_prest_operacao PRIMARY KEY (cd_total_prest_operacao)
);

CREATE TABLE IF NOT EXISTS tb_lucro_bruto_operacao (
    cd_lucro_bruto_operacao INT NOT NULL AUTO_INCREMENT,
    vl_lucro_bruto_operacao DECIMAL(10 , 2 ),
    pc_lucro_bruto_operacao DECIMAL(5 , 2 ),
    CONSTRAINT pk_lucro_bruto_operacao PRIMARY KEY (cd_lucro_bruto_operacao)
);

CREATE TABLE IF NOT EXISTS tb_margem_operacao (
    cd_margem_operacao INT NOT NULL AUTO_INCREMENT,
    vl_margem_operacao DECIMAL(10 , 2 ),
    CONSTRAINT pk_margem_operacao PRIMARY KEY (cd_margem_operacao)
);

/* DESPESAS */

CREATE TABLE IF NOT EXISTS tb_mot_despesa (
    cd_mot_despesa INT NOT NULL AUTO_INCREMENT,
    vl_mot_autonomo_despesa DECIMAL(10 , 2 ),
    vl_pedagio_mot_despesa DECIMAL(10 , 2 ),
    vl_buonny_mot_despesa DECIMAL(10 , 2 ),
    vl_gris_mot_despesa DECIMAL(10 , 2 ),
    vl_dta_di_terc_mot_despesa DECIMAL(10 , 2 ),
    vl_estacionamento_mot_despesa DECIMAL(10 , 2 ),
    vl_ajudante_mot_despesa DECIMAL(10 , 2 ),
    vl_profit_mot_despesa DECIMAL(10 , 2 ),
    pc_comissao_mot_despesa DECIMAL(5 , 2 ),
    vl_comissao_mot_despesa DECIMAL(10 , 2 ),
    CONSTRAINT pk_mot_despesa PRIMARY KEY (cd_mot_despesa)
);
 
CREATE TABLE IF NOT EXISTS tb_imp_despesa (
    cd_imp_despesa INT NOT NULL AUTO_INCREMENT,
    pc_rcfdc_imp_despesa DECIMAL(5 , 2 ),
    vl_rcfdc_imp_despesa DECIMAL(10 , 2 ),
    pc_rctrc_imp_despesa DECIMAL(5 , 2 ),
    vl_rctrc_imp_despesa DECIMAL(10 , 2 ),
    pc_simples_nac_imp_despesa DECIMAL(5 , 2 ),
    vl_simples_nac_imp_despesa DECIMAL(10 , 2 ),
    pc_irpj_imp_despesa DECIMAL(5 , 2 ),
    vl_irpj_imp_despesa DECIMAL(10 , 2 ),
    pc_adic_irpj_imp_despesa DECIMAL(5 , 2 ),
    vl_adic_irpj_imp_despesa DECIMAL(10 , 2 ),
    pc_pis_imp_despesa DECIMAL(5 , 2 ),
    vl_pis_imp_despesa DECIMAL(10 , 2 ),
    pc_cofins_imp_despesa DECIMAL(5 , 2 ),
    vl_cofins_imp_despesa DECIMAL(10 , 2 ),
    CONSTRAINT pk_imp_despesa PRIMARY KEY (cd_imp_despesa)
);

CREATE TABLE IF NOT EXISTS tb_icms_despesa (
    cd_icms_despesa INT NOT NULL AUTO_INCREMENT,
    nm_rota_icms_despesa VARCHAR(10),
    vl_icms_despesa DECIMAL(10 , 2 ),
    pc_icms_despesa DECIMAL(5 , 2 ),
    CONSTRAINT pk_icms_despesa PRIMARY KEY (cd_icms_despesa)
);

CREATE TABLE IF NOT EXISTS tb_total_despesa (
    cd_total_despesa INT NOT NULL AUTO_INCREMENT,
    vl_total_despesa DECIMAL(10 , 2 ),
    CONSTRAINT pk_total_despesa PRIMARY KEY (cd_total_despesa)
);

/* CARGA */

CREATE TABLE IF NOT EXISTS tb_tipo_carga (
    cd_tipo_carga INT NOT NULL AUTO_INCREMENT,
    nm_tipo_carga VARCHAR(100),
    CONSTRAINT pk_tipo_carga PRIMARY KEY (cd_tipo_carga)
);

CREATE TABLE IF NOT EXISTS tb_eixos_carga (
    cd_eixos_carga INT NOT NULL AUTO_INCREMENT,
    qtd_eixos_carga INT,
    CONSTRAINT pk_eixos_carga PRIMARY KEY (cd_eixos_carga)
);

CREATE TABLE IF NOT EXISTS tb_km_ida_carga (
    cd_km_ida_carga INT NOT NULL AUTO_INCREMENT,
    qtd_km_ida_carga DECIMAL(6 , 2 ),
    CONSTRAINT pk_km_ida_carga PRIMARY KEY (cd_km_ida_carga)
);

CREATE TABLE IF NOT EXISTS tb_km_volta_carga (
    cd_km_volta_carga INT NOT NULL AUTO_INCREMENT,
    qtd_km_volta_carga DECIMAL(6 , 2 ),
    CONSTRAINT pk_km_volta_carga PRIMARY KEY (cd_km_volta_carga)
);

CREATE TABLE IF NOT EXISTS tb_total_km_carga (
    cd_total_km_carga INT NOT NULL AUTO_INCREMENT,
    vl_total_km_carga DECIMAL(6 , 2 ),
    CONSTRAINT pk_total_km_carga PRIMARY KEY (cd_total_km_carga)
);

CREATE TABLE IF NOT EXISTS tb_pedagio_ida_eixo_carga (
    cd_pedagio_ida_eixo_carga INT NOT NULL AUTO_INCREMENT,
    vl_pedagio_ida_eixo_carga DECIMAL(10 , 2 ),
    CONSTRAINT pk_pedagio_ida_eixo_carga PRIMARY KEY (cd_pedagio_ida_eixo_carga)
);

CREATE TABLE IF NOT EXISTS tb_pedagio_volta_eixo_carga (
    cd_pedagio_volta_eixo_carga INT NOT NULL AUTO_INCREMENT,
    vl_pedagio_volta_eixo_carga DECIMAL(10 , 2 ),
    CONSTRAINT pk_pedagio_volta_eixo_carga PRIMARY KEY (cd_pedagio_volta_eixo_carga)
);

CREATE TABLE IF NOT EXISTS tb_consumo_medio_km_litro_carga (
    cd_consumo_medio_km_litro_carga INT NOT NULL AUTO_INCREMENT,
    qtd_consumo_medio_km_litro_carga DECIMAL(5 , 2 ),
    CONSTRAINT pk_consumo_medio_km_litro_carga PRIMARY KEY (cd_consumo_medio_km_litro_carga)
);

CREATE TABLE IF NOT EXISTS tb_preco_litro_comb_carga (
    cd_preco_litro_comb_carga INT NOT NULL AUTO_INCREMENT,
    vl_preco_litro_comb_carga DECIMAL(5 , 2 ),
    CONSTRAINT pk_preco_litro_comb_carga PRIMARY KEY (cd_preco_litro_comb_carga)
);

CREATE TABLE IF NOT EXISTS tb_comb_total_litro_carga (
    cd_comb_total_litro_carga INT NOT NULL AUTO_INCREMENT,
    qtd_comb_total_litro_carga DECIMAL(6 , 2 ),
    CONSTRAINT pk_comb_total_litro_carga PRIMARY KEY (cd_comb_total_litro_carga)
);

CREATE TABLE IF NOT EXISTS tb_valor_total_comb_carga (
    cd_valor_total_comb_carga INT NOT NULL AUTO_INCREMENT,
    vl_total_comb_carga DECIMAL(10 , 2 ),
    CONSTRAINT pk_valor_total_comb_carga PRIMARY KEY (cd_valor_total_comb_carga)
);

CREATE TABLE IF NOT EXISTS tb_valor_total_pedagio_carga (
    cd_valor_total_pedagio_carga INT NOT NULL AUTO_INCREMENT,
    vl_valor_total_pedagio_carga DECIMAL(10 , 2 ),
    CONSTRAINT pk_valor_total_pedagio_carga PRIMARY KEY (cd_valor_total_pedagio_carga)
);

CREATE TABLE IF NOT EXISTS tb_despesa_total_viagem_carga (
    cd_despesa_total_viagem_carga INT NOT NULL AUTO_INCREMENT,
    vl_despesa_total_viagem_carga DECIMAL(10 , 2 ),
    CONSTRAINT pk_despesa_total_viagem_carga PRIMARY KEY (cd_despesa_total_viagem_carga)
);

CREATE TABLE IF NOT EXISTS tb_valor_carga_usd_eur_carga (
    cd_valor_carga_usd_eur_carga INT NOT NULL AUTO_INCREMENT,
    vl_carga_usd_eur_carga DECIMAL(10 , 2 ),
    CONSTRAINT pk_valor_carga_usd_eur_carga PRIMARY KEY (cd_valor_carga_usd_eur_carga)
);

CREATE TABLE IF NOT EXISTS tb_tipo_moeda_carga (
    cd_tipo_moeda_carga INT NOT NULL AUTO_INCREMENT,
    nm_tipo_moeda_carga VARCHAR(100),
    CONSTRAINT pk_tipo_moeda_carga PRIMARY KEY (cd_tipo_moeda_carga)
);

CREATE TABLE IF NOT EXISTS tb_cotacao_carga (
    cd_cotacao_carga INT NOT NULL AUTO_INCREMENT,
    vl_cotacao_carga DECIMAL(10 , 2 ),
    CONSTRAINT pk_cotacao_carga PRIMARY KEY (cd_cotacao_carga)
);

CREATE TABLE IF NOT EXISTS tb_valor_carga_brl_carga (
    cd_valor_carga_brl_carga INT NOT NULL AUTO_INCREMENT,
    vl_valor_carga_brl_carga DECIMAL(10 , 2 ),
    CONSTRAINT pk_valor_carga_brl_carga PRIMARY KEY (cd_valor_carga_brl_carga)
);

CREATE TABLE IF NOT EXISTS tb_frete_peso (
    cd_frete_peso INT NOT NULL AUTO_INCREMENT,
    vl_frete_peso DECIMAL(10 , 2 ),
    pc_frete_peso DECIMAL(5 , 2 ),
    CONSTRAINT pk_frete_peso PRIMARY KEY (cd_frete_peso)
);
 
/*MOTORISTA*/

CREATE TABLE IF NOT EXISTS tb_valores_motorista (
    cd_valores_motorista INT NOT NULL AUTO_INCREMENT,
    vl_valores_mototrista DECIMAL(10 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_valores_motorista PRIMARY KEY (cd_valores_motorista),
    CONSTRAINT fk_valores_motorista_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_frete_conf_antt_motorista (
    cd_frete_conf_antt_motorista INT NOT NULL AUTO_INCREMENT,
    vl_frete_conf_antt_motorista DECIMAL(10 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_frete_conf_antt_motorista PRIMARY KEY (cd_frete_conf_antt_motorista),
    CONSTRAINT fk_frete_conf_antt_motorista_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_vale_pedagio_tab_motorista (
    cd_vale_pedagio_tab_motorista INT NOT NULL AUTO_INCREMENT,
    vl_vale_pedagio_tab_motorista DECIMAL(10 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_vale_pedagio_tab_motorista PRIMARY KEY (cd_vale_pedagio_tab_motorista),
    CONSTRAINT fk_vale_pedagio_tab_motorista_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_total_aut_motorista (
    cd_total_aut_motorista INT NOT NULL AUTO_INCREMENT,
    vl_total_aut_motorista DECIMAL(10 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_total_aut_motorista PRIMARY KEY (cd_total_aut_motorista),
    CONSTRAINT fk_total_aut_motorista_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_lucro_total_aut_tab_motorista (
    cd_lucro_total_aut_tab_motorista INT NOT NULL AUTO_INCREMENT,
    vl_lucro_total_aut_tab_motorista DECIMAL(10 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_lucro_total_aut_tab_motorista PRIMARY KEY (cd_lucro_total_aut_tab_motorista),
    CONSTRAINT fk_lucro_total_aut_tab_motorista_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_frete_all_in_fechado_motorista (
    cd_frete_all_in_fechado_motorista INT NOT NULL AUTO_INCREMENT,
    vl_frete_all_in_fechado_motorista DECIMAL(10 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_frete_all_in_fechado_motorista PRIMARY KEY (cd_frete_all_in_fechado_motorista),
    CONSTRAINT fk_frete_all_in_fechado_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_lucro_frete_all_in_fechado_motorista (
    cd_lucro_frete_all_in_fechado_motorista INT NOT NULL AUTO_INCREMENT,
    vl_lucro_frete_all_in_fechado_motorista DECIMAL(10 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_lucro_frete_all_in_fechado_motorista PRIMARY KEY (cd_lucro_frete_all_in_fechado_motorista),
    CONSTRAINT fk_lucro_frete_all_in_fechado_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_tentar_fechar_motorista (
    cd_tentar_fechar_motorista INT NOT NULL AUTO_INCREMENT,
    vl_tentar_fechar_motorista DECIMAL(10 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_tentar_fechar_motorista PRIMARY KEY (cd_tentar_fechar_motorista),
    CONSTRAINT fk_tentar_fechar_motorista_proposta FOREIGN KEY (cd_proposta)
        REFERENCES tb_proposta (cd_proposta)
);

CREATE TABLE IF NOT EXISTS tb_lucro_tentar_fechar_motorista (
    cd_lucro_tentar_fechar_motorista INT NOT NULL AUTO_INCREMENT,
    vl_lucro_tentar_fechar_motorista DECIMAL(10 , 2 ),
    cd_proposta INT,
    CONSTRAINT pk_lucro_tentar_fechar_motorista PRIMARY KEY (cd_lucro_tentar_fechar_motorista),
    CONSTRAINT fk_lucro_tentar_fechar_motorista_proposta FOREIGN KEY (cd_proposta)
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

/* ADICIONAIS SE NECESSÁRIO*/

CREATE TABLE IF NOT EXISTS tb_isca (
    cd_isca INT NOT NULL AUTO_INCREMENT,
    id_isca CHAR(3),
    vl_isca DECIMAL(10 , 2 ),
    id_monitoramento_isca VARCHAR(3),
    CONSTRAINT pk_isca PRIMARY KEY (cd_isca)
);
    
CREATE TABLE IF NOT EXISTS tb_escolta_armada (
    cd_escolta_armada INT NOT NULL AUTO_INCREMENT,
    id_escolta_armada CHAR(3),
    vl_escolta_armada DECIMAL(10 , 2 ),
    CONSTRAINT pk_escolta_armada PRIMARY KEY (cd_escolta_armada)
);
 
CREATE TABLE IF NOT EXISTS tb_adic_imo (
    cd_adic_imo INT NOT NULL AUTO_INCREMENT,
    id_adic_imo CHAR(3),
    vl_adic_imo DECIMAL(10 , 2 ),
    CONSTRAINT pk_adic_imo PRIMARY KEY (cd_adic_imo)
);
 
CREATE TABLE IF NOT EXISTS tb_carregamento_exp (
    cd_carregamento_exp INT NOT NULL AUTO_INCREMENT,
    id_carregamento_exp CHAR(3),
    vl_carregamento_exp DECIMAL(10 , 2 ),
    CONSTRAINT pk_carregamento_exp PRIMARY KEY (cd_carregamento_exp)
); 
 
CREATE TABLE IF NOT EXISTS tb_cavalo_ls (
    cd_cavalo_ls INT NOT NULL AUTO_INCREMENT,
    id_cavalo_ls CHAR(3),
    vl_cavalo_ls DECIMAL(10 , 2 ),
    CONSTRAINT pk_cavalo_ls PRIMARY KEY (cd_cavalo_ls)
);
 
CREATE TABLE IF NOT EXISTS tb_estadia_esp (
    cd_estadia_esp INT NOT NULL AUTO_INCREMENT,
    id_estadia_esp CHAR(3),
    vl_estadia_esp DECIMAL(10 , 2 ),
    CONSTRAINT pk_estadia_esp PRIMARY KEY (cd_estadia_esp)
);

CREATE TABLE IF NOT EXISTS tb_sobrestadia_carreg (
    cd_sobrestadia_carreg INT NOT NULL AUTO_INCREMENT,
    id_sobrestadia_carreg CHAR(3),
    CONSTRAINT pk_sobrestadia_carreg PRIMARY KEY (cd_sobrestadia_carreg)
);

/* PROPOSTA */

CREATE TABLE IF NOT EXISTS tb_proposta (
    cd_proposta INT NOT NULL AUTO_INCREMENT,
    dt_proposta DATE,
    nm_referencia_acl VARCHAR(100),
    dt_horario_recebimento DATETIME,
    ds_metodo_transporte VARCHAR(500),
    cd_usuario INT,
    cd_cliente INT,
    cd_produto INT,
    cd_tipo_frete INT,
    cd_uf_origem INT,
    cd_uf_destino INT,
    cd_cidade_origem INT,
    cidade_destino INT,
    cd_container INT,
    cd_veiculo INT,
    cd_tipo_operacao INT,
    cd_cat_imposto_operacao INT,
    cd_valor_merc_operacao INT,
    cd_valor_container_operacao INT,
    cd_frete_peso_operacao INT,
    cd_imp_operacao INT,
    cd_total_imp_operacao INT,
    cd_class_imo INT,
    cd_desp_operacao INT,
    cd_valor_icms_operacao INT,
    cd_subtotal_operacao INT,
    cd_total_prest_operacao INT,
    cd_lucro_bruto_operacao INT,
    cd_margem_operacao INT,
    cd_mot_despesa INT,
    cd_imp_despesa INT,
    cd_icms_despesa INT,
    cd_total_despesa INT,
    cd_tipo_carga INT,
    cd_eixos_carga INT,
    cd_km_ida_carga INT,
    cd_km_volta_carga INT,
    cd_total_km_carga INT,
    cd_pedagio_ida_eixo_carga INT,
    cd_pedagio_volta_eixo_carga INT,
    cd_consumo_medio_km_litro_carga INT,
    cd_preco_litro_comb_carga INT,
    cd_comb_total_litro_carga INT,
    cd_valor_total_comb_carga INT,
    cd_valor_total_pedagio_carga INT,
    cd_despesa_total_viagem_carga INT,
    cd_valor_carga_usd_eur_carga INT,
    cd_tipo_moeda_carga INT,
    cd_cotacao_carga INT,
    cd_valor_carga_brl_carga INT,
    cd_frete_peso INT,
    cd_isca INT,
    cd_escolta_armada INT,
    cd_adic_imo INT,
    cd_carregamento_exp INT,
    cd_cavalo_ls INT,
    cd_estadia_esp INT,
    cd_sobrestadia_carreg INT,
    CONSTRAINT pk_proposta PRIMARY KEY (cd_proposta),
    CONSTRAINT fk_proposta_usuario FOREIGN KEY (cd_usuario)
        REFERENCES tb_usuario (cd_usuario),
    CONSTRAINT fk_proposta_cliente FOREIGN KEY (cd_cliente)
        REFERENCES tb_cliente (cd_cliente),
    CONSTRAINT fk_proposta_produto FOREIGN KEY (cd_produto)
        REFERENCES tb_produto (cd_produto),
    CONSTRAINT fk_proposta_tipo_frete FOREIGN KEY (cd_tipo_frete)
        REFERENCES tb_tipo_frete (cd_tipo_frete),
    CONSTRAINT fk_proposta_uf_origem FOREIGN KEY (cd_uf_origem)
        REFERENCES tb_uf_origem (cd_uf_origem),
    CONSTRAINT fk_proposta_uf_destino FOREIGN KEY (cd_uf_destino)
        REFERENCES tb_uf_destino (cd_uf_destino),
    CONSTRAINT fk_proposta_cidade_origem FOREIGN KEY (cd_cidade_origem)
        REFERENCES tb_cidade_origem (cd_cidade_origem),
    CONSTRAINT fk_proposta_cidade_destino FOREIGN KEY (cd_cidade_destino)
        REFERENCES tb_cidade_destino (cd_cidade_destino),
    CONSTRAINT fk_proposta_container FOREIGN KEY (cd_container)
        REFERENCES tb_container (cd_container),
    CONSTRAINT fk_proposta_veiculo FOREIGN KEY (cd_veiculo)
        REFERENCES tb_veiculo (cd_veiculo),
    CONSTRAINT fk_proposta_tipo_operacao FOREIGN KEY (cd_tipo_operacao)
        REFERENCES tb_tipo_operacao (cd_tipo_operacao),
    CONSTRAINT fk_proposta_cat_imposto_operacao FOREIGN KEY (cd_cat_imposto_operacao)
        REFERENCES tb_cat_imposto_operacao (cd_cat_imposto_operacao),
    CONSTRAINT fk_proposta_valor_merc_operacao FOREIGN KEY (cd_valor_merc_operacao)
        REFERENCES tb_valor_merc_operacao (cd_valor_merc_operacao),
    CONSTRAINT fk_proposta_valor_container_operacao FOREIGN KEY (cd_valor_container_operacao)
        REFERENCES tb_valor_container_operacao (cd_valor_container_operacao),
    CONSTRAINT fk_proposta_frete_peso_operacao FOREIGN KEY (cd_frete_peso_operacao)
        REFERENCES tb_frete_peso_operacao (cd_frete_peso_operacao),
    CONSTRAINT fk_proposta_imp_operacao FOREIGN KEY (cd_imp_operacao)
        REFERENCES tb_imp_operacao (cd_imp_operacao),
    CONSTRAINT fk_proposta_total_imp_operacao FOREIGN KEY (cd_total_imp_operacao)
        REFERENCES tb_total_imp_operacao (cd_total_imp_operacao),
    CONSTRAINT fk_proposta_class_imo FOREIGN KEY (cd_class_imo)
        REFERENCES tb_class_imo (cd_class_imo),
    CONSTRAINT fk_proposta_desp_operacao FOREIGN KEY (cd_desp_operacao)
        REFERENCES tb_desp_operacao (cd_desp_operacao),
    CONSTRAINT fk_proposta_valor_icms_operacao FOREIGN KEY (cd_valor_icms_operacao)
        REFERENCES tb_valor_icms_operacao (cd_valor_icms_operacao),
    CONSTRAINT fk_proposta_subtotal_operacao FOREIGN KEY (cd_subtotal_operacao)
        REFERENCES tb_subtotal_operacao (cd_subtotal_operacao),
    CONSTRAINT fk_proposta_total_prest_operacao FOREIGN KEY (cd_total_prest_operacao)
        REFERENCES tb_total_prest_operacao (cd_total_prest_operacao),
    CONSTRAINT fk_proposta_lucro_bruto_operacao FOREIGN KEY (cd_lucro_bruto_operacao)
        REFERENCES tb_lucro_bruto_operacao (cd_lucro_bruto_operacao),
    CONSTRAINT fk_proposta_margem_operacao FOREIGN KEY (cd_margem_operacao)
        REFERENCES tb_margem_operacao (cd_margem_operacao),
    CONSTRAINT fk_proposta_mot_despesa FOREIGN KEY (cd_mot_despesa)
        REFERENCES tb_mot_despesa (cd_mot_despesa),
    CONSTRAINT fk_proposta_imp_despesa FOREIGN KEY (cd_imp_despesa)
        REFERENCES tb_imp_despesa (cd_imp_despesa),
    CONSTRAINT fk_proposta_icms_despesa FOREIGN KEY (cd_icms_despesa)
        REFERENCES tb_icms_despesa (cd_icms_despesa),
    CONSTRAINT fk_proposta_total_despesa FOREIGN KEY (cd_total_despesa)
        REFERENCES tb_total_despesa (cd_total_despesa),
    CONSTRAINT fk_proposta_tipo_carga FOREIGN KEY (cd_tipo_carga)
        REFERENCES tb_tipo_carga (cd_tipo_carga),
    CONSTRAINT fk_proposta_eixos_carga FOREIGN KEY (cd_eixos_carga)
        REFERENCES tb_eixos_carga (cd_eixos_carga),
    CONSTRAINT fk_proposta_km_ida_carga FOREIGN KEY (cd_km_ida_carga)
        REFERENCES tb_km_ida_carga (cd_km_ida_carga),
    CONSTRAINT fk_proposta_km_ida_volta_carga FOREIGN KEY (cd_km_ida_volta_carga)
        REFERENCES tb_km_ida_volta_carga (cd_km_ida_volta_carga),
    CONSTRAINT fk_proposta_total_km_carga FOREIGN KEY (cd_total_km_carga)
        REFERENCES tb_total_km_carga (cd_total_km_carga),
    CONSTRAINT fk_proposta_pedagio_ida_eixo_carga FOREIGN KEY (cd_pedagio_ida_eixo_carga)
        REFERENCES tb_pedagio_ida_eixo_carga (cd_pedagio_ida_eixo_carga),
    CONSTRAINT fk_proposta_pedagio_volta_eixo_carga FOREIGN KEY (cd_pedagio_volta_eixo_carga)
        REFERENCES tb_pedagio_volta_eixo_carga (cd_pedagio_volta_eixo_carga),
    CONSTRAINT fk_proposta_consumo_medio_km_litro_carga FOREIGN KEY (cd_consumo_medio_km_litro_carga)
        REFERENCES tb_consumo_medio_km_litro_carga (cd_consumo_medio_km_litro_carga),
    CONSTRAINT fk_proposta_preco_litro_comb_despesa FOREIGN KEY (cd_preco_litro_comb_despesa)
        REFERENCES tb_preco_litro_comb_despesa (cd_preco_litro_comb_despesa),
    CONSTRAINT fk_proposta_comb_total_litro_carga FOREIGN KEY (cd_comb_total_litro_carga)
        REFERENCES tb_comb_total_litro_carga (cd_comb_total_litro_carga),
    CONSTRAINT fk_proposta_valor_total_comb_carga FOREIGN KEY (cd_valor_total_comb_carga)
        REFERENCES tb_valor_total_comb_carga (cd_valor_total_comb_carga),
    CONSTRAINT fk_proposta_valor_total_pedagio_carga FOREIGN KEY (cd_valor_total_pedagio_carga)
        REFERENCES tb_valor_total_pedagio_carga (cd_valor_total_pedagio_carga),
    CONSTRAINT fk_proposta_despesa_total_viagem_carga FOREIGN KEY (cd_despesa_total_viagem_carga)
        REFERENCES tb_despesa_total_viagem_carga (cd_despesa_total_viagem_carga),
    CONSTRAINT fk_proposta_valor_carga_usd_eur_carga FOREIGN KEY (cd_valor_carga_usd_eur_carga)
        REFERENCES tb_valor_carga_usd_eur_carga (cd_valor_carga_usd_eur_carga),
    CONSTRAINT fk_proposta_tipo_moeda_carga FOREIGN KEY (cd_tipo_moeda_carga)
        REFERENCES tb_tipo_moeda_carga (cd_tipo_moeda_carga),
    CONSTRAINT fk_proposta_cotacao_carga FOREIGN KEY (cd_cotacao_carga)
        REFERENCES tb_cotacao_carga (cd_cotacao_carga),
    CONSTRAINT fk_proposta_valor_carga_brl_carga FOREIGN KEY (cd_valor_carga_brl_carga)
        REFERENCES tb_valor_carga_brl_carga (cd_valor_carga_brl_carga),
    CONSTRAINT fk_proposta_frete_peso FOREIGN KEY (cd_frete_peso)
        REFERENCES tb_frete_peso (cd_frete_peso),
    CONSTRAINT fk_proposta_isca FOREIGN KEY (cd_isca)
        REFERENCES tb_isca (cd_isca),
    CONSTRAINT fk_proposta_escolta_armada FOREIGN KEY (cd_escolta_armada)
        REFERENCES tb_escolta_armada (cd_escolta_armada),
    CONSTRAINT fk_proposta_adic_imo FOREIGN KEY (cd_adic_imo)
        REFERENCES tb_adic_imo (cd_adic_imo),
    CONSTRAINT fk_proposta_carregamento_exp FOREIGN KEY (cd_carregamento_exp)
        REFERENCES tb_carregamento_exp (cd_carregamento_exp),
    CONSTRAINT fk_proposta_cavalo_ls FOREIGN KEY (cd_cavalo_ls)
        REFERENCES tb_cavalo_ls (cd_cavalo_ls),
    CONSTRAINT fk_proposta_estadia_esp FOREIGN KEY (cd_estadia_esp)
        REFERENCES tb_estadia_esp (cd_estadia_esp),
    CONSTRAINT fk_proposta_sobrestadia_carreg FOREIGN KEY (cd_sobrestadia_carreg)
        REFERENCES tb_sobrestadia_carreg (cd_sobrestadia_carreg)
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
    CONSTRAINT pk_tipos_proposta PRIMARY KEY (cd_tipo_proposta)
);

/* TABELAS DE CONSULTA*/

CREATE TABLE IF NOT EXISTS tb_consulta_porc_icms (
    cd_consulta_porc_icms INT NOT NULL AUTO_INCREMENT,
    nm_consulta_porc_icms VARCHAR(10),
    vl_consulta_porc_icms DOUBLE,
    CONSTRAINT pk_consulta_porc_icms PRIMARY KEY (cd_consulta_porc_icms)
);


CREATE TABLE IF NOT EXISTS tb_tipo_op (
    cd_tipo_op INT NOT NULL AUTO_INCREMENT,
    nm_tipo_op VARCHAR(50),
    CONSTRAINT pk_tipo_op PRIMARY KEY (cd_tipo_op)
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