module Style.App where

import Constants (style)
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

appStyle :: CSS
appStyle = R.css { fontFamily: "\"Open Sans\", Helvetica, Arial, sans-serif"
  , color: style.textColor
  , fontSize: "15px"
  , textAlign: "center"
  , letterSpacing: "-0.45px"
  , lineHeight: "24px"
  , display: "flex"
  , flexDirection: "column" }

sectionContainerStyle :: CSS
sectionContainerStyle = R.css { padding: "0 15px"}
