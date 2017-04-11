-- Built for xmonad v.0.13
-- Author: Martin "kluvin" Kleiven
-- Licensed under MIT
--
-- The following imports' documentation along with usage examples and etc
-- can be looked up at http://xmonad.org/xmonad-docs/xmonad-contrib/
--

import XMonad

import XMonad.StackSet as W

import XMonad.Actions.Navigation2D
import XMonad.Actions.UpdatePointer
import XMonad.Actions.CycleWS

import XMonad.Layout.Spacing
import XMonad.Layout.Reflect
import XMonad.Layout.MultiToggle
import XMonad.Layout.BinarySpacePartition

import XMonad.Hooks.ManageDocks

import XMonad.Util.EZConfig


myTerminal          = "termite"
myWorkspaces        = ["Web", "Web-2", "Code", "Code-etc",
                       "Music", "etc-terms", "IM"] ++ map show [8..9]
-- Default Layouts
myLayout            = avoidStruts                 $
                      spacingWithEdge 0           $
                      mkToggle (single REFLECTX)  $
                      mkToggle (single REFLECTY)  $
                      (emptyBSP ||| Full) -- Layouts

-- Make cursor follow focused window, center
myLogHook           = updatePointer (0.5, 0.5) (0, 0)
-- Make focused window follow cursor
myFocusFollowsMouse = True
-- No borders, we have visual feedback by the position of the cursor
myBorderWidth       = 0
-- Make default Mod key the 'windows', or 'super', key
myModMask           = mod4Mask

-- Keybindings to remove from the default config
myRemovedKeys       = [ "M-<Space>"
                      , "M-<Return>"
                      , "M-S-c"
                      ]

-- Keybindings to add
myAdditionalKeys    = [ ("M-x w",      spawn "firefox")
                      , ("M-<Space>",  spawn "rofi -show run")
                      , ("M-l",        spawn "shlock")
                      , ("M-<Return>", spawn myTerminal)
                      , ("M-c",        kill)
                      , ("M-a",        swapNextScreen)
                      , ("M-g",        windows W.swapMaster)
                      , ("M-b",        sendMessage Balance)
                      , ("M-e",        sendMessage Equalize)
                      , ("M-r x",      sendMessage $ Toggle REFLECTX)
                      , ("M-r y",      sendMessage $ Toggle REFLECTY)
                      , ("M-]",        incSpacing (-5))
                      , ("M-[",        incSpacing   5)
                      ]

-- Load xmonad with the defaults we have specified
main = xmonad $ docks $ navigation2DP def
                ("<Up>", "<Left>", "<Down>", "<Right>")
                [("M-",  windowGo  ),
                ("M-S-", windowSwap)]
                False

        $ def
                -- simple stuff
                { terminal           = myTerminal
                , focusFollowsMouse  = myFocusFollowsMouse
                , borderWidth        = myBorderWidth
                , modMask            = myModMask
                , XMonad.workspaces  = myWorkspaces

                 -- hooks, layouts
                , logHook               = myLogHook
                , layoutHook            = myLayout
                } `removeKeysP`     myRemovedKeys
                  `additionalKeysP` myAdditionalKeys
