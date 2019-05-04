module Style.DesktopNavbar where

import Constants (style)
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

navbarStyle :: CSS
navbarStyle = R.css {position: "fixed"
  , backgroundColor: style.white
  , color: "white"
  , height: "56px"
  , width: "100%"
  , zIndex: 999
  , display: "flex"
  , alignItems: "center"
}

navbarStyleActive :: CSS
navbarStyleActive = R.css {}

linkStyle :: CSS
linkStyle = R.css {
  color: "#fff"
}

linkStyleActive :: CSS
linkStyleActive = R.mergeStyles [
  linkStyle,
  R.css { backgroundColor: "black" }
]
