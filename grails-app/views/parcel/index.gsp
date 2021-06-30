
<%@ page import="gormtest.Parcel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'parcel.label', default: 'Parcel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-parcel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-parcel" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="parcel.category.label" default="Category" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'parcel.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${parcelInstanceList}" status="i" var="parcelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${parcelInstance.id}">${fieldValue(bean: parcelInstance, field: "category")}</g:link></td>
					
						<td>${fieldValue(bean: parcelInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${parcelInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
