module Components.Link where

import Style.Link (linkStyle)
import Prelude (Unit, pure, bind)

import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)
import React.Basic.Events (handler_)
import Effect (Effect)

import Utils (scrollTo)

type Props = {
  value :: String
  , onClick :: String -> Effect Unit
  , style :: CSS
}

linkComponent :: Component Props
linkComponent = createComponent "Link"

link :: Props -> JSX
link = makeStateless linkComponent \props ->
  R.div
    {
      style: R.mergeStyles [linkStyle, props.style]
      , onClick: handler_ do
          r1 <- props.onClick props.value
          r2 <- scrollTo props.value
          pure r2
      , children: [ R.text props.value]
    }
