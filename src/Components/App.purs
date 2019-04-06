module Components.App where

import Prelude

import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as DOM
import React.Basic.DOM.Generated (style)

component :: Component Unit
component = createComponent "App"

app :: JSX
app = unit # makeStateless component \_ ->
  DOM.div
    {
      style: DOM.css { padding: "5px" }
      , children: [ DOM.text "prova" ]
    }
