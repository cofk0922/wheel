
<%@ page import="th.ac.chula.bsd.wheel.Appointment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'appointment.label', default: 'Appointment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		
		<script type="text/javascript">
   function showSpinner() {
      $('spinner').show();
   }
   function hideSpinner() {
      $('spinner').hide();
   }
   Ajax.Responders.register({
      onLoading: function() {
         showSpinner();
      },
      onComplete: function() {     
         if(!Ajax.activeRequestCount) hideSpinner();
      }
   });
</script>
	</head>
	<body>
		<a href="#list-appointment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<!-- <div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		 -->
		<div class="search">
			<g:form action="search">
				<g:hiddenField name="offset" value="${params.offset} = 0" />
				<g:hiddenField name="max" value="${params.max} = 10"/>
				<g:message code="default.search.label" default="Search Appointment"/>
				<g:textField name="keyword" value="${params.keyword}" />
				<g:submitToRemote update="searchresults" value="Search" url="[controller:'appointment', action:'search']"
				onLoading="showSpinner(true)" onComplete="showSpinner(false)">
				</g:submitToRemote>
			</g:form>
			<div id="spinner" style="display: none;">
   				<img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Loading..." width="16" height="16" />
			</div>
		</div>
		<g:render template="searchResults" />
	</body>
</html>
