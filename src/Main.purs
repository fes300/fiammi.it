module Main where

import Prelude

import Components.App (app)
import Control.Monad.Reader (runReader)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Exception (throw)
import React.Basic.DOM (render)
import Utils (getDeviceType, getDeviceWidth)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

main :: Effect Unit
main = do
  root <- getElementById "root" =<< (map toNonElementParentNode $ document =<< window)
  device <- getDeviceType
  deviceWidth <- getDeviceWidth
  case root of
    Nothing -> throw "Root element not found."
    Just r  -> render (runReader app { device, deviceWidth } unit) r
