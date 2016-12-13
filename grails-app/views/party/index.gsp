<!DOCTYPE html>
<html>
    <head>
    <asset:link rel="icon" href="icono.png" type="image/x-ico" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'party.label', default: 'Party')}" />
        <asset:stylesheet src="kustomer.css"/>
        <title>Participantes</title>
    </head>
    <body>
        <a href="#list-party" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create">Nuevo Participante</g:link></li>
            </ul>
        </div>
        <div id="list-party" class="content scaffold-list" role="main">
            <h1>Lista de Participantes</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>


            <table>
                <thead>
                    <tr>
                        <th>Ver</th>
                        <g:sortableColumn property="partyId" defaultOrder="desc" title="rut"/>
                        <g:sortableColumn property="firstName" defaultOrder="desc" title="nombre"/>
                        <g:sortableColumn property="lastName" defaultOrder="desc" title="apellido"/>
                        <g:sortableColumn property="address" defaultOrder="desc" title="direccion"/>
                        <g:sortableColumn property="mail" defaultOrder="desc" title="email"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="party" status="i" in="${partyList}">
                         <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                            <td><a href="show/${party.id}"><img src="https://imagenes.es.sftcdn.net/es/scrn/3342000/3342147/file-viewer-08-535x535.png" class="ver"></a></td>
                            <td>${party.partyId}</td>
                            <td>${party.firstName}</td>
                            <td>${party.lastName}</td>
                            <td>${party.address}</td>
                            <td>${party.mail}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${partyCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
