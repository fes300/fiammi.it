module Components.FAQ where

import Prelude

import Effect (Effect)
import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM as R
import React.Basic.Events (handler_)
import Style.FAQ as S
import Utils (getElementSize)

faqComponent :: Component Unit
faqComponent = createComponent "faq"

data AccordionElement = How | HowLong | Differences

toString :: AccordionElement -> String
toString a = case a of
  How -> "how"
  HowLong -> "howLong"
  Differences -> "differences"

minus :: JSX
minus = R.div { style: S.iconMinusStyle }

plus :: JSX
plus = R.div { children: [R.div { style: S.iconPlusH }
  , R.div { style: S.iconPlusV }] }

accordionElement :: { element :: AccordionElement
  , selected :: AccordionElement
  , onSelect :: String -> Effect Unit
  , title :: String
  , bodyactiveSize :: String
  , body :: String } -> JSX
accordionElement { element, selected, onSelect, title, body, bodyactiveSize } =
  R.div { children: [el false
    , el true] }
  where
    el :: Boolean -> JSX
    el hidden = R.div { onClick: handler_ _onClick
      , style: R.mergeStyles $ [S.accordionElementStyle accordionHeight] <> (if hidden then [S.hiddenStyle] else [])
      , id: if hidden then toString element <> "_hidden" else toString element
      , children: [R.div { style: if isSelected then selctedTitleStyle else S.accordionElementTitleStyle
          , children: [R.text title, if isSelected then minus else plus ] }
        , R.div { style: if isSelected then selctedBodyStyle else S.accordionElementBodyStyle hidden
          , children: [R.text body] }] }
        where
          _onClick = if isSelected then pure unit else
            do
              size <- getElementSize $ toString element <> "_hidden"
              onSelect $ (show (size)) <> "px"
          isSelected = eq (toString element) (toString selected)
          accordionHeight = if isSelected then bodyactiveSize else "auto"
          selctedTitleStyle = R.mergeStyles [S.accordionElementTitleStyle, S.activeTitle]
          selctedBodyStyle = R.mergeStyles [S.accordionElementBodyStyle isSelected, S.activeBody]

faq :: Unit -> JSX
faq = make faqComponent { initialState: { el: How, activeSize: "auto" }, render }
  where
    render self = R.div {style: S.accordionStyle
      , children: [accordionElement { selected: self.state.el
          , onSelect: \activeSize -> self.setState \s -> s { el = How, activeSize = activeSize }
          , title: "come funziona la psicoterapia?"
          , body: "La terapia della parola è un lavoro congiunto in cui il terapeuta, grazie alle proprie conoscenze \
            \ed esperienze, aiuta il paziente a stare meglio, a sviluppare nuove consapevolezze rispetto a sé e alla propria vita e a \
            \trovare soluzioni più funzionali."
          , bodyactiveSize: self.state.activeSize
          , element: How }
        , accordionElement { selected: self.state.el
          , onSelect: \activeSize -> self.setState \s -> s { el = HowLong, activeSize = activeSize }
          , title: "quanto dura in media un percorso psicoterapico?"
          , body: "La psicoterapia non ha una durata fissa o prestabilita.\
            \ L’approccio breve focale integrato ha come finalità quella di raggiungere un cambiamento nel minor tempo possibile: si incentra \
            \ infatti soprattutto sul presente e sul futuro e procede per fasi, ognuna con un obiettivo esplicitato \
            \ e condiviso, intervallate da momenti in cui si fa insieme un bilancio su cosa si è raggiunto e su cosa si può ancora fare."
          , bodyactiveSize: self.state.activeSize
          , element: HowLong }
        , accordionElement { selected: self.state.el
          , onSelect: \activeSize -> self.setState \s -> s { el = Differences, activeSize = activeSize }
          , title: "che differenze ci sono tra psicologo, psichiatra e psicoterapeuta?"
          , body: "Lo psicologo  - iscritto all’Albo sezione A - si è formato tramite un percorso universitario \
            \ quinquennale, seguito da un anno di tirocinio e poi dall’esame di stato. Avvalendosi di specifici\
            \ strumenti e tecniche mira al raggiungimento del benessere di individui, gruppi e comunità.\
            \ Lo psichiatra è un medico specializzato in psichiatria che si occupa prevalentemente della terapia farmacologica per la cura dei disturbi psichici. \
            \ Lo psicoterapeuta è un medico o uno psicologo che ha completato la propria specializzazione con un corso post-universitario quadriennale e un tirocinio pratico,\
            \ sempre della durata di quattro anni, che lo formano in percorsi specialistici di trattamento e cura. In base all’orientamento teorico della\
            \ scuola di psicoterapia varia la tipologia di formazione che può essere ad esempio psicoanalitica, sistemica, cognitivo-comportamentale o integrata. "
          , bodyactiveSize: self.state.activeSize
          , element: Differences }] }
