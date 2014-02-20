
<%@ page import="th.ac.chula.bsd.wheel.MaxWheel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maxWheel.label', default: 'MaxWheel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-maxWheel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-maxWheel" class="content scaffold-list" role="main">
		
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
					</tr>
				</thead>
				<tbody>
					<br>
					 
					 
					 
					 
					    <g:uploadForm action="upload">
        <input type="file" name="myFile" />
        <input type="submit" />
    </g:uploadForm>
					
					<br>
					
					<g:if test ="${filename}">
					<g:img dir="images" file="${filename}" id="cropbox" />
					</g:if>
				</tbody>
			</table>
	
		</div>
	</body>
</html>
