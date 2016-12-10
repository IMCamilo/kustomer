<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
        <asset:stylesheet src="kustomer.css"/>
        <title>Ver Roles</title>
    </head>
    <body>
        <a href="#show-role" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index">Lista de Roles</g:link></li>
                <li><g:link class="create" action="create">Nuevo Rol</g:link></li>
            </ul>
        </div>
        <div id="show-role" class="content scaffold-show" role="main">
            <h1>Mostrar Rol</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <table class="mostrarparty">
              <tr>
                <td class=""><strong><f:display bean="role" /></strong></td>
                <td><g:form resource="${this.role}" method="DELETE"></td>
              </tr>
            </table>
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.role}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
