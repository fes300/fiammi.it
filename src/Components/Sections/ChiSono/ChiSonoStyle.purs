module Style.ChiSono where

import Constants (style)
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

imageContainer :: CSS
imageContainer = R.css { display: "flex"
, flexDirection: ""
, justifyContent: "center"
, height: "350px"
, backgroundImage: "url(assets/images/fiammi.jpeg)"
, backgroundPosition: "top center"
, backgroundSize: "cover"
, margin: "30px 0" }

subSection :: CSS
subSection = R.mergeStyles[ style.highlight, R.css { marginTop: "10px" } ]
