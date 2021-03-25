<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=euc-kr" %>

	
<c:if test="${ resultPage.beginUnitPage < 6 }">
		�� ����
</c:if>
<c:if test="${ resultPage.beginUnitPage >= 6}">
		<a href="javascript:fncGetList('${ resultPage.beginUnitPage - resultPage.pageUnit}')">�� ����</a>
</c:if>

<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
	<c:if test="${i ne resultPage.currentPage }">
		<a href="javascript:fncGetList('${ i }');">${ i }</a>
	</c:if>
 
	<c:if test="${i eq resultPage.currentPage}">
		<a><font size="3">${ i }</font></a>
	</c:if>
</c:forEach>

<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
		���� ��
</c:if>
<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
		<a href="javascript:fncGetList('${resultPage.beginUnitPage + resultPage.pageUnit }')">���� ��</a>
</c:if>



