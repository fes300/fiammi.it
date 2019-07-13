module Style.Input where

import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

inputStyle :: CSS
inputStyle = R.css { color: "#fff"
  , cursor: "pointer" }
