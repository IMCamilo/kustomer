<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <asset:stylesheet src="kustomer.css"/>
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index">Lista de Proyectos</g:link></li>
                <li><g:link class="create" action="create">Nuevo Proyecto</g:link></li>
            </ul>
        </div>
        <div id="show-project" class="content scaffold-show" role="main">
            <h1>Proyectos</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}
                </div>
            </g:if>


            <g:if test="${this.project?.paidByCompleteTask == true}">
                <h4>Porcentaje de avance proyecto ${qtyTask}  ${qtyTaskFinished}</h4>

                <div class="progress">
                    <div class="progress-bar progress-bar-striped active" role="progressbar"
                    aria-valuenow="${percentyTaskFinished}" aria-valuemin="0" aria-valuemax="${totalTask}" style="width:${percentyTaskFinished}%">
                        ${percentyTaskFinished}%
                    </div>
                </div>

            </g:if>
                

            

            <g:hiddenField name="version" value="${this.project?.version}" />
            <table class="mostrarparty">
                <tr><td class="tdizq"><strong><label>Codigo proyecto </strong></td><td> ${this.project?.codeProject}</label></td></tr>
                <tr><td class="tdizq"><strong><label>
                    <g:if test="${this.project?.paidByCompleteTask == true}">Pago por tarea completada </strong> <td> Si</td></g:if>
                    <g:else>Pago por tarea completada  <td>No</td>  </g:else> </label></td></tr>
                <tr><td class="tdizq"><strong><label>Monto total  </strong></td><td>${this.project?.totalAmount}</label></td></tr>
                <tr><td class="tdizq"><strong><label>Creado por  </strong></td><td>${this.project?.createdBy}</label></td></tr>
                <tr><td class="tdizq"><strong><label>Nombre </strong></td><td> ${this.project?.name}</label></td></tr>
                <tr><td class="tdizq"><strong><label>Descripcion </strong></td><td> ${this.project?.description}</label></td></tr>
                <tr><td class="tdizq"><strong><label>Fecha creación </strong></td><td> <g:formatDate date="${this.project?.creationDate}" type="datetime" style="LONG" timeStyle="SHORT"/></label></td></tr>
                <tr><td class="tdizq"><strong><label>Desde fecha </strong></td><td> <g:formatDate date="${this.project?.fromDate}" type="datetime" style="LONG" timeStyle="SHORT"/></label></td></tr>
                <tr><td class="tdizq"><strong><label>Hasta fecha </strong></td><td> <g:formatDate date="${this.project?.thruDate}" type="datetime" style="LONG" timeStyle="SHORT"/></label></td></tr>
            </table>

            <div class="page-header">
                <h1><g:link controller="projectBudget" action="index" params="[projectId: this.project?.id, 
                    codeProject:this.project?.codeProject]">Administrar Presupuestos</g:link></h1>
                <h1><g:link controller="projectTask" action="index" params="[projectId: this.project?.id, 
                    codeProject:this.project?.codeProject]">Administrar Tareas</g:link></h1>
            </div>

            <g:form resource="${this.project}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.project}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
