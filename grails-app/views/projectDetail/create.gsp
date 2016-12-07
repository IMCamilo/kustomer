<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectDetail.label', default: 'ProjectDetail')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:stylesheet src="autocomplete.css"/>
        <style>
            .typeahead {
                width:400px;
            }
        </style>
    </head>
    <body>
        <a href="#create-projectDetail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-projectDetail" class="content scaffold- te" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
                <div class="fieldcontain required" id="descriptionInputDiv">
                    <label for="description">Descripcion de la asignacion
                        <span class="required-indicator">*</span>
                    </label>
                    <input id="description" class="typeahead" name="description" type="text" required="" placeholder="Descripción para la asignación">
                </div>

                <div class="fieldcontain required" id="userInputDiv">
                    <label for="partyId">Usuario
                        <span class="required-indicator">*</span>
                    </label>
                    <input id="partyId" class="typeahead" name="partyId" type="text" required="" placeholder="Busca un usuario">
                </div>

                <div class="fieldcontain required" id="projectInputDiv">
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
                        // an array that will be populated with substring matches
                        matches = [];
                        // regex used to determine if a string contains the substring `q`
                        substrRegex = new RegExp(q, 'i');
                        // iterate through the pool of strings and for any string that
                        // contains the substring `q`, add it to the `matches` array
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
                        '${it.firstName} ${it.lastName} - ${it.partyId}',
                    </g:each>
                ];
                var projectList = [
                    <g:each in="${projectList}">
                        '${it.name} - ${it.codeProject}',
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
