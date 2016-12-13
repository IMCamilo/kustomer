<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="layout" content="usermain" />
        <meta charset="UTF-8">
         <asset:link rel="icon" href="icono.png" type="image/x-ico" />
        <asset:stylesheet src="kustomer.css"/>
        <title>Proyectos - Kustomer - ${detailsUser.firstName} ${detailsUser.lastName}</title>
    </head>
    <body>

    <br><br><br>

    <div class="row">
                <h2>Detalles Proyecto</h2>
                <div class="col-md-3">
                    <label>Código Proyecto</label>
                    <br><label>Nombre Proyecto</label>
                    <br><label>Monto Total</label>
                    <br><label>Descripción</label>
                    <br><label>Pago Por Tarea</label>
                    <br><label>Fecha Creación</label>
                    <br><label>Desde Fecha</label>
                    <br><label>Hasta Fecha</label>
                    <br><label>Proyecto Creado Por</label>
                    <br><label>Documento Creado Por</label>
                </div>
                <div class="col-md-6">
                    <label>${this.currentProject?.codeProject}</label>
                    <br><label>${this.currentProject?.name}</label>
                    <br><label>${this.currentProject?.totalAmount}</label>
                    <br><label>${this.currentProject?.description}</label>
                    <br>
                    <label>
                        <td>
                            <g:if test="${this.currentProject?.paidByCompleteTask == true}">Si</g:if>
                            <g:else>No</g:else>
                        </td>
                    </label>
                    <br>
                    <label>
                        <g:formatDate date="${this.currentProject?.creationDate}" type="datetime" style="LONG" timeStyle="SHORT"/>
                    </label>
                    <br>
                    <label>
                        <g:formatDate date="${this.currentProject?.fromDate}" type="datetime" style="LONG" timeStyle="SHORT"/>
                    </label>
                    <br>
                    <label>
                        <g:formatDate date="${this.currentProject?.thruDate}" type="datetime" style="LONG" timeStyle="SHORT"/>
                    </label>
                    <br><label>${this.currentProject?.createdBy}</label>
                    <br><label>${this.document?.createdBy}</label>
                </div>
                <div class="col-md-3">
                    <g:form controller="document" name="downloadDocument" action="downloadDocument">
                        <input type="hidden" name="projectId" value="${currentProject?.id}">
                        <input class="btn btn-primary" type="submit" value="Descargar Documento">
                    </g:form>
                </div>
            </div>
            <div class="row">
                <h2>Presupuestos</h2>
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Monto Total</th>
                            <th>Fecha Creación</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each var="budget" status="i" in="${listBudgetForProject}">
                            <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                                <td>${i+1}</td>
                                <td>${budget.name}</td>
                                <td>${budget.description}</td>
                                <td>${budget.totalAmount}</td>
                                <td>
                                    <g:formatDate date="${budget?.creationDate}" type="datetime" style="LONG" timeStyle="SHORT"/>
                                </td>
                                <td></td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
            <div class="row">
                <h2>Tareas</h2>
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Estado</th>
                            <th>Fecha Creación</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each var="task" status="i" in="${listTaskForProject}">
                            <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                                <td>${i+1}</td>
                                <td>${task.name}</td>
                                <td>${task.description}</td>
                                <td>
                                    <label>
                                        <g:if test="${task.status == 'In_Process'}">
                                            En Proceso
                                        </g:if>
                                        <g:elseif test="${task.status == 'Finished'}">
                                            Terminada
                                        </g:elseif>
                                    </label>
                                </td>
                                <td>
                                    <g:formatDate date="${task?.creationDate}" type="datetime" style="LONG" timeStyle="SHORT"/>
                                </td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>

             <div class="row">
                <h2>Participantes</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Número</th>
                            <th>Rut</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Correo</th>
                            <th>Dirección</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each var="party" status="i" in="${listPartiesForProject}">
                            <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                                <td>${i+1}</td>
                                <td>${party.partyId}</td>
                                <td>${party.firstName}</td>
                                <td>${party.lastName}</td>
                                <td>${party.mail}</td>
                                <td>${party.address}</td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
            <br>
    </body>
</html>
