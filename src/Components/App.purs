module Components.App where

import Prelude

import Components.Sections (sectionsJsx)
import Data.Array (fromFoldable)
import Data.List ((:))
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
      , children: fromFoldable (navbar unit : (values sectionsJsx))
    }
