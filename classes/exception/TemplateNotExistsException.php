<?php

class TemplateNotExistsException extends B1LException {
    protected $template;

    public function __construct (String $template) {
        parent::__construct();
        $this->template = $template;
    }
}

?>
