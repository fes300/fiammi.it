module Components.FAQ where

import Prelude

import Data.Maybe (Maybe(..))
import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM as R
import React.Basic.Events (EventHandler, handler_)
import Style.FAQ (active)

faqComponent :: Component Unit
faqComponent = createComponent "faq"

data AccordionElement = How | HowLong | Differences

toString :: AccordionElement -> String
toString a = case a of
  How -> "how"
  HowLong -> "howLong"
  Differences -> "differences"

accordionElement :: { element :: AccordionElement
  , selected :: Maybe AccordionElement
  , onSelect :: EventHandler
  , title :: String } -> JSX
accordionElement { element, selected, onSelect, title } = R.div { onClick: onSelect
  , style: if eq (Just $ toString element) (map toString selected) then active else R.css {}
  , children: [R.text title] }

faq :: Unit -> JSX
faq = make faqComponent { initialState: Nothing, render }
  where
    render self = R.div { children: [accordionElement { selected: self.state
      , onSelect: handler_ (self.setState \_ -> Just How)
      , title: "prova"
      , element: How }] }
