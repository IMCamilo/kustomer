<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectBudget.label', default: 'ProjectBudget')}" />
        <asset:stylesheet src="kustomer.css"/>
        <title>Presupuestos de proyecto ${currentProject?.codeProject} ${currentProject?.name}</title>
    </head>
    <body>
        <a href="#show-projectBudget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index" params="[projectId:currentProject?.id]">Lista de Presupuestos</g:link></li>
            </ul>
        </div>
        <div id="show-projectBudget" class="content scaffold-show" role="main">
            <h1>Presupuestos de proyecto ${currentProject?.codeProject} ${currentProject?.name}</h1>
            <g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
            <table class="mostrarparty">
            <tr><td class="tdizq"><strong><label>Creado por </strong></td><td> ${this.projectBudget?.createdBy}</label></td></tr>
            <tr><td class="tdizq"><strong><label>Nombre del presupuesto </strong></td><td> ${this.projectBudget?.name}</label></td></tr>
            <tr><td class="tdizq"><strong><label>Monto del presupuesto </strong></td><td> ${this.projectBudget?.totalAmount}</label></td></tr>
            <tr><td class="tdizq"><strong><label>Descripción del presupuesto </strong></td><td> ${this.projectBudget?.description}</label></td></tr>
            <tr><td class="tdizq"><strong><label>Fecha creación </strong></td><td> <g:formatDate date="${this.projectBudget?.creationDate}" type="datetime" style="LONG" timeStyle="SHORT"/></label></td></tr>
            <tr><td class="tdizq"><strong><label>Nombre proyecto </strong></td><td> ${this.currentProject?.name}</label></td></tr>
            <tr><td class="tdizq"><strong><label>Código proyecto </strong></td><td> ${this.currentProject?.codeProject}</label></td></tr>
            </table>
            <g:form resource="${this.projectBudget}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.projectBudget}" 
                    params="[projectId:currentProject.id, codeProject:currentProject.codeProject]">
                        <g:message code="default.button.edit.label" default="Edit" />
                    </g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
