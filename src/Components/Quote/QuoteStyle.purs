module Style.Quote where

import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

iconStyle :: CSS
iconStyle = R.css { margin: "25px 0" }

quoteStyle :: CSS
quoteStyle = R.css {color: "#4e5464"
  , fontStyle: "italic"}

authorStyle :: CSS
authorStyle = R.css {color: "#4e5464"
  , marginTop: "25px"
  , fontSize: "17px"
  , fontWeight: "700"
  , textTransform: "uppercase"}
