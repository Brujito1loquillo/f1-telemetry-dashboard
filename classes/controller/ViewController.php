<?php

class ViewController  {
    protected $view;

    public function __construct (View $view = null) {
        if (is_null($view)) $this->view = new HomeView();
        else $this->view = $view;
    }
}

?>
