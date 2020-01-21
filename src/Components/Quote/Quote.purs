module Components.Quote where

import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import React.Basic.DOM.SVG (path, svg)
import Style.Quote (iconStyle, quoteStyle, authorStyle)

type QuoteProps = { quote :: String, author :: String }

quoteComponent :: Component QuoteProps
quoteComponent = createComponent "Quote"

quote :: QuoteProps -> JSX
quote = makeStateless quoteComponent \props ->
  R.div { children: [svg { style: iconStyle
      , fill: "#cbcbcb"
      , width: "35"
      , height: "32"
      , viewBox: "0 0 35 32"
      , children: [ path { d: "m 0.11181235,29.707834 c 0,-0.825 0.640474,-1.5 1.42327505,-1.5 2.461751,0 7.401382,-4.925183 8.091659,-8.067992 0.8021826,-3.652316 -0.522229,-5.483467 -4.548415,-6.288704 -5.58846405,-1.117693 -6.539632,-8.9112291 -1.491282,-12.2190351 3.23497,-2.11963402 8.0730726,-1.04326802 10.2509546,2.2806 3.775728,5.76249 0.919974,18.7645821 -5.3258986,24.2485321 -3.695924,3.245064 -8.40029305,4.111197 -8.40029305,1.546599 z m 18.99999965,0 c 0,-0.825 0.72,-1.5 1.6,-1.5 2.532916,0 8.4,-6.480023 8.4,-9.277555 0,-2.825873 -1.363754,-4.175899 -5.123411,-5.071838 -3.486123,-0.830755 -5.623911,-5.7149991 -4.031302,-9.2103941 2.530028,-5.55280697 9.840678,-5.64341401 13.181994,-0.163375 3.742162,6.1374581 1.796609,15.7845261 -4.5109,22.3674081 -4.313043,4.50134 -9.516381,6.062801 -9.516381,2.855754 z" } ] }
    , R.div { style: quoteStyle
      ,children: [ R.text props.quote ] }
    , R.div { style: authorStyle
      ,children: [ R.text props.author ] } ] }

