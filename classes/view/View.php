<?php

class View {
    private $templates, $styles, $menu, $content, $scripts;

    public function __construct () {
        $this->templates = [
            "head",
            "menu" => "header",
            "resource" => "default",
            "end"
        ];

        $this->styles = [];

        // $this->menu = MenuController::getMenu();

        // $this->scripts = [];
    }

    ## Metodos ##
    public function show (): void {
        foreach ($this->templates as $template) {
            if (file_exists($templateFile = "templates/$template.php"))
                require_once $templateFile;
            else {
                throw new Exception("La plantilla $templateFile no existe.");
                // throw new TemplateNotExistsException($template);
            }
        }
    }

    ## GETs & SETs
    public function setResource (String $resource): void {
        $this->templates["resource"] = $resource;
    }

    public function setContent ($content): void {
        $this->content = $content;
    }
}

?>
