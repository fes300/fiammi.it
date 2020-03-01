module Style.Button where

import Constants (style)
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

buttonStyle :: CSS
buttonStyle = R.css { color: "#fff"
  , padding: "15px 27px"
  , borderRadius: "4px"
  , fontWeight: 600
  , border: "none"
  , width: "120px"
  , textTransform:"uppercase"
  , backgroundColor: style.safeGreen
  , cursor: "pointer" }
