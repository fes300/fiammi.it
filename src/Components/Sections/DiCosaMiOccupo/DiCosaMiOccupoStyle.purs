module Style.DiCosaMiOccupo where

import Prelude ((<>))
import Constants (style)
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

ansiaImage :: CSS
ansiaImage = R.css { display: "flex"
  , flexDirection: ""
  , justifyContent: "center"
  , height: "200px"
  , backgroundImage: "url(assets/images/ansia.jpeg)"
  , backgroundPosition: "top center"
  , backgroundSize: "cover"
  , margin: "30px 0" }

depressioneImage :: CSS
depressioneImage = R.css { display: "flex"
  , flexDirection: ""
  , justifyContent: "center"
  , height: "200px"
  , backgroundImage: "url(assets/images/depressione.jpeg)"
  , backgroundPosition: "top center"
  , backgroundSize: "cover"
  , margin: "30px 0" }

altriDisturbiImage :: CSS
altriDisturbiImage = R.css { display: "flex"
  , flexDirection: ""
  , justifyContent: "center"
  , height: "200px"
  , backgroundImage: "url(assets/images/altriDisturbi.jpg)"
  , backgroundPosition: "top center"
  , backgroundSize: "cover"
  , margin: "30px 0" }

subsection :: CSS
subsection = R.mergeStyles [ style.subtitle
  , R.css { margin: "20px 0" } ]

cosaPossoFare :: CSS
cosaPossoFare  = R.css { padding: "50px 27px"
    , marginTop: "40px"
    , border: "3px solid" <> style.safeGreen }

cosaPossoFareTitle :: CSS
cosaPossoFareTitle  = R.mergeStyles [ style.subtitle
  , R.css {fontSize: "22px"}]

linkStyle :: CSS
linkStyle  = R.css { margin: "20px 35%" }

minidivider :: CSS
minidivider  = R.css { margin: "20px 35%"
  , border: "2px solid" <> style.safeGreen }
