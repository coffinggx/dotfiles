{ config, pkgs, ... }:

{
  programs.kitty.enable = true;
  home.file.".config/kitty/kitty.conf".text = ''
# ──────────────────────────────
#   FONT
# ──────────────────────────────

font_family      JetBrainsMono Nerd Font
italic_font      JetBrainsMono Nerd Font Italic
bold_font        JetBrainsMono Nerd Font Bold
bold_italic_font JetBrainsMono Nerd Font Bold Italic
font_size 14

adjust_line_height 4
adjust_column_width 1
disable_ligatures never

# ──────────────────────────────
#   WINDOW BEHAVIOR
# ──────────────────────────────

window_padding_width 14
enable_audio_bell no
remember_window_size no
placement_strategy center
hide_window_decorations titlebar-only

# ──────────────────────────────
#   PERFORMANCE
# ──────────────────────────────

repaint_delay 10
input_delay   1
sync_to_monitor yes

# ──────────────────────────────
#   SCROLLBACK
# ──────────────────────────────

scrollback_lines 5000
scrollback_pager_history_size 64

# ──────────────────────────────
#   KEYBINDINGS
# ──────────────────────────────

map ctrl+shift+enter new_tab
map ctrl+shift+left  previous_tab
map ctrl+shift+right next_tab
map ctrl+shift+w     close_tab

# ──────────────────────────────
#   COLORS — Koda Super Black
# ──────────────────────────────

foreground            #b8b8b8
background            #050505
background_opacity    0.98

selection_foreground  #eeeeee
selection_background  #202020

cursor                #d8d8d8
cursor_text_color     #050505

url_color             #a0a0a0
active_border_color   #222222
inactive_border_color #101010

# ───────── ANSI

# black / base
color0   #000000
color8   #4a4a4a

# red / danger
color1   #555555
color9   #858585

# green
color2   #666666
color10  #aaaaaa

# yellow / warning
color3   #737373
color11  #c0c0c0

# blue / highlight
color4   #808080
color12  #c8c8c8

# magenta / pink
color5   #8c8c8c
color13  #d0d0d0

# cyan
color6   #969696
color14  #d8d8d8

# white / foreground
color7   #b8b8b8
color15  #eeeeee

# ──────────────────────────────
#   CURSOR / BORDER
# ──────────────────────────────

window_border_width 0

cursor_shape block
cursor_blink_interval 0.8

shell_integration enabled
'';
}
