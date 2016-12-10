<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
        <title>Detalle Documento ${this.document.id}</title>
    </head>
    <body>
        <a href="#show-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-document" class="content scaffold-show" role="main">
            <h1>Detalle Documento ${this.document.id}</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
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
                     <input class="btn btn-info" type="submit"
                        data-toggle="modal" value="Descargar Documento">
                </div>
            </div>
            <div class="row">
                <h2>Presupuestos</h2>
                <div class="col-md-1"><label>Número</label></div>
                <div class="col-md-2">
                    <label>Nombre</label>
                </div>
                <div class="col-md-3">
                    <label>Descripción</label>
                </div>
                <div class="col-md-2">
                    <label>Monto Total</label>
                </div>
                <div class="col-md-2">
                    <label>Fecha Creación</label>
                </div>
                <div class="col-md-2">
                    <label>Creado Por</label>
                </div>
                <g:each var="budget" status="i" in="${listBudgetForProject}">
                    <div class="col-md-1">
                        <label>${i+1}</label>
                    </div>
                    <div class="col-md-2">
                        <label>${budget.name}</label>
                    </div>
                    <div class="col-md-3">
                        <label>${budget.description}</label>
                    </div>
                    <div class="col-md-2">
                        <label>${budget.totalAmount}</label>
                    </div>
                    <div class="col-md-2">
                        <label>
                            <g:formatDate date="${budget?.creationDate}" type="datetime" style="LONG" timeStyle="SHORT"/>
                        </label>
                    </div>
                    <div class="col-md-2">
                        <label>${budget.createdBy}</label>
                    </div>
                </g:each>
            </div>
            <div class="row">
                <h2>Tareas</h2>
                <div class="col-md-1"><label>Número</label></div>
                <div class="col-md-2">
                    <label>Nombre</label>
                </div>
                <div class="col-md-3">
                    <label>Descripción</label>
                </div>
                <div class="col-md-2">
                    <label>Estado</label>
                </div>
                <div class="col-md-2">
                    <label>Fecha Creación</label>
                </div>
                <div class="col-md-2">
                    <label>Creado Por</label>
                </div>
                <g:each var="document" status="i" in="${listTaskForProject}">
                    <div class="col-md-1">
                        <label>${i+1}</label>
                    </div>
                    <div class="col-md-2">
                        <label>${document.name}</label>
                    </div>
                    <div class="col-md-3">
                        <label>${document.description}</label>
                    </div>
                    <div class="col-md-2">
                        <label>
                            <g:if test="${document.status == 'In_Process'}">
                                En Proceso
                            </g:if>
                            <g:elseif test="${document.status == 'Finished'}">
                                Terminada
                            </g:elseif>
                        </label>
                    </div>
                    <div class="col-md-2">
                        <label>
                            <g:formatDate date="${document?.creationDate}" type="datetime" style="LONG" timeStyle="SHORT"/>
                        </label>
                    </div>
                    <div class="col-md-2">
                        <label>${document.createdBy}</label>
                    </div>
                </g:each>
            </div>
            <div class="row">
                <h2>Participantes</h2>
                <div class="col-md-1">
                    <label>Número</label>
                </div>
                <div class="col-md-2">
                    <label>Rut</label>
                </div>
                <div class="col-md-2">
                    <label>Nombres</label>
                </div>
                <div class="col-md-2">
                    <label>Apellidos</label>
                </div>
                <div class="col-md-2">
                    <label>Correo</label>
                </div>
                <div class="col-md-3">
                    <label>Dirección</label>
                </div>
                <g:each var="party" status="i" in="${listPartiesForProject}">
                    <div class="col-md-1">
                        <label>${i+1}</label>
                    </div>
                    <div class="col-md-2">
                        <label>${party.partyId}</label>
                    </div>
                    <div class="col-md-2">
                        <label>${party.firstName}</label>
                    </div>
                    <div class="col-md-2">
                        <label>${party.lastName}</label>
                    </div>
                    <div class="col-md-2">
                        <label>${party.mail}</label>
                    </div>
                    <div class="col-md-3">
                        <label>${party.address}</label>
                    </div>
                </g:each>
            </div>
            <br>

            <g:form resource="${this.document}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.document}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
