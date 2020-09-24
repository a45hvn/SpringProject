<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring Board</title>
<tiles:insertAttribute name="asset"></tiles:insertAttribute>
<style>

</style>
</head>
<body>

	<main>
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
		<tiles:insertAttribute name="submenu"></tiles:insertAttribute>
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</main>
</body>
<script>

</script>
</html>