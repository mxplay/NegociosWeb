<?php

    session_start();
    require_once("libs/utilities.php");
    $pageRequest = "menup";
    if(isset($_GET["page"])){
        $pageRequest = $_GET["page"];
    }
    //Incorporando los midlewares son codigos que se deben ejecutar
    //Siempre
    require_once("controllers/site.mw.php");
    require_once("controllers/verificar.mw.php");

    //Este switch se encarga de todo el enrutamiento

    switch($pageRequest){
        case "home":
            //llamar al controlador
            require_once("controllers/home.control.php");
            break;

        case "categorias":
            //llamar al controlador
            require_once("controllers/categorias.control.php");
            break;
        case "login":
            require_once("controllers/login.control.php");
            break;
        case "registro":
            require_once("controllers/registro.control.php");
            break;
        //para agregar una nueva pagina
        // agregar otro case
        case "menup":
          require_once("controllers/menup.control.php");
          break;
          case "bachillerato":
            require_once("controllers/bachillerato.control.php");
            break;
          case "visionymision":
            require_once("controllers/visionymision.control.php");
            break;
          case "actividades":
            require_once("controllers/actividades.control.php");
            break;
          case "oferta":
            require_once("controllers/oferta.control.php");
            break;
          case "primaria":
            require_once("controllers/primaria.control.php");
            break;
          case "secundaria":
            require_once("controllers/secundaria.control.php");
            break;
          case "servicios":
            require_once("controllers/servicios.control.php");
            break;
          case "iniciarsesion":
            require_once("controllers/iniciarsesion.control.php");
            break;
          case "cursos":
          require_once("controllers/cursos.control.php");
          break;
        default:
            require_once("controllers/error.control.php");

    }


?>
