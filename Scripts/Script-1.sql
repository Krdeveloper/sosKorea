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
	replycnt int default 0,
	primary key (bno),
	foreign key (userid) references sos_member (userid)
);

select *  from jobs;

insert into jobs(title, content, userid) values('tit1', 'con1', 'id1');

select * from jobs where bno>0 order by bno desc limit 20, 20;

insert into jobs(title, content, userid) (select title, content, userid from jobs);

create table jobs_reply(
	rno int not null auto_increment,
	bno int not null,
	replytext varchar(1000) not null,
	userid varchar(50) not null,
	regdate timestamp not null default now(),
	primary key(rno)
);
alter table jobs_reply add constraint fk_jobs
foreign key(bno) references jobs(bno);
alter table jobs_reply add constraint fk_member
foreign key(userid) references sos_member(userid);

select * from jobs_reply;

insert into jobs_reply(bno, replytext, userid) (select bno, replytext, userid from jobs_reply);

update jobs set replycnt =
(select count(rno) from jobs_reply
where bno = jobs.bno) where bno>0;
