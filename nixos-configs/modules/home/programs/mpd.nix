{
  services.mpd = {
    enable = true;

    musicDirectory = /home/coffinggx/personal/music;

    network = {
      listenAddress = "127.0.0.1";
      port = 6600;
    };

    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire"
      }

      auto_update "yes"
      restore_paused "yes"
      filesystem_charset "UTF-8"
    '';
  };
}
