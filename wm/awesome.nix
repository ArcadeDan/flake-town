{ config, lib, pkgs, ... }:

with lib;

let 

    cfg = config.xsession.windowManager.awesome;
    awesome = cfg.package;
    getLuaPath = lib: dir: "${lib}/${dir}/lua/${awesome.lua.luaversion}";
    makeSearchPath = lib.concatMapStrings 