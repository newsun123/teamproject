<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#MypageWrap{
		padding-bottom:30px; 
	}
	table{
		border-bottom: 1px solid #ddd;
    	border-top: 2px solid #cecece;
    	margin-top:30px;
		text-align: center;
	}
	table tr td {
    	border-bottom: 1px solid #ddd;
    	letter-spacing: 0.5px;
	}
	table tr:last-child td{
		border-bottom: none;
	}
	table tr:first-child td {
	    background-color: #f9f9fb;
	    border-bottom: 1px solid #ddd;
	    height: 55px;
	    color: #333;
	    font-family: 'NotoSansM';
	    text-align: center;
	} 
	table tr {
		height:60px;
	}
	table tr:first-child{
		height: 55px;
	}
	.tt{
		width: 470px;
		padding-left: 38px;
    	padding-right: 10px;
		box-sizing: border-box;
		height: 100%;
		line-height: 55px;
		text-align: left;
		overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	table tr td.no{
		color: #666;
    	font-size: 14px;
    	text-align: center;
	}
	/*page버튼처리*/
	#btWrap {
		margin-top: 30px;
		position: relative;
		height: 50px;
		text-align: center;
	}	
	#pageCon {
		margin: auto;
	}	
	#pageCon a {
		display: inline-block;
		width: 30px;
		font-size: 14px;
		color: #666;
		line-height: 30px;
		text-align: center;
		vertical-align: top;
	}	
	#pageCon .btnPage {
		width: 30px;
		height: 30px;
		line-height: 30px;
		border: 1px solid #ddd;
		background: url(/static/img/common/arr_sp.png) 50% 0 no-repeat;
	}	
	#pageCon .btnPage.prev {
		margin-right: 5px;
		background-position-y: -27px;
	}	
	#pageCon .btnPage.next {
		margin-left: 5px;
		background-position-y: -52px;
	}	
	#pageCon .btnPage.last {
		background-position-y: -77px;
	}
	#pageCon .btnPage.dis {
		pointer-event: none;
		cursor: default;
	}
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>마이페이지</span></h2>
				<ul id="lnb">
					<li><a href="/mypage/mypage"><span>회원정보수정</span></a></li>
					<li><a href="/mypage/checkReserveSeat"><span>좌석예약현황</span></a></li>
					<li><a href="/mypage/bookreserve"><span>도서예약현황</span></a></li>
					<li class="on"><a href="/mypage/loanlist"><span>도서대출이력</span></a></li>
					<li><a href="/mypage/myjjim">도서찜리스트<span></span></a></li>
					<li><a href="#"><span>문의현황</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서대출이력</h3>
					<p>마이페이지&nbsp;&nbsp;>&nbsp;&nbsp;도서 대출이력</p>
				</div>
				<div id="contents">
					<div id="MypageWrap">
						<table>
							<tr>
								<td>도서명</td>
								<td>출판사</td>
								<td>저자</td>
								<td>대출일</td>
								<td>반납일</td>
							</tr>
						<c:if test="${mapall.size()==0}">
							<tr>
								<td colspan="5" class="no">※ 대출이력이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${mapall.size()!=0}">
						<c:forEach items="${mapall}" var="map">
							<tr>
								<td width="470"><div class="tt">${map.title}</div></td>
								<td width="200">${map.publi}</td>
								<td width="200">${map.writer}</td>
								<td width="150">${map.rental}</td>
								<td width="150">${map.writeday}</td>
							</tr>
						</c:forEach>
						</c:if>
						</table>
						<div id="btWrap">
							<div id=pageCon>
								<c:if test="${pstart!=1}">
									<a href="loanlist?page=${pstart-1}" class="btnPage"></a>
								</c:if>
								<c:if test="${pstart==1}">
									<a class="btnPage dis"></a>
								</c:if>

								<c:if test="${page!=1}">
									<a href="loanlist?page=${page-1}" class="btnPage prev"></a>
								</c:if>
								<c:if test="${page==1}">
									<a class="btnPage dis prev"></a>
								</c:if>

								<c:forEach begin="${pstart}" end="${pend}" var="i">
									<c:if test="${page!=i}">
										<a href="loanlist?page=${i}">${i}</a>
									</c:if>
									<c:if test="${page==i}">
										<a href="loanlist?page=${i}"
											style="background-color: #555; color: #fff">${i}</a>
									</c:if>
								</c:forEach>

								<c:if test="${page!=chong}">
									<a href="loanlist?page=${page+1}" class="btnPage next"></a>
								</c:if>
								<c:if test="${page==chong}">
									<a class="btnPage next dis"></a>
								</c:if>

								<c:if test="${pend!=chong}">
									<a href="loanlist?page=${pend+1}" class="btnPage last"></a>
								</c:if>
								<c:if test="${pend==chong}">
									<a class="btnPage last dis"></a>
								</c:if>
							</div>
						</div>			
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>