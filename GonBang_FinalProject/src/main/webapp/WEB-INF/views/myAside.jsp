<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style type="text/css" >
a{
	text-decoration: none; color: gray;
}
.MyPM{
	margin-bottom: 50px;
}
</style>

<section class="MyPM" style="width: 230px;">
<div class="MyProfile"  style="border-style:groove;" text-align ="center" >
	<img class="img-fluid1" src="resources/images/psa.jpg" 
						alt="사진설정" width="90px;"/> <br>
	<h5 style="margin-top: 40px;">${memberdto.m_grade}</h5>  
	<div style="margin-bottom: 50px;">${memberdto.m_name}님</div>   
						
	
	
</div>
<div class="MyMenu"  style="border-style: groove; text-decoration: none; padding-top: 100px;" >
           <ul>
               	 <li class="text"><a href="./m_productDelivery">주문/배송</a></li>
                    <ul>
                        <li><a href="./m_productDelivery">주문/배송 내역</a></li>
                        <li><a href="./m_productCancle">취소/교환/환불</a></li><br>
                    </ul>
                </li>
                <li><a href="../mypage/m_List.jsp">관심리스트</a>
                    <ul>
                        <li><a href="../mypage/m_List.jsp">관심작품</a></li>
                        <li><a href="../mypage/m_AuthorList.jsp">관심작가</a></li><br>
                    </ul>
                </li>
				<li><a href="../mypage/m_Coupon.jsp">쿠폰/적립금</a>
                    <ul>
                        <li><a href="../mypage/m_Coupon.jsp">쿠폰</a></li>
                        <li><a href="../mypage/m_Point.jsp">적립금</a></li><br>
                    </ul>
                </li>
                <li><a href="../mypage/m_Question.jsp">문의</a>
                    <ul>
                        <li><a href="../mypage/m_Question.jsp">문의내역</a></li><br>
                    </ul>
                </li>
                <li><a href="#">나의정보</a>
                    <ul>
                        <li><a href="#">회원등급</a></li>
						<li><a href="../mypage/m_Address.jsp">주소(배송지관리)</a></li>
                        <li><a href="./m_memberManagerFrm">회원정보 관리</a></li>   
                        <li><a href="../mypage/m_Drop.jsp">회원탈퇴</a></li>                     
                        <li><a href="../mypage/m_Card.jsp">카드 및 환불계좌 관리</a></li>

                    </ul>
                </li>
            </ul>
</div>
</section>
</html>
