module Components.App where

import Prelude

import Components.Footer (footer)
import Components.Navbar (Navbar)
import Navigation (navigation)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import Style.App (appStyle)

component :: Component { navbar :: Navbar }
component = createComponent "App"

app :: { navbar :: Navbar } -> JSX
app = makeStateless component \{ navbar } ->
  R.div
    { style: appStyle
      , children: [ navigation { navbar }
        , footer unit ]
    }
