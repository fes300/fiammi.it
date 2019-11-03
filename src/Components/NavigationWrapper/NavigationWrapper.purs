module Components.NavigationWrapper where

import Prelude

import Components.NavigationLink (Path, navigate)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM (CSS)
import React.Basic.DOM as R
import React.Basic.Events (handler_)

type NavigationWrapperProps = { children :: Array JSX
  , path :: Path
  , style :: CSS
}

navigationWrapperComponent :: Component NavigationWrapperProps
navigationWrapperComponent = createComponent "NavigationWrapper"

navigationWrapper :: NavigationWrapperProps -> JSX
navigationWrapper = makeStateless navigationWrapperComponent \{ children, path, style } ->
  R.div
    { onClick: handler_ do
          r1 <- navigate path
          pure r1
      , children
      , style: R.mergeStyles [style, R.css { cursor: "pointer" }]
    }
