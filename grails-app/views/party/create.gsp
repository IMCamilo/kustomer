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
                <br>Genero
                <select name="gender" required="" id="gender" >
                    <option value="No Aplica" >No Aplica</option>
                    <option value="Masculino" >Masculino</option>
                    <option value="Feminino" >Feminino</option>
                </select>
                <br>Apellido
                <input type="text" name="lastName" value="" required="" id="lastName" />
                <br>Direccion
                <input type="text" name="address" value="" required="" id="address" />
                <br>Correo
                <input type="text" name="mail" value="" required="" id="mail" />
                <br>Es empresa
                <input type="hidden" name="_isCompany" />
                <input type="checkbox" name="isCompany" id="isCompany"  />
                <br>Fecha creacion
                <input type="hidden" name="creationDate" value="date.struct" />
                <select name="creationDate_day" id="creationDate_day" aria-labelledby="creationDate">
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
                <select name="creationDate_month" id="creationDate_month" aria-labelledby="creationDate">
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
                <select name="creationDate_year" id="creationDate_year" aria-labelledby="creationDate">
                    <option value="2018">2018</option>
                    <option value="2017">2017</option>
                    <option value="2016" selected="selected">2016</option>
                </select>
                <br>Nombre
                <input type="text" name="firstName" value="" required="" id="firstName" />
                <br>Nacionalidad
                <input type="text" name="nationality" value="" required="" id="nationality" />
                <br>Telefono
                <input type="text" name="phone" value="" required="" id="phone" />
                <br>Creado por
                <input type="text" name="createdBy" value="" required="" id="createdBy" />
                <br>Rut
                <input type="text" name="partyId" value="" required="" id="partyId" />
                <br>Representante
                <input type="text" name="representative" value="" required="" id="representative" />
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
