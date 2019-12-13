module Utils where

import Constants (Section(..))
import Data.Int (floor)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Console (log)
import Prelude (Unit, bind, (=<<), ($), map, pure, (-), (+), (<), (<>))
import Web.DOM.Element.Add (getBoundingClientRect)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (Window, window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document, scroll, scrollY, innerWidth)

isMobile :: Window -> Effect Boolean
isMobile window = do
  windowWidth <- innerWidth window
  pure $ windowWidth < 425

scrollTo :: String -> Effect Unit
scrollTo el =
  let
    getTopMargin mobile = if mobile then 80 else 200
  in
    do
      domElement <- getElementById el =<< (map toNonElementParentNode $ document =<< window)
      unwrappedWindow <- window
      currentScroll <- scrollY unwrappedWindow
      case domElement of
        Nothing -> log $ el <> " not found"
        Just domEl  -> do
          elScroll <- getBoundingClientRect domEl
          mobile <- isMobile unwrappedWindow
          scroll currentScroll (currentScroll + floor elScroll - getTopMargin mobile) unwrappedWindow

sectionToString :: Section -> String
sectionToString = case _ of
  Home -> "Home"
  ChiSono -> "ChiSono"
  DiCosaMiOccupo -> "DiCosaMiOccupo"
  ComeLavoro -> "ComeLavoro"
  DoveRicevo -> "DoveRicevo"
  FAQ -> "FAQ"
  Contatti -> "Contatti"
