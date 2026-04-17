{ lib }:
{
  mkFoundationEnableOption = name:
    lib.mkEnableOption "foundation module ${name}";
}
