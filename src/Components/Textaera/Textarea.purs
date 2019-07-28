module Components.Textarea where

import Prelude

import Data.Maybe (Maybe(..))
import Data.String.NonEmpty (NonEmptyString, fromString, toString)
import Effect (Effect)
import Effect.Uncurried (EffectFn1)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import React.Basic.DOM.Events (preventDefault, targetValue)
import React.Basic.Events (handler, SyntheticEvent)

type TextareaProps = { value :: Maybe NonEmptyString
  , onChange :: Maybe NonEmptyString -> Effect Unit
  , placeholder :: String
  , required :: Boolean }

textareaComponent :: Component TextareaProps
textareaComponent = createComponent "Textarea"

textarea :: TextareaProps -> JSX
textarea = makeStateless textareaComponent \props ->
  let
    convertToNonEmpty :: Maybe String -> Maybe NonEmptyString
    convertToNonEmpty s = (>>=) s fromString
    specializedHandler :: EffectFn1 SyntheticEvent Unit
    specializedHandler = handler (preventDefault >>> targetValue) (convertToNonEmpty >>> props.onChange)
  in
    case props.value of
      Nothing -> R.textarea { value: "", onChange: specializedHandler, placeholder: props.placeholder }
      Just n -> R.textarea { value: toString n, onChange: specializedHandler, placeholder: props.placeholder }
