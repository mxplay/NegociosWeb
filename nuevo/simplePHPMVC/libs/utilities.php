<?php
    $global_context = array();

    function addToContext($key,$value){
        global $global_context;
        $global_context[$key] = $value;
    }

    function redirectWithMessage($message, $url="index.php"){
      echo "<script>alert('$message'); window.location='$url';</script>";
      die();
    }

    function redirectToUrl($url){
      header("Location: $url");
      die();
    }

    function mergeArrayTo(&$origin, &$destiny){
      if(is_array($origin) && is_array($destiny)){
        foreach($origin as $okey => $ovalue){
          if(isset($destiny[$okey])){
            $destiny[$okey] = $ovalue;
          }
        }
      }
    }
?>
