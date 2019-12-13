module Components.Navbar.MenuItems where

import Components.Link (link, LinkProps(EffectfulLink))
import Constants (Section(..), sections)
import Data.Array (fromFoldable)
import Effect (Effect)
import Prelude (Unit, map, (==), ($))
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

type MenuItemsProps = {
  open :: Boolean
  , onClick :: Section -> Effect Unit
  , activeLink :: Section
  , linkStyle :: CSS
  , linkStyleActive :: CSS
  , menuStyle :: CSS
  , menuStyleActive :: CSS
}

sectionToTitle :: Section -> String
sectionToTitle = case _ of
  Home -> "Home"
  ChiSono ->  "Chi sono"
  DiCosaMiOccupo ->  "Di cosa mi occupo"
  ComeLavoro -> "Come lavoro"
  DoveRicevo -> "Dove ricevo"
  FAQ -> "FAQ"
  Contatti -> "Contatti"

menuItemsComponent :: Component MenuItemsProps
menuItemsComponent = createComponent "Menu"

menuItems :: MenuItemsProps -> JSX
menuItems = makeStateless menuItemsComponent \props ->
  let
    fromSectionToLink :: Section -> JSX
    fromSectionToLink section =
      link $ EffectfulLink {
        onClick: props.onClick
        , value: section
        , text: sectionToTitle section
        , style: if props.activeLink == section then R.mergeStyles [props.linkStyle, props.linkStyleActive] else props.linkStyle
      }
  in
    R.div
      {
        style: if props.open then R.mergeStyles [props.menuStyle, props.menuStyleActive] else props.menuStyle
        , children: fromFoldable (map fromSectionToLink sections)
      }
