module Constants where

import Data.List (List(..), (:))
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

sections :: List String
sections = ("Home" : "Chi sono" : "Come lavoro" : "Dove ricevo" : "FAQ" : "Contatti" : "Disturbi trattati" : Nil)

style :: {bluePalette :: String
  , bluePaletteLight :: String
  , white :: String
  , green :: String
  , lightGreen :: String
  , lightGray :: String
  , borderColor :: String
  , stylishText :: CSS
}
style = {"bluePalette": "#343944"
  , "bluePaletteLight": "#484c56"
  , "white": "#fff"
  , "green": "#35ba52"
  , "lightGreen": "#85d597"
  , "lightGray": "#f2f2f2"
  , "borderColor": "#f2f2f2"
  , "stylishText":  R.css {
      "cursor": "pointer",
      "display": "inline",
      "fontFamily": "PT Serif, Georgia, Times New Roman, Times, serif",
      "fontSize": "20px",
      "fontStyle": "italic",
      "fontWeight": "400",
      "letterSpacing": "-0.45px",
      "lineHeight": "24px",
      "whiteSpace": "nowrap"
    }
}
