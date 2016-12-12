<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectBudget.label', default: 'ProjectBudget')}" />
        <title>Edicion presupuesto de proyecto ${currentProject.codeProject} ${currentProject.name}</title>
        <asset:stylesheet src="autocomplete.css"/>
        <asset:stylesheet src="kustomer.css"/>
    </head>
    <body>
        <a href="#edit-projectBudget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index" params="[projectId:currentProject.id]"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-projectBudget" class="content scaffold-edit" role="main">
            <h1>Edicion presupuesto de proyecto ${currentProject.codeProject} ${currentProject.name}</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.projectBudget}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.projectBudget}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <br>
            <g:form resource="${this.projectBudget}" method="PUT">
                <g:hiddenField name="version" value="${this.projectBudget?.version}" />
                <g:hiddenField name="projectId" value="${currentProject.id}" />
                <g:hiddenField name="codePro" value="${currentProject.codeProject}" />

                <div class="fieldcontain required espacio">
                    <label for="name">Nombre del presupuesto
                        <span class="required-indicator">*</span>
                    </label>
                    <input id="name" value="${this.projectBudget?.name}" class="typeahead" name="name" type="text" required="" placeholder="Nombre para el presupuesto">
                </div>

                <div class="fieldcontain required espacio">
                    <label for="totalAmount">Monto total
                        <span class="required-indicator">*</span>
                    </label>
                    <input id="totalAmount" value="${this.projectBudget?.totalAmount}" class="typeahead" name="totalAmount" type="number" required="" placeholder="Monto para el presupuesto">
                </div>

                <div class="fieldcontain required espacio">
                    <label for="description">Descripción del presupuesto
                        <span class="required-indicator">*</span>
                    </label>
                    <input id="description" value="${this.projectBudget?.description}" class="typeahead" name="description" type="text" required="" placeholder="Descripción para el presupuesto">
                </div>

                <br>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
