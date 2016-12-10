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

            <h2 class="titulotareas">Tareas</h2>
            <table style="width:70%" id="tabla1">
                <thead>
                    <tr>
                        <td><strong>Nombre</strong></td>
                        <td><strong>Estado</strong></td>
                        <td><strong>Descripción</strong></td>
                        <td><strong>Acción</strong></td>
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
            <input style="width:70%" class="btn btn-link" type="submit"
                 data-toggle="modal" data-target="#modalNewTask" value="Nueva tarea">

            <h2 class="titulotareas">Presupuestos</h2>
            <table style="width:70%" id="tabla">
                <thead>
                    <tr>
                        <td><strong>Nombre</strong></td>
                        <td><strong>Monto</strong></td>
                        <td><strong>Descripción</strong></td>
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
            <input style="width:70%" class="btn btn-link" type="submit"
                 data-toggle="modal" data-target="#modalNewBudget" value="Nuevo presupuesto">
            <br><br>

            <g:form resource="${this.project}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.project}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
        <div class="modal fade" id="modalNewBudget" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Crear presupuesto para proyecto ${this.project?.codeProject}</h4>
                    </div>
                    <div class="modal-body">
                    ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary">Guardar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalNewTask" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Crear tarea para proyecto ${this.project?.codeProject}</h4>
                    </div>
                    <div class="modal-body">
                    ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary">Guardar</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $('#modalNewBudget').on('shown.bs.modal', function () {
                $('#myInput').focus()
            })
            $('#modalNewTask').on('shown.bs.modal', function () {
                $('#myInput').focus()
            })
        </script>
    </body>
</html>
