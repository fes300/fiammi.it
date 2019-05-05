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

type Props a = {
  value :: a
  , text :: String
  , onClick :: a -> Effect Unit
  , style :: CSS
}

linkComponent :: Component (Props Section)
linkComponent = createComponent "Link"

link :: Props Section -> JSX
link = makeStateless linkComponent \props ->
  R.div
    {
      style: R.mergeStyles [linkStyle, props.style]
      , onClick: handler_ do
          r1 <- props.onClick props.value
          r2 <- scrollTo $ sectionToString props.value
          pure r2
      , children: [ R.text props.text]
    }
