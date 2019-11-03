module Navigation where

import Prelude

import Components.Navbar (Navbar)
import Components.NavigationLink (Path(..), toPath)
import Components.Sections (sectionsJsx)
import Data.Array (fromFoldable)
import Data.Map (values)
import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM as R
import Web.Event.Event (EventType(..))
import Web.Event.EventTarget (addEventListener, eventListener)
import Web.HTML (window)
import Web.HTML.Location (hash)
import Web.HTML.Window (location, toEventTarget)

navigationComponent :: Component { navbar :: Navbar }
navigationComponent = createComponent "Navigation"

navigation :: { navbar :: Navbar } -> JSX
navigation = make navigationComponent { initialState: HomePath
  , render
  , didMount: \self -> do
      unwrappedWindow <- window
      unwrappedHash <- location unwrappedWindow >>= hash
      _ <- self.setState(\_ -> toPath unwrappedHash)
      listener <- eventListener (\_ -> do
        futureHash <- location unwrappedWindow >>= hash
        self.setState(\_ -> toPath futureHash))
      _ <- addEventListener (EventType "hashchange") listener false (toEventTarget unwrappedWindow)
      pure unit }
  where
    render = \self -> case self.state of
      HomePath -> R.div { children: [self.props.navbar { home: true }
        , R.div { style: R.css { padding: "0 15px"}
          , children: fromFoldable (values sectionsJsx) }] }
      AnsiaPath -> R.div { children: [self.props.navbar { home: false }
        , R.text "ansia"] }
      DepressionePath -> R.div { children: [self.props.navbar { home: false }
        , R.text "depressione"] }
      AltriPath -> R.div { children: [self.props.navbar { home: false }
        , R.text "altri"] }
