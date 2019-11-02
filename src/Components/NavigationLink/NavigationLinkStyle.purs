module Style.NavigationLink where

import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

navigationLinkStyle :: CSS
navigationLinkStyle = R.css { color: "#fff"
  , cursor: "pointer" }
