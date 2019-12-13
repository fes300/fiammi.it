module Style.NavigationLink where

import Constants (style)
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

navigationLinkStyle :: CSS
navigationLinkStyle = R.css { display: "flex"
  , alignItems: "center"
  , justifyContent: "center"
  , color: style.safeGreen
  , cursor: "pointer"
  , fontWeight: "700"
  , margin: "5px 0" }

textStyle :: CSS
textStyle = R.css { marginRight: "10px"}
