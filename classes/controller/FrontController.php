<?php

class FrontController {
    private $view, $method, $controller;

    ## Constructor
    public function __construct () {
        $sm = $_SERVER["REQUEST_METHOD"];

        if ($sm === "GET" && count($_GET) === 0) {
            $this->controller = new HomeController();
            $this->method = "show";
        } else {
            throw new Exception("El metodo de solicitud $sm no se esperaba");
        }
    }
}

?>
