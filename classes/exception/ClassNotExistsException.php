<?php

class ClassNotExistsException extends B1LException {
    protected $class;

    public function __construct (String $class) {
        parent::__construct();

        $this->class = $class;
    }
}

?>
