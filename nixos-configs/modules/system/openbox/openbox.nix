{ config, pkgs, ... }:

{
  services.xserver.windowManager.openbox.enable = true;

  environment.systemPackages = with pkgs; [
    openbox
    conky
    rofi
    ghostty
    firefox
    feh
    xorg.xset
    bash
    coreutils
    iproute2
  ];

  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xorg.xset}/bin/xset r rate 200 50
  '';

  environment.etc."conky/conky.conf".text = ''
    conky.config = {
      alignment = 'top_left',
      background = false,
      border_width = 0,
      cpu_avg_samples = 2,
      default_color = 'aaaaaa',
      double_buffer = true,
      draw_borders = false,
      draw_graph_borders = false,
      draw_outline = false,
      draw_shades = false,
      font = 'JetBrainsMono Nerd Font:size=9',
      gap_x = 0,
      gap_y = 0,
      minimum_width = 1920,
      minimum_height = 1080,
      maximum_width = 1920,
      own_window = true,
      own_window_argb_visual = true,
      own_window_argb_value = 255,
      own_window_class = 'Conky',
      own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
      own_window_transparent = false,
      own_window_type = 'normal',
      update_interval = 2,
      use_xft = true,
    }

    conky.text = [[
''${goto 1680}''${voffset 30}CPU  ''${cpu cpu0}%
''${goto 1680}RAM  ''${memperc}%
''${goto 1680}BAT  ''${execi 10 sh -c 'bat=$(find /sys/class/power_supply -maxdepth 1 -type l -name "BAT*" | head -n1); if [ -n "$bat" ] && [ -r "$bat/capacity" ]; then cat "$bat/capacity"; else printf "N/A"; fi'}%
''${goto 1680}NET  ''${execi 5 sh -c 'if ${pkgs.iproute2}/bin/ip route get 1.1.1.1 >/dev/null 2>&1; then printf online; else printf offline; fi'}
''${goto 1680}TIME ''${time %I:%M %p}
    ]]
  '';

  environment.etc."xdg/openbox/rc.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>

    <openbox_config xmlns="http://openbox.org/3.6/rc">

      <theme>
        <name>Default</name>
        <titleLayout>NLIMC</titleLayout>
        <keepBorder>yes</keepBorder>
        <animateIconify>no</animateIconify>
        <font>
          <name>JetBrainsMono Nerd Font</name>
          <size>7</size>
          <weight>Normal</weight>
          <slant>Normal</slant>
        </font>
      </theme>

      <desktops>
        <number>4</number>
        <firstdesk>1</firstdesk>
        <names>
          <name>1</name>
          <name>2</name>
          <name>3</name>
          <name>4</name>
        </names>
        <popupTime>300</popupTime>
      </desktops>

      <focus>
        <focusNew>yes</focusNew>
        <followMouse>no</followMouse>
        <focusLast>yes</focusLast>
        <underMouse>no</underMouse>
        <raiseOnFocus>yes</raiseOnFocus>
      </focus>

      <placement>
        <policy>Smart</policy>
        <center>no</center>
        <monitor>Primary</monitor>
      </placement>

      <mouse>
        <context name="Frame">
          <mousebind button="W-Left" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
          </mousebind>

          <mousebind button="W-Left" action="Drag">
            <action name="Move"/>
          </mousebind>

          <mousebind button="W-Right" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
          </mousebind>

          <mousebind button="W-Right" action="Drag">
            <action name="Resize"/>
          </mousebind>

          <mousebind button="Middle" action="Press">
            <action name="Lower"/>
          </mousebind>
        </context>

        <context name="Root">
          <mousebind button="Right" action="Press">
            <action name="ShowMenu">
              <menu>root-menu</menu>
            </action>
          </mousebind>
        </context>

        <context name="Titlebar">
          <mousebind button="Left" action="Press">
            <action name="Focus"/>
            <action name="Raise"/>
          </mousebind>

          <mousebind button="Left" action="Drag">
            <action name="Move"/>
          </mousebind>

          <mousebind button="Double-Left" action="Press">
            <action name="ToggleMaximize"/>
          </mousebind>

          <mousebind button="Right" action="Press">
            <action name="ShowMenu">
              <menu>client-menu</menu>
            </action>
          </mousebind>
        </context>

        <context name="Close">
          <mousebind button="Left" action="Press">
            <action name="Close"/>
          </mousebind>
        </context>

        <context name="Maximize">
          <mousebind button="Left" action="Press">
            <action name="ToggleMaximize"/>
          </mousebind>
        </context>

        <context name="Iconify">
          <mousebind button="Left" action="Press">
            <action name="Iconify"/>
          </mousebind>
        </context>
      </mouse>

      <keyboard>
        <keybind key="W-Return">
          <action name="Execute">
            <command>ghostty</command>
          </action>
        </keybind>

        <keybind key="W-b">
          <action name="Execute">
            <command>firefox</command>
          </action>
        </keybind>

        <keybind key="W-d">
          <action name="Execute">
            <command>rofi -show drun</command>
          </action>
        </keybind>

        <keybind key="W-q">
          <action name="Close"/>
        </keybind>

        <keybind key="W-f">
          <action name="ToggleMaximize"/>
        </keybind>

        <keybind key="W-space">
          <action name="ShowMenu">
            <menu>root-menu</menu>
          </action>
        </keybind>

        <keybind key="A-Tab">
          <action name="NextWindow"/>
        </keybind>

        <keybind key="A-S-Tab">
          <action name="PreviousWindow"/>
        </keybind>

        <keybind key="W-Left">
          <action name="DirectionalCycleWindows">
            <direction>left</direction>
          </action>
        </keybind>

        <keybind key="W-Right">
          <action name="DirectionalCycleWindows">
            <direction>right</direction>
          </action>
        </keybind>

        <keybind key="W-Up">
          <action name="DirectionalCycleWindows">
            <direction>up</direction>
          </action>
        </keybind>

        <keybind key="W-Down">
          <action name="DirectionalCycleWindows">
            <direction>down</direction>
          </action>
        </keybind>

        <keybind key="W-1">
          <action name="GoToDesktop">
            <to>1</to>
          </action>
        </keybind>

        <keybind key="W-2">
          <action name="GoToDesktop">
            <to>2</to>
          </action>
        </keybind>

        <keybind key="W-3">
          <action name="GoToDesktop">
            <to>3</to>
          </action>
        </keybind>

        <keybind key="W-4">
          <action name="GoToDesktop">
            <to>4</to>
          </action>
        </keybind>

        <keybind key="W-S-1">
          <action name="SendToDesktop">
            <desktop>1</desktop>
          </action>
        </keybind>

        <keybind key="W-S-2">
          <action name="SendToDesktop">
            <desktop>2</desktop>
          </action>
        </keybind>

        <keybind key="W-S-3">
          <action name="SendToDesktop">
            <desktop>3</desktop>
          </action>
        </keybind>

        <keybind key="W-S-4">
          <action name="SendToDesktop">
            <desktop>4</desktop>
          </action>
        </keybind>

        <keybind key="W-S-Left">
          <action name="MoveRelative">
            <x>-20</x>
            <y>0</y>
          </action>
        </keybind>

        <keybind key="W-S-Right">
          <action name="MoveRelative">
            <x>20</x>
            <y>0</y>
          </action>
        </keybind>

        <keybind key="W-S-Up">
          <action name="MoveRelative">
            <x>0</x>
            <y>-20</y>
          </action>
        </keybind>

        <keybind key="W-S-Down">
          <action name="MoveRelative">
            <x>0</x>
            <y>20</y>
          </action>
        </keybind>

        <keybind key="W-C-Left">
          <action name="ResizeRelative">
            <left>20</left>
            <right>0</right>
            <top>0</top>
            <bottom>0</bottom>
          </action>
        </keybind>

        <keybind key="W-C-Right">
          <action name="ResizeRelative">
            <left>0</left>
            <right>20</right>
            <top>0</top>
            <bottom>0</bottom>
          </action>
        </keybind>

        <keybind key="W-C-Up">
          <action name="ResizeRelative">
            <left>0</left>
            <right>0</right>
            <top>20</top>
            <bottom>0</bottom>
          </action>
        </keybind>

        <keybind key="W-C-Down">
          <action name="ResizeRelative">
            <left>0</left>
            <right>0</right>
            <top>0</top>
            <bottom>20</bottom>
          </action>
        </keybind>

        <keybind key="W-S-r">
          <action name="Reconfigure"/>
        </keybind>

        <keybind key="W-S-e">
          <action name="Exit"/>
        </keybind>

        <keybind key="A-F4">
          <action name="Close"/>
        </keybind>

        <keybind key="A-F10">
          <action name="ToggleMaximize"/>
        </keybind>

        <keybind key="A-F9">
          <action name="Iconify"/>
        </keybind>
      </keyboard>

      <resistance>
        <strength>10</strength>
        <screen_edge_strength>20</screen_edge_strength>
      </resistance>

      <applications>
        <application class="Conky">
          <decor>no</decor>
          <focus>no</focus>
          <desktop>4</desktop>
          <layer>below</layer>
          <skip_pager>yes</skip_pager>
          <skip_taskbar>yes</skip_taskbar>
        </application>
      </applications>

      <margins>
        <top>0</top>
        <bottom>0</bottom>
        <left>0</left>
        <right>0</right>
      </margins>

      <dock>
        <position>TopLeft</position>
        <floatingX>0</floatingX>
        <floatingY>0</floatingY>
        <noStrut>no</noStrut>
        <stacking>Above</stacking>
        <direction>Horizontal</direction>
        <autoHide>yes</autoHide>
        <hideDelay>300</hideDelay>
        <showDelay>300</showDelay>
        <moveButton>Middle</moveButton>
        <noMouse>no</noMouse>
      </dock>

      <popupTime>0</popupTime>

    </openbox_config>
  '';

  environment.etc."xdg/openbox/menu.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>

    <openbox_menu xmlns="http://openbox.org/3.5/menu">

      <menu id="root-menu" label="Openbox">

        <item label="Terminal">
          <action name="Execute">
            <command>ghostty</command>
          </action>
        </item>

        <item label="Firefox">
          <action name="Execute">
            <command>firefox</command>
          </action>
        </item>

        <separator/>

        <item label="Reload">
          <action name="Reconfigure"/>
        </item>

        <item label="Exit">
          <action name="Exit"/>
        </item>

      </menu>

    </openbox_menu>
  '';

  environment.etc."xdg/openbox/autostart".text = ''
    ${pkgs.feh}/bin/feh --bg-fill /home/coffinggx/personal/wallpapers/ggs.jpg &
    ${pkgs.conky}/bin/conky -c /etc/conky/conky.conf &
  '';
}
