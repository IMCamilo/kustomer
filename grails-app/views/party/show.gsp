<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'party.label', default: 'Party')}" />
        <asset:stylesheet src="kustomer.css"/>
        <title>Mostrar Participantes</title>
    </head>
    <body>
        <a href="#show-party" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index">Lista de Participantes</g:link></li>
                <li><g:link class="create" action="create">Crear Participante</g:link></li>
            </ul>
        </div>
        <div id="show-party" class="content scaffold-show" role="main">
            <h1>Mostrar Participante</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="mostrardiv">
              <table class="mostrarparty">
                <tr><td class="tdizq"><strong>Genero</strong></td><td> ${this.party?.gender}</td></tr>
                <tr><td class="tdizq"><strong>Apellido</strong></td><td> ${this.party?.lastName}</td></tr>
                <tr><td class="tdizq"><strong>Direccion</strong></td><td> ${this.party?.address}</td></tr>
                <tr><td class="tdizq"><strong>Correo</strong></td><td> ${this.party?.mail}</td></tr>
                <tr><td class="tdizq"><strong>Es empresa</strong></td><td> ${this.party?.isCompany}</td></tr>
                <tr><td class="tdizq"><strong>Nombre</strong></td><td> ${this.party?.firstName}</td></tr>
                <tr><td class="tdizq"><strong>Nacionalidad</strong></td><td> ${this.party?.nationality}</td></tr>
                <tr><td class="tdizq"><strong>Telefono</strong></td><td> ${this.party?.phone}</td></tr>
                <tr><td class="tdizq"><strong>Creado por</strong></td><td> ${this.party?.createdBy}</td></tr>
                <tr><td class="tdizq"><strong>Rut</strong></td><td> ${this.party?.partyId}</td></tr>
                <tr><td class="tdizq"><strong>Representante</strong></td><td> ${this.party?.representative}</td></tr>
              </table>
            </div>

            <g:form resource="${this.party}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.party}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
