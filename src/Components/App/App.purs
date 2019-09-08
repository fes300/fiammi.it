module Components.App where

import Prelude

import Components.Footer (footer)
import Components.Sections (sectionsJsx)
import Data.Array (concat, fromFoldable)
import Data.Map (values)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import Style.App (appStyle, sectionContainerStyle)

type Navbar = Unit -> JSX

component :: Component Unit
component = createComponent "App"

app :: Navbar -> JSX
app navbar = unit # makeStateless component \_ ->
  R.div
    { style: appStyle
      , children: concat [[navbar unit]
        , [R.div { style: sectionContainerStyle, children: fromFoldable (values sectionsJsx) }]
        , [footer unit]]
    }
