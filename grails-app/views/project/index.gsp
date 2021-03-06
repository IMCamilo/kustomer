<!DOCTYPE html>
<html>
    <head>
    <asset:link rel="icon" href="icono.png" type="image/x-ico" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <asset:stylesheet src="kustomer.css"/>
        <title>Proyectos</title>
    </head>
    <body>
        <a href="#list-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create">Nuevo Proyecto</g:link></li>
            </ul>
        </div>
        <div id="list-project" class="content scaffold-list" role="main">
            <h1>Lista de Proyectos</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <table>
                <thead>
                    <tr>
                        <th>Ver</th>
                        <g:sortableColumn property="codeProject" defaultOrder="desc" title="Codigo"/>
                        <g:sortableColumn property="name" defaultOrder="desc" title="Nombre"/>
                        <g:sortableColumn property="paidByCompleteTask" defaultOrder="desc" title="Pago por Tarea"/>
                        <g:sortableColumn property="totalAmount" defaultOrder="desc" title="Monto Total"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="project" status="i" in="${projectList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="show/${project.id}"><img src="https://imagenes.es.sftcdn.net/es/scrn/3342000/3342147/file-viewer-08-535x535.png" class="ver"></a></td>
                            <td>${project?.codeProject}</td>
                            <td>${project?.name}</td>
                            <td>
                                <g:if test="${this.project?.paidByCompleteTask == true}">Si</g:if>
                                <g:else>No</g:else>
                            </td>
                            <td>${project?.totalAmount}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${projectCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
