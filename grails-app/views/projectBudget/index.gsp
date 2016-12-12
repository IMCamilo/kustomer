<!DOCTYPE html>
<html>
    <head>
    <asset:link rel="icon" href="icono.png" type="image/x-ico" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectBudget.label', default: 'ProjectBudget')}" />
        <asset:stylesheet src="kustomer.css"/>
        <title>Presupuestos de Proyecto ${params.codeProject}</title>
    </head>
    <body>
        <a href="#list-projectBudget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
        <g:form action="save">
            <br>
            <input type="hidden" name="createdBy" value="${username}" required=""/>
            <input type="hidden" name="project" value="${params.projectId}" required="">
            <input type="hidden" name="codePro" value="${params.codeProject}" required="">
            
            <div class="fieldcontain required espacio">
                <label for="name">Nombre del presupuesto
                    <span class="required-indicator">*</span>
                </label>
                <input id="name" class="typeahead" name="name" type="text" required="" placeholder="Nombre para el presupuesto">
            </div>
            
            <div class="fieldcontain required espacio">
                <label for="totalAmount">Monto total
                    <span class="required-indicator">*</span>
                </label>
                <input id="totalAmount" class="typeahead" name="totalAmount" type="number" required="" placeholder="Monto para el presupuesto">
            </div>
            
            <div class="fieldcontain required espacio">
                <label for="description">Descripción del presupuesto
                    <span class="required-indicator">*</span>
                </label>
                <textarea name="description" rows="4" cols="50"></textarea> 
            </div>
            
            <div class="fieldcontain required espacio">
                <label for="name"></label>
                <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </div>

        </g:form>
        <div id="list-projectBudget" class="content scaffold-list" role="main">
            <h1>Lista de Presupuestos para Proyecto ${params.codeProject}</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>Ver</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Monto Total</th>
                        <th>Fecha Creación</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="projectBudget" status="i" in="${projectBudgetList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td>
                                <g:link controller="projectBudget" action="show" params="[id:projectBudget.id, 
                    projectId:params.projectId]">Detalles</g:link>
                            </td>
                            <td>${projectBudget.name}</td>
                            <td>${projectBudget.description}</td>
                            <td>${projectBudget.totalAmount}</td>
                            <td>
                                <g:formatDate date="${projectBudget.creationDate}" type="datetime" style="LONG" timeStyle="SHORT"/>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
    </body>
</html>
