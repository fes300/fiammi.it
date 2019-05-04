module Style.DesktopNavbar where

import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

navbarStyle :: CSS
navbarStyle = R.css {
  position: "fixed",
  backgroundColor: "#343944",
  color: "white",
  height: "56px",
  width: "100%",
  zIndex: 999,
  display: "flex",
  alignItems: "center"
}

navbarStyleActive :: CSS
navbarStyleActive = R.css {
  backgroundColor: "black"
}

linkStyle :: CSS
linkStyle = R.css {
  position: "absolute"
}

linkStyleActive :: CSS
linkStyleActive = R.mergeStyles [
  linkStyle,
  R.css { position: "absolute" }
]
