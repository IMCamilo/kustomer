<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'party.label', default: 'Party')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-party" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-party" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
            <g:form action="save">
            <table>
              <tr>
                <tr><br>Genero</tr>
                <tr>&nbsp;<select name="gender" required="" id="gender" >
                    <option value="No Aplica" >No Aplica</option>
                    <option value="Masculino" >Masculino</option>
                    <option value="Feminino" >Feminino</option>
                    </select>
                </tr>
              </tr>
              <tr>
                <tr><br>Apellido</tr>
                <tr>&nbsp;<input type="text" name="lastName" value="" required="" id="lastName" /></tr>
              </tr>
              <tr>
                <tr><br>Direccion</tr>
                <tr><input type="text" name="address" value="" required="" id="address" /></tr>
              </tr>
              <tr>
                <tr><br>Correo</tr>
                <tr><input type="text" name="mail" value="" required="" id="mail" /></tr>
              </tr>
                <tr>
                <tr><br>Es empresa</tr>
                <tr><input type="hidden" name="_isCompany" /></tr>
                <tr><input type="checkbox" name="isCompany" id="isCompany"  /><tr>
                </tr>
                <tr>
                <tr><br>Nombre</tr>
                <input type="text" name="firstName" value="" required="" id="firstName" />
                </tr>
                <br>Nacionalidad
                <input type="text" name="nationality" value="" required="" id="nationality" />
                <br>Telefono
                <input type="text" name="phone" value="" required="" id="phone" />
                <input type="hidden" name="createdBy" value="${username}" required="" id="createdBy" />
                <br>Rut
                <input type="text" name="partyId" value="" required="" id="partyId" />
                <br>Representante
                <input type="text" name="representative" value="" required="" id="representative" />

              </table>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
