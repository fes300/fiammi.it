module Style.NavigationLink where

import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

navigationLinkStyle :: CSS
navigationLinkStyle = R.css { display: "flex"
  , alignItems: "center"
  , justifyContent: "center"
  , color: "rgb(53, 186, 82)"
  , cursor: "pointer"
  , fontWeight: "700"
  , margin: "5px 0" }

textStyle :: CSS
textStyle = R.css { marginRight: "10px"}
