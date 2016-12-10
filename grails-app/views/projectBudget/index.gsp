<!DOCTYPE html>
<html>
    <head>
    <asset:link rel="icon" href="icono.png" type="image/x-ico" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectBudget.label', default: 'ProjectBudget')}" />
        <asset:stylesheet src="kustomer.css"/>
        <title>Presupuestos</title>
    </head>
    <body>
        <a href="#list-projectBudget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create">Nuevo Presupuesto</g:link></li>
            </ul>
        </div>
        <div id="list-projectBudget" class="content scaffold-list" role="main">
            <h1>Lista de Presupuestos</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <table>
                <thead>
                    <tr>
                        <th>Ver</th>
                        <g:sortableColumn property="name" defaultOrder="desc" title="Nombre"/>
                        <g:sortableColumn property="description" defaultOrder="desc" title="Descripción"/>
                        <g:sortableColumn property="totalAmount" defaultOrder="desc" title="Monto Total"/>
                        <g:sortableColumn property="creationDate" defaultOrder="desc" title="Fecha Creación"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="projectBudget" status="i" in="${projectBudgetList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="show/${projectBudget.id}">Ver</a></td>
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

            <div class="pagination">
                <g:paginate total="${projectBudgetCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
