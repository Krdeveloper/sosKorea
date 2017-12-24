create table sos_member(
	userid varchar(50) not null,
	userpw varchar(50) not null,
	email varchar(100),
	joindate timestamp default now(),
	secretmem boolean null,
	primary key(userid)
);

drop table member;

select *  from sos_member;

insert into sos_member(userid, userpw, email ) values('id2', 'pw', 'mail');

select now();

delete from sos_member where userid='id';

create table jobs(
	bno int not null auto_increment,
	title varchar(200) not null,
	content text null,
	userid varchar(50) not null,
	regdate timestamp not null default now(),
	viewcnt int default 0,
	/*agree int null,
	disagree int null,*/
	replycnt int null,
	primary key (bno),
	foreign key (userid) references sos_member (userid)
);

select *  from jobs;

drop table jobs;

insert into jobs(title, content, userid) values('title2', '새로운2', 'id1');


