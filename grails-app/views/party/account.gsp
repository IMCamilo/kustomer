<!DOCTYPE html>
<html>
    <head>
    <asset:link rel="icon" href="icono.png" type="image/x-ico" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'party.label', default: 'Party')}" />
        <asset:stylesheet src="kustomer.css"/>
        <title>Cuenta ${detailsUser.firstName} ${detailsUser.lastName}</title>
    </head>
    <body>


        <div class="row">
                <h2>Detalles Cuenta</h2>
                <div class="col-md-6">
                    <div class="container">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td>Rut</td>
                                    <td>${detailsUser.partyId}</td>
                                </tr>
                                <tr>
                                    <td>Nombres</td>
                                    <td>${detailsUser.firstName}</td>
                                </tr>
                                <tr>
                                    <td>Apellidos</td>
                                    <td>${detailsUser.lastName}</td>
                                </tr>
                                <tr>
                                    <td>Dirección</td>
                                    <td>${detailsUser.address}</td>
                                </tr>
                                <tr>
                                    <td>Género</td>
                                    <td>${detailsUser.gender}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="container">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td>Es Empresa?</td>
                                    <td>
                                        <g:if test="${detailsUser.isCompany == true}">Si</g:if>
                                        <g:else>No</g:else>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="container">
                    <table class="table">
                        <tbody>
                            <tr>
                                <td>Correo</td>
                                <td>${detailsUser.mail}</td>
                            </tr>
                            <tr>
                                <td>Teléfono</td>
                                <td>${detailsUser.phone}</td>
                            </tr>
                            <tr>
                                <td>Representante</td>
                                <td>${detailsUser.representative}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
