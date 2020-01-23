module Components.Navbar where

import Components.Navbar.Desktop (desktopNavbar)
import Components.Navbar.Mobile (mobileNavbar)
import Control.Monad.Reader (Reader, ask)
import Prelude (bind, pure)
import React.Basic (JSX)
import Utils (Context, DeviceType(..))

type Navbar = { home :: Boolean } -> JSX

navbar :: Reader Context Navbar
navbar = do
  { device } <- ask
  case device of
    Mobile -> pure mobileNavbar
    Tablet -> pure desktopNavbar
    Desktop -> pure desktopNavbar

