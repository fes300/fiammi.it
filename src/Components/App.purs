module Components.App where

import Prelude

import Components.Footer (footer)
import Components.Sections (sectionsJsx)
import Data.Array (concat, fromFoldable)
import Data.Map (values)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R

type Navbar = Unit -> JSX

component :: Component Unit
component = createComponent "App"

app :: Navbar -> JSX
app navbar = unit # makeStateless component \_ ->
  R.div
    { style: R.css { fontFamily: "\"Open Sans\", Helvetica, Arial, sans-serif", display: "flex", flexDirection: "column" }
      , children: concat [[navbar unit], fromFoldable (values sectionsJsx), [footer unit]]
    }
