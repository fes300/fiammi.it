module Navigation where

import Prelude (Unit, pure, bind, (>>=), unit, ($), (<>))

import Components.Footer (footer)
import Components.Navbar (navbar)
import Components.NavigationLink (Path(..), toPath)
import Components.Sections (sectionsJsx)
import Control.Monad.Reader (Reader)
import Data.Array (fromFoldable)
import Data.Map (values)
import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM as R
import Utils (Context)
import Web.Event.Event (EventType(..))
import Web.Event.EventTarget (addEventListener, eventListener)
import Web.HTML (window)
import Web.HTML.Location (hash)
import Web.HTML.Window (location, toEventTarget)

type NavigationProps = Unit

navigationComponent :: Component NavigationProps
navigationComponent = createComponent "Navigation"

navigation :: Reader Context (NavigationProps -> JSX)
navigation = do
  nav <- navbar
  pure $ make navigationComponent { initialState: HomePath
    , render: \self -> (_render nav self)
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
    _render nav self =
      case self.state of
        HomePath -> R.div { children: [nav { home: true }
          , R.div { style: R.css { padding: "0 15px"}
            , children: (fromFoldable $ values sectionsJsx) }] <> [footer unit] }
        AnsiaPath -> R.div { children: [nav { home: false }
          , R.text "ansia"] }
        DepressionePath -> R.div { children: [nav { home: false }
          , R.text "depressione"] <> [footer unit] }
        AltriPath -> R.div { children: [nav { home: false }
          , R.text "altri"] <> [footer unit] }
