<!DOCTYPE html>
<html>
    <head>
    <asset:link rel="icon" href="icono.png" type="image/x-ico" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectDetail.label', default: 'ProjectDetail')}" />
        <title>Asignaciones</title>
    </head>
    <body>
        <a href="#list-projectDetail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create">Nueva Asignación</g:link></li>
            </ul>
        </div>
        <div id="list-projectDetail" class="content scaffold-list" role="main">
            <h1>Lista de Asignaciones</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

             <table>
                <thead>
                    <tr>
                        <th>Ver</th>
                        <g:sortableColumn property="description" defaultOrder="desc" title="Descripción"/>
                        <g:sortableColumn property="creationDate" defaultOrder="desc" title="Fecha Creación"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="projectDetail" status="i" in="${projectDetailList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="show/${projectDetail.id}">Ver</a></td>
                            <td>${projectDetail.description}</td>
                            <td>
                                <g:formatDate date="${projectDetail.creationDate}" type="datetime" style="LONG" timeStyle="SHORT"/>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${projectDetailCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
