module Components.Navbar where

import Prelude

import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM as R
import React.Basic.DOM.Events (capture_)

type Props = {}

component :: Component Props
component = createComponent "Navbar"

navbar :: Props -> JSX
navbar = make component { initialState, render }
  where
    initialState = false

    render self =
      R.div
        { style: R.css { backgroundColor: "#343944", color: "white", height: "56px", width: "100%" }
          ,children: [
            R.button
            { style: R.css { cursor: "pointer" }
            , onClick: capture_ $ self.setState (\s -> (not s))
            , children: [ R.text "show menu" ]
            }
            , R.text if self.state then "menu showed" else "menu hidden"
          ]
        }
