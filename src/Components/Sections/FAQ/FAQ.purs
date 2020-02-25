module Components.FAQ where

import Prelude

import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM as R
import React.Basic.Events (EventHandler, handler_)
import Style.FAQ (iconMinusStyle, iconPlusH, iconPlusV, activeTitle, activeBody, accordionElementStyle, accordionElementBodyStyle, accordionElementTitleStyle, accordionStyle)

faqComponent :: Component Unit
faqComponent = createComponent "faq"

data AccordionElement = How | HowLong | Differences

toString :: AccordionElement -> String
toString a = case a of
  How -> "how"
  HowLong -> "howLong"
  Differences -> "differences"

minus :: JSX
minus = R.div { style: iconMinusStyle }

plus :: JSX
plus = R.div { children: [R.div { style: iconPlusH }
  , R.div { style: iconPlusV }] }

accordionElement :: { element :: AccordionElement
  , selected :: AccordionElement
  , onSelect :: EventHandler
  , title :: String
  , bodySize :: String
  , body :: String } -> JSX
accordionElement { element, selected, onSelect, title, body, bodySize } = R.div { onClick: onSelect
  , style: accordionElementStyle
  , children: [R.div { style: if isSelected then selctedTitleStyle else accordionElementTitleStyle
      , children: [R.text title, if isSelected then minus else plus ] }
    , R.div { style: if isSelected then selctedBodyStyle else accordionElementBodyStyle
      , children: [R.text body] }] }
    where
      isSelected = eq (toString element) (toString selected)
      selctedTitleStyle = R.mergeStyles [accordionElementTitleStyle, activeTitle]
      selctedBodyStyle = R.mergeStyles [accordionElementBodyStyle, activeBody bodySize]

faq :: Unit -> JSX
faq = make faqComponent { initialState: How, render }
  where
    render self = R.div {style: accordionStyle
      , children: [accordionElement { selected: self.state
          , onSelect: handler_ (self.setState \_ -> How)
          , title: "come funziona la psicoterapia?"
          , body: "La terapia della parola è un lavoro congiunto in cui il terapeuta, grazie alle proprie conoscenze \
            \ed esperienze, aiuta il paziente a stare meglio, a sviluppare nuove consapevolezze rispetto a sé e alla propria vita e a \
            \trovare soluzioni più funzionali."
          , bodySize: "120px"
          , element: How }
        , accordionElement { selected: self.state
          , onSelect: handler_ (self.setState \_ -> HowLong)
          , title: "quanto dura in media un percorso psicoterapico?"
          , body: "La psicoterapia non ha una durata fissa o prestabilita.\
            \ L’approccio breve focale integrato ha come finalità quella di raggiungere un cambiamento nel minor tempo possibile: si incentra \
            \ infatti soprattutto sul presente e sul futuro e procede per fasi, ognuna con un obiettivo esplicitato \
            \ e condiviso, intervallate da momenti in cui si fa insieme un bilancio su cosa si è raggiunto e su cosa si può ancora fare."
          , bodySize: "190px"
          , element: HowLong }
        , accordionElement { selected: self.state
          , onSelect: handler_ (self.setState \_ -> Differences)
          , title: "che differenze ci sono tra psicologo, psichiatra e psicoterapeuta?"
          , body: "Lo psicologo  - iscritto all’Albo sezione A - si è formato tramite un percorso universitario \
            \ quinquennale, seguito da un anno di tirocinio e poi dall’esame di stato. Avvalendosi di specifici\
            \ strumenti e tecniche mira al raggiungimento del benessere di individui, gruppi e comunità.\
            \ Lo psichiatra è un medico specializzato in psichiatria che si occupa prevalentemente della terapia farmacologica per la cura dei disturbi psichici. \
            \ Lo psicoterapeuta è un medico o uno psicologo che ha completato la propria specializzazione con un corso post-universitario quadriennale e un tirocinio pratico,\
            \ sempre della durata di quattro anni, che lo formano in percorsi specialistici di trattamento e cura. In base all’orientamento teorico della\
            \ scuola di psicoterapia varia la tipologia di formazione che può essere ad esempio psicoanalitica, sistemica, cognitivo-comportamentale o integrata. "
          , bodySize: "420px"
          , element: Differences }] }
