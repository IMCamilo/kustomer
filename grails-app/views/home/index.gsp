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
                <a href="/document/" class="thumbnail"><img src="http://tommuir.net/img/icon-projects.png" alt="img doc"></a>
            </div>
            <div class="col-xs-6 col-md-3" data-toggle="tooltip" data-placement="left" title="Gestionar Asignaciones">
                <a href="/projectDetail/" class="thumbnail"><img src="http://ciarancanavan.com/images/projects.png" alt="img assi"></a>
            </div>
            <div class="col-xs-6 col-md-3" data-toggle="tooltip" data-placement="left" title="Gestionar Participantes">
                <a href="/party" class="thumbnail"><img src="http://givebycell.com/wp-content/uploads/2015/09/Give_clienticon_community.png" alt="img part"></a>
            </div>
            <div class="col-xs-6 col-md-3" data-toggle="tooltip" data-placement="left" title="Gestionar Proyectos">
                <a href="/project" class="thumbnail"><img src="http://www.lauravenuto.com/wp-content/uploads/laura-venuto-services-icon-special-projects.png" alt="img pro"></a>
            </div>
        </div>
        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>
    </body>
</html>
