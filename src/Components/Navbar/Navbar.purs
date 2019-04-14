module Components.Navbar where

import Prelude (Unit, not, ($), append)

import Style.Navbar (bottomBurger, bottomBurgerActive, burger, centralBurger, centralBurgerActive, fiammi, menuStyle, menuStyleActive, topBurger, topBurgerActive, menuLinkStyle)
import React.Basic (Component, JSX, createComponent, make, makeStateless)
import React.Basic.DOM as R
import React.Basic.DOM.Events (capture_)
import Effect (Effect)

import Components.Link (link)

type MenuProps = {
  open :: Boolean
  , hideMenu :: String -> Effect Unit
}

menuComponent :: Component MenuProps
menuComponent = createComponent "Menu"

menu :: MenuProps -> JSX
menu = makeStateless menuComponent \props ->
  R.div
    {
      style: if props.open then R.mergeStyles [menuStyle, menuStyleActive] else menuStyle
      , children: [
        link { onClick: props.hideMenu, value: "Chi sono", style: menuLinkStyle }
      ]
    }

navbarComponent :: Component Unit
navbarComponent = createComponent "Navbar"

navbar :: Unit -> JSX
navbar = make navbarComponent { initialState, render }
  where
    initialState = false

    render self =
      let
        toggleState = self.setState (\s -> not s)
      in
        append
          (R.div
            { style: R.css { position: "relative", backgroundColor: "#343944", color: "white", height: "56px", width: "100%", zIndex: 999, display: "flex", alignItems: "center" }
            ,children: [
                R.button
                { style: burger
                , onClick: capture_ toggleState
                , children: [ R.span {style: if self.state then topBurgerActive else topBurger}
                , R.span {style: if self.state then centralBurgerActive else centralBurger}
                , R.span {style: if self.state then bottomBurgerActive else bottomBurger}]
                }
                , R.div
                  {style: fiammi
                  , children: [ R.text  "Fiammetta Facchinetti"]
                  }
              ]
            })
          $ menu { open: self.state, hideMenu: \_ -> toggleState }

