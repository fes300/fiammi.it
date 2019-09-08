module Style.App where

import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

appStyle :: CSS
appStyle = R.css { fontFamily: "\"Open Sans\", Helvetica, Arial, sans-serif"
  , display: "flex"
  , flexDirection: "column" }

sectionContainerStyle :: CSS
sectionContainerStyle = R.css { padding: "0 15px"}
