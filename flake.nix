{
  description = "ojsef39 profile README generator";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/JHOFER-Cloud/NixOS-nixpkgs/0.1.tar.gz";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      inherit (pkgs) lib;

      username = "ojsef39";
      profileUrl = "https://github.com/${username}";

      palettes = {
        macchiato = {
          base = "24273a";
          mantle = "1e2030";
          surface0 = "363a4f";
          text = "cad3f5";
          subtext0 = "a5adcb";
          mauve = "c6a0f6";
          blue = "8aadf4";
          sapphire = "7dc4e4";
          sky = "91d7e3";
          green = "a6da95";
          yellow = "eed49f";
          peach = "f5a97e";
          red = "ed8796";
          pink = "f5bde6";
          lavender = "b7bdf8";
          teal = "8bd5ca";
        };
        latte = {
          base = "eff1f5";
          mantle = "e6e9ef";
          surface0 = "ccd0da";
          text = "4c4f69";
          subtext0 = "6c6f85";
          mauve = "8839ef";
          blue = "1e66f5";
          sapphire = "209fb5";
          sky = "04a5e5";
          green = "40a02b";
          yellow = "df8e1d";
          peach = "fe640b";
          red = "d20f39";
          pink = "ea76cb";
          lavender = "7287fd";
          teal = "179299";
        };
      };

      urls = {
        typing = p: "https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=600&size=24&pause=1200&color=${lib.toUpper p.mauve}&center=true&vCenter=true&width=560&lines=hi%2C+i'm+josef+%F0%9F%91%8B;system+engineer+%C2%B7+infra+tinkerer;coffee+in%2C+yaml+out";
        stats = p: "https://github-stats-extended.vercel.app/api?username=${username}&show_icons=true&hide_border=true&title_color=${p.mauve}&text_color=${p.text}&icon_color=${p.blue}&bg_color=${p.base}&hide=contribs&include_all_commits=true&card_width=380&line_height=30";
        streak = p: "https://github-readme-streak-stats.herokuapp.com/?user=${username}&hide_border=true&card_width=380&background=${p.base}&stroke=${p.blue}&ring=${p.mauve}&fire=${p.yellow}&currStreakNum=${p.text}&sideNums=${p.text}&currStreakLabel=${p.mauve}&sideLabels=${p.text}&dates=${p.subtext0}";
        topLangs = p: "https://github-stats-extended.vercel.app/api/top-langs?username=${username}&layout=compact&hide_border=true&title_color=${p.mauve}&text_color=${p.text}&bg_color=${p.base}&card_width=500&hide=typescript";
        activity = p: "https://github-readme-activity-graph.vercel.app/graph?username=${username}&bg_color=${p.base}&color=${p.mauve}&line=${p.blue}&point=${p.yellow}&area=true&hide_border=true&radius=8";
      };

      snakeUrls = {
        dark = "https://raw.githubusercontent.com/${username}/${username}/output/github-contribution-grid-snake-dark.svg";
        light = "https://raw.githubusercontent.com/${username}/${username}/output/github-contribution-grid-snake.svg";
      };

      mkPicture = {
        dark,
        light,
        alt,
      }: ''<picture><source media="(prefers-color-scheme: dark)" srcset="${dark}" /><source media="(prefers-color-scheme: light)" srcset="${light}" /><img alt="${alt}" src="${dark}" /></picture>'';

      mkLinked = url: inner: ''<a href="${url}">${inner}</a>'';

      themed = name: alt: let
        inner = mkPicture {
          dark = urls.${name} palettes.macchiato;
          light = urls.${name} palettes.latte;
          inherit alt;
        };
      in
        mkLinked profileUrl inner;

      badgeUrl = {
        display,
        logo,
        color,
      }: p: "https://img.shields.io/badge/${display}-${p.base}?style=for-the-badge&logo=${logo}&logoColor=${p.${color}}";

      themedBadge = {
        display,
        logo,
        color,
        link ? null,
      }: let
        url = badgeUrl {inherit display logo color;};
        inner = mkPicture {
          dark = url palettes.macchiato;
          light = url palettes.latte;
          alt = display;
        };
      in
        if link != null
        then mkLinked link inner
        else inner;

      visitorsUrl = p: "https://hits.sh/github.com/${username}.svg?style=for-the-badge&color=${p.base}&labelColor=${p.mantle}&label=visitors";

      linkBadges = {
        website = {
          display = "website";
          logo = "safari";
          color = "sky";
          link = "https://me.jhofer.de";
        };
        uptime = {
          display = "uptime";
          logo = "statuspage";
          color = "green";
          link = "https://status.jhofer.org";
        };
        email = {
          display = "email";
          logo = "maildotru";
          color = "mauve";
          link = "mailto:me+github@jhofer.de";
        };
      };

      # LinkedIn was removed from simple-icons after a trademark request and
      # GitHub strips `data:image/svg+xml` URIs from img src for security, so
      # we hand-build the badge SVG and host it in the repo. Referenced via
      # raw.githubusercontent.com (same path the snake uses).
      linkedinBadgeSvg = p: let
        textColor =
          if p == palettes.latte
          then "333"
          else "fff";
        path = "M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 01-2.063-2.065 2.063 2.063 0 112.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z";
      in ''<svg xmlns="http://www.w3.org/2000/svg" width="111" height="28" role="img" aria-label="LINKEDIN"><title>LINKEDIN</title><g shape-rendering="crispEdges"><rect width="111" height="28" fill="#${p.base}"/></g><g fill="#${textColor}" text-anchor="middle" font-family="Verdana,Geneva,DejaVu Sans,sans-serif" text-rendering="geometricPrecision" font-size="100"><g transform="translate(9 7) scale(.583)"><path fill="#${p.blue}" d="${path}"/></g><text transform="scale(.1)" x="655" y="175" textLength="670" font-weight="bold">LINKEDIN</text></g></svg>'';

      linkedinSvgFiles = {
        macchiato = pkgs.writeText "linkedin-macchiato.svg" (linkedinBadgeSvg palettes.macchiato);
        latte = pkgs.writeText "linkedin-latte.svg" (linkedinBadgeSvg palettes.latte);
      };

      linkedinBadge = let
        url = name: "./assets/linkedin-${name}.svg";
        inner = mkPicture {
          dark = url "macchiato";
          light = url "latte";
          alt = "linkedin";
        };
      in
        mkLinked "https://linkedin.com/in/josef-h-65332423a" inner;

      toolchainBadges = {
        nix = {
          display = "Nix";
          logo = "nixos";
          color = "blue";
        };
        python = {
          display = "Python";
          logo = "python";
          color = "yellow";
        };
        go = {
          display = "Go";
          logo = "go";
          color = "sky";
        };
        bash = {
          display = "Bash";
          logo = "gnubash";
          color = "green";
        };
        lua = {
          display = "Lua";
          logo = "lua";
          color = "blue";
        };
        kubernetes = {
          display = "Kubernetes";
          logo = "kubernetes";
          color = "blue";
        };
        talos = {
          display = "Talos";
          logo = "talos";
          color = "mauve";
        };
        flux = {
          display = "Flux";
          logo = "flux";
          color = "mauve";
        };
        helm = {
          display = "Helm";
          logo = "helm";
          color = "blue";
        };
        docker = {
          display = "Docker";
          logo = "docker";
          color = "blue";
        };
        terraform = {
          display = "Terraform";
          logo = "terraform";
          color = "mauve";
        };
        renovate = {
          display = "Renovate";
          logo = "renovate";
          color = "teal";
        };
        prometheus = {
          display = "Prometheus";
          logo = "prometheus";
          color = "peach";
        };
        grafana = {
          display = "Grafana";
          logo = "grafana";
          color = "yellow";
        };
        nixos = {
          display = "NixOS";
          logo = "nixos";
          color = "sapphire";
        };
        macos = {
          display = "macOS";
          logo = "apple";
          color = "text";
        };
        neovim = {
          display = "Neovim";
          logo = "neovim";
          color = "green";
        };
      };

      widgets =
        {
          typing = mkPicture {
            dark = urls.typing palettes.macchiato;
            light = urls.typing palettes.latte;
            alt = "typing";
          };
          stats = themed "stats" "stats";
          streak = themed "streak" "streak";
          topLangs = themed "topLangs" "top languages";
          activity = themed "activity" "activity graph";
          snake = mkLinked profileUrl (mkPicture {
            inherit (snakeUrls) dark light;
            alt = "contribution snake";
          });
          visitors = mkPicture {
            dark = visitorsUrl palettes.macchiato;
            light = visitorsUrl palettes.latte;
            alt = "visitors";
          };
          linkedin = linkedinBadge;
        }
        // lib.mapAttrs (_: themedBadge) (linkBadges // toolchainBadges);

      template = builtins.readFile ./template.md;

      readme =
        lib.replaceStrings
        (map (k: "{{${k}}}") (builtins.attrNames widgets))
        (builtins.attrValues widgets)
        template;

      readmeFile = pkgs.writeText "ReadME.md" readme;

      regenerate = pkgs.writeShellApplication {
        name = "d-regen";
        text = ''
          cd "$(git rev-parse --show-toplevel)"
          mkdir -p assets
          install -m 0644 ${readmeFile} ./ReadME.md
          install -m 0644 ${linkedinSvgFiles.macchiato} ./assets/linkedin-macchiato.svg
          install -m 0644 ${linkedinSvgFiles.latte} ./assets/linkedin-latte.svg
          echo "ReadME.md and assets/ regenerated"
        '';
      };

      preview = pkgs.writeShellApplication {
        name = "d-preview";
        runtimeInputs = [regenerate pkgs.gh-markdown-preview];
        text = ''
          cd "$(git rev-parse --show-toplevel)"
          d-regen
          gh-markdown-preview ReadME.md
        '';
      };
    in {
      packages = {
        default = readmeFile;
        readme = readmeFile;
        inherit regenerate preview;
      };

      apps = {
        regenerate = {
          type = "app";
          program = lib.getExe regenerate;
        };
        preview = {
          type = "app";
          program = lib.getExe preview;
        };
      };

      devShells.default = pkgs.mkShell {
        packages = [regenerate preview];
      };

      formatter = pkgs.alejandra;
    });
}
