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
      in
        input { value: self.state.name , onChange: onChangeName }
