module Components.Navbar.Desktop where

import Components.Navbar.MenuItems (menuItems)
import Components.NavigationLink (Path(..))
import Components.NavigationWrapper (navigationWrapper)
import Constants (Section(..), style)
import Effect (Effect)
import Prelude (Unit)
import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM as R
import Style.DesktopNavbar (navbarStyle, navbarStyleActive, linkStyle, linkStyleActive, menuStyle, fiammiStyle)

desktopNavbarComponent :: Component { home :: Boolean }
desktopNavbarComponent = createComponent "DesktopNavbar"

desktopNavbar :: { home :: Boolean } -> JSX
desktopNavbar = make desktopNavbarComponent { initialState, render }
  where
    initialState :: { activeLink :: Section }
    initialState = { activeLink: Home }

    render self =
      let
        setActiveLink :: Section -> Effect Unit
        setActiveLink al = self.setState (\s -> s { activeLink = al })
      in
        R.div { style: navbarStyle
          , children: [
            R.div {style: fiammiStyle
              , children: [ R.div
                  {style: style.stylishText
                    , children: [ R.text  "dott.ssa Fiammetta Facchinetti"]
                  }
                , R.div
                  {style: style.stylishText
                    , children: [ R.text  "Psicologa Psicoterapeuta"]
                  }
              ]
            }
            , case self.props.home of
              false -> navigationWrapper { children: [R.text "home"]
                , style: R.css {}
                , path: HomePath }
              true -> menuItems { open: true
                , activeLink: self.state.activeLink
                , onClick: setActiveLink
                , linkStyle: linkStyle
                , linkStyleActive: linkStyleActive
                , menuStyle: menuStyle
                , menuStyleActive: navbarStyleActive }
          ]
        }

