{
  description = "My Nix templates";

  outputs = { self }: {
    templates = {
      basic = {
        path = ./basic;
        description = "Simple universal package template";
      };
    };

    defaultTemplate = self.templates.basic;
  };
}
