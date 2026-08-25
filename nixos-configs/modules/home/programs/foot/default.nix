{ config, pkgs, ... }:

{
  programs.foot.enable = true;
  home.file.".config/foot/foot.ini".text = ''
font=JetBrainsMono NF:size=12
pad=6x6

[colors-dark]
foreground=c0caf5
background=08080c

# Normal
regular0=08080c
regular1=f7768e
regular2=9ece6a
regular3=e0af68
regular4=7aa2f7
regular5=bb9af7
regular6=7dcfff
regular7=a9b1d6

# Bright
bright0=30303a
bright1=ff7a93
bright2=a6e3a1
bright3=e8b86d
bright4=82aaff
bright5=c6a0f6
bright6=7ddfff
bright7=c0caf5

# Dim
dim0=202028
dim1=db4b4b
dim2=7aa2f7
dim3=c2965b
dim4=6585c7
dim5=9d7cd8
dim6=5ba7c4
dim7=727887
'';
}
