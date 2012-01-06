<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	<head>
		<title>Home</title>
		<style type="text/css" media="screen">
			a {
				text-decoration: none;
				font-family: Monaco, serif;
				font-size: 12px;
				color: black;
			}
			
			a:hover {
				color: #00FF00;
			}
			
			#echo {
				background: #FFCC66;
				padding: 10px 10px;
				width: 150px;
				border-radius: 10px;
				margin: auto;
			}
			
		</style>
	</head>
	<body>
		<div id="echo">
			<a id="byPath" href="<c:url value="/mapping/path" />">GET Controller say</a><br />
			<a id="byParameter" href="<c:url value="/mapping/parameter?foo=h" />">GET Controller say (by parameter)</a><br />
			<a id="byParameterAll" href="<c:url value="/mapping/parameter?test=0" />">GET Controller say (by parameter is not foo)</a><br />
			<a id="byMethod" href="<c:url value="/mapping/method?test=0" />">GET Controller say (by method)</a><br />
			<form id="byConsumes" action="<c:url value="/mapping/consumes" />" method="POST">
				<input id="byConsumesSubmit" type="submit" value="By Consumes" />
			</form>
			<a id="byProduces" href="<c:url value="/mapping/produces" />">POST Produces say</a>
		</div>
	</body>
</html>