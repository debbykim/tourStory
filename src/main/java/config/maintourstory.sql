/* Drop Tables */
DROP TABLE tourstory_image CASCADE CONSTRAINTS;
DROP TABLE board_reply CASCADE CONSTRAINTS;
DROP TABLE myschedule CASCADE CONSTRAINTS;
DROP TABLE tourstory_album CASCADE CONSTRAINTS;
DROP TABLE tourstory_board CASCADE CONSTRAINTS;
DROP TABLE tourstory_member CASCADE CONSTRAINTS;
DROP TABLE tourstory_qna CASCADE CONSTRAINTS;

select b.* from (select rownum as rowm,a.* from
	   (select * from tourstory_board where upper(BOARD_subject) like upper('%j%') or upper(board_content) like upper('%j%')
    or upper(member_board_nick) like upper('%j%'))a)b
    where b.rowm>=1 and b.rowm<=5


select * from tourstory_board where board_num=24
/* select */
select * from board_reply;
select * from myschedule;
select * from tourstory_album;
select * from tourstory_board;
select * from tourstory_member;
select * from tourstory_qna;
select * from tourstory_image;
delete from myschedule 
/*qna sequence */
create sequence tourstory_qna_seq start with 1 increment by 1;
create sequence tour_board_seq start with 1 increment by 1;
create sequence tour_reply_seq start with 1 increment by 1;

drop sequence tourstory_qna_seq;
drop sequence tour_board_seq;
drop sequence tour_reply_seq;


/* Create Tables */
CREATE TABLE tourstory_image
(
	board_subject varchar2(200),
	board_image varchar2(100)
);

CREATE TABLE board_reply
(
	board_num number NOT NULL,
	member_reply_nick varchar2(50),
	reply_content varchar2(500),
	reply_num number,
	reply_date date
);

CREATE TABLE myschedule
(
	member_schedule_nick varchar2(50),
	schedule_name varchar2(200),
	schedule_title varchar2(100) NOT NULL,
	schedule_address varchar2(400) NOT NULL,
	schedule_tel varchar2(15) NOT NULL,
	schedule_latitude varchar2(50) NOT NULL,
	schedule_longitude varchar2(50) NOT NULL,
	schedule_num number,
	schedule_day varchar2(50)
);


CREATE TABLE tourstory_album
(
	board_num number NOT NULL,
	album_num number NOT NULL,
	album_upload varchar2(300),
	album_content varchar2(2000)
);

CREATE TABLE tourstory_board
(
	board_num number NOT NULL,
	member_board_nick varchar2(50),
	board_subject varchar2(200),
	board_date date,
	board_readcount number,
	board_upload varchar2(300),
	board_content varchar2(4000),
	board_category varchar2(20),
	board_like number,
	board_close number,
	PRIMARY KEY (board_num)
);


CREATE TABLE tourstory_member
(
	member_id varchar2(20) NOT NULL,
	member_pass varchar2(30),
	member_nickname varchar2(50),
	member_email varchar2(50)
);


CREATE TABLE tourstory_qna
(
	qna_num number NOT NULL,
	member_qna_nick varchar2(50),
	qna_subject varchar2(50) NOT NULL,
	qna_content varchar2(2000),
	qna_date date,
	qna_readcount number,
	qna_ref_num number,
	qna_re_level number,
	qna_re_step number,
	qna_category varchar2(20),
	PRIMARY KEY (qna_num)
);
/* Create Foreign Keys */
ALTER TABLE board_reply
	ADD FOREIGN KEY (board_num)
	REFERENCES tourstory_board (board_num)
;


ALTER TABLE tourstory_album
	ADD FOREIGN KEY (board_num)
	REFERENCES tourstory_board (board_num)
;

/*
 * on delete cascade : 쉽게 말해서 부모의 데이터가 삭제되면 폭포수 처럼 주르르르 연관된 데이터는 다 사라진다 ~ // cascade(폭포)
 * 위 조건은 게시판을 삭제하면 그 안에있는 댓글도 모두 삭제하고자 하는 용도로 사용된다. 
  on delete set null : 이 조건은 cascade 조건과 다르게 부모의 데이터가 사라지면 연관된 데이터는 사라지지 않고, null값이 들어가게 된다.
 * 위 조건은 예를 들어 회원이 탈퇴되더라도 게시글은 남기고 싶을 때 사용한다. */
