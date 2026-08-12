{ ... }:

{
  programs.rmpc = {
    enable = true;

    config = ''
      (
        address: "127.0.0.1:6600",
        lyrics_dir: Some("/home/coffinggx/personal/music"),
        enable_lyrics_index: true,
        enable_lyrics_hot_reload: true,
        lyrics_offset_ms: 0,
      )
    '';
  };
}
