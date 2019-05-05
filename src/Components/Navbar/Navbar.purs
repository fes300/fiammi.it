module Components.Navbar where

import Components.Navbar.Desktop (desktopNavbar)
import Components.Navbar.Mobile (mobileNavbar)
import Effect (Effect)
import Prelude (Unit, bind, pure)
import React.Basic (JSX)
import Utils (isMobile)
import Web.HTML (window)

navbar :: Effect (Unit -> JSX)
navbar = do
  unwrappedWindow <- window
  mobile <- isMobile unwrappedWindow
  if mobile
    then pure mobileNavbar
    else pure desktopNavbar

