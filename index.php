<?php
// phpinfo();

## CARGA DE CLASES ##
spl_autoload_register(function (String $className) {
    $classType= "model";

    if (fnmatch("*Controller", $className))
        $classType = "controller";
    else if (fnmatch("*View", $className))
        $classType = "view";
    else if (fnmatch("*Exception", $className))
        $classType = "exception";

    if (file_exists($classFile = "classes/$classType/$className.php"))
        require_once $classFile;
    else {
        throw new Exception("El fichero $classFile no existe");
        // throw new ClassNotExistsException("El fichero $classFile no existe");
    }
});

$GLOBALS["core"] = null;

try {
    $GLOBALS["core"] = new FrontController();
} catch (B1LException $b1l) {
    $GLOBALS["core"] = new ErrorController($b1l);
} catch (Exception $e) {
    $GLOBALS["core"] = new ErrorController($e);
} finally {}

?>
