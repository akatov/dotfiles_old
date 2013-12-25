import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Layout.SimpleDecoration
import XMonad.Util.Themes
import XMonad.Layout.Tabbed
import XMonad.Config.Gnome
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Layout.ThreeColumns

{-
myStartupHook = do
    spawn "xmodmap .xmodmap"
--    spawn "trayer"
--    spawn "killall gnome-screensaver && xscreensaver -no-splash"
    spawn "xscreensaver -no-splash"
-}
myManageHook  = manageDocks <+>
                composeAll
                [ className =? "Gimp"      --> doFloat
                , className =? "Vncviewer" --> doFloat
                ] <+>
                manageHook defaultConfig

myLayoutHook0 = ThreeColMid 1 (3/100) (1/2)
--myLayoutHook0 = avoidStruts $ layoutHook defaultConfig
-- myLayoutHook1 = avoidStruts $ simpleDeco shrinkText defaultTheme (layoutHook defaultConfig)
-- myLayoutHook2 = avoidStruts $ tabbed shrinkText (theme smallClean)

myLogHook xmp = dynamicLogWithPP xmobarPP
                { ppOutput = hPutStrLn xmp
                , ppTitle  = xmobarColor "green" "" . shorten 50
                }
               
myModMask     = mod4Mask  -- Rebind Mod to Windows (Super) Key

myTerminal    = "urxvt"

myKeys        = [ ((mod4Mask .|. shiftMask, xK_z), spawn "gnome-screensaver-command --lock")
                , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
                , ((0, xK_Print), spawn "scrot")
                ]


main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
--    xmonad $ gnomeConfig
        { manageHook  = myManageHook
        , layoutHook  = myLayoutHook0
        , startupHook = setWMName "LG3D" -- to make it work with Java apps
        , logHook     = myLogHook xmproc
        , modMask     = myModMask
        , terminal    = myTerminal
        } `additionalKeys` myKeys
