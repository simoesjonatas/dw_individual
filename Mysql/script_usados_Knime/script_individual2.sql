/*
 Arquivo para ser usado depois que for inserido a carga de dados na tabela aux
 */
USE DWENADE;

/*tratando os dados vazio e nulos*/

UPDATE tabela_aux SET
 NU_ANO = IF(NU_ANO in ('','NA',' '),NULL,NU_ANO)
,CO_IES = IF(CO_IES in ('','NA',' '),NULL,CO_IES)
,CO_CATEGAD = IF(CO_CATEGAD in ('','NA',' '),NULL,CO_CATEGAD)
,CO_ORGACAD = IF(CO_ORGACAD in ('','NA',' '),NULL,CO_ORGACAD)
,CO_GRUPO = IF(CO_GRUPO in ('','NA',' '),NULL,CO_GRUPO)
,CO_CURSO = IF(CO_CURSO in ('','NA',' '),NULL,CO_CURSO)
,CO_MODALIDADE = IF(CO_MODALIDADE in ('','NA',' '),NULL,CO_MODALIDADE)
,CO_MUNIC_CURSO = IF(CO_MUNIC_CURSO in ('','NA',' '),NULL,CO_MUNIC_CURSO)
,CO_UF_CURSO = IF(CO_UF_CURSO in ('','NA',' '),NULL,CO_UF_CURSO)
,CO_REGIAO_CURSO = IF(CO_REGIAO_CURSO in ('','NA',' '),NULL,CO_REGIAO_CURSO)
,NU_IDADE = IF(NU_IDADE in ('','NA',' '),NULL,NU_IDADE)
,TP_SEXO = IF(TP_SEXO in ('','NA',' '),NULL,TP_SEXO)
,ANO_FIM_EM = IF(ANO_FIM_EM in ('','NA',' '),NULL,ANO_FIM_EM)
,ANO_IN_GRAD = IF(ANO_IN_GRAD in ('','NA',' '),NULL,ANO_IN_GRAD)
,CO_TURNO_GRADUACAO = IF(CO_TURNO_GRADUACAO in ('','NA',' '),NULL,CO_TURNO_GRADUACAO)
,TP_INSCRICAO_ADM = IF(TP_INSCRICAO_ADM in ('','NA',' '),NULL,TP_INSCRICAO_ADM)
,TP_INSCRICAO = IF(TP_INSCRICAO in ('','NA',' '),NULL,TP_INSCRICAO)
,NU_ITEM_OFG = IF(NU_ITEM_OFG in ('','NA',' '),NULL,NU_ITEM_OFG)
,NU_ITEM_OFG_Z = IF(NU_ITEM_OFG_Z in ('','NA',' '),NULL,NU_ITEM_OFG_Z)
,NU_ITEM_OFG_X = IF(NU_ITEM_OFG_X in ('','NA',' '),NULL,NU_ITEM_OFG_X)
,NU_ITEM_OFG_N = IF(NU_ITEM_OFG_N in ('','NA',' '),NULL,NU_ITEM_OFG_N)
,NU_ITEM_OCE = IF(NU_ITEM_OCE in ('','NA',' '),NULL,NU_ITEM_OCE)
,NU_ITEM_OCE_Z = IF(NU_ITEM_OCE_Z in ('','NA',' '),NULL,NU_ITEM_OCE_Z)
,NU_ITEM_OCE_X = IF(NU_ITEM_OCE_X in ('','NA',' '),NULL,NU_ITEM_OCE_X)
,NU_ITEM_OCE_N = IF(NU_ITEM_OCE_N in ('','NA',' '),NULL,NU_ITEM_OCE_N)
,DS_VT_GAB_OFG_ORIG = IF(DS_VT_GAB_OFG_ORIG in ('','NA',' '),NULL,DS_VT_GAB_OFG_ORIG)
,DS_VT_GAB_OFG_FIN = IF(DS_VT_GAB_OFG_FIN in ('','NA',' '),NULL,DS_VT_GAB_OFG_FIN)
,DS_VT_GAB_OCE_ORIG = IF(DS_VT_GAB_OCE_ORIG in ('','NA',' '),NULL,DS_VT_GAB_OCE_ORIG)
,DS_VT_GAB_OCE_FIN = IF(DS_VT_GAB_OCE_FIN in ('','NA',' '),NULL,DS_VT_GAB_OCE_FIN)
,DS_VT_ESC_OCE = IF(DS_VT_ESC_OCE in ('','NA',' '),NULL,DS_VT_ESC_OCE)
,DS_VT_ACE_OCE = IF(DS_VT_ACE_OCE in ('','NA',' '),NULL,DS_VT_ACE_OCE)
,TP_PRES = IF(TP_PRES in ('','NA',' '),NULL,TP_PRES)
,TP_PR_GER = IF(TP_PR_GER in ('','NA',' '),NULL,TP_PR_GER)
,DS_VT_ESC_OFG = IF(DS_VT_ESC_OFG in ('','NA',' '),NULL,DS_VT_ESC_OFG)
,DS_VT_ACE_OFG = IF(DS_VT_ACE_OFG in ('','NA',' '),NULL,DS_VT_ACE_OFG)
,TP_PR_OB_FG = IF(TP_PR_OB_FG in ('','NA',' '),NULL,TP_PR_OB_FG)
,TP_PR_DI_FG = IF(TP_PR_DI_FG in ('','NA',' '),NULL,TP_PR_DI_FG)
,TP_PR_OB_CE = IF(TP_PR_OB_CE in ('','NA',' '),NULL,TP_PR_OB_CE)
,TP_PR_DI_CE = IF(TP_PR_DI_CE in ('','NA',' '),NULL,TP_PR_DI_CE)
,TP_SFG_D1 = IF(TP_SFG_D1 in ('','NA',' '),NULL,TP_SFG_D1)
,TP_SFG_D2 = IF(TP_SFG_D2 in ('','NA',' '),NULL,TP_SFG_D2)
,TP_SCE_D1 = IF(TP_SCE_D1 in ('','NA',' '),NULL,TP_SCE_D1)
,TP_SCE_D2 = IF(TP_SCE_D2 in ('','NA',' '),NULL,TP_SCE_D2)
,TP_SCE_D3 = IF(TP_SCE_D3 in ('','NA',' '),NULL,TP_SCE_D3)
,NT_GER = IF(NT_GER in ('','NA',' '),NULL,NT_GER)
,NT_FG = IF(NT_FG in ('','NA',' '),NULL,NT_FG)
,NT_OBJ_FG = IF(NT_OBJ_FG in ('','NA',' '),NULL,NT_OBJ_FG)
,NT_DIS_FG = IF(NT_DIS_FG in ('','NA',' '),NULL,NT_DIS_FG)
,NT_FG_D1 = IF(NT_FG_D1 in ('','NA',' '),NULL,NT_FG_D1)
,NT_FG_D1_PT = IF(NT_FG_D1_PT in ('','NA',' '),NULL,NT_FG_D1_PT)
,NT_FG_D1_CT = IF(NT_FG_D1_CT in ('','NA',' '),NULL,NT_FG_D1_CT)
,NT_FG_D2 = IF(NT_FG_D2 in ('','NA',' '),NULL,NT_FG_D2)
,NT_FG_D2_PT = IF(NT_FG_D2_PT in ('','NA',' '),NULL,NT_FG_D2_PT)
,NT_FG_D2_CT = IF(NT_FG_D2_CT in ('','NA',' '),NULL,NT_FG_D2_CT)
,NT_CE = IF(NT_CE in ('','NA',' '),NULL,NT_CE)
,NT_OBJ_CE = IF(NT_OBJ_CE in ('','NA',' '),NULL,NT_OBJ_CE)
,NT_DIS_CE = IF(NT_DIS_CE in ('','NA',' '),NULL,NT_DIS_CE)
,NT_CE_D1 = IF(NT_CE_D1 in ('','NA',' '),NULL,NT_CE_D1)
,NT_CE_D2 = IF(NT_CE_D2 in ('','NA',' '),NULL,NT_CE_D2)
,NT_CE_D3 = IF(NT_CE_D3 in ('','NA',' '),NULL,NT_CE_D3)
,CO_RS_I1 = IF(CO_RS_I1 in ('','NA',' '),NULL,CO_RS_I1)
,CO_RS_I2 = IF(CO_RS_I2 in ('','NA',' '),NULL,CO_RS_I2)
,CO_RS_I3 = IF(CO_RS_I3 in ('','NA',' '),NULL,CO_RS_I3)
,CO_RS_I4 = IF(CO_RS_I4 in ('','NA',' '),NULL,CO_RS_I4)
,CO_RS_I5 = IF(CO_RS_I5 in ('','NA',' '),NULL,CO_RS_I5)
,CO_RS_I6 = IF(CO_RS_I6 in ('','NA',' '),NULL,CO_RS_I6)
,CO_RS_I7 = IF(CO_RS_I7 in ('','NA',' '),NULL,CO_RS_I7)
,CO_RS_I8 = IF(CO_RS_I8 in ('','NA',' '),NULL,CO_RS_I8)
,CO_RS_I9 = IF(CO_RS_I9 in ('','NA',' '),NULL,CO_RS_I9)
,QE_I01 = IF(QE_I01 in ('','NA',' '),NULL,QE_I01)
,QE_I02 = IF(QE_I02 in ('','NA',' '),NULL,QE_I02)
,QE_I03 = IF(QE_I03 in ('','NA',' '),NULL,QE_I03)
,QE_I04 = IF(QE_I04 in ('','NA',' '),NULL,QE_I04)
,QE_I05 = IF(QE_I05 in ('','NA',' '),NULL,QE_I05)
,QE_I06 = IF(QE_I06 in ('','NA',' '),NULL,QE_I06)
,QE_I07 = IF(QE_I07 in ('','NA',' '),NULL,QE_I07)
,QE_I08 = IF(QE_I08 in ('','NA',' '),NULL,QE_I08)
,QE_I09 = IF(QE_I09 in ('','NA',' '),NULL,QE_I09)
,QE_I10 = IF(QE_I10 in ('','NA',' '),NULL,QE_I10)
,QE_I11 = IF(QE_I11 in ('','NA',' '),NULL,QE_I11)
,QE_I12 = IF(QE_I12 in ('','NA',' '),NULL,QE_I12)
,QE_I13 = IF(QE_I13 in ('','NA',' '),NULL,QE_I13)
,QE_I14 = IF(QE_I14 in ('','NA',' '),NULL,QE_I14)
,QE_I15 = IF(QE_I15 in ('','NA',' '),NULL,QE_I15)
,QE_I16 = IF(QE_I16 in ('','NA',' '),NULL,QE_I16)
,QE_I17 = IF(QE_I17 in ('','NA',' '),NULL,QE_I17)
,QE_I18 = IF(QE_I18 in ('','NA',' '),NULL,QE_I18)
,QE_I19 = IF(QE_I19 in ('','NA',' '),NULL,QE_I19)
,QE_I20 = IF(QE_I20 in ('','NA',' '),NULL,QE_I20)
,QE_I21 = IF(QE_I21 in ('','NA',' '),NULL,QE_I21)
,QE_I22 = IF(QE_I22 in ('','NA',' '),NULL,QE_I22)
,QE_I23 = IF(QE_I23 in ('','NA',' '),NULL,QE_I23)
,QE_I24 = IF(QE_I24 in ('','NA',' '),NULL,QE_I24)
,QE_I25 = IF(QE_I25 in ('','NA',' '),NULL,QE_I25)
,QE_I26 = IF(QE_I26 in ('','NA',' '),NULL,QE_I26)
,QE_I27 = IF(QE_I27 in ('','NA',' '),NULL,QE_I27)
,QE_I28 = IF(QE_I28 in ('','NA',' '),NULL,QE_I28)
,QE_I29 = IF(QE_I29 in ('','NA',' '),NULL,QE_I29)
,QE_I30 = IF(QE_I30 in ('','NA',' '),NULL,QE_I30)
,QE_I31 = IF(QE_I31 in ('','NA',' '),NULL,QE_I31)
,QE_I32 = IF(QE_I32 in ('','NA',' '),NULL,QE_I32)
,QE_I33 = IF(QE_I33 in ('','NA',' '),NULL,QE_I33)
,QE_I34 = IF(QE_I34 in ('','NA',' '),NULL,QE_I34)
,QE_I35 = IF(QE_I35 in ('','NA',' '),NULL,QE_I35)
,QE_I36 = IF(QE_I36 in ('','NA',' '),NULL,QE_I36)
,QE_I37 = IF(QE_I37 in ('','NA',' '),NULL,QE_I37)
,QE_I38 = IF(QE_I38 in ('','NA',' '),NULL,QE_I38)
,QE_I39 = IF(QE_I39 in ('','NA',' '),NULL,QE_I39)
,QE_I40 = IF(QE_I40 in ('','NA',' '),NULL,QE_I40)
,QE_I41 = IF(QE_I41 in ('','NA',' '),NULL,QE_I41)
,QE_I42 = IF(QE_I42 in ('','NA',' '),NULL,QE_I42)
,QE_I43 = IF(QE_I43 in ('','NA',' '),NULL,QE_I43)
,QE_I44 = IF(QE_I44 in ('','NA',' '),NULL,QE_I44)
,QE_I45 = IF(QE_I45 in ('','NA',' '),NULL,QE_I45)
,QE_I46 = IF(QE_I46 in ('','NA',' '),NULL,QE_I46)
,QE_I47 = IF(QE_I47 in ('','NA',' '),NULL,QE_I47)
,QE_I48 = IF(QE_I48 in ('','NA',' '),NULL,QE_I48)
,QE_I49 = IF(QE_I49 in ('','NA',' '),NULL,QE_I49)
,QE_I50 = IF(QE_I50 in ('','NA',' '),NULL,QE_I50)
,QE_I51 = IF(QE_I51 in ('','NA',' '),NULL,QE_I51)
,QE_I52 = IF(QE_I52 in ('','NA',' '),NULL,QE_I52)
,QE_I53 = IF(QE_I53 in ('','NA',' '),NULL,QE_I53)
,QE_I54 = IF(QE_I54 in ('','NA',' '),NULL,QE_I54)
,QE_I55 = IF(QE_I55 in ('','NA',' '),NULL,QE_I55)
,QE_I56 = IF(QE_I56 in ('','NA',' '),NULL,QE_I56)
,QE_I57 = IF(QE_I57 in ('','NA',' '),NULL,QE_I57)
,QE_I58 = IF(QE_I58 in ('','NA',' '),NULL,QE_I58)
,QE_I59 = IF(QE_I59 in ('','NA',' '),NULL,QE_I59)
,QE_I60 = IF(QE_I60 in ('','NA',' '),NULL,QE_I60)
,QE_I61 = IF(QE_I61 in ('','NA',' '),NULL,QE_I61)
,QE_I62 = IF(QE_I62 in ('','NA',' '),NULL,QE_I62)
,QE_I63 = IF(QE_I63 in ('','NA',' '),NULL,QE_I63)
,QE_I64 = IF(QE_I64 in ('','NA',' '),NULL,QE_I64)
,QE_I65 = IF(QE_I65 in ('','NA',' '),NULL,QE_I65)
,QE_I66 = IF(QE_I66 in ('','NA',' '),NULL,QE_I66)
,QE_I67 = IF(QE_I67 in ('','NA',' '),NULL,QE_I67)
,QE_I68 = IF(QE_I68 in ('','NA',' '),NULL,QE_I68)
,QE_I69 = IF(QE_I69 in ('','NA',' '),NULL,QE_I69)
,QE_I70 = IF(QE_I70 in ('','NA',' '),NULL,QE_I70)
,QE_I71 = IF(QE_I71 in ('','NA',' '),NULL,QE_I71)
,QE_I72 = IF(QE_I72 in ('','NA',' '),NULL,QE_I72)
,QE_I73 = IF(QE_I73 in ('','NA',' '),NULL,QE_I73)
,QE_I74 = IF(QE_I74 in ('','NA',' '),NULL,QE_I74)
,QE_I75 = IF(QE_I75 in ('','NA',' '),NULL,QE_I75)
,QE_I76 = IF(QE_I76 in ('','NA',' '),NULL,QE_I76)
,QE_I77 = IF(QE_I77 in ('','NA',' '),NULL,QE_I77)
,QE_I78 = IF(QE_I78 in ('','NA',' '),NULL,QE_I78)
,QE_I79 = IF(QE_I79 in ('','NA',' '),NULL,QE_I79)
,QE_I80 = IF(QE_I80 in ('','NA',' '),NULL,QE_I80)
,QE_I81 = IF(QE_I81 in ('','NA',' '),NULL,QE_I81);



/*
 inserindo todas as instituicoes encontradas na base de dados
 */
insert ignore into TBInstituicao (Cod_OrganizacaoAcademica, Cod_Categoria, Cod_AreaDoCurso, Cod_Curso, Cod_Modalidade)
select CO_ORGACAD,CO_CATEGAD,CO_GRUPO,CO_CURSO,CO_MODALIDADE from tabela_aux;


/*
 inserindo os tipos de presenca
 */
insert ignore into TBTipoPresenca (
                                   Cod_Enade
                                    , Cod_Prova
                                    , Cod_ObjetivaGeral
                                    , Cod_DiscursivaGeral
                                    , Cod_ObjetivaEspecifico
                                    , Cod_DiscursivaEspecifico)
SELECT TP_PRES
     ,TP_PR_GER
     ,TP_PR_OB_FG
     ,TP_PR_DI_FG
     ,TP_PR_OB_CE
    ,TP_PR_DI_CE
from tabela_aux;

-- inserindo os dados na base relacional
insert into TBEstudante(NR_Idade, DS_Sexo, AnoConclusaoEnsinoMedio, AnoInicioGraduacao, DS_Turno, B_InscricaoAdm, B_Concluinte)
SELECT NU_IDADE,TP_SEXO,ANO_FIM_EM,ANO_IN_GRAD,CO_TURNO_GRADUACAO,TP_INSCRICAO_ADM,TP_INSCRICAO from tabela_aux;

 -- tirando as coisas que nao precisamos mais
DROP TRIGGER IF EXISTS TBEstudante_TR_ON_INSERT;
DROP TABLE DWENADE.tabela_aux;
