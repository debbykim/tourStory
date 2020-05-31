CREATE TABLE tourstory_board
(
	member_id varchar2(20) NOT NULL,
	board_num number NOT NULL,
	board_subject varchar2(50),
	board_date date,
	board_readcount number,
	board_upload varchar2(300),
	board_content varchar2(2000),
	board_category varchar2(20),
	board_like number,
	PRIMARY KEY (board_num)
);

select * from TOURSTORY_BOARD
select * from board_reply

delete from TOURSTORY_BOARD;
delete from board_reply;

drop table board_reply;

drop sequence tour_board_seq;
drop sequence tour_reply_seq;
CREATE TABLE board_reply

(
	board_num number NOT NULL,
	member_id varchar2(20),
	reply_content varchar2(500),
	reply_num number,
	reply_date date
);

create sequence tour_board_seq start with 1 increment by 1;
create sequence tour_reply_seq start with 1 increment by 1;

insert into tourstory_board 
values(1,tour_board_seq.nextval,'제목',sysdate,0,'132bed90-559c-4db9-be63-82c5e787244e_5af8e39e05604a92f0c676a37ed859e6','내용 테스트.......','1',1)



  select b.* from (select rownum as rowm,a.* from 
	(select * from board_reply order by reply_num desc)a)b
			where b.rowm>=1 and b.rowm<=5
			
			
select * from tourstory_board 
where upper(BOARD_subject) like upper('%111%') or upper(board_content) like upper('%111%')






