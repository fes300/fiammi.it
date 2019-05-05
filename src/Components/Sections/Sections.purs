module Components.Sections where

import Prelude

import Constants (Section(..), sections)
import Data.Map (Map, fromFoldable)
import Data.Tuple (Tuple(..))
import React.Basic (JSX)
import React.Basic.DOM as R
import Utils (sectionToString)

sectionsJsx :: Map Section JSX
sectionsJsx = fromFoldable $ map sectionToTuple sections
  where
    sectionToTuple :: Section -> Tuple Section JSX
    sectionToTuple = case _ of
      Home -> Tuple Home (R.div { style: R.css { height: "800px" }, id: (sectionToString Home), children: [ R.text "Home" ] })
      ChiSono -> Tuple ChiSono (R.div { style: R.css { height: "800px" }, id: (sectionToString ChiSono), children: [ R.text "ChiSono" ] })
      ComeLavoro -> Tuple ComeLavoro (R.div { style: R.css { height: "800px" }, id: (sectionToString ComeLavoro), children: [ R.text "ComeLavoro" ] })
      DoveRicevo -> Tuple DoveRicevo (R.div { style: R.css { height: "800px" }, id: (sectionToString DoveRicevo), children: [ R.text "DoveRicevo" ] })
      FAQ -> Tuple FAQ (R.div { style: R.css { height: "800px" }, id: (sectionToString FAQ), children: [ R.text "FAQ" ] })
      Contatti -> Tuple Contatti (R.div { style: R.css { height: "800px" }, id: (sectionToString Contatti), children: [ R.text "Contatti" ] })
      DisturbiTrattati -> Tuple DisturbiTrattati (R.div { style: R.css { height: "800px" }, id: (sectionToString DisturbiTrattati), children: [ R.text "DisturbiTrattati" ] })


