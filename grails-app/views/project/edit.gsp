<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index">Lista de Proyectos</g:link></li>
                <li><g:link class="create" action="create">Nuevo Proyecto</g:link></li>
            </ul>
        </div>
        <div id="edit-project" class="content scaffold-edit" role="main">
            <h1>Editar Proyecto</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.project}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.project}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.project}" method="PUT">
                <g:hiddenField name="version" value="${this.project?.version}" />
              <table class="mostrarparty">
                <tr><td class="tdizq"><strong>codigo proyecto</strong></td>
                    <td><input type="text" name="codeProject" value="${this.project?.codeProject}" required="" id="codeProject" /></td></tr>
                <tr><td class="tdizq"><strong>pago por tarea completada</strong></td><td>
                <g:if test="${this.project?.paidByCompleteTask == true}">
                    <input type="hidden" name="_paidByCompleteTask"/>
                    <input type="checkbox" name="paidByCompleteTask" checked id="paidByCompleteTask"  />
                </g:if>
                <g:else>
                    <input type="hidden" name="_paidByCompleteTask"/>
                    <input type="checkbox" name="paidByCompleteTask" id="paidByCompleteTask"  />
                </g:else></td></tr>
                <tr><td class="tdizq"><strong>monto total</strong></td><td>
                <input type="number" name="totalAmount" value="${this.project?.totalAmount}" required="" id="totalAmount" /></td></tr>
                <tr><td class="tdizq"><strong>Nombre</strong></td><td>
                <input type="text" name="name" value="${this.project?.name}" required="" id="name" /></td></tr>
                <tr><td class="tdizq"><strong>Descripcion</strong></td><td>
                <input type="text" name="description" value="${this.project?.description}" required="" id="description" /></td></tr>
                <tr><td class="tdizq"><strong>hasta fecha</strong></td><td>
                <input type="hidden" name="thruDate" value="date.struct" />
                <select name="thruDate_day" id="thruDate_day" aria-labelledby="thruDate">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
                    <option value="24">24</option>
                    <option value="25">25</option>
                    <option value="26">26</option>
                    <option value="27">27</option>
                    <option value="28">28</option>
                    <option value="29">29</option>
                    <option value="30">30</option>
                    <option value="31">31</option>
                </select>
                <select name="thruDate_month" id="thruDate_month" aria-labelledby="thruDate">
                    <option value="1">January</option>
                    <option value="2">February</option>
                    <option value="3">March</option>
                    <option value="4">April</option>
                    <option value="5">May</option>
                    <option value="6">June</option>
                    <option value="7">July</option>
                    <option value="8">August</option>
                    <option value="9">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12" selected="selected">December</option>
                </select>
                <select name="thruDate_year" id="thruDate_year" aria-labelledby="thruDate">
                    <option value="2019">2019</option>
                    <option value="2018">2018</option>
                    <option value="2017">2017</option>
                    <option value="2016" selected="selected">2016</option>
                </select></td></tr>
              </table>
                <br>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
