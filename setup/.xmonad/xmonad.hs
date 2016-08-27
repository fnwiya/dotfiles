-------------------------------------------------------------------------------
--                  __  ____  __                       _                     --
--                  \ \/ /  \/  | ___  _ __   __ _  __| |                    --
--                   \  /| |\/| |/ _ \| '_ \ / _` |/ _` |                    --
--                   /  \| |  | | (_) | | | | (_| | (_| |                    --
--                  /_/\_\_|  |_|\___/|_| |_|\__,_|\__,_|                    --
--                                                                           --
-------------------------------------------------------------------------------
-- Import modules                                                           {{{
-------------------------------------------------------------------------------

import qualified Data.Map as M
import System.IO                       -- for xmobar

import XMonad
import qualified XMonad.StackSet as W

import XMonad.Actions.CycleWS
import qualified XMonad.Actions.FlexibleResize as Flex -- flexible resize
import XMonad.Actions.FloatKeys
import XMonad.Actions.WindowGo

import XMonad.Hooks.DynamicLog         -- for xmobar
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks        -- avoid xmobar area

import XMonad.Layout
import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders         -- In Full mode, border is no use
import XMonad.Layout.PerWorkspace      -- Configure layouts on a per-workspace
import XMonad.Layout.ResizableTile     -- Resizable Horizontal border
import XMonad.Layout.Simplest
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing           -- this makes smart space around windows
import XMonad.Layout.ToggleLayouts     -- Full window at any time

import XMonad.Util.EZConfig            -- removeKeys, additionalKeys
import XMonad.Util.Run
import XMonad.Util.Run(spawnPipe)      -- spawnPipe, hPutStrLn
import XMonad.Util.SpawnOnce

--------------------------------------------------------------------------- }}}
-- vars                                                                     {{{
-------------------------------------------------------------------------------

modm = mod4Mask  -- Super
myWorkspaces = ["1", "2", "3", "4", "5"]
myFloatWorkspace = "3"
myTerminal   = "gnome-terminal"

-- Color Setting
colorBlue      = "#868bae"
colorGreen     = "#86ae87"
colorRed       = "#ae8686"
colorGray      = "#90a2a0"
colorWhite     = "#bdbdbd"
colorNormalbg  = "#1c1c1c"
colorfg        = "#585858"

-- Border width
borderwidth = 1

-- Border color
mynormalBorderColor  = "#333333"
myfocusedBorderColor = "#585858"

-- gapwidth
gapwidth  = 5
gwU = 1
gwD = 0
gwL = 10
gwR = 10

--------------------------------------------------------------------------- }}}
-- main                                                                     {{{
-------------------------------------------------------------------------------

main :: IO ()
main = do
    wsbar <- spawnPipe myWsBar
    xmonad $ ewmh defaultConfig
       {
         modMask            = modm
       , terminal           = myTerminal
       , workspaces         = myWorkspaces
       , borderWidth        = borderwidth
       , normalBorderColor  = mynormalBorderColor
       , focusedBorderColor = myfocusedBorderColor
       , startupHook        = myStartupHook
       , manageHook         = manageDocks
       , layoutHook         = avoidStruts $ ( toggleLayouts (noBorders Full)
                                            $ onWorkspace myFloatWorkspace simplestFloat
                                            $ myLayout
                                            )
       , logHook            = myLogHook wsbar
       }

       -------------------------------------------------------------------- }}}
       -- Keymap:                                                           {{{
       ------------------------------------------------------------------------
       -- xprop | grep WM_CLASS

        `additionalKeys`
        [
          ((modm, xK_e), runOrRaise "emacs" (className =? "Emacs"))
        , ((modm, xK_s), runOrRaise "gnome-terminal" (className =? "Gnome-terminal"))
        ]

--------------------------------------------------------------------------- }}}
-- myLayout:          Handle Window behaveior                               {{{
-------------------------------------------------------------------------------

myLayout = spacing gapwidth $
  gaps [(U, gwU),(D, gwD),(L, gwL),(R, gwR)]
  $ (ResizableTall 1 (1/204) (119/204) [])
  ||| Simplest

  --------------------------------------------------------------------------- }}}
-- myStartupHook:     Start up applications                                 {{{
-------------------------------------------------------------------------------

myStartupHook = do
        spawnOnce "gnome-settings-daemon"
        spawnOnce "xscreensaver -no-splash"
        spawnOnce "$HOME/.dropbox-dist/dropboxd"

--------------------------------------------------------------------------- }}}
-- myLogHook:         loghock settings                                      {{{
-------------------------------------------------------------------------------

myLogHook h = dynamicLogWithPP $ wsPP {
  ppOutput = hPutStrLn h
  }

--------------------------------------------------------------------------- }}}
-- myWsBar:           xmobar setting                                        {{{
-------------------------------------------------------------------------------

myWsBar = "xmobar $HOME/.xmonad/xmobar.hs"

wsPP = xmobarPP { ppOrder           = \(ws:l:t:_)  -> [ws,t]
                , ppCurrent         = xmobarColor colorGreen colorNormalbg . \s -> "●"
                , ppUrgent          = xmobarColor colorfg    colorNormalbg . \s -> "●"
                , ppVisible         = xmobarColor colorGreen colorNormalbg . \s -> "⦿"
                , ppHidden          = xmobarColor colorfg    colorNormalbg . \s -> "●"
                , ppHiddenNoWindows = xmobarColor colorfg    colorNormalbg . \s -> "○"
                , ppTitle           = xmobarColor colorGreen colorNormalbg
                , ppOutput          = putStrLn
                , ppWsSep           = " "
                , ppSep             = "  "
                }

--------------------------------------------------------------------------- }}}
