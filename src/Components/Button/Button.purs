module Components.Button where

import Prelude

import Effect (Effect)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import React.Basic.DOM.Events (capture)
import React.Basic.Events (EventFn, EventHandler, SyntheticEvent, unsafeEventFn)

type ButtonProps = { label :: String
  , disabled :: Boolean
  , onClick :: Unit -> Effect Unit
}

buttonComponent :: Component ButtonProps
buttonComponent = createComponent "Button"

button :: ButtonProps -> JSX
button = makeStateless buttonComponent \props ->
  let
    ignoreEvent :: EventFn SyntheticEvent Unit
    ignoreEvent = unsafeEventFn $ const unit
    specializedHandler :: EventHandler
    specializedHandler = capture ignoreEvent props.onClick
  in
    R.button { children: [ R.text props.label ]
      , disabled: props.disabled
      , onClick: specializedHandler
      , type: "submit"
    }
