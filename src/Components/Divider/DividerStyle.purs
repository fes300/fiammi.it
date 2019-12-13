module Style.Divider where

import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)


dividerStyle :: CSS
dividerStyle = R.css { display: "flex"
, margin: "20px 20px"
, height: "2px"
, background: "linear-gradient(to right, white 0%, #e5e5e5 50%, white 100%)" }
