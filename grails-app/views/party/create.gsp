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
                <td><br>Genero</td>
                <td>&nbsp;<select name="gender" required="" id="gender" >
                    <option value="No Aplica" >No Aplica</option>
                    <option value="Masculino" >Masculino</option>
                    <option value="Feminino" >Feminino</option>
                    </select>
                </td>
              </tr>
              <tr>
                <td><br>Apellido</td>
                <td>&nbsp;<input type="text" name="lastName" value="" required="" id="lastName" /></td>
              </tr>
              <tr>
                <td><br>Direccion</td>
                <td>&nbsp;<input type="text" name="address" value="" required="" id="address" /></td>
              </tr>
              <tr>
                <td><br>Correo</td>
                <td>&nbsp;<input type="text" name="mail" value="" required="" id="mail" /></td>
              </tr>
                <tr>
                <td><br>Es empresa</td>
                <td>&nbsp;<input type="hidden" name="_isCompany" /></td>
                <td>&nbsp;<input type="checkbox" name="isCompany" id="isCompany"  /><td>
                </tr>
                <tr>
                <td><br>Nombre</td>
                <td>&nbsp;<input type="text" name="firstName" value="" required="" id="firstName" /></td>
                </tr>
                <tr>
                <td><br>Nacionalidad</td>
                <td>&nbsp;<input type="text" name="nationality" value="" required="" id="nationality" /></td>
                </tr>
                <tr>
                <td><br>Telefono</td>
                <td>&nbsp;<input type="text" name="phone" value="" required="" id="phone" /></td>
                <td>&nbsp;<input type="hidden" name="createdBy" value="${username}" required="" id="createdBy" /></td>
                </tr>
                <tr>
                <td><br>Rut</td>
                <td>&nbsp;<input type="text" name="partyId" value="" required="" id="partyId" /></td>
                </tr>
                <tr>
                <td><br>Representante</td>
                <td>&nbsp;<input type="text" name="representative" value="" required="" id="representative" /></td>
                </tr>
              </table>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
