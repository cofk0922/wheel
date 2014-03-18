<g:set var="userObject" value="${th.ac.chula.bsd.security.User.findByUsername(sec.loggedInUserInfo(field:'username'))}"/>
		<a href="#create-branch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<!-- <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->				
				<sec:ifLoggedIn>
    			<sec:ifAllGranted roles="ROLE_SUPERADMIN">
    				<li><g:link class="list" action="index" controller="branch"><g:message code="default.list.branch.label" default="Branch List" /></g:link></li>
        			<li><g:link class="create" action="create" controller="branch"><g:message code="default.new.branch.label" default="New Branch" /></g:link></li>
     			</sec:ifAllGranted>
				</sec:ifLoggedIn>
				
				<li><g:link class="list" action="show" id='${userObject.branch.id}' controller="branch"><g:message code="default.show.branch.label" default="Branch Info" /></g:link></li>
				
				<li><g:link class="list" action="index" controller="workDay"><g:message code="default.list.workday.label" default="Work Day List" /></g:link></li>
				
				<li><a class="home" href="${createLink(uri: '/configMenu/')}"><g:message code="ตั้งค่าระบบ"/></a></li>
			</ul>
		</div> 