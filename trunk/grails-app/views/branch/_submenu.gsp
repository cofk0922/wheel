<%@page import="org.eclipse.jdt.internal.compiler.codegen.BranchLabel"%>
<%
	branchlabel = message(code: 'branch.label.args')
 %>
<g:set var="userObject" value="${th.ac.chula.bsd.security.User.findByUsername(sec.loggedInUserInfo(field:'username'))}"/>
<g:set var="branchEntityName" value="${message(code: 'branch.label')}" />
<g:set var="workdayEntityName" value="${message(code: 'workDay.label')}" />
		<a href="#create-branch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<!-- <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->				
				<sec:ifLoggedIn>
    			<sec:ifAllGranted roles="ROLE_SUPERADMIN">
    				<li><g:link class="list" action="index" controller="branch"><g:message code="default.list.label" args="[branchEntityName]" /></g:link></li>
        			<li><g:link class="create" action="create" controller="branch"><g:message code="default.new.label" args="[branchEntityName]" /></g:link></li>
     			</sec:ifAllGranted>
				</sec:ifLoggedIn>
				
				<li><g:link class="list" action="show" id='${userObject.branch.id}' controller="branch"><g:message code="default.show.label" args="[branchEntityName]" /></g:link></li>
				
				<li><g:link class="list" action="index" controller="workDay"><g:message code="default.list.label" args="[workdayEntityName]" /></g:link></li>
				
				<li><a class="home" href="${createLink(uri: '/configMenu/')}"><g:message code="default.menu.setting.label"/></a></li>
			</ul>
		</div> 