<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="layout" content="main" />
        <meta charset="UTF-8">
        <asset:link rel="icon" href="icono.png" type="image/x-ico" />
        <asset:stylesheet src="kustomer.css"/>
        <title>Administrador - Kustomer</title>
    </head>
    <body>
        <div class="page-header">
            <h1>Página de administración <small>CRM KUSTOMER</small></h1>
        </div>

        <div class="row">
            <div class="col-xs-6 col-md-3" data-toggle="tooltip" data-placement="left" title="Gestionar Documentos">
                <g:link controller="document">
                    <img src="http://www.auth4me.com/wp-content/uploads/2012/04/Document-Logo-150x150.png" alt="img doc">
                </g:link>
            </div>
            <div class="col-xs-6 col-md-3" data-toggle="tooltip" data-placement="left" title="Gestionar Asignaciones">
                <g:link controller="projectDetail">
                    <img src="https://www.gimmal.com/wp-content/uploads/2015/08/Gimmal-Market-Icons_SAP-150x150.png" alt="img assi">
                </g:link>
            </div>
            <div class="col-xs-6 col-md-3" data-toggle="tooltip" data-placement="left" title="Gestionar Participantes">
                <g:link controller="party">
                    <img src="http://sharepointmaven.com/wp-content/uploads/2015/06/team-site-icon-150x150.png" alt="img part">
                </g:link>
            </div>
            <div class="col-xs-6 col-md-3" data-toggle="tooltip" data-placement="left" title="Gestionar Proyectos">
                <g:link controller="project">
                    <img src="http://sharepointmaven.com/wp-content/uploads/2016/03/task-icon-150x150.png" alt="img pro">
                </g:link>
            </div>
        </div>
        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>
    </body>
</html>
