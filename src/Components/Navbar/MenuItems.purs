module Components.Navbar.MenuItems where

import Prelude((==))

import Components.Link (link)
import Components.Navbar.Constants (sections)
import Data.Array (fromFoldable)
import Effect (Effect)
import Prelude (Unit, map, ($))
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

type MenuItemsProps = {
  open :: Boolean
  , onClick :: String -> Effect Unit
  , activeLink :: String
  , linkStyle :: CSS
  , linkStyleActive :: CSS
  , menuStyle :: CSS
  , menuStyleActive :: CSS
}

menuItemsComponent :: Component MenuItemsProps
menuItemsComponent = createComponent "Menu"

menuItems :: MenuItemsProps -> JSX
menuItems = makeStateless menuItemsComponent \props ->
  let
    fromSectionToLink :: String -> JSX
    fromSectionToLink section =
      link {
        onClick: props.onClick
        , value: section
        , style: if props.activeLink == section then R.mergeStyles [props.linkStyle, props.linkStyleActive] else props.linkStyle
      }
  in
    R.div
      {
        style: if props.open then R.mergeStyles [props.menuStyle, props.menuStyleActive] else props.menuStyle
        , children: fromFoldable (map fromSectionToLink sections)
      }
