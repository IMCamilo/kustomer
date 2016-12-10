<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectDetail.label', default: 'ProjectDetail')}" />
        <asset:stylesheet src="kustomer.css"/>
        <title>Detalle de Proyecto</title>
    </head>
    <body>
        <a href="#show-projectDetail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index">Lista de Asignaciones</g:link></li>
                <li><g:link class="create" action="create">Nueva Asignación</g:link></li>
            </ul>
        </div>
        <div id="show-projectDetail" class="content scaffold-show" role="main">
            <h1>Detalle de Asignaciones</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <div class="row">
                <div class="col-md-6">
                  <table class="mostrarparty">
                    <tr><td class="tdizq"><strong><label>Creado por </strong></td><td> ${this.projectDetail?.createdBy}</label></td></tr>
                    <tr><td class="tdizq"><strong><label>Descripción </strong></td><td> ${this.projectDetail?.description}</label></td></tr>
                    <tr><td class="tdizq"><strong><label>Proyecto </strong></td><td> ${projectFromAssign.codeProject} ${projectFromAssign.name}</label></td></tr>
                    <tr><td class="tdizq"><strong><label>Fecha creación </strong></td><td> <g:formatDate date="${this.projectDetail?.creationDate}" type="datetime" style="LONG" timeStyle="SHORT"/></label></td></tr>
                    <tr><td class="tdizq"><strong><label>Participante </strong></td><td> ${partyFromAssign.partyId} ${partyFromAssign.firstName} ${partyFromAssign.lastName}</label></td></tr>
                  </table>
                </div>
                <div class="col-md-6">
                    <br>
                    <g:if test="${diffCreateDocument>30}">
                        <g:form controller="document" action="save">
                            <input type="hidden" name="createdBy" value="${username}" required="" id="createdBy" />
                            <input type="hidden" name="projectDetail" value="${this.projectDetail?.id}" required="" id="projectDetail" />
                            <input type="hidden" name="projectId" value="${this.projectDetail?.projectId}" required="" id="projectId" />
                            <input style="width:50%" class="btn btn-info" type="submit"
                                data-toggle="modal" value="Emitir Documento">
                            <br><br>
                        </g:form>
                    </g:if>
                     <g:else>
                        <label>Emitido</label><br><br><br>
                    </g:else>
                    
                    <g:form controller="document" name="downloadDocument" action="downloadDocument">
                        <input type="hidden" name="rendicion" value="${this.projectDetail?.projectId}">
                        <input class="btn btn-primary" type="submit" value="Descargar Documento">
                    </g:form>

                    <br><br>
                </div>
            </div>

            <g:form resource="${this.projectDetail}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.projectDetail}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
