<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectBudget.label', default: 'ProjectBudget')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-projectBudget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-projectBudget" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            
            <br>
            <label>
               Creado por : ${this.projectBudget?.createdBy}
            </label>
            <br>
            <label>
                Nombre del presupuesto : ${this.projectBudget?.name}
            </label>
            <br>
            <label>
                Descripción del presupuesto : ${this.projectBudget?.description}
            </label>
            <br>
            <label>
                Fecha creación : <g:formatDate date="${this.projectBudget?.creationDate}" type="datetime" style="LONG" timeStyle="SHORT"/>
            </label>
            <br>
            <label>
                Asigna a un proyecto : ${mapWithCurrentDetails.codeProject} ${mapWithCurrentDetails.name} - ${mapWithCurrentDetails.id}
            </label>
            <br>

            <g:form resource="${this.projectBudget}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.projectBudget}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
