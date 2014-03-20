<g:set var="nutEntity" value="${message(code: 'nut.label')}" />
<g:set var="wheelEntity" value="${message(code: 'maxwheel.label')}" />
		<a href="#create-branch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<!-- <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
				<li><g:link class="list" action="index" params="${[prodID:params.prodID, prodType:params.prodType ]}"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create" params="${[prodID:params.prodID, prodType:params.prodType ]}" ><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				
				<g:if test="${params.prodType == 'NUT'}">
				<li><g:link class="home" action="show" controller="nut" id="${params.prodID}"><g:message code="default.show.label" args="[nutEntity]" /></g:link></li>
				</g:if>
				<g:elseif test="${params.prodType == 'WHEEL' }">
				<li><g:link class="home" action="show" controller="maxwheel" id="${params.prodID }"><g:message code="default.show.label" args="[wheelEntity]" /></g:link></li>
				</g:elseif>
				<g:else>
					<li>Display	${params.prodType }</li>
				</g:else>
				<li><a class="home" href="${createLink(uri: '/configMenu/')}"><g:message code="default.menu.setting.label" /></a></li>
			</ul>
		</div> 