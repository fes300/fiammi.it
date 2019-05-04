module Constants where

import Data.List (List(..), (:))

sections :: List String
sections = ("Home" : "Chi sono" : "Come lavoro" : "Dove ricevo" : "FAQ" : "Contatti" : "Disturbi trattati" : Nil)

style :: {bluePalette :: String
  , bluePaletteLight :: String
  , white :: String
}
style = {"bluePalette": "#343944"
  , "bluePaletteLight": "#484c56"
  , "white": "#fff"
}
