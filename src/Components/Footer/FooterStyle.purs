module Style.Footer where

import Constants (style)
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

footerStyle :: CSS
footerStyle = R.css { backgroundColor: style.bluePalette
  , flexDirection: "column"
  , padding: "80px 15px"
  , display: "flex" }

inputStyle :: CSS
inputStyle = R.css { backgroundColor: style.bluePaletteMedium
  , marginBottom: "10px"
  , color: "#FFF"
  , border: "none" }

title :: CSS
title = R.css { textTransform: "uppercase"
  , color:"#fff"
  , margin: "0 0 15px 0"
  , fontSize: "17px"
  , lineHeight: 1.5
  , textAlign: "center"}

icon :: CSS
icon = R.css { height: "20px"
  , width: "20px"
  , marginRight: "15px"}

iconRow :: CSS
iconRow = R.css { display: "flex"
  , alignItems:"center"
  , marginBottom: "10px" }

iconRowWrapper :: CSS
iconRowWrapper = R.css { display: "flex"
  , flexDirection: "column"
  , margin: "15px auto" }

success :: CSS
success = R.css { color: style.safeGreen
  , marginBottom: "10px" }

error :: CSS
error = R.css { color: style.dangerRed
  , marginBottom: "10px" }
