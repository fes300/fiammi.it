module Style.ComeLavoro where

import Prelude ((<>))
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

foreign import doorsImage :: { default :: String }

image :: CSS
image = R.css { display: "flex"
  , flexDirection: ""
  , justifyContent: "center"
  , height: "200px"
  , backgroundImage: "url(" <> doorsImage.default <> ")"
  , backgroundPosition: "top center"
  , backgroundSize: "cover"
  , margin: "30px 0" }
