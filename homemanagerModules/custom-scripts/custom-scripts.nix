{
  pkgs,
  home,
  ...
}:
{
  home.packages = with pkgs; [
    (writeShellScriptBin "rebuild" (builtins.readFile ./rebuild.sh))
    (writeShellScriptBin "rebuild-test" (builtins.readFile ./rebuild-test.sh))
    (writeShellScriptBin "purge-wallpaper" (builtins.readFile ./purge-wallpaper.sh))
  ];
}
