module Style.Divider where

import Prelude

import Constants (style)
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)


dividerStyle :: CSS
dividerStyle = R.css { display: "flex"
, margin: "20px 20px"
, borderTop: "1px solid " <> style.borderColor }
