-- const y = element.getBoundingClientRect().top + window.scrollY;
-- window.scroll({
--   top: y,
--   behavior: 'smooth'
-- });
module Utils where

import Prelude (Unit, bind, (=<<), ($), map, pure, (-))

import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document, scroll, scrollY)
import Effect (Effect)
import Data.Maybe (Maybe(..))
import Data.Int (fromNumber)

import Web.DOM.Element.Add (getBoundingClientRect)

uni :: String
uni = ""

scrollTo :: String -> Effect Unit
scrollTo el = do
  numberEffect <- getElementById el =<< (map toNonElementParentNode $ document =<< window)
  unwrappedWindow <- window
  currentScroll <- scrollY unwrappedWindow
  case numberEffect of
    Nothing -> (scroll 0 0 unwrappedWindow)
    Just ne  -> do
      elScroll <- getNumber (getBoundingClientRect ne)
      scroll 0 (elScroll - 80) unwrappedWindow

getNumber :: Effect Number -> Effect Int
getNumber effN = do
  n <- effN
  case fromNumber n of
    Nothing -> pure 0
    Just i -> pure i
