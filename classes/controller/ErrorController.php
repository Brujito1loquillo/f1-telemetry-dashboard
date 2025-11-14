<?php

class ErrorController extends ViewController {
    private $throwable;

    public function __construct (Throwable $t) {
        parent::__construct(new ErrorView());
        
        $this->throwable = $t;

        $c = "<h2>" . get_class($this->throwable) . "</h2>";
        $c .= "<p>" . $this->throwable->getMessage() . "</p>";

        $this->view->setContent($c);

        $this->view->setResource("error");

        $this->view->show();
    }
}

?>
