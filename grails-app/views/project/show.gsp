<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-project" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}
                </div>
            </g:if>
            
            <g:hiddenField name="version" value="${this.project?.version}" />
            <br>
            <br><label>Codigo proyecto : ${this.project?.codeProject}</label>
            <br><label>Pago por tarea completada : ${this.project?.paidByCompleteTask}</label>
            <br><label>Monto total : ${this.project?.totalAmount}</label>
            <br><label>Creado por : ${this.project?.createdBy}</label>
            <br><label>Nombre : ${this.project?.name}</label>
            <br><label>Descripcion : ${this.project?.description}</label>
            <br><label>Fecha creación : <g:formatDate date="${this.project?.creationDate}" type="datetime" style="LONG" timeStyle="SHORT"/></label>
            <br><label>Desde fecha : <g:formatDate date="${this.project?.fromDate}" type="datetime" style="LONG" timeStyle="SHORT"/></label>
            <br><label>Hasta fecha : <g:formatDate date="${this.project?.thruDate}" type="datetime" style="LONG" timeStyle="SHORT"/></label>
            
            <br><br>

            <h2>Tareas</h2>
            <table style="width:70%" id="tabla">
                <thead>
                    <tr>
                        <td>Nombre</td>
                        <td>Estado</td>
                        <td>Descripción</td>
                        <td>Acción</td>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="tasks" status="i" in="${taskList}">
                        <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td>${tasks.name}</td>
                            <td>${tasks.status}</td>
                            <td>${tasks.description}</td>
                            <td>Aprobar</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <input style="width:70%" class="btn btn-link" type="submit" value="Nueva tarea">

            <h2>Presupuestos</h2>
            <table style="width:70%" id="tabla">
                <thead>
                    <tr>
                        <td>Nombre</td>
                        <td>Monto</td>
                        <td>Descripción</td>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="budgets" status="i" in="${budgetList}">
                        <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td>${budgets.name}</td>
                            <td>${budgets.totalAmount}</td>
                            <td>${budgets.description}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <input style="width:70%" class="btn btn-link" type="submit" value="Nuevo presupuesto">
            <br><br>
            
            <g:form resource="${this.project}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.project}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
