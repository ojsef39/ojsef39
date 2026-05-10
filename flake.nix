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

      visitorsUrl = p: "https://komarev.com/ghpvc/?username=${username}&style=for-the-badge&color=${p.base}&label=VISITORS&labelColor=${p.mantle}";

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
        linkedin = {
          display = "linkedin";
          logo = "linkedin";
          color = "blue";
          link = "https://linkedin.com/in/josef-h-65332423a";
        };
      };

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
          install -m 0644 ${readmeFile} ./ReadME.md
          echo "ReadME.md regenerated"
        '';
      };
    in {
      packages = {
        default = readmeFile;
        readme = readmeFile;
        inherit regenerate;
      };

      apps.regenerate = {
        type = "app";
        program = lib.getExe regenerate;
      };

      devShells.default = pkgs.mkShell {
        packages = [regenerate];
      };

      formatter = pkgs.alejandra;
    });
}
