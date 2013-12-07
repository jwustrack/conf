import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.Spiral
import XMonad.Layout.SimpleDecoration
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.Magnifier
import XMonad.Util.Themes
import System.IO

myManageHook = composeAll
   [ className =? "Firefox" --> doShift "3:www"
   , className =? "Skype" --> doShift "5:z"
   , className =? "Xmessage"  --> doFloat
   , manageDocks
   ]

myTheme = defaultTheme {
	activeColor = blue
	, inactiveColor = grey
	, activeBorderColor = blue
	, inactiveBorderColor = grey
	, activeTextColor = grey
	, inactiveTextColor = light
	, decoHeight          = 14
}
	where
		blue = "#99bbdd"
		grey = "#444444"
		light = "#dddddd"

main = do
    xmproc <- spawnPipe "xmobar /home/jwustrack/.xmobarrc"
    xmonad $ defaultConfig
        { workspaces = ["dev","doc","www","zw","z","6","7","8","9","₀"]
        , borderWidth        = 1
        , terminal           = "/home/jwustrack/bin/urxvt -fb 'xft:Monospace:size=10' -fn 'xft:Monospace:size=10' +sb -tn rxvt-unicode -bg `rcolor`"
        , normalBorderColor  = "#444444"
        , focusedBorderColor = "#99bbdd"
        , manageHook = myManageHook <+> manageHook defaultConfig
        --, layoutHook = avoidStruts $ Tall 1 (3 / 100) (1 / 1.162) |||  Grid ||| Full
        , layoutHook = noFrillsDeco shrinkText myTheme $ avoidStruts ( Tall 1 (3 / 100) (1 / 2) ||| Mirror (Tall 1 (3 / 100) (1 / 2)) ||| Grid ||| Full )
        , logHook = dynamicLogWithPP xmobarPP
                        { ppCurrent = wrap "<fc=#66ccff>" "</fc>"
                        , ppOutput = hPutStrLn xmproc
                        , ppLayout = \x -> "<fc=#6cf>" ++ last (words x) ++ "</fc>"
                        , ppTitle = xmobarColor "white" "" . shorten 50
                        }
        , modMask = mod4Mask 
        }
