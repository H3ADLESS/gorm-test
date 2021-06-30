
<%@ page import="gormtest.Container" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'container.label', default: 'Container')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-container" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-container" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list container">
			
				<g:if test="${containerInstance?.slot1}">
				<li class="fieldcontain">
					<span id="slot1-label" class="property-label"><g:message code="container.slot1.label" default="Slot1" /></span>
					
						<span class="property-value" aria-labelledby="slot1-label"><g:link controller="parcel" action="show" id="${containerInstance?.slot1?.id}">${containerInstance?.slot1?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${containerInstance?.slot2}">
				<li class="fieldcontain">
					<span id="slot2-label" class="property-label"><g:message code="container.slot2.label" default="Slot2" /></span>
					
						<span class="property-value" aria-labelledby="slot2-label"><g:link controller="parcel" action="show" id="${containerInstance?.slot2?.id}">${containerInstance?.slot2?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${containerInstance?.slot3}">
				<li class="fieldcontain">
					<span id="slot3-label" class="property-label"><g:message code="container.slot3.label" default="Slot3" /></span>
					
						<span class="property-value" aria-labelledby="slot3-label"><g:link controller="parcel" action="show" id="${containerInstance?.slot3?.id}">${containerInstance?.slot3?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${containerInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="container.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${containerInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:containerInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${containerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
