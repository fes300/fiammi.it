module Style.Button where

import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

buttonStyle :: CSS
buttonStyle = R.css { color: "#fff"
  , cursor: "pointer" }
