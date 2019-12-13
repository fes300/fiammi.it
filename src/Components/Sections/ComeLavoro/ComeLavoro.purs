module Components.ComeLavoro where

import Prelude

import Components.Divider (divider)
import Constants (style)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import Style.ComeLavoro (image)

comeLavoroComponent :: Component Unit
comeLavoroComponent = createComponent "comeLavoro"

comeLavoro :: Unit -> JSX
comeLavoro = makeStateless comeLavoroComponent \props ->
  R.div {
    children: [R.h1 { style: style.title
        ,children: [ R.text "Come Lavoro"
          , divider ]}
      , R.div { style: image }
      , R.div {style: style.quote
        , children: [ R.text "\
          \“Intendo la psicoterapia come un ampliamento delle strade percorribili, delle possibilità di scelta, \
          \delle porte da aprire. Un'opportunità per tornare a prendersi cura del proprio benessere.”" ] }
      , divider
      , R.div { children: [ R.text "\
        \Tendenzialmente propongo alle persone che si rivolgono a me tre colloqui conoscitivi per capire meglio il \
        \problema riportato e come/se posso aiutarli. Avvalendomi talvolta anche di test specifici volti a inquadrare il funzionamento \
        \della persona, offro un percorso adatto alle sue caratteristiche e ai suoi bisogni, con l’obiettivo di \
        \intervenire sul problema principale e prioritario in quel dato momento. L’intento è promuovere un cambiamento e \
        \ottenere un benessere nel minore tempo possibile, sviluppando la capacità della persona di essere resiliente, ovvero \
        \valorizzando le sue risorse per superare in modo positivo le circostanze avverse e raggiungere le sue finalità. Svolgo \
        \consulenze psicologiche e colloqui di psicoterapia rivolti ad adolescenti e ad adulti, utilizzando una metodologia \
        \integrata, che combina in modo flessibile, individualizzato e conforme alle indicazioni provenienti dalla letteratura \
        \scientifica tecniche derivanti dal modello psicoanalitico e da quello cognitivo-comportamentale, in aggiunta a \
        \strumenti specifici di gestione dello stress. Questo modello è di vasta applicabilità e di elevata efficacia, in \
        \quanto la scelta della terapia e della tecnica varia a seconda della persona che si ha davanti e della fase di \
        \vita che sta attraversando, permettendo una “personalizzazione” dell’intervento terapico." ] } ] }
