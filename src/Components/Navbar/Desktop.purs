module Components.Navbar.Desktop where

import Prelude (Unit)

import Style.DesktopNavbar (navbarStyle, navbarStyleActive, linkStyle, linkStyleActive)
import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM as R
import Components.Navbar.MenuItems (menuItems)
import Effect (Effect)

desktopNavbarComponent :: Component Unit
desktopNavbarComponent = createComponent "DesktopNavbar"

desktopNavbar :: Unit -> JSX
desktopNavbar = make desktopNavbarComponent { initialState, render }
  where
    initialState :: { activeLink :: String }
    initialState = { activeLink: "Home" }

    render self =
      let
        setActiveLink :: String -> Effect Unit
        setActiveLink al = self.setState (\s -> s { activeLink = al })
      in
        R.div
          { children: [
              menuItems {
                open: true
                , activeLink: self.state.activeLink
                , onClick: setActiveLink
                , linkStyle: linkStyle
                , linkStyleActive: linkStyleActive
                , menuStyle: navbarStyle
                , menuStyleActive: navbarStyleActive
              }
            ]
          }

