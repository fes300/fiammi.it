module Components.NavigationLink where

import Prelude

import Components.AngleRight (angleRight)
import Constants (Section)
import Effect (Effect)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import React.Basic.Events (handler_)
import Style.NavigationLink (navigationLinkStyle, textStyle)
import Web.HTML (window)
import Web.HTML.Location (setHash)
import Web.HTML.Window (location)

type NavigationLinkProps a = { text :: String
  , path :: Path
}

data Path = HomePath | AnsiaPath | DepressionePath | AltriPath

toString :: Path -> String
toString = case _ of
  HomePath -> "#home"
  AnsiaPath -> "#ansia"
  DepressionePath -> "#depressione"
  AltriPath -> "#altri"

toPath :: String -> Path
toPath = case _ of
  "#home" -> HomePath
  "#ansia" -> AnsiaPath
  "#depressione" -> DepressionePath
  "#altri" -> AltriPath
  _ -> HomePath

navigate :: Path -> Effect Unit
navigate path = do
  unwrappedWindow <- window
  unwrappedLocation <- location unwrappedWindow
  setHash (toString path) unwrappedLocation

navigationLinkComponent :: Component (NavigationLinkProps Section)
navigationLinkComponent = createComponent "NavigationLink"

navigationLink :: NavigationLinkProps Section -> JSX
navigationLink = makeStateless navigationLinkComponent \props ->
  R.div
    {
      style: navigationLinkStyle
      , onClick: handler_ do
          r1 <- navigate props.path
          pure r1
      , children: [ R.div { style: textStyle
          , children: [R.text props.text] }
        , angleRight { height: "12", width: "12", color: "rgb(53, 186, 82)" }]
    }
