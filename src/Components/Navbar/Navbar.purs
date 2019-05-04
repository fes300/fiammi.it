module Components.Navbar where

import Components.Navbar.Desktop (desktopNavbar)
import Components.Navbar.Mobile (mobileNavbar)
import Effect (Effect)
import Prelude (Unit, bind, (<), pure)
import React.Basic (JSX)
import Web.HTML (window)
import Web.HTML.Window (innerWidth)

navbar :: Effect (Unit -> JSX)
navbar = do
  unwrappedWindow <- window
  width <- innerWidth unwrappedWindow
  if width < 425
    then pure mobileNavbar
    else pure desktopNavbar

