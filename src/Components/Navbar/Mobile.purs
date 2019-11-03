module Components.Navbar.Mobile where

import Components.BackIcon (backIcon)
import Components.Navbar.MenuItems (menuItems)
import Components.NavigationLink (Path(..))
import Components.NavigationWrapper (navigationWrapper)
import Constants (Section(..), style)
import Effect (Effect)
import Prelude (Unit, not, ($), append)
import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM as R
import React.Basic.DOM.Events (capture_)
import Style.MobileNavbar (backButton, bottomBurger, bottomBurgerActive, burger, centralBurger, centralBurgerActive, menuLinkActiveStyle, menuLinkStyle, menuStyle, menuStyleActive, navbarStyle, topBurger, topBurgerActive)

mobileNavbarComponent :: Component { home :: Boolean }
mobileNavbarComponent = createComponent "MobileNavbar"

mobileNavbar :: { home :: Boolean } -> JSX
mobileNavbar = make mobileNavbarComponent { initialState, render }
  where
    initialState :: { open :: Boolean, activeLink :: Section }
    initialState = { open: false, activeLink: Home }

    render self =
      let
        setActiveLink :: Section -> Effect Unit
        setActiveLink al = self.setState (\s -> s { open = not s.open, activeLink = al })
        toggleState = self.setState (\s -> s { open = not s.open })
      in
        append
            (R.div
              { style: navbarStyle
              ,children: [
                case self.props.home of
                  false -> navigationWrapper { children: [backIcon { color: "#fff", width: "20", height: "20" }]
                    , style: backButton
                    , path: HomePath }
                  true -> R.button { style: burger
                    , onClick: capture_ toggleState
                    , children: [ R.span {style: if self.state.open then topBurgerActive else topBurger}
                    , R.span {style: if self.state.open then centralBurgerActive else centralBurger}
                    , R.span {style: if self.state.open then bottomBurgerActive else bottomBurger}] }
                , R.div
                  {style: style.stylishText
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

