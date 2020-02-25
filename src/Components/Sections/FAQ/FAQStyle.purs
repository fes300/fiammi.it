module Style.FAQ where

import Prelude ((<>))
import Constants (style)
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

border :: String
border = "solid 1px " <> style.borderColorLight

accordionStyle :: CSS
accordionStyle = R.css { borderBottom: border
  , borderLeft: border
  , borderRight: border}

iconMinusStyle :: CSS
iconMinusStyle = R.css { position: "absolute"
  , right: "0px"
  , borderTop: border
  , borderWidth: "1px"
  , width: "14px"
  , top: "50%"}

iconPlusV :: CSS
iconPlusV = R.css { position: "absolute"
  , right: "7px"
  , borderLeft: "solid 1px " <> style.safeGreen
  , height: "14px"
  , top: "calc(50% - 7px)"}

iconPlusH :: CSS
iconPlusH = R.css { position: "absolute"
  , right: "0px"
  , borderTop: "solid 1px " <> style.safeGreen
  , width: "14px"
  , top: "50%"}

accordionElementStyle :: CSS
accordionElementStyle = R.css { borderTop: border
  , padding: "15px"
  , overflow: "hidden"
  , textAlign: "left"}

accordionElementTitleStyle :: CSS
accordionElementTitleStyle = R.css { textTransform: "uppercase"
  , fontWeight: 600
  , paddingRight: "50px"
  , cursor: "pointer"
  , position: "relative"
  , color: style.blackText }

accordionElementBodyStyle :: CSS
accordionElementBodyStyle = R.css { textTransform: "none"
  , height: "0px"
  , opacity: "0"
  , transition: "opacity 1s, height .5s"
  , color: style.textColor }

activeTitle :: CSS
activeTitle = R.css { color: style.safeGreen }

activeBody :: String -> CSS
activeBody h = R.css { height: h
  , opacity: 1
  , paddingTop: "15px"}


