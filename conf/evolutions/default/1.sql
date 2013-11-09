# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table ITEM (
  item_number               integer not null,
  constraint pk_ITEM primary key (item_number))
;

create table ORDER (
  order_number              integer not null,
  constraint pk_ORDER primary key (order_number))
;


create table ORDER_ITEM (
  my_order                       integer not null,
  my_item                        integer not null,
  constraint pk_ORDER_ITEM primary key (my_order, my_item))
;
create sequence ITEM_seq;

create sequence ORDER_seq;




alter table ORDER_ITEM add constraint fk_ORDER_ITEM_ORDER_01 foreign key (my_order) references ORDER (order_number) on delete restrict on update restrict;

alter table ORDER_ITEM add constraint fk_ORDER_ITEM_ITEM_02 foreign key (my_item) references ITEM (item_number) on delete restrict on update restrict;

# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists ITEM;

drop table if exists ORDER_ITEM;

drop table if exists ORDER;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists ITEM_seq;

drop sequence if exists ORDER_seq;

