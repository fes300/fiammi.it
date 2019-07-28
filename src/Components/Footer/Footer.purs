module Components.Footer where

import Prelude

import Components.Button (button)
import Components.Input (input)
import Components.Textarea (textarea)
import Data.Maybe (Maybe(..), isJust)
import Data.String.NonEmpty (NonEmptyString)
import Effect (Effect)
import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM as R

footerComponent :: Component Unit
footerComponent = createComponent "Footer"

footer :: Unit -> JSX
footer = make footerComponent { initialState, render }
  where
    initialState :: { name :: Maybe NonEmptyString, email :: Maybe NonEmptyString, message :: Maybe NonEmptyString }
    initialState = { name: Nothing, email: Nothing, message: Nothing }

    render self =
      let
        onChangeName :: Maybe NonEmptyString -> Effect Unit
        onChangeName n = self.setState (\s -> s { name = n })
        onChangeEmail :: Maybe NonEmptyString -> Effect Unit
        onChangeEmail n = self.setState (\s -> s { email = n })
        onChangeMessage :: Maybe NonEmptyString -> Effect Unit
        onChangeMessage n = self.setState (\s -> s { message = n })
        sendForm :: Unit -> Effect Unit
        sendForm n = self.setState (\s -> initialState)
      in
        R.div { children: [
          input { value: self.state.name
            , onChange: onChangeName
            , placeholder: "il tuo nome"
            , required: false }
          , input { value: self.state.email
            , onChange: onChangeEmail
            , placeholder: "la tua email"
            , required: true }
          , textarea { value: self.state.message
            , onChange: onChangeMessage
            , placeholder: "messaggio"
            , required: true }
          , button { label: "send mail"
            , disabled: not $ isJust self.state.name && isJust self.state.email && isJust self.state.message
            , onClick: sendForm
          }
        ]}
