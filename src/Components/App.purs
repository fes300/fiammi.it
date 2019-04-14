module Components.App where

import Prelude

import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import Components.Navbar(navbar)

component :: Component Unit
component = createComponent "App"

app :: JSX
app = unit # makeStateless component \_ ->
  R.div
    {
      children: [
        navbar unit
        , R.div { style: R.css { height: "2000px" } }
        , R.div { style: R.css { height: "2000px" }, id: "Chi sono", children: [ R.text "chi" ] }
      ]
    }
