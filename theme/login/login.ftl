<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        DMS Login
    <#elseif section = "header">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>

        <script>
          function togglePassword() {
            var input = document.getElementById("password");
            var img   = document.getElementById("toggle-eye");

            if (input.type === "password") {
              input.type = "text";
              img.src = "${url.resourcesPath}/img/eye-off.png";
            } else {
              input.type = "password";
              img.src = "${url.resourcesPath}/img/eye.png";
            }
          }
        </script>

    <#elseif section = "form">

        <style>
          /* SFONDO TECH */

          html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: "Muli", Arial, sans-serif;
            overflow: hidden;
          }

          .reindex-bg {
            position: fixed;
            inset: 0;
            background: radial-gradient(circle at 20% 30%, #1aff68 0%, #0b7d3b 35%, #0a5e30 85%);
            z-index: 0;
          }

          .tech-lines::before,
          .tech-lines::after {
            content: "";
            position: absolute;
            inset: 0;
            background-repeat: no-repeat;
            pointer-events: none;
          }

          .tech-lines::before {
            background-image:
              linear-gradient(115deg, rgba(255,255,255,0.10) 0%, rgba(255,255,255,0) 60%),
              linear-gradient(300deg, rgba(255,255,255,0.06) 0%, rgba(255,255,255,0) 70%);
            mix-blend-mode: overlay;
          }

          .tech-lines::after {
            background-image:
              repeating-linear-gradient(45deg, rgba(0,255,85,0.16) 0, rgba(0,255,85,0.16) 2px, transparent 2px, transparent 16px),
              repeating-linear-gradient(-45deg, rgba(0,255,85,0.10) 0, rgba(0,255,85,0.10) 2px, transparent 2px, transparent 16px);
            opacity: 0.35;
          }

          /*  BOX LOGIN  */

          .reindex-page {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            z-index: 1;
          }

          .reindex-box {
            width: 440px;
            padding: 32px 28px;
            background: rgba(0, 0, 0, 0.88);
            border-radius: 16px;
            backdrop-filter: blur(5px);
            box-shadow: 0 10px 28px rgba(0,0,0,0.7);
            text-align: center;
            color: white;
            border: 1px solid rgba(255,255,255,0.12);
          }

          .reindex-logo {
            width: 90%;
            max-width: 430px;
            margin-bottom: 20px;
          }

          .reindex-title {
            font-size: 20px;
            margin-bottom: 24px;
            color: #e9fff5;
          }

          /*  LAYOUT FORM (tutto centrato) */

          .form-layout {
            display: flex;
            flex-direction: column;
            align-items: center;     /* centra orizzontalmente */
            gap: 12px;
            margin-top: 8px;
          }

          .field-wrapper,
          .password-wrapper {
            background: #ffffff;
            border-radius: 6px;
            border: 1px solid #cccccc;
            padding: 0 8px;
            display: flex;
            align-items: center;
            box-sizing: border-box;
            width: 100%;
            max-width: 340px;       /* stessa larghezza */
          }

          .field-wrapper input,
          .password-wrapper input {
            flex: 1;
            height: 36px;
            border: none;
            background: transparent;
            color: #222222;
            font-size: 15px;
            outline: none;
            padding: 0;
            margin: 0;
            text-align: left;
          }

          .field-wrapper input::placeholder,
          .password-wrapper input::placeholder {
            color: #888888;
          }

          .password-wrapper img {
            width: 18px;
            height: 18px;
            cursor: pointer;
            margin-left: 6px;
          }

          .submit {
            width: 100%;
            max-width: 340px;       /* uguale ai campi */
            height: 42px;
            margin-top: 12px;
            background: #16c46a;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            color: #082b18;
            cursor: pointer;
            transition: 0.2s;
          }

          .submit:hover {
            background: #1aff84;
            transform: translateY(-2px);
          }
        </style>

        <!-- SFONDO COMPLETO -->
        <div class="reindex-bg tech-lines"></div>

        <!-- CONTENUTO -->
        <div class="reindex-page">
            <div class="reindex-box">
                <img class="reindex-logo"
                     src="${url.resourcesPath}/img/logo-reindex-white.png?v=1"
                     alt="Reindex">

                <p class="reindex-title">Document Management System</p>

                <#if realm.password>
                    <form id="kc-form-login" class="form-layout" action="${url.loginAction}" method="post">

                        <!-- USERNAME -->
                        <div class="field-wrapper">
                            <input id="username"
                                   placeholder="${msg("username")}"
                                   type="text"
                                   name="username">
                        </div>

                        <!-- PASSWORD + OCCHIO -->
                        <div class="password-wrapper">
                            <input id="password"
                                   placeholder="${msg("password")}"
                                   type="password"
                                   name="password">
                            <img id="toggle-eye"
                                 src="${url.resourcesPath}/img/eye.png"
                                 alt="Mostra/Nascondi password"
                                 onclick="togglePassword()">
                        </div>

                        <input class="submit" type="submit" value="${msg("doLogIn")}">
                    </form>
                </#if>
            </div>
        </div>

    </#if>
</@layout.registrationLayout>
