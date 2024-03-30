{ pkgs ? import <nixpkgs> { }
,
}:

with pkgs;
let
  hugo = buildGoModule rec {
    nativeBuildInputs = [ gcc installShellFiles ];

    name = "hugo-katex";
    version = "6fcd31be18f1a0fc23b08620ed3e3b0465ac3a07";
    src = fetchFromGitHub {
      owner = "PietroCarrara";
      repo = "hugo";
      rev = version;
      hash = "sha256-1/9orKPwB7ZYQKJleMWBNJkwBSSxNaHoy8N8/PEoQ44=";
    };

    doCheck = false;
    proxyVendor = true;
    vendorHash = "sha256-Kh8epqCSkB+ymLiU5ihkhKQ0xGLV7yCQur1OKXCVL7I=";

    tags = [ "extended" ];

    postInstall = let emulator = stdenv.hostPlatform.emulator buildPackages; in ''
      ${emulator} $out/bin/hugo gen man
      installManPage man/*
      installShellCompletion --cmd hugo \
        --bash <(${emulator} $out/bin/hugo completion bash) \
        --fish <(${emulator} $out/bin/hugo completion fish) \
        --zsh  <(${emulator} $out/bin/hugo completion zsh)
    '';
  };
in

stdenv.mkDerivation {
  name = "PietroCarrara.github.io";
  nativeBuildInputs = [ hugo ];
  buildInputs = [ git ];

  src = ./.;
  buildPhase = ''
    hugo --destination $out
  '';
}
