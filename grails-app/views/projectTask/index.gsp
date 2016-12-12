<!DOCTYPE html>
<html>
    <head>
    <asset:link rel="icon" href="icono.png" type="image/x-ico" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectTask.label', default: 'ProjectTask')}" />
        <title>Tareas de Proyecto ${params.codeProject}</title>
    </head>
    <body>
        <a href="#list-projectTask" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>

        <g:form action="save">
            <input name="createdBy" type="hidden" value="${username}" required="">
            <input name="project" type="hidden" value="${params.projectId}" required="">
            <input name="status" type="hidden" value="In_Process" required="">
            <div class="fieldcontain required espacio">
                <label for="description">Nombre de la tarea
                    <span class="required-indicator">*</span>
                </label>
                <input name="name" type="text" required="" placeholder="Ingrese nombre de la tarea">
            </div>
            <div class="fieldcontain required espacio">
                <label for="description">Descripción de la tarea
                    <span class="required-indicator">*</span>
                </label>
                <textarea name="description" rows="4" cols="50"></textarea> 
            </div>
            <div class="fieldcontain required espacio">
                <label for="name"></label>
                <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </div>
        </g:form>

        <div id="list-projectTask" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <f:table collection="${projectTaskList}" />

            <div class="pagination">
                <g:paginate total="${projectTaskCount ?: 0}" />
            </div>
        </div>
    </body>
</html>