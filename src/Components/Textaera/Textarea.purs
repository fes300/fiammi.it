module Components.Textarea where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Uncurried (EffectFn1)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import React.Basic.DOM.Events (preventDefault, targetValue)
import React.Basic.Events (handler, SyntheticEvent)

data Input = NumberInput (Maybe Int) | StringInput (Maybe String) | BooleanInput (Maybe Boolean)

type TextareaProps = { value :: Maybe String
  , onChange :: Maybe String -> Effect Unit
  , placeholder :: String
  , required :: Boolean }

textareaComponent :: Component TextareaProps
textareaComponent = createComponent "Textarea"

textarea :: TextareaProps -> JSX
textarea = makeStateless textareaComponent \props ->
  let
    specializedHandler :: EffectFn1 SyntheticEvent Unit
    specializedHandler = handler (preventDefault >>> targetValue) props.onChange
  in
    case props.value of
      Nothing -> R.textarea { value: "", onChange: specializedHandler, placeholder: props.placeholder }
      Just n -> R.textarea { value: n, onChange: specializedHandler, placeholder: props.placeholder }
