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
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            
            <g:hiddenField name="version" value="${this.project?.version}" />
                <br><br>
                codigo proyecto ${this.project?.codeProject}
                <br>pago por tarea completada ${this.project?.paidByCompleteTask}
                <br>monto total ${this.project?.totalAmount}
                <br>creado por ${this.project?.createdBy}
                <br>Nombre ${this.project?.name}
                <br>Descripcion ${this.project?.description}
                <br>desde fecha ${this.project?.fromDate} 
                <br>fecha creacion ${this.project?.creationDate}
                <br>hasta fecha ${this.project?.thruDate}
                
                <br><br><br><br>
                
                <h2>cuadro con presupuestos del proyecto</h2>
                <h2>==============================</h2>
                <h2>==============================</h2>
                <h2>Crear Presupuestos<h2>
                
                <br><br><br><br>
                
                <h2>cuadro con tareas del proyecto</h2>
                <h2>==============================</h2>
                <h2>==============================</h2>
                <h2>Crear Tareas<h2>
                
                <br><br><br><br><br>

            <g:form resource="${this.project}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.project}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>