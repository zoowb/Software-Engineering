use market;

# ================= User =================
# 사용자 관련 Query

# 회원가입
insert into user(u_email, u_pw, u_name, u_phone) values ("ksh@naver.com", "1234", "김상호", "01012345678");

# 회원정보 수정
update user 
set u_pw = "2345"
where u_email = "ksh@naver.com" and u_name = "김상호" and u_phone = "01012345678";

# 회원탈퇴
delete  
from user
where u_email = "ksh@naver.com" and u_pw = "2345";

# 사용자 정지
update user
set u_report = 1
where u_email = "";

# 사용자 조회
select *
from user;


# ================= Product =================
# 상품 관련 Query

SELECT * FROM market.product;
# 상품 등록
insert into product(p_thumnail, p_image, p_category1, p_category2, p_title, p_price, p_listprice, p_size, p_status, p_puton_count, p_dirty, p_contents, User_u_id) 
values (null, null, "카테고리1", "카테고리2", "블라우스 팝니다.", 30000, 100000, "S", "좋음", 10, "N", "많이 입지 않은 블라우스 팝니다.", 1);

# 개별 상품 디테일 
select * 
from product 
where p_id = 1;

# 상품 구매 목록
select *
from product p
where p.p_id = (
	select o.Product_p_id
    from user u join market.order o
	where u.u_id = o.User_u_id and u.u_id = 1);
    
# 상품 판매 목록
select p.*
from user u join product p
where u.u_id = p.User_u_id and u.u_id = 1;

# HOT item 상위 N개 선택하기
select * 
from product
order by p_view DESC
LIMIT 10;

# 카테고리와 가격 범위 필터에 맞는 상품 반환
# 1 -> 최근 등록순
select * 
from product
where p_price between 0 and 100000
order by p_date DESC;

# 2 -> 조회가 많은 순
select * 
from product
where p_price between 0 and 100000
order by p_view DESC;

# ================= Announce =================
# 공지사항 관련 Query

# 공지사항 리스트 
select * from announce;

# 공지사항 세부조회
select * 
from announce
where post_id = 1;

# 공지사항 등록
insert into announce(post_title, post_contents)
values ("", "");

# 공지사항 변경
update announce
set post_title = "" and post_contents = ""
where post_id = 1;

# 공지사항 삭제
delete from announce
where post_id = 1;






