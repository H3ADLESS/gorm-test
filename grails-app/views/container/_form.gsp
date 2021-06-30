<%@ page import="gormtest.Container" %>



<div class="fieldcontain ${hasErrors(bean: containerInstance, field: 'slot1', 'error')} ">
	<label for="slot1">
		<g:message code="container.slot1.label" default="Slot1" />
		
	</label>
	<g:select id="slot1" name="slot1.id" from="${gormtest.Parcel.list()}" optionKey="id" value="${containerInstance?.slot1?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: containerInstance, field: 'slot2', 'error')} ">
	<label for="slot2">
		<g:message code="container.slot2.label" default="Slot2" />
		
	</label>
	<g:select id="slot2" name="slot2.id" from="${gormtest.Parcel.list()}" optionKey="id" value="${containerInstance?.slot2?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: containerInstance, field: 'slot3', 'error')} ">
	<label for="slot3">
		<g:message code="container.slot3.label" default="Slot3" />
		
	</label>
	<g:select id="slot3" name="slot3.id" from="${gormtest.Parcel.list()}" optionKey="id" value="${containerInstance?.slot3?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: containerInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="container.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${containerInstance?.name}"/>

</div>

