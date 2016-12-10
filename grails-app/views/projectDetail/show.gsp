<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectDetail.label', default: 'ProjectDetail')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-projectDetail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-projectDetail" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
                
            <div class="row">
                <div class="col-md-6">
                    <br><label>Creado por : ${this.projectDetail?.createdBy}</label>
                    <br><label>Descripción : ${this.projectDetail?.description}</label>
                    <br><label>Proyecto : ${projectFromAssign.codeProject} ${projectFromAssign.name} - ${projectFromAssign.id}</label>
                    <br><label>Fecha creación : <g:formatDate date="${this.projectDetail?.creationDate}" type="datetime" style="LONG" timeStyle="SHORT"/></label>
                    <br><label>Participante : ${partyFromAssign.partyId} ${partyFromAssign.firstName} ${partyFromAssign.lastName} - ${partyFromAssign.id}</label>
                    <br><br>
                </div>
                <div class="col-md-6">
                    <br>
                    <g:form controller="document" action="save">
                        <input type="hidden" name="createdBy" value="${username}" required="" id="createdBy" />
                        <input type="hidden" name="projectDetail" value="${this.projectDetail?.id}" required="" id="projectDetail" />
                        <input type="hidden" name="projectId" value="${this.projectDetail?.projectId}" required="" id="projectId" />
                        <input style="width:50%" class="btn btn-info" type="submit"
                            data-toggle="modal" value="Emitir Documento">
                        <br><br>
                    </g:form>
                    <input style="width:50%" class="btn btn-info" type="submit"
                    data-toggle="modal" value="Descargar Documento">
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
