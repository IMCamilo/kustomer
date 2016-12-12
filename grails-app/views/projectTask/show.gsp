<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectTask.label', default: 'ProjectTask')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-projectTask" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index" params="[projectId:currentProject.id]"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-projectTask" class="content scaffold-show" role="main">
            <h1>Detalles proyecto ${currentProject.codeProject}</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <table>
                <tr><td class="tdizq"><strong>Creado Por</strong></td><td> ${this.projectTask?.createdBy}</td></tr>
                <tr><td class="tdizq"><strong>Nombre</strong></td><td> ${this.projectTask?.name}</td></tr>
                <tr><td class="tdizq"><strong>Descripcion</strong></td><td> ${this.projectTask?.description}</td></tr>
                <tr><td class="tdizq"><strong>Proyecto Codigo</strong></td><td> ${currentProject.codeProject}</td></tr>
                <tr><td class="tdizq"><strong>Proyecto Nombre</strong></td><td> ${currentProject.name}</td></tr>
                <tr>
                    <td class="tdizq"><strong>Estado</strong></td>
                    <td>
                        <g:if test="${this.projectTask?.status == 'In_Process'}">
                            En Proceso
                        </g:if>
                        <g:elseif test="${this.projectTask?.status == 'Finished'}">
                            Terminada
                        </g:elseif>
                    </td>
                </tr>
                <tr>
                    <td class="tdizq"><strong>Fecha Creación</strong></td>
                    <td> 
                        <g:formatDate date="${this.projectTask?.creationDate}" type="datetime" style="LONG" timeStyle="SHORT"/>    
                    </td>
                </tr>
              </table>       
            <g:form resource="${this.projectTask}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.projectTask}"
                        params="[projectId:currentProject.id]"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
