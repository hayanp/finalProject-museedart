<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#title{
	width:165px;
	border-top: 7px solid #563D39;
	margin-top:70px;
	margin-left:70px;
	font-weight:700;
	font-size: 40px;
	margin-bottom: 50px;
	}
	#table1 tr:first-child {
	border-top: 2px solid #563D39;
    }
    #table1 tr:nth-child(2) {
	border-top: 2px solid white;
    }
    #boardTitle{
    font-size: 30px;
    font-weight: 600;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="container">
		<div id="title">공지사항</div>
		<table id="table1" class="table">
			<tr>
				<td id="boardTitle" colspan="3">${b.boardTitle }</td>
			</tr>
			<tr>
				<td>등록일 &nbsp;&nbsp;&nbsp;&nbsp;  ${b.regDate }</td>
				<td>첨부파일</td>
				<td>
				<c:forEach items="${b.list }" var="f">
				<a href="/fileDown.do?filename=${f.filename }&filepath=${f.filepath }">${f.filename }</a>
				</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="3">
				${b.boardContent }
				</td>
			</tr>
		</table>
		<c:if test="${sessionScope.m.memberLevel eq 0 }">
		<a class="btn" href="/boardDelete.do?boardType=1&boardNo=${b.boardNo }">글삭제</a>
		<a class="btn" href="/boardUpdateFrm.do?boardNo=${b.boardNo }">글수정</a>
		</c:if>
		<div>
		<div>다음글&nbsp;
			<a href="/boardView.do?boardType=1&boardNo=${info.nextNo}" onclick="return chkNext();">
			<input type="hidden" id="next" value="${info.nextNo }">${info.nextTitle }
			</a>
		</div>
		<div>이전글&nbsp;
			<a href="/boardView.do?boardType=1&boardNo=${info.prevNo}" onclick="return chkPrev();">
			<input type="hidden" id="prev" value="${info.prevNo }">${info.prevTitle }
			</a>
		</div>
		<a class="btn" href="/additionBoard.do?boardType=1&reqPage=1">글목록</a>
		</div>
	</div>
	<script>
	function chkPrev(){
		var prev = $("#prev").val();
		if(prev==0){
			return false;
		}
	}
	function chkNext(){
		var next = $("#next").val();
		if(next==0){
			return false;
		}
	}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>