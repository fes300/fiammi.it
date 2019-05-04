module Style.DesktopNavbar where

import Constants (style)
import Prelude ((<>))
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

navbarStyle :: CSS
navbarStyle = R.css {position: "fixed"
  , display: "flex"
  , backgroundColor: style.white
  , height: "56px"
  , width: "100%"
  , zIndex: 999
}

menuStyle :: CSS
menuStyle = R.css {display: "flex"
  , alignItems: "center"
  , justifyContent: "space-around"
  , borderBottom: "solid 1px " <> style.borderColor
  , width: "100%"
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
