module Components.Home where

import Prelude

import Constants (style)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import Style.Home (imageContainer)

homeComponent :: Component Unit
homeComponent = createComponent "Home"

home :: Unit -> JSX
home = makeStateless homeComponent \props ->
  R.div {
    children: [R.div { style: imageContainer
      , children: [ R.img { src: "../../src/assets/images/homepage-main.jpeg", alt: "aiuto psicologo", height: "200px" }]}
      ,R.h1 { style: style.title
        ,children: [ R.text "Quando è utile rivolgersi a uno psicoterapeuta?" ] }]
  }
