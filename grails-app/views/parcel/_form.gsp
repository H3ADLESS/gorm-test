<%@ page import="gormtest.Parcel" %>



<div class="fieldcontain ${hasErrors(bean: parcelInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="parcel.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${gormtest.Category.list()}" optionKey="id" required="" value="${parcelInstance?.category?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: parcelInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="parcel.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${parcelInstance?.name}"/>

</div>

