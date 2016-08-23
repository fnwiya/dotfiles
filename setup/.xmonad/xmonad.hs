-------------------------------------------------------------------------------
-- Import modules                                                           {{{
-------------------------------------------------------------------------------
import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Actions.WindowGo  -- Keybind
import XMonad.Util.Run  -- spawnPipe, hPutStrLn
import XMonad.Util.Run(spawnPipe)
import System.IO
--------------------------------------------------------------------------- }}}
-- vars                                                                     {{{
-------------------------------------------------------------------------------
modm = mod4Mask
--------------------------------------------------------------------------- }}}
-- main                                                                     {{{
-------------------------------------------------------------------------------
main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , terminal           = "gnome-terminal"
        , borderWidth        = 2
        , normalBorderColor  = "#333333"
        , focusedBorderColor = "#cd8b00"
        , modMask  = mod4Mask
        }
       -------------------------------------------------------------------- }}}
       -- Keymap:                                                           {{{
       ------------------------------------------------------------------------
        `additionalKeys`
        [
        ((modm, xK_e), runOrRaise "emacs" (className =? "Emacs"))
        , ((modm, xK_s), runOrRaise "gnome-terminal" (className =? "Gnome-terminal"))
        , ((modm, xK_g), runOrRaise "chrome" (className =? "Google-chrome"))
        ]
--------------------------------------------------------------------------- }}}
