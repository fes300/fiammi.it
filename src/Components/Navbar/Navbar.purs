module Components.Navbar where

import Prelude

import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM as R
import React.Basic.DOM.Events (capture_)
import Components.NavbarStyle


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
            { style: burger
            , onClick: capture_ $ self.setState (\s -> (not s))
            , children: [ R.span {style: if self.state then topBurgerActive else topBurger}
             , R.span {style: if self.state then centralBurgerActive else centralBurger}
             , R.span {style: if self.state then bottomBurgerActive else bottomBurger}]
            }
            , R.text if self.state then "menu showed" else "menu hidden"
          ]
        }
