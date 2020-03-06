module Utils where

import Constants (Section(..))
import Data.Int (floor, toNumber)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Console (log)
import Prelude (Unit, bind, (=<<), ($), map, pure, (-), (+), (<=), (<>))
import Web.DOM.Element (clientHeight)
import Web.DOM.Element.Add (getBoundingClientRect)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document, scroll, scrollY, innerWidth)

sectionToString :: Section -> String
sectionToString = case _ of
  Home -> "Home"
  ChiSono -> "ChiSono"
  DiCosaMiOccupo -> "DiCosaMiOccupo"
  ComeLavoro -> "ComeLavoro"
  DoveRicevo -> "DoveRicevo"
  FAQ -> "FAQ"

data DeviceType = Mobile | Tablet | Desktop

type Context = { device :: DeviceType
  , deviceWidth :: Int }

getDeviceWidth :: Effect Int
getDeviceWidth = innerWidth =<< window

getDeviceType :: Effect DeviceType
getDeviceType = do
  windowWidth <- getDeviceWidth
  if
    windowWidth <= 425 then pure Mobile
  else
    if windowWidth <= 1025 then pure Tablet
      else pure Desktop

isMobileOrTablet :: Effect Boolean
isMobileOrTablet = do
  deviceType <- getDeviceType
  pure $ case deviceType of
    Mobile -> true
    Tablet -> true
    Desktop -> false

getElementSize :: String -> Effect Number
getElementSize el = do
  domElement <- getElementById el =<< (map toNonElementParentNode $ document =<< window)
  unwrappedWindow <- window
  case domElement of
    Nothing -> do
      _ <- log $ el <> " not found"
      pure (toNumber 0)
    Just domEl  -> clientHeight domEl

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
          mobileOrTablet <- isMobileOrTablet
          scroll currentScroll (currentScroll + floor elScroll - getTopMargin mobileOrTablet) unwrappedWindow
