<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectTask.label', default: 'ProjectTask')}" />
        <title>Edicion tarea de proyecto ${currentProject.codeProject}</title>
    </head>
    <body>
        <a href="#edit-projectTask" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index" params="[projectId:currentProject.id]"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                </ul>
        </div>
        <div id="edit-projectTask" class="content scaffold-edit" role="main">
            <h1>Edicion tarea proyecto ${currentProject.codeProject} ${currentProject.name}</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.projectTask}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.projectTask}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.projectTask}" method="PUT">
                <g:hiddenField name="version" value="${this.projectTask?.version}" />
                <fieldset class="form">
                    <input name="project" type="hidden" value="${currentProject.id}" required="">
                    <input name="codePro" type="hidden" value="${currentProject.codeProject}" required="">
                    <div class="fieldcontain required espacio">
                        <label for="description">Nombre de la tarea
                            <span class="required-indicator">*</span>
                        </label>
                        <input name="name" type="text" value="${this.projectTask?.name}" required="" placeholder="Ingrese nombre de la tarea">
                    </div>
                    <div class="fieldcontain required espacio">
                        <label for="description">Descripción de la tarea
                            <span class="required-indicator">*</span>
                        </label>
                        <textarea name="description" rows="4" cols="50">${this.projectTask?.description}</textarea> 
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
