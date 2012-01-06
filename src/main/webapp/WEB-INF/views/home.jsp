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
		<script type="text/javascript" src="<c:url value="/resources/jquery-1.7.1.min.js" />" ></script>
		<script>
			MvcUtil = {};
			MvcUtil.showSuccessResponse = function (text, element) {
				MvcUtil.showResponse("success", text, element);
			};
			MvcUtil.showErrorResponse = function showErrorResponse(text, element) {
				MvcUtil.showResponse("error", text, element);
			};
			MvcUtil.showResponse = function(type, text, element) {
				var responseElementId = element.attr("id") + "Response";
				var responseElement = $("#" + responseElementId);
				if (responseElement.length == 0) {
					responseElement = $('<span id="' + responseElementId + '" class="' + type + '" style="display:none">' + text + '</span>').insertAfter(element);
				} else {
					responseElement.replaceWith('<span id="' + responseElementId + '" class="' + type + '" style="display:none">' + text + '</span>');
					responseElement = $("#" + responseElementId);
				}
				responseElement.fadeIn("slow");
			};
			MvcUtil.xmlencode = function(xml) {
				//for IE 
				var text;
				if (window.ActiveXObject) {
				    text = xml.xml;
				 }
				// for Mozilla, Firefox, Opera, etc.
				else {
				   text = (new XMLSerializer()).serializeToString(xml);
				}			
				    return text.replace(/\&/g,'&'+'amp;').replace(/</g,'&'+'lt;')
			        .replace(/>/g,'&'+'gt;').replace(/\'/g,'&'+'apos;').replace(/\"/g,'&'+'quot;');
			};
		</script>
		<script type="text/javascript">
			$('document').ready(function() {
				$("form.readJsonForm").submit(function() {
						var form = $(this);
						var button = form.children(":first");
						var data = form.hasClass("invalid") ?
								"{ \"foo\": \"bar\" }" : 
								"{ \"foo\": \"bar\", \"fruit\": \"apple\" }";
						$.ajax({ type: "POST", url: form.attr("action"), data: data, contentType: "application/json", dataType: "text", success: function(text) { MvcUtil.showSuccessResponse(text, button); }, error: function(xhr) { MvcUtil.showErrorResponse(xhr.responseText, button); }});
						return false;
				});
			});
		</script>
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