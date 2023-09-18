<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#inquiryWrap{
		padding-bottom: 30px;
		min-height: 380px;
	}
	form{
		width: 100%;
	    display: block;
	}
	h4{
		font-size: 25px;
	    font-family: 'NotoSansM';
	    text-align: center;
	    padding:30px 0;
	}
	table{
		border-top: 2px solid #cecece;
		text-align: center;
	}
	table tr{
		height: 60px;
	}
	table tr:first-child{
		height: 55px;
	}
	table tr:first-child{
		background: #f8f8fa;
	}
	table tr td{
		border-bottom: 1px solid #e4e4e4;
		letter-spacing: 0.5px;
	}
	#btnCon{    
		text-align: right;
	}
	#btnCon a{
		display: inline-block;
	    border: 1px solid #93765a;
	    color: #93765a;
	   	width:110px;
	    line-height: 45px;
	    height: 45px;
	    margin-bottom: 30px;
	    position: absolute;
	    top: 0;
	    right: 0;
	    font-size: 15px;
	    text-align: center;
	}
	table img{
	    width: 21px;
	}
	table tr td.no{
		color: #666;
    	font-size: 14px;
    	text-align: center;
	}
	.ta{
		width: 670px;
	    box-sizing: border-box;
	    height: 100%;
	    line-height: 60px;
	    text-align: left;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    padding-left: 30px;
	}
	/*page버튼처리*/
	#btWrap{
	    margin-top: 30px;
	    position: relative;
	    height: 50px;
	    text-align:center;
	}
	#pageCon{
    	margin: auto;
	}
	#pageCon a{
		display: inline-block;
	    width: 30px;
	    font-size: 14px;
	    color: #666;
	    line-height: 30px;
	    text-align: center;
	    vertical-align: top;
	}
	#pageCon .btnPage{
		width: 30px;
	    height: 30px;
	    line-height: 30px;
	    border: 1px solid #ddd;
	    background: url(/static/img/common/arr_sp.png) 50% 0 no-repeat;
	}
	#pageCon .btnPage.prev{
		margin-right: 5px;
    	background-position-y: -27px;
	}
	#pageCon .btnPage.next{
		margin-left: 5px;
    	background-position-y: -52px;
	}
	#pageCon .btnPage.last{
		background-position-y: -77px;
	}
	#pageCon .btnPage.dis{
		pointer-event:none;
		cursor:default;
	}
	#search{
		padding:10px 20px;
		border-radius:5px;
		color:#fff;
		margin-bottom:40px;
		width:100px;
		background:#93765a;
	}
	#searchCon{
		width:630px;
		position:relative;
		right:0;
		display:flex;
		justify-content:space-between;
		align-items:center;
	}
	#select{
		display: inline-block;
	    width: 148px;
	    position: relative;
	    height: 48px;
	    border: 1px solid #e2e2e2;
	    background-color: #fff;
	}
	#select .selected{
		display: flex;
	    justify-content: space-between;
	    padding: 0;
	    cursor: pointer;
	}
	#select .selected_value{
		display: inline-block;
	    font-size: 16px;
	    width: calc(100% - 60px);
	    line-height: 44px;
	    text-align: left;
	    margin-left: 18px;
	}
	#select .arrow{
		width: 42px;
   		background: url(/static/img/common/ic_arrow.png) no-repeat 50% 50%;
	}
	#select ul{
	    width: 148px;
	    border: 1px solid #d6dae6;
	    position: absolute;
	    left: -1px;
	    z-index: 999;
	    background: #fff;
	    border-top: none;
	    
	    top: 47px;	
	    display: none;
	}
	#select ul li{
	    font-size: 16px;
	    padding: 0 20px;
	    line-height: 38px;
	    height: 38px;
	    border-bottom: 1px solid #eee;
	    cursor:pointer;
	}
	#select ul li:last-child{
		border:none;
	}
	#select ul li:hover{
		display: block;
		background-color:#ebeef7;
	}
	input.searchtext{
		border-radius: 0!important;
	    height: 48px!important;
	    vertical-align: top!important;
	    width: 500px;
	}
</style>
<script>
	window.onload=function(){
		<c:if test="${type!=null}">
		   <c:if test="${type=='title'}">
		     <c:set var="aa" value="제목"/>
		   </c:if>
		   <c:if test="${type=='content'}">
		     <c:set var="aa" value="내용"/>
		   </c:if>
			<c:if test="${type=='aa'}">
				<c:set var="aa" value="전체"/>
			</c:if>
			document.getElementById("sv").innerText="${aa}";
		</c:if>
		 
	}
	var schk=0;
	function selectView(){
		
		if(schk==0){
			document.getElementById("type").style.display="block";
			schk=1;
		}else{
			document.getElementById("type").style.display="none";
			schk=0;
		}
	}
	function inputWr(txt){
 
		if(txt=="전체"){
			document.getElementsByClassName("selected_value")[0].innerText="전체";
			document.getElementById("seltype").value="aa";  // titlewriterpubli
			// aa로 value값을 줘서 impl
		}
		else if(txt=="제목"){
			document.getElementsByClassName("selected_value")[0].innerText="제목";
			document.getElementById("seltype").value="title";
		}else if(txt=="내용"){
			document.getElementsByClassName("selected_value")[0].innerText="내용";
			document.getElementById("seltype").value="content";
		}
		document.getElementById("type").style.display="none";
		schk=0;
	}
</script>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2>
					<span>열린공간</span>
				</h2>
				<ul id="lnb">
					<li><a href="/gongji/list"><span>공지사항</span></a></li>
					<li class="on"><a href="/inquiry/list"><span>문의사항</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>문의사항</h3>
					<p>열린공간&nbsp;&nbsp;>&nbsp;&nbsp;문의사항</p>
				</div>
				<div id="contents">
					<div id="inquiryWrap">
					<form name="iform" method="post" action="list">
							<input type="hidden" value="${type}" name="type" id="seltype">
								<input type="hidden" value="${keyword}">
								<div id="select">
									<div class="selected" onclick="selectView()">
										<div class="selected_value" id="sv">전체</div>		
										<div class="arrow"></div>
									</div>
									<ul id="type">
										<li class="option" id="notype" onclick="inputWr('전체')">전체</li>
										<li class="option" id="title" onclick="inputWr('제목')">제목</li>
										<li class="option" id="content" onclick="inputWr('내용')">내용</li>
									</ul>
								</div>
								<input type="text" class="searchtext" name="keyword" maxlength="100" placeholder="검색어 입력" value="${keyword}">
								<input type="submit" id="search" class="searchtext" value="검색">
						</form>
						<div id="btnCon">
						<c:if test="${userid!=null}">
							<a href="/inquiry/write">글쓰기</a>
						</c:if>
						<c:if test="${userid==null}">
							<a href="/member/login?ichk=1" onclick="alert('비로그인 시 작성할 수 없습니다.')"><span>글쓰기</span></a>
						</c:if>
						</div>		
						<table>
							<tr>
								<td width="670">제목</td>
								<td width="180">작성자</td>
								<td width="190">등록일</td>
								<td width="130">상태처리</td>
							</tr>	
						<c:if test="${empty ilist}">
								<tr>
									<td colspan="5" align="center" class="no">※ 일치하는 검색 기록이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${! empty ilist}">					
						<c:forEach items="${ilist}" var="ivo">
							<tr> 
								<td>
									<div class="ta">
									<c:if test="${userid==null}">
										<a href="/member/login?ichk=1" onclick="alert('비로그인 시 확인할 수 없습니다.')">${ivo.title}</a>
									</c:if>
									<c:if test="${userid!=null}">
										<a href="readnum?no=${ivo.no}&page=${page}">${ivo.title}</a>
									</c:if>
									</div> 
								</td>
								<td>${ivo.userid}</td>	
								<td>${ivo.writeday}</td>  
								<td>
								<c:if test="${ivo.state==0}">
									답변대기
								</c:if>
								<c:if test="${ivo.state==1}">
									답변완료
								</c:if>
								</td>  
							</tr>
						</c:forEach>
						</c:if>							
						</table>
						<div id="btWrap">
						<c:if test="${!empty ilist}">
							<div id=pageCon>
							<c:if test="${pstart!=1}">
								<a href="list?page=${pstart-1}" class="btnPage"></a>
							</c:if>
							<c:if test="${pstart==1}">
								<a class="btnPage dis"></a> 
							</c:if>
							
							<c:if test="${page!=1}">
								<a href="list?page=${page-1}" class="btnPage prev"></a>
							</c:if>
							<c:if test="${page==1}">
								<a class="btnPage dis prev"></a>
							</c:if>
							
							<c:forEach begin="${pstart}" end="${pend}" var="i">
								<c:if test="${page!=i}">
									<a href="list?page=${i}">${i}</a>
								</c:if>
								<c:if test="${page==i}">
									<a href="list?page=${i}" style="background-color: #555;color:#fff">${i}</a>
								</c:if>
							</c:forEach>
						
							<c:if test="${page!=chong}">
								<a href="list?page=${page+1}" class="btnPage next"></a>
							</c:if>
							<c:if test="${page==chong}">
								<a class="btnPage next dis"></a>
							</c:if>
							
							<c:if test="${pend!=chong}">
								<a href="list?page=${pend+1}" class="btnPage last"></a>
							</c:if>
							<c:if test="${pend==chong}">
								<a class="btnPage last dis"></a> 
							</c:if>	
							</div>
						</c:if>
						<c:if test="${empty ilist}">
						</c:if>
						</div>							
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>