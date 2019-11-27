<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Persons Manage Page</title>
<style>
table {
	background: #262626;
	color: #fff;
}

.tabela {
background: #262626;
	color: #fff;
	border-radius: 26px;
	padding: 16px;
}
</style>
</head>

<body>
	<%-- Person Add/Edit logic --%>
	<c:if test="${requestScope.error ne null}">
		<strong style="color: red;"><c:out
				value="${requestScope.error}"></c:out></strong>
	</c:if>
	<c:if test="${requestScope.success ne null}">
		<strong style="color: green;"><c:out
				value="${requestScope.success}"></c:out></strong>
	</c:if>
	<c:url value="/addPerson" var="addURL"></c:url>
	<c:url value="/editPerson" var="editURL"></c:url>

	<%-- Edit Request --%>
	<c:if test="${requestScope.person ne null}">
		<form action='<c:out value="${editURL}"></c:out>' method="post">
			ID: <input type="text" value="${requestScope.person.id}"
				readonly="readonly" name="id"><br> Nome: <input
				type="text" value="${requestScope.person.name}" name="name"><br>
			Pais: <input type="text" value="${requestScope.person.country}"
				name="country"><br> <input type="submit"
				value="Edit Person">
		</form>
	</c:if>

	<%-- Add Request --%>
	<c:if test="${requestScope.person eq null}">
		<form action='<c:out value="${addURL}"></c:out>' method="post">
			Nome: <input type="text" name="name"><br> Pais: <input
				type="text" name="country"><br> <input type="submit"
				value="Add Person">
		</form>
	</c:if>

	<%-- Persons List Logic --%>
	<c:if test="${not empty requestScope.persons}">
		<div class="tabela">
		<table style="width:100%">
			<tbody>
				<tr style="background: #5f5f5f; color: #34de80; border: none">
					<th>ID</th>
					<th>Nome</th>
					<th>Pais</th>
					<th>Editar</th>
					<th>Excluir</th>
				</tr>
				<c:forEach items="${requestScope.persons}" var="person">
					<c:url value="/editPerson" var="editURL">
						<c:param name="id" value="${person.id}"></c:param>
					</c:url>
					<c:url value="/deletePerson" var="deleteURL">
						<c:param name="id" value="${person.id}"></c:param>
					</c:url>
					<tr>
						<td><c:out value="${person.id}"></c:out></td>
						<td><c:out value="${person.name}"></c:out></td>
						<td><c:out value="${person.country}"></c:out></td>
						<td><a
							href='<c:out value="${editURL}" escapeXml="true"></c:out>'>Edit</a></td>
						<td><a
							href='<c:out value="${deleteURL}" escapeXml="true"></c:out>'>Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		
	</c:if>
</body>
</html>