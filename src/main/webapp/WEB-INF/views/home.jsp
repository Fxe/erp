<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<form:form method="GET" name="myForm" commandName="exampleForm" action="#">
<form:input path="name1"/>
<form:select path="country">
	<form:option value="-" label="--Select Country"/>
	<form:options items="${data}"/>
</form:select>
</form:form>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
