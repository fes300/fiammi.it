module Components.Sections where

import Prelude

import Components.ChiSono (chiSono)
import Components.ComeLavoro (comeLavoro)
import Components.DiCosaMiOccupo (diCosaMiOccupo)
import Components.DoveRicevo (doveRicevo)
import Components.Home (home)
import Constants (Section(..), sections)
import Data.Map (Map, fromFoldable)
import Data.Tuple (Tuple(..))
import React.Basic (JSX)
import React.Basic.DOM as R
import Style.Sections (sectionStyle)
import Utils (sectionToString)

sectionsJsx :: Map Section JSX
sectionsJsx = fromFoldable $ map sectionToTuple sections
  where
    sectionToTuple :: Section -> Tuple Section JSX
    sectionToTuple = case _ of
      Home -> Tuple Home (R.div { style: sectionStyle, id: (sectionToString Home), children: [ home unit ] })
      ChiSono -> Tuple ChiSono (R.div { style: sectionStyle, id: (sectionToString ChiSono), children: [ chiSono unit ] })
      DiCosaMiOccupo -> Tuple DiCosaMiOccupo (R.div { style: sectionStyle, id: (sectionToString DiCosaMiOccupo), children: [ diCosaMiOccupo unit ] })
      ComeLavoro -> Tuple ComeLavoro (R.div { style: sectionStyle, id: (sectionToString ComeLavoro), children: [ comeLavoro unit ] })
      DoveRicevo -> Tuple DoveRicevo (R.div { style: sectionStyle, id: (sectionToString DoveRicevo), children: [ doveRicevo unit ] })
      FAQ -> Tuple FAQ (R.div { style: sectionStyle, id: (sectionToString FAQ), children: [ R.text "FAQ" ] })
      Contatti -> Tuple Contatti (R.div { style: sectionStyle, id: (sectionToString Contatti), children: [] })


