module Components.App where

import Prelude

import Utils (Context)
import Control.Monad.Reader (Reader)
import Navigation (navigation)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import Style.App (appStyle)

type AppProps = Unit

component :: Component AppProps
component = createComponent "App"

app :: Reader Context (AppProps -> JSX)
app = do
  navigation <- navigation
  pure $ makeStateless component \_ -> R.div { style: appStyle
    , children: [ navigation unit ] }
