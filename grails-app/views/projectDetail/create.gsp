<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectDetail.label', default: 'ProjectDetail')}" />
        <title>Nueva Asignación</title>
        <asset:stylesheet src="autocomplete.css"/>
        <asset:stylesheet src="kustomer.css"/>
    </head>
    <body>
        <a href="#create-projectDetail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index">Lista de Asignaciones</g:link></li>
            </ul>
        </div>
        <div id="create-projectDetail" class="content scaffold- te" role="main">
            <h1>Crear Asignación</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.projectDetail}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.projectDetail}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">

                <input type="hidden" name="createdBy" value="${username}" required="" id="createdBy" />
                <br>
                <div class="fieldcontain required espacio" id="descriptionInputDiv">
                    <label for="description">Descripcion de la asignacion
                        <span class="required-indicator">*</span>
                    </label>
                    <input id="description" class="typeahead" name="description" type="text" required="" placeholder="Descripción para la asignación">
                </div>

                <div class="fieldcontain required espacio" id="userInputDiv">
                    <label for="partyId">Usuario
                        <span class="required-indicator">*</span>
                    </label>
                    <input id="partyId" class="typeahead" name="partyId" type="text" required="" placeholder="Busca un usuario">
                </div>

                <div class="fieldcontain required espacio" id="projectInputDiv">
                    <label for="projectId">Proyecto
                        <span class="required-indicator">*</span>
                    </label>
                    <input id="projectId" class="typeahead" name="projectId" type="text" required="" placeholder="Busca un proyecto">
                </div>
                <br><br>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>

        <asset:javascript src="jquery-2.2.0.min.js"/>
        <asset:javascript src="typeahead.bundle.js"/>
        <script>
            $(document).ready(function() {
                var substringMatcher = function(strs) {
                    return function findMatches(q, cb) {
                        var matches, substringRegex;
                        matches = [];
                        substrRegex = new RegExp(q, 'i');
                        $.each(strs, function(i, str) {
                            if (substrRegex.test(str)) {
                                matches.push(str);
                            }
                        });
                        cb(matches);
                    };
                };
                var userList = [
                    <g:each in="${userList}">
                        '${it.partyId} ${it.firstName} ${it.lastName} - ${it.id}',
                    </g:each>
                ];
                var projectList = [
                    <g:each in="${projectList}">
                        '${it.codeProject} ${it.name} - ${it.id}',
                    </g:each>
                ];
                $('#userInputDiv .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'userList',
                    source: substringMatcher(userList)
                });
                $('#projectInputDiv .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'projectList',
                    source: substringMatcher(projectList)
                });
            });
        </script>

    </body>
</html>
