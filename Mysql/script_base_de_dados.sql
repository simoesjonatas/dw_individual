create table if not exists QuestionarioEstudante
(
	ID_QuestionarioEstudante int auto_increment,
	QE_I01 varchar(1) null,
	QE_I02 varchar(1) null,
	QE_I03 varchar(1) null,
	QE_I04 varchar(1) null,
	QE_I05 varchar(1) null,
	QE_I06 varchar(1) null,
	QE_I07 varchar(1) null,
	QE_I08 varchar(1) null,
	QE_I09 varchar(1) null,
	QE_I10 varchar(1) null,
	QE_I11 varchar(1) null,
	QE_I12 varchar(1) null,
	QE_I13 varchar(1) null,
	QE_I14 varchar(1) null,
	QE_I15 varchar(1) null,
	QE_I16 int null,
	QE_I17 varchar(1) null,
	QE_I18 varchar(1) null,
	QE_I19 varchar(1) null,
	QE_I20 varchar(1) null,
	QE_I21 varchar(1) null,
	QE_I22 varchar(1) null,
	QE_I23 varchar(1) null,
	QE_I24 varchar(1) null,
	QE_I25 varchar(1) null,
	QE_I26 varchar(1) null,
	constraint ID_QuestionarioEstudante
		unique (ID_QuestionarioEstudante)
);

alter table QuestionarioEstudante
	add primary key (ID_QuestionarioEstudante);

create table if not exists QuestionarioProva
(
	ID_QuestionarioProva int auto_increment,
	RS_I1 varchar(1) null,
	RS_I2 varchar(1) null,
	RS_I3 varchar(1) null,
	RS_I4 varchar(1) null,
	RS_I5 varchar(1) null,
	RS_I6 varchar(1) null,
	RS_I7 varchar(1) null,
	RS_I8 varchar(1) null,
	RS_I9 varchar(1) null,
	constraint ID_QuestionarioProva
		unique (ID_QuestionarioProva)
);

alter table QuestionarioProva
	add primary key (ID_QuestionarioProva);

create table if not exists TBEstudante
(
	ID_Estudante int auto_increment,
	NR_Idade int null,
	DS_Sexo varchar(100) null,
	AnoConclusaoEnsinoMedio int null,
	AnoInicioGraduacao int null,
	DS_Turno varchar(100) null,
	B_InscricaoAdm tinyint(1) null,
	B_Concluinte tinyint(1) null,
	constraint ID_Estudante
		unique (ID_Estudante)
);

alter table TBEstudante
	add primary key (ID_Estudante);

create trigger TBEstudante_TR_ON_INSERT
	after insert
	on TBEstudante
	for each row
	BEGIN

    DECLARE IDSQNota INT;
    DECLARE IDSQGrauConcordanciaAluno INT;
    DECLARE IDSQQuestionarioEstudante INT;
    DECLARE IDSQQuestionarioProva INT;
    DECLARE IDSQInstituicao INT;
    DECLARE IDSQTipoPresenca INT;


    DECLARE ORGACAD INT;
    DECLARE CATEGAD INT;
    DECLARE GRUPO INT;
    DECLARE CURSO INT;
    DECLARE MODALIDADE INT;
    DECLARE PRES INT;
    DECLARE PR_GER INT;
    DECLARE PR_OB_FG INT;
    DECLARE PR_DI_FG INT;
    DECLARE PR_OB_CE INT;
    DECLARE PR_DI_CE INT;


    select
         -- tb instituicao
        CO_ORGACAD
         ,CO_CATEGAD
         ,CO_GRUPO
         ,CO_CURSO
         ,CO_MODALIDADE
         -- tipo presenca
         , TP_PRES
         ,TP_PR_GER
         ,TP_PR_OB_FG
         ,TP_PR_DI_FG
         ,TP_PR_OB_CE
         ,TP_PR_DI_CE
    INTO
        ORGACAD
        ,CATEGAD
        ,GRUPO
        ,CURSO
        ,MODALIDADE
        ,PRES
        ,PR_GER
        ,PR_OB_FG
        ,PR_DI_FG
        ,PR_OB_CE
        ,PR_DI_CE
    FROM tabela_aux
    WHERE id_aux = NEW.ID_Estudante;

    SET IDSQInstituicao = (
        SELECT ID_Instituicao
        FROM TBInstituicao
        WHERE Cod_OrganizacaoAcademica = ORGACAD
            AND Cod_Categoria = CATEGAD
            AND Cod_AreaDoCurso = GRUPO
            AND Cod_Curso = CURSO
            AND Cod_Modalidade = MODALIDADE
        LIMIT 1 -- nao precisa
    );

    SET IDSQTipoPresenca = (
            SELECT ID_TipoPresenca
            FROM TBTipoPresenca
            WHERE Cod_Enade = PRES
                AND Cod_Prova = PR_GER
                AND Cod_ObjetivaGeral = PR_OB_FG
                AND Cod_DiscursivaGeral = PR_DI_FG
                AND Cod_ObjetivaEspecifico = PR_OB_CE
                AND Cod_DiscursivaEspecifico = PR_DI_CE
            LIMIT 1 -- nao precisa
        );

    -- nao pode ser unico
    INSERT INTO QuestionarioProva(RS_I1, RS_I2, RS_I3, RS_I4, RS_I5, RS_I6, RS_I7, RS_I8, RS_I9)
    SELECT CO_RS_I1,CO_RS_I2,CO_RS_I3,CO_RS_I4,CO_RS_I5,CO_RS_I6,CO_RS_I7,CO_RS_I8,CO_RS_I9
    from tabela_aux WHERE id_aux = NEW.ID_Estudante;

    SET IDSQQuestionarioProva = LAST_INSERT_ID();

    -- Nao pode ser unico
    INSERT INTO QuestionarioEstudante(QE_I01, QE_I02, QE_I03, QE_I04, QE_I05, QE_I06, QE_I07, QE_I08, QE_I09, QE_I10, QE_I11, QE_I12, QE_I13, QE_I14, QE_I15, QE_I16, QE_I17, QE_I18, QE_I19, QE_I20, QE_I21, QE_I22, QE_I23, QE_I24, QE_I25, QE_I26)
    SELECT
        QE_I01
         , QE_I02
         , QE_I03
         , QE_I04
         , QE_I05
         , QE_I06
         , QE_I07
         , QE_I08
         , QE_I09
         , QE_I10
         , QE_I11
         , QE_I12
         , QE_I13
         , QE_I14
         , QE_I15
         , IF(QE_I16 = '', NULL,QE_I16)
         , QE_I17
         , QE_I18
         , QE_I19
         , QE_I20
         , QE_I21
         , QE_I22
         , QE_I23
         , QE_I24
         , QE_I25
         , QE_I26
    from tabela_aux WHERE id_aux = NEW.ID_Estudante;

    SET IDSQQuestionarioEstudante = LAST_INSERT_ID();

    -- nao pode ser unico
    INSERT INTO TBGrauConcordanciaAluno(QE_I27, QE_I28, QE_I29, QE_I30, QE_I31, QE_I32, QE_I33, QE_I34, QE_I35, QE_I36, QE_I37, QE_I38, QE_I39, QE_I40, QE_I41, QE_I42, QE_I43, QE_I44, QE_I45, QE_I46, QE_I47, QE_I48, QE_I49, QE_I50, QE_I51, QE_I52, QE_I53, QE_I54, QE_I55, QE_I56, QE_I57, QE_I58, QE_I59, QE_I60, QE_I61, QE_I62, QE_I63, QE_I64, QE_I65, QE_I66, QE_I67, QE_I68)
    SELECT if(QE_I27 = '',NULL,QE_I27)
         , if(QE_I28 = '',NULL,QE_I28)
         , if(QE_I29 = '',NULL,QE_I29)
         , if(QE_I30 = '',NULL,QE_I30)
         , if(QE_I31 = '',NULL,QE_I31)
         , if(QE_I32 = '',NULL,QE_I32)
         , if(QE_I33 = '',NULL,QE_I33)
         , if(QE_I34 = '',NULL,QE_I34)
         , if(QE_I35 = '',NULL,QE_I35)
         , if(QE_I36 = '',NULL,QE_I36)
         , if(QE_I37 = '',NULL,QE_I37)
         , if(QE_I38 = '',NULL,QE_I38)
         , if(QE_I39 = '',NULL,QE_I39)
         , if(QE_I40 = '',NULL,QE_I40)
         , if(QE_I41 = '',NULL,QE_I41)
         , if(QE_I42 = '',NULL,QE_I42)
         , if(QE_I43 = '',NULL,QE_I43)
         , if(QE_I44 = '',NULL,QE_I44)
         , if(QE_I45 = '',NULL,QE_I45)
         , if(QE_I46 = '',NULL,QE_I46)
         , if(QE_I47 = '',NULL,QE_I47)
         , if(QE_I48 = '',NULL,QE_I48)
         , if(QE_I49 = '',NULL,QE_I49)
         , if(QE_I50 = '',NULL,QE_I50)
         , if(QE_I51 = '',NULL,QE_I51)
         , if(QE_I52 = '',NULL,QE_I52)
         , if(QE_I53 = '',NULL,QE_I53)
         , if(QE_I54 = '',NULL,QE_I54)
         , if(QE_I55 = '',NULL,QE_I55)
         , if(QE_I56 = '',NULL,QE_I56)
         , if(QE_I57 = '',NULL,QE_I57)
         , if(QE_I58 = '',NULL,QE_I58)
         , if(QE_I59 = '',NULL,QE_I59)
         , if(QE_I60 = '',NULL,QE_I60)
         , if(QE_I61 = '',NULL,QE_I61)
         , if(QE_I62 = '',NULL,QE_I62)
         , if(QE_I63 = '',NULL,QE_I63)
         , if(QE_I64 = '',NULL,QE_I64)
         , if(QE_I65 = '',NULL,QE_I65)
         , if(QE_I66 = '',NULL,QE_I66)
         , if(QE_I67 = '',NULL,QE_I67)
         , if(QE_I68 = '',NULL,QE_I68)
    from tabela_aux WHERE id_aux = NEW.ID_Estudante;

    SET IDSQGrauConcordanciaAluno = LAST_INSERT_ID();

    -- nao pode ser unico
    insert into TBNota(
          NR_BrutaProva
        , NR_BrutaGeral
        , NR_BrutaObjetivaGeral
        , NR_BrutaDiscursivaGeral
        , NR_Q1_Geral
        , NR_LP_Q1_DiscursivaGeral
        , NR_Conteudo_Q1_DiscursivaGeral
        , NR_Q2_Geral
        , NR_LP_Q2_DiscursivaGeral
        , NR_Conteudo_Q2_DiscursivaGeral
        , NR_BrutaComponenteEspecifico
        , NR_BrutaObjetivaEspecifico
        , NR_BrutaDiscursivaEspecifico
        , NR_Q1_DiscursivaEspecifico
        , NR_Q2_DiscursivaEspecifico
        , NR_Q3_DiscursivaEspecifico)
    SELECT IF(NT_GER = '',NULL, REPLACE(NT_GER,',','.')),
           IF(NT_FG = '',NULL, REPLACE(NT_FG,',','.')),
           IF(NT_OBJ_FG = '',NULL, REPLACE(NT_OBJ_FG,',','.')),
           IF(NT_DIS_FG = '',NULL, REPLACE(NT_DIS_FG,',','.')),
           IF(NT_FG_D1 = '',NULL, REPLACE(NT_FG_D1,',','.')),
           IF(NT_FG_D1_PT = '',NULL, REPLACE(NT_FG_D1_PT,',','.')),
           IF(NT_FG_D1_CT = '',NULL, REPLACE(NT_FG_D1_CT,',','.')),
           IF(NT_FG_D2 = '',NULL, REPLACE(NT_FG_D2,',','.')),
           IF(NT_FG_D2_PT = '',NULL, REPLACE(NT_FG_D2_PT,',','.')),
           IF(NT_FG_D2_CT = '',NULL, REPLACE(NT_FG_D2_CT,',','.')),
           IF(NT_CE = '',NULL, REPLACE(NT_CE,',','.')),
           IF(NT_OBJ_CE = '',NULL, REPLACE(NT_OBJ_CE,',','.')),
           IF(NT_DIS_CE = '',NULL, REPLACE(NT_DIS_CE,',','.')),
           IF(NT_CE_D1 = '',NULL, REPLACE(NT_CE_D1,',','.')),
           IF(NT_CE_D2 = '',NULL, REPLACE(NT_CE_D2,',','.')),
           IF(NT_CE_D3 = '',NULL, REPLACE(NT_CE_D3,',','.'))
    from tabela_aux WHERE id_aux = NEW.ID_Estudante;

    SET IDSQNota = LAST_INSERT_ID();

    -- nao pode ser unico
    insert into Dados(NR_Ano
    , FK_SQ_Instituicao
    , FK_SQ_Municipio
    , FK_SQ_UF
    , FK_SQ_Regiao
    , FK_SQ_TipoPresenca
    , FK_SQ_Estudante
    , FK_SQ_Nota
    , FK_SQ_QuestionarioProva
    , FK_SQ_QuestionarioEstudante
    , FK_SQ_GrauConcordanciaAluno)
    SELECT NU_ANO
         ,IDSQInstituicao
         ,CO_MUNIC_CURSO
         ,CO_UF_CURSO
         ,CO_REGIAO_CURSO
         ,IDSQTipoPresenca
         ,NEW.ID_Estudante
         ,IDSQNota
         ,IDSQQuestionarioProva
         ,IDSQQuestionarioEstudante
         ,IDSQGrauConcordanciaAluno
    from tabela_aux WHERE id_aux = NEW.ID_Estudante;


    END;

create table if not exists TBGrauConcordanciaAluno
(
	ID_GrauConcordanciaAluno int auto_increment,
	QE_I27 int null,
	QE_I28 int null,
	QE_I29 int null,
	QE_I30 int null,
	QE_I31 int null,
	QE_I32 int null,
	QE_I33 int null,
	QE_I34 int null,
	QE_I35 int null,
	QE_I36 int null,
	QE_I37 int null,
	QE_I38 int null,
	QE_I39 int null,
	QE_I40 int null,
	QE_I41 int null,
	QE_I42 int null,
	QE_I43 int null,
	QE_I44 int null,
	QE_I45 int null,
	QE_I46 int null,
	QE_I47 int null,
	QE_I48 int null,
	QE_I49 int null,
	QE_I50 int null,
	QE_I51 int null,
	QE_I52 int null,
	QE_I53 int null,
	QE_I54 int null,
	QE_I55 int null,
	QE_I56 int null,
	QE_I57 int null,
	QE_I58 int null,
	QE_I59 int null,
	QE_I60 int null,
	QE_I61 int null,
	QE_I62 int null,
	QE_I63 int null,
	QE_I64 int null,
	QE_I65 int null,
	QE_I66 int null,
	QE_I67 int null,
	QE_I68 int null,
	constraint ID_GrauConcordanciaAluno
		unique (ID_GrauConcordanciaAluno)
);

alter table TBGrauConcordanciaAluno
	add primary key (ID_GrauConcordanciaAluno);

create table if not exists TBInstituicao
(
	Cod_Modalidade tinyint(1) null,
	Cod_Curso int null,
	Cod_AreaDoCurso int null,
	Cod_OrganizacaoAcademica int null,
	Cod_Categoria int null,
	ID_Instituicao int auto_increment,
	constraint ID_Instituicao
		unique (ID_Instituicao),
	constraint tudo_index
		unique (Cod_Modalidade, Cod_AreaDoCurso, Cod_Categoria, Cod_OrganizacaoAcademica, Cod_Curso)
);

alter table TBInstituicao
	add primary key (ID_Instituicao);

create table if not exists TBMunicipio
(
	Cod_Municipio int not null,
	DS_Nome varchar(200) null,
	constraint Cod_Municipio
		unique (Cod_Municipio)
);

alter table TBMunicipio
	add primary key (Cod_Municipio);

create table if not exists TBNota
(
	ID_Nota int auto_increment,
	NR_BrutaProva decimal(13,2) null,
	NR_BrutaGeral decimal(13,2) null,
	NR_BrutaObjetivaGeral decimal(13,2) null,
	NR_BrutaDiscursivaGeral decimal(13,2) null,
	NR_Q1_Geral decimal(13,2) null,
	NR_LP_Q1_DiscursivaGeral decimal(13,2) null,
	NR_Conteudo_Q1_DiscursivaGeral decimal(13,2) null,
	NR_Q2_Geral decimal(13,2) null,
	NR_LP_Q2_DiscursivaGeral decimal(13,2) null,
	NR_Conteudo_Q2_DiscursivaGeral decimal(13,2) null,
	NR_BrutaComponenteEspecifico decimal(13,2) null,
	NR_BrutaObjetivaEspecifico decimal(13,2) null,
	NR_BrutaDiscursivaEspecifico decimal(13,2) null,
	NR_Q1_DiscursivaEspecifico decimal(13,2) null,
	NR_Q2_DiscursivaEspecifico decimal(13,2) null,
	NR_Q3_DiscursivaEspecifico decimal(13,2) null,
	constraint ID_Nota
		unique (ID_Nota)
);

alter table TBNota
	add primary key (ID_Nota);

create table if not exists TBRegiao
(
	ID_Regiao int auto_increment,
	DS_Nome varchar(200) null,
	constraint ID_Regiao
		unique (ID_Regiao)
);

alter table TBRegiao
	add primary key (ID_Regiao);

create table if not exists TBTipoPresenca
(
	ID_TipoPresenca int auto_increment,
	Cod_Enade int null,
	Cod_Prova int null,
	Cod_ObjetivaGeral int null,
	Cod_DiscursivaGeral int null,
	Cod_ObjetivaEspecifico int null,
	Cod_DiscursivaEspecifico int null,
	constraint ID_TipoPresenca
		unique (ID_TipoPresenca),
	constraint tudo_index
		unique (Cod_Enade, Cod_DiscursivaEspecifico, Cod_DiscursivaGeral, Cod_Prova, Cod_ObjetivaEspecifico, Cod_ObjetivaGeral)
);

alter table TBTipoPresenca
	add primary key (ID_TipoPresenca);

create table if not exists TBUF
(
	ID_UF int not null,
	DS_UF varchar(50) null,
	constraint ID_UF
		unique (ID_UF)
);

alter table TBUF
	add primary key (ID_UF);

create table if not exists Dados
(
	ID_Dados int auto_increment,
	NR_Ano int null,
	FK_SQ_Instituicao int null,
	FK_SQ_Municipio int null,
	FK_SQ_UF int null,
	FK_SQ_Regiao int null,
	FK_SQ_TipoPresenca int null,
	FK_SQ_Estudante int null,
	FK_SQ_Nota int null,
	FK_SQ_QuestionarioProva int null,
	FK_SQ_QuestionarioEstudante int null,
	FK_SQ_GrauConcordanciaAluno int null,
	constraint ID_Dados
		unique (ID_Dados),
	constraint Dados_TBGrauConcordanciaAluno_ID_GrauConcordanciaAluno_fk
		foreign key (FK_SQ_GrauConcordanciaAluno) references TBGrauConcordanciaAluno (ID_GrauConcordanciaAluno),
	constraint Dados_TBInstituicao_ID_Instituicao_fk
		foreign key (FK_SQ_Instituicao) references TBInstituicao (ID_Instituicao),
	constraint Dados_TBUF_ID_UF_fk
		foreign key (FK_SQ_UF) references TBUF (ID_UF),
	constraint Dados_ibfk_1
		foreign key (FK_SQ_Regiao) references TBRegiao (ID_Regiao),
	constraint Dados_ibfk_3
		foreign key (FK_SQ_TipoPresenca) references TBTipoPresenca (ID_TipoPresenca),
	constraint Dados_ibfk_4
		foreign key (FK_SQ_Estudante) references TBEstudante (ID_Estudante),
	constraint Dados_ibfk_5
		foreign key (FK_SQ_Nota) references TBNota (ID_Nota),
	constraint Dados_ibfk_6
		foreign key (FK_SQ_QuestionarioEstudante) references QuestionarioEstudante (ID_QuestionarioEstudante),
	constraint Dados_ibfk_7
		foreign key (FK_SQ_QuestionarioProva) references QuestionarioProva (ID_QuestionarioProva),
	constraint Dados_ibfk_8
		foreign key (FK_SQ_Municipio) references TBMunicipio (Cod_Municipio)
);

create index FK_SQ_Estudante
	on Dados (FK_SQ_Estudante);

create index FK_SQ_Municipio
	on Dados (FK_SQ_Municipio);

create index FK_SQ_Nota
	on Dados (FK_SQ_Nota);

create index FK_SQ_QuestionarioEstudante
	on Dados (FK_SQ_QuestionarioEstudante);

create index FK_SQ_QuestionarioProva
	on Dados (FK_SQ_QuestionarioProva);

create index FK_SQ_Regiao
	on Dados (FK_SQ_Regiao);

create index FK_SQ_TipoPresenca
	on Dados (FK_SQ_TipoPresenca);

alter table Dados
	add primary key (ID_Dados);

create table if not exists tabela_aux
(
	NU_ANO varchar(100) null,
	CO_CATEGAD varchar(100) null,
	CO_ORGACAD varchar(100) null,
	CO_IES varchar(100) null,
	CO_GRUPO varchar(100) null,
	CO_CURSO varchar(100) null,
	CO_MODALIDADE varchar(100) null,
	CO_MUNIC_CURSO varchar(100) null,
	CO_UF_CURSO varchar(100) null,
	CO_REGIAO_CURSO varchar(100) null,
	NU_IDADE varchar(100) null,
	TP_SEXO varchar(100) null,
	ANO_FIM_EM varchar(100) null,
	ANO_IN_GRAD varchar(100) null,
	CO_TURNO_GRADUACAO varchar(100) null,
	TP_INSCRICAO_ADM varchar(100) null,
	TP_INSCRICAO varchar(100) null,
	NU_ITEM_OFG varchar(100) null,
	NU_ITEM_OFG_Z varchar(100) null,
	NU_ITEM_OFG_X varchar(100) null,
	NU_ITEM_OFG_N varchar(100) null,
	NU_ITEM_OCE varchar(100) null,
	NU_ITEM_OCE_Z varchar(100) null,
	NU_ITEM_OCE_X varchar(100) null,
	NU_ITEM_OCE_N varchar(100) null,
	DS_VT_GAB_OFG_ORIG varchar(100) null,
	DS_VT_GAB_OFG_FIN varchar(100) null,
	DS_VT_GAB_OCE_ORIG varchar(100) null,
	DS_VT_GAB_OCE_FIN varchar(100) null,
	DS_VT_ESC_OCE varchar(100) null,
	DS_VT_ACE_OCE varchar(100) null,
	TP_PRES varchar(100) null,
	TP_PR_GER varchar(100) null,
	DS_VT_ESC_OFG varchar(100) null,
	DS_VT_ACE_OFG varchar(100) null,
	TP_PR_OB_FG varchar(100) null,
	TP_PR_DI_FG varchar(100) null,
	TP_PR_OB_CE varchar(100) null,
	TP_PR_DI_CE varchar(100) null,
	TP_SFG_D1 varchar(100) null,
	TP_SFG_D2 varchar(100) null,
	TP_SCE_D1 varchar(100) null,
	TP_SCE_D2 varchar(100) null,
	TP_SCE_D3 varchar(100) null,
	NT_GER varchar(100) null,
	NT_FG varchar(100) null,
	NT_OBJ_FG varchar(100) null,
	NT_DIS_FG varchar(100) null,
	NT_FG_D1 varchar(100) null,
	NT_FG_D1_PT varchar(100) null,
	NT_FG_D1_CT varchar(100) null,
	NT_FG_D2 varchar(100) null,
	NT_FG_D2_PT varchar(100) null,
	NT_FG_D2_CT varchar(100) null,
	NT_CE varchar(100) null,
	NT_OBJ_CE varchar(100) null,
	NT_DIS_CE varchar(100) null,
	NT_CE_D1 varchar(100) null,
	NT_CE_D2 varchar(100) null,
	NT_CE_D3 varchar(100) null,
	CO_RS_I1 varchar(100) null,
	CO_RS_I2 varchar(100) null,
	CO_RS_I3 varchar(100) null,
	CO_RS_I4 varchar(100) null,
	CO_RS_I5 varchar(100) null,
	CO_RS_I6 varchar(100) null,
	CO_RS_I7 varchar(100) null,
	CO_RS_I8 varchar(100) null,
	CO_RS_I9 varchar(100) null,
	QE_I01 varchar(100) null,
	QE_I02 varchar(100) null,
	QE_I03 varchar(100) null,
	QE_I04 varchar(100) null,
	QE_I05 varchar(100) null,
	QE_I06 varchar(100) null,
	QE_I07 varchar(100) null,
	QE_I08 varchar(100) null,
	QE_I09 varchar(100) null,
	QE_I10 varchar(100) null,
	QE_I11 varchar(100) null,
	QE_I12 varchar(100) null,
	QE_I13 varchar(100) null,
	QE_I14 varchar(100) null,
	QE_I15 varchar(100) null,
	QE_I16 varchar(100) null,
	QE_I17 varchar(100) null,
	QE_I18 varchar(100) null,
	QE_I19 varchar(100) null,
	QE_I20 varchar(100) null,
	QE_I21 varchar(100) null,
	QE_I22 varchar(100) null,
	QE_I23 varchar(100) null,
	QE_I24 varchar(100) null,
	QE_I25 varchar(100) null,
	QE_I26 varchar(100) null,
	QE_I27 varchar(100) null,
	QE_I28 varchar(100) null,
	QE_I29 varchar(100) null,
	QE_I30 varchar(100) null,
	QE_I31 varchar(100) null,
	QE_I32 varchar(100) null,
	QE_I33 varchar(100) null,
	QE_I34 varchar(100) null,
	QE_I35 varchar(100) null,
	QE_I36 varchar(100) null,
	QE_I37 varchar(100) null,
	QE_I38 varchar(100) null,
	QE_I39 varchar(100) null,
	QE_I40 varchar(100) null,
	QE_I41 varchar(100) null,
	QE_I42 varchar(100) null,
	QE_I43 varchar(100) null,
	QE_I44 varchar(100) null,
	QE_I45 varchar(100) null,
	QE_I46 varchar(100) null,
	QE_I47 varchar(100) null,
	QE_I48 varchar(100) null,
	QE_I49 varchar(100) null,
	QE_I50 varchar(100) null,
	QE_I51 varchar(100) null,
	QE_I52 varchar(100) null,
	QE_I53 varchar(100) null,
	QE_I54 varchar(100) null,
	QE_I55 varchar(100) null,
	QE_I56 varchar(100) null,
	QE_I57 varchar(100) null,
	QE_I58 varchar(100) null,
	QE_I59 varchar(100) null,
	QE_I60 varchar(100) null,
	QE_I61 varchar(100) null,
	QE_I62 varchar(100) null,
	QE_I63 varchar(100) null,
	QE_I64 varchar(100) null,
	QE_I65 varchar(100) null,
	QE_I66 varchar(100) null,
	QE_I67 varchar(100) null,
	QE_I68 varchar(100) null,
	QE_I69 varchar(100) null,
	QE_I70 varchar(100) null,
	QE_I71 varchar(100) null,
	QE_I72 varchar(100) null,
	QE_I73 varchar(100) null,
	QE_I74 varchar(100) null,
	QE_I75 varchar(100) null,
	QE_I76 varchar(100) null,
	QE_I77 varchar(100) null,
	QE_I78 varchar(100) null,
	QE_I79 varchar(100) null,
	QE_I80 varchar(100) null,
	QE_I81 varchar(100) null,
	ID_AUX int auto_increment
		primary key
);

create table if not exists testeload
(
	NU_ANO varchar(100) null,
	CO_CATEGAD varchar(100) null,
	CO_ORGACAD varchar(100) null,
	CO_IES varchar(100) null,
	CO_GRUPO varchar(100) null,
	CO_CURSO varchar(100) null,
	CO_MODALIDADE varchar(100) null,
	CO_MUNIC_CURSO varchar(100) null,
	CO_UF_CURSO varchar(100) null,
	CO_REGIAO_CURSO varchar(100) null,
	NU_IDADE varchar(100) null,
	TP_SEXO varchar(100) null,
	ANO_FIM_EM varchar(100) null,
	ANO_IN_GRAD varchar(100) null,
	CO_TURNO_GRADUACAO varchar(100) null,
	TP_INSCRICAO_ADM varchar(100) null,
	TP_INSCRICAO varchar(100) null,
	NU_ITEM_OFG varchar(100) null,
	NU_ITEM_OFG_Z varchar(100) null,
	NU_ITEM_OFG_X varchar(100) null,
	NU_ITEM_OFG_N varchar(100) null,
	NU_ITEM_OCE varchar(100) null,
	NU_ITEM_OCE_Z varchar(100) null,
	NU_ITEM_OCE_X varchar(100) null,
	NU_ITEM_OCE_N varchar(100) null,
	DS_VT_GAB_OFG_ORIG varchar(100) null,
	DS_VT_GAB_OFG_FIN varchar(100) null,
	DS_VT_GAB_OCE_ORIG varchar(100) null,
	DS_VT_GAB_OCE_FIN varchar(100) null,
	DS_VT_ESC_OCE varchar(100) null,
	DS_VT_ACE_OCE varchar(100) null,
	TP_PRES varchar(100) null,
	TP_PR_GER varchar(100) null,
	DS_VT_ESC_OFG varchar(100) null,
	DS_VT_ACE_OFG varchar(100) null,
	TP_PR_OB_FG varchar(100) null,
	TP_PR_DI_FG varchar(100) null,
	TP_PR_OB_CE varchar(100) null,
	TP_PR_DI_CE varchar(100) null,
	TP_SFG_D1 varchar(100) null,
	TP_SFG_D2 varchar(100) null,
	TP_SCE_D1 varchar(100) null,
	TP_SCE_D2 varchar(100) null,
	TP_SCE_D3 varchar(100) null,
	NT_GER varchar(100) null,
	NT_FG varchar(100) null,
	NT_OBJ_FG varchar(100) null,
	NT_DIS_FG varchar(100) null,
	NT_FG_D1 varchar(100) null,
	NT_FG_D1_PT varchar(100) null,
	NT_FG_D1_CT varchar(100) null,
	NT_FG_D2 varchar(100) null,
	NT_FG_D2_PT varchar(100) null,
	NT_FG_D2_CT varchar(100) null,
	NT_CE varchar(100) null,
	NT_OBJ_CE varchar(100) null,
	NT_DIS_CE varchar(100) null,
	NT_CE_D1 varchar(100) null,
	NT_CE_D2 varchar(100) null,
	NT_CE_D3 varchar(100) null,
	CO_RS_I1 varchar(100) null,
	CO_RS_I2 varchar(100) null,
	CO_RS_I3 varchar(100) null,
	CO_RS_I4 varchar(100) null,
	CO_RS_I5 varchar(100) null,
	CO_RS_I6 varchar(100) null,
	CO_RS_I7 varchar(100) null,
	CO_RS_I8 varchar(100) null,
	CO_RS_I9 varchar(100) null,
	QE_I01 varchar(100) null,
	QE_I02 varchar(100) null,
	QE_I03 varchar(100) null,
	QE_I04 varchar(100) null,
	QE_I05 varchar(100) null,
	QE_I06 varchar(100) null,
	QE_I07 varchar(100) null,
	QE_I08 varchar(100) null,
	QE_I09 varchar(100) null,
	QE_I10 varchar(100) null,
	QE_I11 varchar(100) null,
	QE_I12 varchar(100) null,
	QE_I13 varchar(100) null,
	QE_I14 varchar(100) null,
	QE_I15 varchar(100) null,
	QE_I16 varchar(100) null,
	QE_I17 varchar(100) null,
	QE_I18 varchar(100) null,
	QE_I19 varchar(100) null,
	QE_I20 varchar(100) null,
	QE_I21 varchar(100) null,
	QE_I22 varchar(100) null,
	QE_I23 varchar(100) null,
	QE_I24 varchar(100) null,
	QE_I25 varchar(100) null,
	QE_I26 varchar(100) null,
	QE_I27 varchar(100) null,
	QE_I28 varchar(100) null,
	QE_I29 varchar(100) null,
	QE_I30 varchar(100) null,
	QE_I31 varchar(100) null,
	QE_I32 varchar(100) null,
	QE_I33 varchar(100) null,
	QE_I34 varchar(100) null,
	QE_I35 varchar(100) null,
	QE_I36 varchar(100) null,
	QE_I37 varchar(100) null,
	QE_I38 varchar(100) null,
	QE_I39 varchar(100) null,
	QE_I40 varchar(100) null,
	QE_I41 varchar(100) null,
	QE_I42 varchar(100) null,
	QE_I43 varchar(100) null,
	QE_I44 varchar(100) null,
	QE_I45 varchar(100) null,
	QE_I46 varchar(100) null,
	QE_I47 varchar(100) null,
	QE_I48 varchar(100) null,
	QE_I49 varchar(100) null,
	QE_I50 varchar(100) null,
	QE_I51 varchar(100) null,
	QE_I52 varchar(100) null,
	QE_I53 varchar(100) null,
	QE_I54 varchar(100) null,
	QE_I55 varchar(100) null,
	QE_I56 varchar(100) null,
	QE_I57 varchar(100) null,
	QE_I58 varchar(100) null,
	QE_I59 varchar(100) null,
	QE_I60 varchar(100) null,
	QE_I61 varchar(100) null,
	QE_I62 varchar(100) null,
	QE_I63 varchar(100) null,
	QE_I64 varchar(100) null,
	QE_I65 varchar(100) null,
	QE_I66 varchar(100) null,
	QE_I67 varchar(100) null,
	QE_I68 varchar(100) null,
	QE_I69 varchar(100) null,
	QE_I70 varchar(100) null,
	QE_I71 varchar(100) null,
	QE_I72 varchar(100) null,
	QE_I73 varchar(100) null,
	QE_I74 varchar(100) null,
	QE_I75 varchar(100) null,
	QE_I76 varchar(100) null,
	QE_I77 varchar(100) null,
	QE_I78 varchar(100) null,
	QE_I79 varchar(100) null,
	QE_I80 varchar(100) null,
	QE_I81 varchar(100) null,
	ID_AUX int auto_increment
		primary key
);

