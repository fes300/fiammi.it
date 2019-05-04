module Components.Navbar.Mobile where

import Prelude (Unit, not, ($), append)

import Style.MobileNavbar (
  bottomBurger,
  bottomBurgerActive,
  burger,
  centralBurger,
  centralBurgerActive,
  fiammi,
  menuStyle,
  menuStyleActive,
  topBurger,
  topBurgerActive,
  menuLinkStyle,
  menuLinkActiveStyle,
  navbarStyle
)
import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM as R
import React.Basic.DOM.Events (capture_)
import Components.Navbar.MenuItems (menuItems)
import Effect (Effect)

mobileNavbarComponent :: Component Unit
mobileNavbarComponent = createComponent "MobileNavbar"

mobileNavbar :: Unit -> JSX
mobileNavbar = make mobileNavbarComponent { initialState, render }
  where
    initialState :: { open :: Boolean, activeLink :: String }
    initialState = { open: false, activeLink: "Home" }

    render self =
      let
        setActiveLink :: String -> Effect Unit
        setActiveLink al = self.setState (\s -> s { open = not s.open, activeLink = al })
        toggleState = self.setState (\s -> s { open = not s.open })
      in
        append
          (R.div
            { style: navbarStyle
            ,children: [
                R.button
                { style: burger
                , onClick: capture_ toggleState
                , children: [ R.span {style: if self.state.open then topBurgerActive else topBurger}
                , R.span {style: if self.state.open then centralBurgerActive else centralBurger}
                , R.span {style: if self.state.open then bottomBurgerActive else bottomBurger}]
                }
                , R.div
                  {style: fiammi
                  , children: [ R.text  "Fiammetta Facchinetti"]
                  }
              ]
            })
          $ menuItems {
            open: self.state.open
            , activeLink: self.state.activeLink
            , onClick: setActiveLink
            , linkStyle: menuLinkStyle
            , linkStyleActive: menuLinkActiveStyle
            , menuStyle: menuStyle
            , menuStyleActive: menuStyleActive
          }

