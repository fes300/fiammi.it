module Style.Textarea where

import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

textareaStyle :: CSS
textareaStyle = R.css { color: "#fff"
  , cursor: "pointer"
  , padding: "10px 17px" }
