module Components.Input where

import Prelude

import Data.Maybe (Maybe(..))
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.Events (EventHandler)
import React.Basic.DOM as R

-- missing "placeholder" and "required" props

data Input = NumberInput (Maybe Number) | StringInput (Maybe String) | BooleanInput (Maybe Boolean)

type InputProps = { value :: Input, onChange :: EventHandler }

inputComponent :: Component InputProps
inputComponent = createComponent "Input"

input :: InputProps -> JSX
input = makeStateless inputComponent \props ->
  case props.value of
    NumberInput Nothing -> R.input { type: "number", value: "", onChange: props.onChange }
    NumberInput (Just n) -> R.input { type: "number", value: show n, onChange: props.onChange }
    StringInput Nothing -> R.input { type: "text", value: "", onChange: props.onChange }
    StringInput (Just s) -> R.input { type: "text", value: s, onChange: props.onChange }
    BooleanInput Nothing -> R.input { type: "checkbox", checked: false, onChange: props.onChange }
    BooleanInput (Just b) -> R.input { type: "checkbox", checked: b, onChange: props.onChange }
