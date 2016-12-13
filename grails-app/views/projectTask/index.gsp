<!DOCTYPE html>
<html>
    <head>
    <asset:link rel="icon" href="icono.png" type="image/x-ico" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectTask.label', default: 'ProjectTask')}" />
        <title>Tareas de Proyecto ${params.codeProject}  ${currentProject.name}</title>
    </head>
    <body>
        <a href="#list-projectTask" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>

        <h1>Nueva tarea para proyecto ${currentProject.codeProject}</h1>
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
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <h1>Lista de tareas de proyecto ${currentProject.codeProject} ${currentProject.name}</h1>
            <table>
                <thead>
                    <tr>
                        <th>Ver</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Estado</th>
                        <th>Fecha Creación</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="task" status="i" in="${projectTaskList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td>
                                <g:link controller="projectTask" action="show" params="[id:task.id, projectId:currentProject.id]">Detalles</g:link>
                            </td>
                            <td>${task.name}</td>
                            <td>${task.description}</td>
                            <td>
                                <g:if test="${task?.status == 'In_Process'}">
                                    En Proceso
                                </g:if>
                                <g:elseif test="${task?.status == 'Finished'}">
                                    Terminada
                                </g:elseif>
                            </td>
                            <td><prettytime:display date="${task.creationDate}"/></td>
                            <td>
                                <g:if test="${task?.status == 'In_Process'}">
                                    <form action="finalizeTask" method="POST">
                                        <input name="id" type="hidden" value="${task.id}" required="">
                                        <input name="project" type="hidden" value="${currentProject.id}" required="">
                                        <input name="codePro" type="hidden" value="${currentProject.codeProject}" required="">
                                        <input type="submit" value="Finalizar" class="btn-warning">
                                    </form>
                                </g:if>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${projectTaskCount ?: 0}" />
            </div>
        </div>
    </body>
</html>