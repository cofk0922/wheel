
<%
	branchlabel = message(code: 'userRole.label.args')
 %>
<g:set var="userObject" value="${th.ac.chula.bsd.security.User.findByUsername(sec.loggedInUserInfo(field:'username'))}"/>
<g:set var="userRoleEntityName" value="${message(code: 'userRole.label')}" />
		<a href="#create-userRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<!-- <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->				
				<sec:ifLoggedIn>
    			<sec:ifAllGranted roles="ROLE_SUPERADMIN">
    				<li><g:link class="list" action="index" controller="userRole"><g:message code="default.list.label" args="[userRoleEntityName]" /></g:link></li>
    				<li><g:link class="create" action="create" controller="userRole"><g:message code="default.create.label" args="[userRoleEntityName]" /></g:link></li>
     			</sec:ifAllGranted>
				</sec:ifLoggedIn>
				
				<li><a class="home" href="${createLink(uri: '/configMenu/')}"><g:message code="default.menu.setting.label"/></a></li>
			</ul>
		</div> 