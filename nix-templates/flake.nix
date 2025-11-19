{
  description = "My Nix templates";

  outputs = { self }: {
    templates = {
      simple-packages = {
        path = ./basic;
        description = "Simple universal package template";
      };
    };

    defaultTemplate = self.templates.basic;
  };
}
