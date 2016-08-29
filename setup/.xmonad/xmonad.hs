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

import System.IO                       -- for xmobar
import qualified Data.Map as M
import Control.Monad (liftM2)          -- myManageHookShift

import XMonad
import qualified XMonad.StackSet as W

import XMonad.Actions.CycleWS
import XMonad.Actions.FloatKeys
import XMonad.Actions.WindowGo
import qualified XMonad.Actions.FlexibleResize as Flex -- flexible resize

import XMonad.Hooks.DynamicLog         -- for xmobar
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks        -- avoid xmobar area
import XMonad.Hooks.ManageHelpers

import XMonad.Layout
import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders         -- In Full mode, border is no use
import XMonad.Layout.PerWorkspace      -- Configure layouts on a per-workspace
import XMonad.Layout.ResizableTile     -- Resizable Horizontal border
import XMonad.Layout.Simplest
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing           -- this makes smart space around windows
import XMonad.Layout.ToggleLayouts     -- Full window at any time
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.Fullscreen (fullscreenFull)
import XMonad.Layout.Named

import XMonad.Util.EZConfig            -- removeKeys, additionalKeys
import XMonad.Util.Run
import XMonad.Util.Run(spawnPipe)      -- spawnPipe, hPutStrLn
import XMonad.Util.SpawnOnce
import XMonad.Util.WorkspaceCompare

import XMonad.Config.Desktop (desktopLayoutModifiers)

--------------------------------------------------------------------------- }}}
-- vars                                                                     {{{
-------------------------------------------------------------------------------

modm = mod4Mask  -- Super
myWorkspaces = ["1", "2", "3", "4", "5"]
myFloatWorkspace = "3"
myTerminal   = "gnome-terminal"
--myTerminal   = "urxvt"

-- Color Setting
colorBlue      = "#77A0D4"
colorGreen     = "#519CA5"
colorRed       = "#E15F67"
colorGray      = "#6E7E93"
colorWhite     = "#FDFDFE"
colorNormalbg  = "#333134"
colorfg        = "#D0CDD9"

-- Border width
borderwidth = 1

-- Border color
mynormalBorderColor  = colorGray
myfocusedBorderColor = colorRed

-- gapwidth
gapwidth  = 3
gwU = 0
gwD = 0
gwL = 0
gwR = 0

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
       , manageHook         = myManageHookShift <+>
                              myManageHookFloat <+>
                              manageDocks
       , layoutHook         = avoidStruts $ (
                                toggleLayouts (noBorders Full)
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
        , ((modm, xK_c), runOrRaise "google-chrome" (className =? "google-chrome"))
        , ((modm, xK_t), runOrRaise "thg" (className =? "thg"))
        ]
        `additionalKeysP`
        [
        -- CycleWS setup
        ("M-l", moveTo Next NonEmptyWS)
        , ("M-h", moveTo Prev NonEmptyWS)
        , ("M-S-h", shiftTo Prev EmptyWS)
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
-- myManageHookShift: some window must created there                        {{{
-------------------------------------------------------------------------------

myManageHookShift = composeAll
            -- if you want to know className, type "$ xprop|grep CLASS" on shell
            [ className =? "Firefox"       --> mydoShift "4"
            , className =? "Thg"           --> mydoShift "5" 
            , className =? "google-chrome" --> mydoShift "4" 
            , className =? "Emacs"         --> mydoShift "2" 
            ]
             where mydoShift = doF . liftM2 (.) W.greedyView W.shift

--------------------------------------------------------------------------- }}}
-- myManageHookFloat: new window will created in Float mode                 {{{
-------------------------------------------------------------------------------

myManageHookFloat = composeAll
    [ className =? "Gimp"             --> doFloat
    , className =? "Shutter"          --> doFloat
    , className =? "Nautilus"         --> doFloat
    , isFullscreen                    --> doFullFloat
    ]

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
