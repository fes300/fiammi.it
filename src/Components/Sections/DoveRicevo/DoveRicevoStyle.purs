module Style.DoveRicevo where

import Prelude ((<>))
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

foreign import studioImage :: { default :: String }

image :: CSS
image = R.css { display: "flex"
  , flexDirection: ""
  , justifyContent: "center"
  , height: "200px"
  , backgroundImage: "url(" <> studioImage.default <> ")"
  , backgroundPosition: "top center"
  , backgroundSize: "cover"
  , margin: "30px 0" }

trattaStyle :: CSS
trattaStyle = R.css { display: "flex"
  , justifyContent: "center" }

mezzoStyle :: CSS
mezzoStyle = R.css { fontWeight: "700" }
