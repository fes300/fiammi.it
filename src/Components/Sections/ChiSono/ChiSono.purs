module Components.ChiSono where

import Prelude

import Components.Divider (divider)
import Constants (style)
import Style.ChiSono (imageContainer, subSection)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R

chiSonoComponent :: Component Unit
chiSonoComponent = createComponent "chiSono"

chiSono :: Unit -> JSX
chiSono = makeStateless chiSonoComponent \props ->
  R.div {
    children: [R.h1 { style: style.title
        ,children: [ R.text "Chi sono"
          , divider ]}
      , R.div { children: [ R.text "\
          \Ritengo fondamentali nel mio lavoro non soltanto una buona preparazione a livello teorico, ma anche muovermi \
          \con sensibilità, naturalezza e rispetto nei confronti di chi ho davanti, entrando in empatia e in contatto affettivo autentico.\n\
          \Solo così si può iniziare un viaggio insieme verso una meta comune.\n" ] }
      , R.div { style: imageContainer }
      , R.div { style: subSection
        , children: [ R.text "La mia formazione" ] }
      , R.div { children: [ R.text "\
        \Sono iscritta all’Albo degli Psicologi della Lombardia e abilitata all’esercizio della professione \
        \di Psicologo Psicoterapeuta. Dopo essermi laureata con lode in Psicologia Clinica presso l’Università Bicocca di \
        \Milano, ho ottenuto l’abilitazione alla somministrazione del Test di Rorschach con metodo Exner presso \
        \l'A.R.P. (Associazione per la Ricerca in Psicologia Clinica) di Milano. In seguito agli studi accademici ho conseguito il \
        \Diploma di Specializzazione Quadriennale in Psicoterapia Focale Integrata presso l’Istituto ISeRDiP – Istituto \
        \per lo Studio e la Ricerca sui Disturbi Psichici. Convinta della necessità di una formazione continua, ho \
        \poi svolto un corso di formazione sull’utilizzazione degli indici di resilienza nella valutazione diagnostica e nell’intervento integrato." ] }
      , R.div { style: subSection
        , children: [ R.text "Le mie esperienze lavorative" ] }
      , R.div { children: [ R.text "\
        \Presso il mio Studio di Milano mi occupo principalmente di percorsi psicoterapici individuali, di \
        \interventi di supporto per la gestione dello stress, di valutazioni psicodiagnostiche e di consulenze tecnico \
        \peritali. Collaboro inoltre con il Centro Clinico Specialistico G. C. Zapparoli e con alcune scuole di Milano, tenendo uno sportello d'ascolto e corsi di formazione \
        \finalizzati alla gestione del disagio dei docenti e alla promozione del benessere degli alunni. \n\
        \In passato ho collaborato per cinque anni con l’Ospedale Fatebenefratelli di Milano presso il Centro Psico Sociale 6 \
        \(C.P.S.), dove ho maturato una significativa esperienza nella cura dei disturbi psicologi." ] }
      , R.div { style: subSection
        , children: [ R.text "Pubblicazioni" ] }
      , R.div { children: [ R.text "\
        \Contributo all’articolo \"Uso clinico dei sogni in psicoterapia cognitiva\", Rivista Sperimentale di Freniatria VOL CXLI - N°2, 2017" ] } ]
  }
