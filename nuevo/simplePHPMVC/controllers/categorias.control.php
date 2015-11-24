<?php
/* Controlador: Listado de Categorias
 * Fecha: 2015-06-30
 * Created By: OJBA
 * Last Modification:
 */
  require_once("libs/template_engine.php");
  //Agregar requires de modelos aquí
  //ej require_once("models/tabla.model.php");
  require_once("models/categorias.model.php");


  //=================================
  function run(){
    /*Agregar código aquí*/
    $categorias = array();
    $categorias = obtenerCategorias();
    /*$categorias[] = array(
        "catcod" => 1,
        "catdsc" => "Categoria",
        "catest" => "ACT"
    );
    $categorias[] = array(
        "catcod" => 2,
        "catdsc" => "Categoria 2",
        "catest" => "ACT"
    );
    $categorias[] = array(
        "catcod" => 3,
        "catdsc" => "Categoria 3",
        "catest" => "INA"
    );*/

    /*====================*/
    renderizar("categorias",
                array("categorias"=>$categorias));
  }
  run();
?>
