module Main where

import Prelude

import Components.App (app)
import Components.Navbar(navbar)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Exception (throw)
import React.Basic.DOM (render)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

main :: Effect Unit
main = do
  root <- getElementById "root" =<< (map toNonElementParentNode $ document =<< window)
  unwrappedNavbar <- navbar
  case root of
    Nothing -> throw "Root element not found."
    Just r  -> render (app { navbar: unwrappedNavbar }) r
