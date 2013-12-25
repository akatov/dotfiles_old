import qualified Data.Map as M
import XMonad
import XMonad.Config.Kde
import XMonad.Hooks.ManageDocks
import XMonad.Layout.ThreeColumns
import XMonad.Util.CustomKeys
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W -- to shift and float windows

main = xmonad $ kdeConfig
    { modMask    = mod4Mask
    , manageHook = manageHook kdeConfig <+> myManageHook
    , layoutHook = avoidStruts $ ThreeColMid 1 (3/100) (1/2)
--    , terminal   = "urxvt -e 'if tmux has-session -t 0 2> /dev/null; then tmux a; else tmux; fi'"
--    , terminal   = "urxvt -e bash -c 'tmux new-session'"
    , terminal   = "urxvt"
    } `additionalKeys` [ ((mod4Mask, xK_p), spawn "dmenu_run") ]
 
myManageHook = composeAll . concat $
    [ [ className   =? c --> doFloat           | c <- myFloats]
    , [ title       =? t --> doFloat           | t <- myOtherFloats]
    , [ className   =? c --> doF (W.shift "2") | c <- webApps]
    , [ className   =? c --> doF (W.shift "3") | c <- ircApps]
    ]
  where myFloats      = ["MPlayer", "Gimp"]
        myOtherFloats = ["alsamixer", "kmix"]
        webApps       = ["Firefox-bin", "Opera"] -- open on desktop 2
        ircApps       = ["Ksirc"]                -- open on desktop 3
