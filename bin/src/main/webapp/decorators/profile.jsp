<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url value="/resources/" var="URL"></c:url>
<!DOCTYPE html>
<html lang="fr">
<head>


<!-- Site meta -->
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${URL}css/header.css" />
<link rel="stylesheet" href="${URL}css/profile.css" />
<title>Profile</title>



<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">



</head>
<body>

	<%@ include file="/common/header.jsp"%>




	<!-- body -->
	<sitemesh:write property='body'></sitemesh:write>
	<!-- body -->

	<!--=== Footer v4 ===-->

	<%-- <jsp:include page="/common/footer.jsp"></jsp:include> --%>

	<!--=== End Footer v4 ===-->





</body>
</html>