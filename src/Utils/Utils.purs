module Utils where

import Data.Int (fromNumber)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Prelude (Unit, bind, (=<<), ($), map, pure, (-), (+), (<))
import Web.DOM.Element.Add (getBoundingClientRect)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (Window, window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document, scroll, scrollY, innerWidth)
import Constants (Section(..))

isMobile :: Window -> Effect Boolean
isMobile window = do
  windowWidth <- innerWidth window
  pure $ windowWidth < 425

scrollTo :: String -> Effect Unit
scrollTo el =
  let
    getTopMargin mobile = if mobile then 80 else 160
  in
    do
      domElement <- getElementById el =<< (map toNonElementParentNode $ document =<< window)
      unwrappedWindow <- window
      currentScroll <- scrollY unwrappedWindow
      case domElement of
        Nothing -> (scroll 0 0 unwrappedWindow)
        Just domEl  -> do
          elScroll <- getInt (getBoundingClientRect domEl)
          mobile <- isMobile unwrappedWindow
          scroll currentScroll (currentScroll + elScroll - (getTopMargin mobile)) unwrappedWindow

getInt :: Effect Number -> Effect Int
getInt effN = do
  n <- effN
  case fromNumber n of
    Nothing -> pure 0
    Just i -> pure i

sectionToString :: Section -> String
sectionToString = case _ of
  Home -> "Home"
  ChiSono -> "ChiSono"
  ComeLavoro -> "ComeLavoro"
  DoveRicevo -> "DoveRicevo"
  FAQ -> "FAQ"
  Contatti -> "Contatti"
  DisturbiTrattati -> "DisturbiTrattati"
