module Components.Home where

import Prelude

import Components.Divider (divider)
import Components.Quote (quote)
import Constants (style)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import Style.Home (imageContainer)

foreign import homepageMainImage :: { default :: String }

homeComponent :: Component Unit
homeComponent = createComponent "Home"

home :: Unit -> JSX
home = makeStateless homeComponent \props ->
  R.div {
    children: [R.div { style: imageContainer
      , children: [ R.img { src: homepageMainImage.default, alt: "aiuto psicologo", width: "100%" }]}
      ,R.h1 { style: style.title
        ,children: [ R.text "Quando è utile rivolgersi a uno psicoterapeuta?"
          , divider ]}
      , R.div { children: [ R.text "\
          \Nella vita quotidiana ci troviamo spesso ad affrontare cambiamenti importanti o eventi particolarmente stressanti\n\
          \e provare vissuti di malessere che possono bloccarci, mandarci in crisi e interferire con la nostra serenità.\n\
          \In questi momenti possiamo trovarci a ripetere - spesso in modo inconsapevole - strategie, visioni del mondo\n\
          \e comportamenti disfunzionali che sono di ostacolo al raggiungimento delle nostre finalità.\n"
        , R.br {}
        , R.br {}
        , R.text "\
          \La figura dello psicoterapeuta rappresenta un valido aiuto per affrontare questo stato di sofferenza,\n\
          \accompagnando la persona nell’individuazione di modi più funzionali per percepire sé, gli altri e il mondo, ritrovando la\n\
          \direzione verso un maggiore benessere.\n"
        , R.br {}
        , R.br {}
        , R.text "\
          \La psicoterapia può inoltre essere utile laddove si desideri intraprendere un percorso di rafforzamento della consapevolezza di sé,\n\
          \di crescita personale e valorizzazione delle proprie potenzialità.\n\
          \Prendersi cura della propria salute psicologica ha delle ripercussioni positive sulla vita dell’individuo sotto molti aspetti:\n\
          \personale, relazionale e lavorativo." ] }
        , quote { quote: "\
            \I viaggi che portano alle scoperte maggiori non sono \
            \quelli in cui si vedono mondi nuovi, ma quelli in cui \
            \rivediamo mondi conosciuti con occhi diversi.",
          author: "M. Proust" }]
  }
