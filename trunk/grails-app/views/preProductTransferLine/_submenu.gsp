		<a href="#create-branch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<!-- <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
				<li><g:link class="list" action="index" params="[isViewNew:true]"><g:message code="preProductTransferLine.submenu.listPreTran.label" args="${[params.listPreTran]}" /></g:link></li>
				<li><g:link class="create" action="transferto" params="[isViewTransfered:true]"><g:message code="preProductTransferLine.submenu.transferTo.label" args="${[params.listTransferTo]}" /></g:link></li>
				<li><g:link class="create" action="transferfrom" params="[isViewNew:true]"><g:message code="preProductTransferLine.submenu.transferFrom.label" args="${[params.listTransferFrom]}" /></g:link></li>
			</ul>
		</div> 