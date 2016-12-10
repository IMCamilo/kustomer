<!DOCTYPE html>
<html>
    <head>
    <asset:link rel="icon" href="icono.png" type="image/x-ico" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
        <asset:stylesheet src="kustomer.css"/>
        <title>Roles</title>
    </head>
    <body>
        <a href="#list-role" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create">Nuevo Rol</g:link></li>
            </ul>
        </div>
        <div id="list-role" class="content scaffold-list" role="main">
            <h1>Lista de Roles</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${roleList}"/>

            <div class="pagination">
                <g:paginate total="${roleCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
