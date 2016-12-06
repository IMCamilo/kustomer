<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'party.label', default: 'Party')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-party" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-party" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.party}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.party}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.party}" method="PUT">
                <g:hiddenField name="version" value="${this.party?.version}" />
                <br>Genero
                <select name="gender" required="" id="gender" >
                    <option value="No Aplica" >No Aplica</option>
                    <option value="Masculino" >Masculino</option>
                    <option value="Feminino" >Feminino</option>
                </select>
                <br>Apellido
                <input type="text" name="lastName" value="${this.party?.lastName}" required="" id="lastName" />
                <br>Direccion
                <input type="text" name="address" value="${this.party?.address}" required="" id="address" />
                <br>Correo
                <input type="text" name="mail" value="${this.party?.mail}" required="" id="mail" />
                <br>Es empresa
                <input type="hidden" name="_isCompany" />
                <input type="checkbox" name="isCompany" id="isCompany"  />
                <br>Nombre
                <input type="text" name="firstName" value="${this.party?.firstName}" required="" id="firstName" />
                <br>Nacionalidad
                <input type="text" name="nationality" value="${this.party?.nationality}" required="" id="nationality" />
                <br>Telefono
                <input type="text" name="phone" value="${this.party?.phone}" required="" id="phone" />
                <br>Creado por
                <input type="text" name="createdBy" value="${this.party?.createdBy}" required="" id="createdBy" />
                <br>Rut
                <input type="text" name="partyId" value="${this.party?.partyId}" required="" id="partyId" />
                <br>Representante
                <input type="text" name="representative" value="${this.party?.representative}" required="" id="representative" />
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
