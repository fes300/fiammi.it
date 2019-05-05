module Style.DesktopNavbar where

import Constants (style)
import Prelude ((<>))
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

navbarStyle :: CSS
navbarStyle = R.css {
  position: "fixed"
  , top: 0
  , left: 0
  , right: 0
  , display: "flex"
  , backgroundColor: style.white
  , height: "56px"
  , zIndex: 999
  , padding: "25px"
  , borderBottom: "solid 1px " <> style.borderColor
}

menuStyle :: CSS
menuStyle = R.css {
  display: "flex"
  , alignItems: "center"
  , justifyContent: "space-around"
  , flexGrow: 1
}

fiammiStyle :: CSS
fiammiStyle = R.css {
  display: "flex"
  , flexDirection: "column"
  , marginRight: "80px"
}

navbarStyleActive :: CSS
navbarStyleActive = R.css {}

linkStyle :: CSS
linkStyle = R.css { color: style.green }

linkStyleActive :: CSS
linkStyleActive = R.mergeStyles [
  linkStyle,
  R.css { color: style.lightGreen }
]
