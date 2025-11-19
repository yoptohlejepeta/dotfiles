{
  description = "My Nix templates";
  
  outputs = { self }: {
    templates = {
      simple-packages = {
        path = ./simple-packages;
        description = "Simple universal package template";
      };
    };
    
    defaultTemplate = self.templates.basic;
  };
}
