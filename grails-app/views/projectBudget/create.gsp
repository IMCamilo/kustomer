<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectBudget.label', default: 'ProjectBudget')}" />
        <title>Crear Presupuestos</title>
        <asset:stylesheet src="autocomplete.css"/>
        <asset:stylesheet src="kustomer.css"/>
    </head>
    <body>
        <a href="#create-projectBudget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index">Lista de Presupuestos</g:link></li>
            </ul>
        </div>
        <div id="create-projectBudget" class="content scaffold-create" role="main">
            <h1>Crear Presupuesto</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.projectBudget}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.projectBudget}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <br>
                <input type="hidden" name="createdBy" value="${username}" required="" id="createdBy" />

                <div class="fieldcontain required espacio">
                    <label for="name">Nombre del presupuesto
                        <span class="required-indicator">*</span>
                    </label>
                    <input id="name" class="typeahead" name="name" type="text" required="" placeholder="Nombre para el presupuesto">
                </div>

                <div class="fieldcontain required espacio">
                    <label for="totalAmount">Monto total
                        <span class="required-indicator">*</span>
                    </label>
                    <input id="totalAmount" class="typeahead" name="totalAmount" type="number" required="" placeholder="Monto para el presupuesto">
                </div>

                <div class="fieldcontain required espacio">
                    <label for="description">Descripción del presupuesto
                        <span class="required-indicator">*</span>
                    </label>
                    <input id="description" class="typeahead" name="description" type="text" required="" placeholder="Descripción para el presupuesto">
                </div>

                <div class="fieldcontain required espacio" id="projectInputDiv">
                    <label for="projectId">Asigna a un proyecto
                        <span class="required-indicator">*</span>
                    </label>
                    <input id="projectId" class="typeahead" name="projectId" type="text" required="" placeholder="Asigna a un proyecto">
                </div>
                <br>
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
                var projectList = [
                    <g:each in="${projectList}">
                        '${it.codeProject} ${it.name} - ${it.id}',
                    </g:each>
                ];
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
