module Constants where

import Prelude

import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Eq (genericEq)
import Data.Generic.Rep.Ord (genericCompare)
import Data.List (List(..), (:))
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

data Section = Home | ChiSono | DiCosaMiOccupo | ComeLavoro | DoveRicevo | FAQ | Contatti

derive instance genericSection :: Generic Section _

instance sectionEq :: Eq Section where
  eq = genericEq

instance sectionCompare :: Ord Section where
  compare = genericCompare

sections :: List Section
sections = (Home : ChiSono : DiCosaMiOccupo : ComeLavoro : DoveRicevo : FAQ : Contatti : Nil)

style :: {bluePalette :: String
  , bluePaletteLight :: String
  , white :: String
  , green :: String
  , lightGreen :: String
  , safeGreen :: String
  , lightGray :: String
  , borderColor :: String
  , stylishText :: CSS
  , title :: CSS
  , highlight :: CSS
  , subtitle :: CSS
  , quote :: CSS
}

style = {"bluePalette": "#343944"
  , "bluePaletteLight": "#484c56"
  , "white": "#fff"
  , "green": "#35ba52"
  , "lightGreen": "#85d597"
  , "safeGreen": "#58c56f"
  , "lightGray": "#f2f2f2"
  , "borderColor": "#bcb1b1"
  , "stylishText":  R.css {"cursor": "pointer"
      , "display": "inline"
      , "fontFamily": "PT Serif, Georgia, Times New Roman, Times, serif"
      , "fontSize": "20px"
      , "fontStyle": "italic"
      , "fontWeight": "400"
      , "letterSpacing": "-0.45px"
      , "lineHeight": "24px"
      , "whiteSpace": "nowrap"}
  , "title": R.css { "color": "rgb(67, 67, 69)"
    , "fontSize": "36px"
    , "fontFamily": "'PT Serif', Georgia, 'Times New Roman'"
    , "fontWeight": "700"
    , "letterSpacing": "-.03em"
    , "lineHeight": "1.2"
    , "textAlign": "center" }
  , "subtitle": R.css { "fontWeight": "700"
    , "color": "rgb(67, 67, 69)"
    , "fontSize": "20px" }
  , "quote": R.css { "fontWeight": "400"
    , "color": "rgb(67, 67, 69)"
    , "fontSize": "24px"
    , "fontStyle": "italic"
    , "lineHeight": "39px"
    , "letterSpacing": "-0.45px" }
  , "highlight": R.css { "color": "rgb(155, 155, 155)"
    , "fontWeight": "700"} }
