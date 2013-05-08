<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  lol
</h1>

<img src="<s:url value='/resources/img/erp_LOGO.png' />" />
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
