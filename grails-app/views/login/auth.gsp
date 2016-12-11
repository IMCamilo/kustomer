<html>
    <head>
        <asset:stylesheet src="bootstrap.css"/>
        <asset:stylesheet src="login.css"/>
        <title><g:message code='springSecurity.login.title'/></title>
        <style>
            body {
                background-image:url('http://www.morada.com.mx/images/fondo-constructora-en-guadalajara.jpg');
            }
        </style>
    </head>
    <body>
    <div id="login">
        <div class="inner">
            <g:if test='${flash.message}'>
                <div class="alert alert-danger" role="alert">${flash.message}</div>
            </g:if>

            <div class="login">
                <h1>Inicia Sesión</h1>
                <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
                    <p>
                        <label for="username">Correo electrónico :</label>
                        <input type="text" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>
                    </p>
                    <p>
                        <label for="password">Contraseña :</label>
                        <input type="password" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>
                    </p>
                    <p id="remember_me_holder">
                        <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                        <label for="remember_me">Recordar</label>
                    </p>
                    <p class="submit"><input type="submit" name="commit" value="Entrar"></p>
                </form>
            </div>


        </div>
    </div>
    <script>
        (function() {
            document.forms['loginForm']
                .elements['${usernameParameter ?: 'username'}'].focus();
        })();
    </script>
    </body>
</html>