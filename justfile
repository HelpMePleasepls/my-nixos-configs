rebuild:
  sudo nixos-rebuild switch
edit:
  nvim /home/bob/justfile
nixconfig:
  nvim /home/bob/nixos-config/configuration.nix
nixpackages:
  nvim /home/bob/nixos-config/modules/packages.nix
asciimage IMAGE:
   ascii-image-converter {{IMAGE}} -bC --dither --dimensions 44,44
search SEARCH:
   nix-search -n {{SEARCH}}
ytdl URL:
   yt-dlp -f bestvideo+bestaudio -o - "{{URL}}" | ffmpeg -i - -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le output.mov
compress VIDEO:
   ffmpeg -i {{VIDEO}} -vf "scale=640:-1" -c:v libx264 -crf 28 -preset medium -c:a aac -b:a 128k output.mp4
