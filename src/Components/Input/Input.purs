module Components.Input where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import React.Basic.DOM.Events (preventDefault, targetValue)
import React.Basic.Events (handler)

-- missing "placeholder" and "required" props

data Input = NumberInput (Maybe Int) | StringInput (Maybe String) | BooleanInput (Maybe Boolean)

type InputProps = { value :: Input, onChange :: Input -> Effect Unit }

inputComponent :: Component InputProps
inputComponent = createComponent "Input"

input :: InputProps -> JSX
input = makeStateless inputComponent \props ->
  let
    toInput :: Maybe String -> Input
    toInput val = case val of
      Just v -> StringInput $ Just v
      Nothing -> StringInput Nothing
    specializedHandler = handler (preventDefault >>> targetValue) (toInput >>> props.onChange)

  in
    case props.value of
      NumberInput Nothing -> R.input { type: "number", value: "", onChange: specializedHandler }
      NumberInput (Just n) -> R.input { type: "number", value: show n, onChange: specializedHandler }
      StringInput Nothing -> R.input { type: "text", value: "", onChange: specializedHandler }
      StringInput (Just s) -> R.input { type: "text", value: s, onChange: specializedHandler }
      BooleanInput Nothing -> R.input { type: "checkbox", checked: false, onChange: specializedHandler }
      BooleanInput (Just b) -> R.input { type: "checkbox", checked: b, onChange: specializedHandler }
