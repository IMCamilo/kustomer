<!doctype html>
<html lang="en" class="no-js">
<head>
<asset:stylesheet src="kustomer.css"/>
<asset:link rel="icon" href="icono.png" type="image/x-ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>

    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/home">
                    <i class="fa grails-icon">
                        <asset:image src="iconkustomer.png"/>
                    </i>KUSTOMER
                </a>
            </div>
            <div class="navbar-collapse collapse" aria-expanded="false" >
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                            role="button" aria-haspopup="true" aria-expanded="false">Usuario<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><g:link controller="party" action="account">Perfil</g:link></li>
                            <li><g:link controller="logoff">Salir</g:link></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                           role="button" aria-haspopup="true" aria-expanded="false">Proyectos<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><g:link controller="project" action="index">Proyectos</g:link></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                           role="button" aria-haspopup="true" aria-expanded="false">Asignaciones<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><g:link controller="projectDetail" action="index">Gestionar</g:link></li>
                        </ul>
                    </li>
                </ul>
                 <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                            role="button" aria-haspopup="true" aria-expanded="false">Participantes<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><g:link controller="party" action="index">Participantes</g:link></li>
                            <li><g:link controller="user" action="index">Usuarios</g:link></li>
                            <li><g:link controller="role" action="index">Roles</g:link></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                            role="button" aria-haspopup="true" aria-expanded="false">Documentos<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><g:link controller="document" action="index">Emitidos</g:link></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <g:pageProperty name="page.nav" />
                </ul>
            </div>
        </div>
    </div>

    <g:layoutBody/>

    <div class="footer" role="contentinfo">@KUSTOMER CRM - CONSTRUCTORA JOPIA SPA. 2016</div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
