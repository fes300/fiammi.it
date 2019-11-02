module Style.Home where

import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

imageContainer :: CSS
imageContainer = R.css { display: "flex"
, flexDirection: ""
, justifyContent: "center"
, marginTop: "120px" }
