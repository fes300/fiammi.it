module Components.Footer where

import Prelude

import Components.Input (Input(..), input)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM as R

footerComponent :: Component Unit
footerComponent = createComponent "Footer"

footer :: Unit -> JSX
footer = make footerComponent { initialState, render }
  where
    initialState :: { name :: Input, email :: Input, message :: Input }
    initialState = { name: StringInput Nothing, email: StringInput Nothing, message: StringInput Nothing }

    render self =
      let
        onChangeName :: Input -> Effect Unit
        onChangeName n = self.setState (\s -> s { name = n })
        onChangeEmail :: Input -> Effect Unit
        onChangeEmail n = self.setState (\s -> s { email = n })
        onChangeMessage :: Input -> Effect Unit
        onChangeMessage n = self.setState (\s -> s { message = n })
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
          , input { value: self.state.message
            , onChange: onChangeMessage
            , placeholder: "messaggio"
            , required: true }
        ]}
