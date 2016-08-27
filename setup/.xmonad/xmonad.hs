-------------------------------------------------------------------------------
-- Import modules                                                           {{{
-------------------------------------------------------------------------------
import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

import XMonad.Actions.WindowGo  -- Keybind

import XMonad.Util.Run  -- spawnPipe, hPutStrLn
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)

import XMonad.Layout
import XMonad.Layout.DragPane          -- see only two window
import XMonad.Layout.Gaps
import XMonad.Layout.LayoutScreens
import XMonad.Layout.NoBorders         -- In Full mode, border is no use
import XMonad.Layout.PerWorkspace      -- Configure layouts on a per-workspace
import XMonad.Layout.ResizableTile     -- Resizable Horizontal border
import XMonad.Layout.Simplest
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing           -- this makes smart space around windows
import XMonad.Layout.ToggleLayouts     -- Full window at any time
import XMonad.Layout.TwoPane

import System.IO
--------------------------------------------------------------------------- }}}
-- vars                                                                     {{{
-------------------------------------------------------------------------------
modm = mod4Mask
myWorkspaces = ["1", "2", "3", "4", "5"]

-- Color Setting
colorBlue      = "#868bae"
colorGreen     = "#86ae87"
colorRed       = "#ae8686"
colorGray      = "#90a2a0"
colorWhite     = "#bdbdbd"
colorNormalbg  = "#1c1c1c"
colorfg        = "#585858"

-- Border width
borderwidth = 0

-- Border color
mynormalBorderColor  = "#333333"
myfocusedBorderColor = "#585858"

-- Float window control width
moveWD = borderwidth
resizeWD = 2*borderwidth

-- gapwidth
gapwidth  = 9
gwU = 1
gwD = 0
gwL = 42
gwR = 42
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
        , normalBorderColor  = mynormalBorderColor
        , focusedBorderColor = myfocusedBorderColor
        , modMask  = modm
        , workspaces         = myWorkspaces
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
