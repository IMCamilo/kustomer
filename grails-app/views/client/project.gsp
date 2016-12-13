<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="layout" content="usermain" />
        <meta charset="UTF-8">
         <asset:link rel="icon" href="icono.png" type="image/x-ico" />
        <asset:stylesheet src="kustomer.css"/>
        <title>Proyectos - Kustomer - ${detailsUser.firstName} ${detailsUser.lastName}</title>
    </head>
    <body>
        <br>
        <table>
            <thead>
                <tr>
                    <th></th>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Pago por Tarea</th>
                    <th>Monto Total</th>
                    <th>Avance</th>
                    <th>Creado el</th>
                    <th>Avance</th>
                </tr>
            </thead>
            <tbody>
                <g:each var="project" status="i" in="${listProjectForUser}">
                    <tr class="${((i % 2 == 0) ? 'odd' : 'even')}">
                        <td>${i+1}</td>
                        <td>${project.codeProject}</td>
                        <td>${project.name}</td>
                        <td>${project.paidByCompleteTask}</td>
                        <td>${project.totalAmount}</td>
                        <td>
                            <div class="progress">
                                <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar"
                                aria-valuenow="${project.percentyTaskFinished}" aria-valuemin="0" aria-valuemax="${project.totalTask}" 
                                style="width:${project.percentyTaskFinished}%; color:black">
                                    ${project.percentyTaskFinished}%
                                </div>
                            </div>
                        </td>
                        <td><prettytime:display date="${project.creationDate}"/></td>
                        <td><g:link action="detailProject" params="[id:project.id]">detalles</g:link></td>
                    </tr>
                </g:each>
            </tbody>
        </table>


    </body>
</html>
