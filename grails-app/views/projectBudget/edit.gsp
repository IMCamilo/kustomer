<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectBudget.label', default: 'ProjectBudget')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:stylesheet src="autocomplete.css"/>
        <asset:stylesheet src="kustomer.css"/>
    </head>
    <body>
        <a href="#edit-projectBudget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-projectBudget" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
            <g:form resource="${this.projectBudget}" method="PUT">
                <g:hiddenField name="version" value="${this.projectBudget?.version}" />
                <div class="fieldcontain required espacio">
                    <label for="name">Nombre del presupuesto
                        <span class="required-indicator">*</span>
                    </label>
                    <input id="name" value="${this.projectBudget?.name}" class="typeahead" name="name" type="text" required="" placeholder="Nombre para el presupuesto">
                </div>

                <div class="fieldcontain required espacio">
                    <label for="totalAmount">Monto total
                        <span class="required-indicator">*</span>
                    </label>
                    <input id="totalAmount" value="${this.projectBudget?.totalAmount}" class="typeahead" name="totalAmount" type="number" required="" placeholder="Monto para el presupuesto">
                </div>

                <div class="fieldcontain required espacio">
                    <label for="description">Descripción del presupuesto
                        <span class="required-indicator">*</span>
                    </label>
                    <input id="description" value="${this.projectBudget?.description}" class="typeahead" name="description" type="text" required="" placeholder="Descripción para el presupuesto">
                </div>

                <div class="fieldcontain required espacio" id="assignInputDiv">
                    <label for="projectDetailId">Asigna a un proyecto
                        <span class="required-indicator">*</span>
                    </label>
                    <input id="projectDetailId" value="${currentProject.codeProject} ${currentProject.name} - ${currentProject.id}" class="typeahead" name="projectDetailId" type="text" required="" placeholder="Asigna a un proyecto">
                </div>
                <br>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
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
                $('#assignInputDiv .typeahead').typeahead({
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
