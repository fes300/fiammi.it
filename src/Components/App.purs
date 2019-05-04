module Components.App where

import Prelude

import CSS (fontFamily)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R

type Navbar = Unit -> JSX

component :: Component Unit
component = createComponent "App"

app :: Navbar -> JSX
app navbar = unit # makeStateless component \_ ->
  R.div
    { style: R.css { fontFamily: "\"Open Sans\", Helvetica, Arial, sans-serif" }
      , children: [
        navbar unit
        , R.div { style: R.css { height: "2000px" } }
        , R.div { style: R.css { height: "2000px" }, id: "Chi sono", children: [ R.text "chi" ] }
      ]
    }
