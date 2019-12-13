module Components.DiCosaMiOccupo where

import Prelude

import Components.AngleRight (angleRight)
import Components.Divider (divider)
import Components.Link (link, LinkProps(Link))
import Components.NavigationLink (Path(..), navigationLink)
import Constants (style, Section(Contatti))
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import Style.DiCosaMiOccupo (altriDisturbiImage, ansiaImage, cosaPossoFare, cosaPossoFareTitle, depressioneImage, minidivider, subsection)
import Style.NavigationLink (navigationLinkStyle)

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
        \affrontabile in base alle risorse a propria disposizione." ] }
      , navigationLink { text: "Continua", path: AnsiaPath }
      , R.div { style: subsection
        , children: [ R.text "Disturbi depressivi" ] }
      , R.div { style: depressioneImage }
      , R.div { children: [ R.text "\
        \Il disturbo depressivo è un disturbo dell’umore molto comune, tanto da essere definito \"il male del secolo\".\n\
        \Considerando la sola realtà italiana si stima che nell’arco della vita colpisca circa il 12% della popolazione \
        \e si prevede che nel 2030 possa diventare la prima causa al mondo di giorni di lavoro persi per disabilità.\n\
        \Comunemente si tende a sovrapporre la depressione al vissuto di tristezza o di malinconia: la tristezza \
        \però, come tutte le emozioni, anche nelle sue forme più estreme, è transitoria, mentre l’umore depresso \
        \è costante, oppressivo e ha delle ripercussioni negative sul funzionamento personale, sociale e lavorativo." ] }
      , navigationLink { text: "Continua", path: DepressionePath }
      , R.div { style: subsection
        , children: [ R.text "Altri disturbi" ] }
      , R.div { style: altriDisturbiImage }
      , R.div { children: [ R.text "\
        \Nella pratica clinica mi occupo di problemi psicologici di vario tipo - oltre a disturbi più frequenti \
        \come ansia e depressione - che provocano un intenso malessere nella vita di tutti i giorni. Spesso \
        \si rivolgono a me persone che stanno vivendo una forte conflittualità familiare o coniugale e non sanno \
        \come uscirne, altri non riescono a superare un evento stressante o hanno problemi sul lavoro che rovinano la loro vita privata." ] }
      , navigationLink { text: "Continua", path: AltriPath }
      , R.div { style: cosaPossoFare
        , children: [ R.div { children: [R.text "Cosa posso fare per te"]
            , style: cosaPossoFareTitle}
          , R.div { style: minidivider }
          , R.text "Lavoreremo insieme per aiutarti a stare meglio."
          , R.div {style: R.css { display: "flex"
              , marginTop: "20px"
              , alignItems: "center"
              , justifyContent: "center"}
            , children: [ link $ Link { text: "Chiedi un consulto"
                , value: Contatti
                , style: R.mergeStyles [navigationLinkStyle, R.css { marginRight: "10px" }] }
              , angleRight { height: "12", width: "12", color: style.safeGreen } ]} ]}]
  }
