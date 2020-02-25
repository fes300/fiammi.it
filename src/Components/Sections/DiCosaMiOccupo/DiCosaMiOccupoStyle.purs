module Style.DiCosaMiOccupo where

import Constants (style)
import Prelude ((<>))
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

foreign import ansiaImage :: { default :: String }
foreign import depressioneImage :: { default :: String }
foreign import altriDisturbiImage :: { default :: String }

ansiaImageStyle :: CSS
ansiaImageStyle = R.css { display: "flex"
  , flexDirection: ""
  , justifyContent: "center"
  , height: "200px"
  , backgroundImage: "url(" <> ansiaImage.default <> ")"
  , backgroundPosition: "top center"
  , backgroundSize: "cover"
  , margin: "30px 0" }

depressioneImageStyle :: CSS
depressioneImageStyle = R.css { display: "flex"
  , flexDirection: ""
  , justifyContent: "center"
  , height: "200px"
  , backgroundImage: "url(" <> depressioneImage.default <> ")"
  , backgroundPosition: "top center"
  , backgroundSize: "cover"
  , margin: "30px 0" }

altriDisturbiImageStyle :: CSS
altriDisturbiImageStyle = R.css { display: "flex"
  , flexDirection: ""
  , justifyContent: "center"
  , height: "200px"
  , backgroundImage: "url(" <> altriDisturbiImage.default <> ")"
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
