module Components.DiCosaMiOccupo where

import Prelude

import Components.Divider (divider)
import Constants (style)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import Style.DiCosaMiOccupo (ansiaImage, subsection)

diCosaMiOccupoComponent :: Component Unit
diCosaMiOccupoComponent = createComponent "diCosaMiOccupo"

diCosaMiOccupo :: Unit -> JSX
diCosaMiOccupo = makeStateless diCosaMiOccupoComponent \props ->
  R.div {
    children: [R.h1 { style: style.title
        ,children: [ R.text "Di cosa mi occupo"
          , divider ]}
      , R.div { children: [ R.text "\
        \Svolgo percorsi di psicoterapia, consulenze in presenza o via Skype, supporti psicologici e valutazioni psicodiagnostiche \
        \rivolti ad adolescenti, adulti e coppie che stanno affrontando momenti di difficoltà, legati a una \
        \specifica fase di vita o più persistenti nel tempo, e sentono il bisogno di migliorare la propria qualità di vita. \
        \Il disagio psicologico può assumere diverse forme, manifestandosi in modo generalizzato e diffuso – tramite \
        \ad esempio vissuti di inadeguatezza, scontento e problematiche relazionali – o attraverso sintomi specifici \
        \- come avviene in disturbi psicologici quali la depressione, le fobie, il disturbo d’ansia e di personalità." ] }
      , R.div { style: subsection
        , children: [ R.text "Disturbi d'ansia" ] }
      , R.div { style: ansiaImage }
      , R.div { children: [ R.text "\
        \I disturbi d’ansia sono estremamente diffusi: ne soffre 1 persona su 20.\n\
        \È importante tener presente che l’ansia è un’emozione innata, naturale e adattiva dell’organismo, \
        \che determina una reazione fisiologica di attivazione di fronte a una situazione vissuta come una minaccia.\n\
        \Quando l’ansia è moderata è quindi utile perché ci permette di reagire velocemente di fronte a una circostanza difficile, può\n\
        \diventare però un problema se eccessiva e sproporzionata rispetto all’evento-stimolo, che viene vissuto come non\
        \affrontabile in base alle risorse a propria disposizione." ] } ]
  }