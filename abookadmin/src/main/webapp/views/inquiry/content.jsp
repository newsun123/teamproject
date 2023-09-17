<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#gongjiWrap{
		padding-bottom: 30px;
	}
	table{
		border-top: 2px solid #cecece;
	}
	table tr{
		height: 55px;
	}
	table tr td{
		border-bottom: 1px solid #e4e4e4;
		padding:0 10px;
	}
	table tr td:first-child {
		padding-left: 10px;
	    background: #f8f8fa;
	    width: 121px;
	    border-right: 1px solid #e4e4e4;
	    font-size: 15px;
	    font-family: 'NotoSansM';
	    color: #555;
	    letter-spacing: 1px;
	}
	table tr:nth-child(2){
		height: 300px;
	}
	table tr td#cont{
		vertical-align: top;
    	padding: 13px 10px;
	}
	#btn{
		text-align: center;
		padding: 30px 0;
	}
	#btn a{
		color: #fff;
	    text-align: center;
	    background: #4e68b9;
	    font-family: 'NotoSansM';
	    height: 50px;
	    width: 130px;
	    line-height:50px;
	    cursor: pointer;
	    margin: 0 2px;
	    border-radius: 3px;
	    display:inline-block;
	}
	.a{  /* 임의로 submit,button 버튼 만짐 */
		color: #fff;
	    text-align: center;
	    background: #4e68b9;
	    font-family: 'NotoSansM';
	    height: 50px;
	    width: 130px;
	    line-height:50px;
	    cursor: pointer;
	    margin: 0 2px;
	    border-radius: 3px;
	    display:inline-block;
	}
	#btn a.dis{
		background: #e0e3e6;
	    color: #6e7277;
	}
</style>
<script>
	function upForm() {
		document.getElementById("con").style.display="none";
		document.getElementById("upForm").style.display="block";
	}
	function cancelUp() {		
		document.getElementById("con").style.display="block";
		document.getElementById("upForm").style.display="none";
	}
</script>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>묻고 답하기</span></h2>
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
					<div id="gongjiWrap">				
						<table> 
							<tr>
								<td>제목</td>
								<td>${ivo.title}</td>
							</tr>
							<tr>
								<td>내용</td>
								<td class="tl" id="cont"> 
									${ivo.content}
								</td>
							</tr>
							<tr>	
								<td> 답변 </td>
								<td class="tl" id="cont">
								<c:if test="${mvo.content!=null}" >
									<span id="con">
									${mvo.content} 
									<input type="button" value=" 답변 수정" class="a" onclick="upForm()">
									</span>
									<span id="upForm" style="display:none;"> 
										<form method="post" action="updateOk">
										<input type="hidden" name="no" value="${mvo.no}">
										<input type="hidden" name="inno" value="${mvo.inno}">
										<input type="hidden" name="page" value="${page}">										<textarea name="content">${mvo.content}</textarea>
										<input type="submit" value="답변 수정" class="a">
										<input type="button" value="수정 취소" class="a" onclick="cancelUp()">
										</form>
									</span>
								</c:if>
								<c:if test="${mvo.content==null}">
									<form method="post" action="writeOk">
									<iput type="hidden" name="inno" value="${ivo.no}">
									<textarea name="content"></textarea>
								</c:if>
								</td>	
							</tr>
							<tr>
								<td>등록일</td>
								<td class="tl">${ivo.writeday}</td>
							</tr>
						 </table>
						<div id="btn">
							<a href="list?no=${ivo.no}&page=${page}" class="dis">목록 </a>
							<c:if test="${mvo.content==null}">
								<input type="submit" value="답변 등록" class="a">
								</form>
							</c:if>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>