module Style.DiCosaMiOccupo where

import Constants (style)
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

ansiaImage :: CSS
ansiaImage = R.css { display: "flex"
  , flexDirection: ""
  , justifyContent: "center"
  , height: "200px"
  , backgroundImage: "url(../../src/assets/images/ansia.jpeg)"
  , backgroundPosition: "center"
  , backgroundSize: "cover"
  , margin: "30px 0" }

subsection :: CSS
subsection = R.mergeStyles [ style.subtitle
  , R.css { margin: "20px 0" } ]
