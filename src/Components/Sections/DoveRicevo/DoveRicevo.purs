module Components.DoveRicevo where

import Prelude

import Components.Divider (divider)
import Constants (style)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import Style.DoveRicevo (image, mezzoStyle, trattaStyle)

comeLavoroComponent :: Component Unit
comeLavoroComponent = createComponent "doveRicevo"

tratta :: { mezzo :: String, tragitto :: String } -> JSX
tratta x = R.div {style: trattaStyle
  ,children: [R.div { style: mezzoStyle
      , children: [R.text x.mezzo] }
    , R.text ":"
    , R.div { style: R.css { marginLeft: "5px" }
      , children: [R.text x.tragitto] }] }

doveRicevo :: Unit -> JSX
doveRicevo = makeStateless comeLavoroComponent \props ->
  R.div {
    children: [R.h1 { style: style.title
        ,children: [ R.text "Dove Ricevo"
          , divider ]}
      , R.div { style: image }
      , R.div { children: [ R.text "Il mio studio si trova in via Trebbia 33." ] }
      , R.div { style: R.mergeStyles [style.subtitle, R.css { marginTop: "20px" }]
        , children: [ R.text "Come raggiungere lo studio:" ] }
      , tratta { mezzo: "Metro", tragitto: "M3 (linea gialla) fermata P.ta Romana" }
      , tratta { mezzo: "Tram", tragitto: "Nº 9, fermata V.le Sabotino" }
      , tratta { mezzo: "Autobus", tragitto: "Nº 91, fermata P.za Trento" } ] }
