drop table passagens cascade constraints;
drop table servicos cascade constraints;
drop table tbl_frequencia_voo cascade constraints;
drop table tbl_voo cascade constraints;
drop table voosservicos cascade constraints;

create table servicos (
    servicoId number(9) primary key,
    categoria varchar2(80),
    descricao varchar2(80),
    valor number(9,2)
);

create table tbl_frequencia_voo (
    frequenciaVooId number(9) primary key,
    codigoFrequencia number(9) not null,
    dataAtivacao date not null
);

create table tbl_voo (
    id number(9) primary key,
    origem varchar2(100) not null,
    destino varchar2(100) not null,
    escala number(1) not null,
    duracao number(4) not null,
    data date not null,
    frequenciaVooId number(9),
    constraint fk_frequencia_voo foreign key(frequenciaVooId) REFERENCES tbl_frequencia_voo(frequenciaVooId)
);

create table passagens (
    passagemId number(9) primary key,
    titular varchar2(80),
    tarifa number(10,2) not null,
    vooId number(9),
    constraint fk_voo_passagem foreign key(vooId) REFERENCES tbl_voo(id)
);

create table voosservicos (
    vooId number(9),
    servicoId number(9),
    constraint pk_voosservicos primary key (vooId, servicoId)
);