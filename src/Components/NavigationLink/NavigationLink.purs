module Components.NavigationLink where

import Prelude

import Constants (Section)
import Effect (Effect)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import React.Basic.Events (handler_)

type NavigationLinkProps a = { text :: String
  , path :: Path
}

data Path = Ansia | Depressione | Altri

navigate :: Path -> Effect Unit
navigate _ = pure unit

navigationLinkComponent :: Component (NavigationLinkProps Section)
navigationLinkComponent = createComponent "NavigationLink"

navigationLink :: NavigationLinkProps Section -> JSX
navigationLink = makeStateless navigationLinkComponent \props ->
  R.div
    {
      onClick: handler_ do
          r1 <- navigate props.path
          pure r1
      , children: [ R.text props.text]
    }
