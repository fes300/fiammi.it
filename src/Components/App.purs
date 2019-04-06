module Components.App where

import Prelude

import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as DOM
import Components.Navbar(navbar)

component :: Component Unit
component = createComponent "App"

app :: JSX
app = unit # makeStateless component \_ ->
  DOM.div
    {
      children: [ navbar {} ]
    }
