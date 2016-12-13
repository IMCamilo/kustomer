<!DOCTYPE html>
<html>
    <head>
    <asset:link rel="icon" href="icono.png" type="image/x-ico" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
        <asset:stylesheet src="kustomer.css"/>
        <title>Documentos emitidos</title>
    </head>
    <body>
        <a href="#list-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
        <div id="list-document" class="content scaffold-list" role="main">
            <h1>Documentos Emitidos</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>Ver</th>
                        <g:sortableColumn property="id" defaultOrder="desc" title="N° Documento"/>
                        <g:sortableColumn property="creationDate" defaultOrder="desc" title="Fecha Creación"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="document" status="i" in="${documentList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="show/${document.id}"><img src="https://imagenes.es.sftcdn.net/es/scrn/3342000/3342147/file-viewer-08-535x535.png" class="ver"></a></td>
                            <td>${document.id}</td>
                             <td>
                                <g:formatDate date="${document.creationDate}" type="datetime" style="LONG" timeStyle="SHORT"/>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${documentCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
