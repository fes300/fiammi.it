module Components.Link where

import Prelude

import Constants (Section)
import Effect (Effect)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)
import React.Basic.Events (handler_)
import Style.Link (linkStyle)
import Utils (scrollTo, sectionToString)

data LinkProps a = EffectfulLink {value :: a
  , text :: String
  , onClick :: a -> Effect Unit
  , style :: CSS
} | Link {value :: a
  , text :: String
  , style :: CSS
}

linkComponent :: Component (LinkProps Section)
linkComponent = createComponent "Link"

link :: LinkProps Section -> JSX
link = makeStateless linkComponent \props ->
  case props of
    EffectfulLink propsE -> R.div {style: R.mergeStyles [linkStyle, propsE.style]
      , onClick: handler_ do
          r1 <- propsE.onClick propsE.value
          r2 <- scrollTo $ sectionToString propsE.value
          pure r2
      , children: [ R.text propsE.text]}
    Link propsF -> R.div {style: R.mergeStyles [linkStyle, propsF.style]
      , onClick: handler_ do
          r2 <- scrollTo $ sectionToString propsF.value
          pure r2
      , children: [ R.text propsF.text]}
