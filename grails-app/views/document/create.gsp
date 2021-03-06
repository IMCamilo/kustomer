<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
        <title>Crear Documento</title>
        <asset:stylesheet src="autocomplete.css"/>
        <asset:stylesheet src="kustomer.css"/>
    </head>
    <body>
        <a href="#create-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index">Lista Documento</g:link></li>
            </ul>
        </div>
        <div id="create-document" class="content scaffold-create" role="main">
            <h1>Crear Documento</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.document}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.document}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <input type="hidden" name="createdBy" value="${username}" required="" id="createdBy" />

                <div class="fieldcontain required" >
                <label><br>Numero de documento
                <span class="required-indicator">*</span></label>
                <input type="number" name="numberDocument" value="" required="" id="numberDocument" />
                </div>
                <br>Project Detail (autocompletable de detalle de proyecto)
                o en su defecto en el detalle de proyecto (como entidad)
                un "generar docuemnto" para que genere un documento.

                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
