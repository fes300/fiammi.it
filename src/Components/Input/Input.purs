module Components.Input where

import Prelude

import Data.Maybe (Maybe(..))
import Data.String.NonEmpty (NonEmptyString, fromString, toString)
import Effect (Effect)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import React.Basic.DOM.Events (preventDefault, targetValue)
import React.Basic.Events (handler)
import React.Basic.DOM.Internal (CSS)
import Style.Input as S

type InputProps = { value :: Maybe NonEmptyString
  , style :: CSS
  , onChange :: Maybe NonEmptyString -> Effect Unit
  , placeholder :: String
  , required :: Boolean }


inputComponent :: Component InputProps
inputComponent = createComponent "Input"

input :: InputProps -> JSX
input = makeStateless inputComponent \props ->
  let
    convertToNonEmpty :: Maybe String -> Maybe NonEmptyString
    convertToNonEmpty s = (>>=) s fromString
    specializedHandler = handler (preventDefault >>> targetValue) (convertToNonEmpty >>> props.onChange)
  in
    case props.value of
      Nothing -> R.input { type: "text"
        , value: ""
        , style: R.mergeStyles [S.inputStyle, props.style]
        , onChange: specializedHandler
        , placeholder: props.placeholder }
      Just s -> R.input { type: "text"
          , value: toString s
          , onChange: specializedHandler
          , style: R.mergeStyles [S.inputStyle, props.style]
          , placeholder: props.placeholder }
