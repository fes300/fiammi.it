module Components.Footer where

import Prelude

import Components.Button (button)
import Components.Input (input)
import Components.Textarea (textarea)
import Data.Argonaut.Core as Json
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.String.NonEmpty (NonEmptyString, fromString, toString)
import Effect (Effect)
import Effect.Aff as Aff
import Milkis as M
import Milkis.Impl.Window (windowFetch)
import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM as R
import Style.Footer as S

fetch :: M.Fetch
fetch = M.fetch windowFetch

footerComponent :: Component Unit
footerComponent = createComponent "Footer"

iconRow :: { rightSide :: JSX, className :: String } -> JSX
iconRow { rightSide: t, className: c } = R.div { style: S.iconRow
  , children: [R.div { className: c, style: S.icon }, t] }

type CallPayload = { name :: String
  , _replyto :: String
  , message :: String }

footer :: Unit -> JSX
footer = make footerComponent { initialState, render }
  where
    initialState :: { name :: Maybe NonEmptyString
      , email :: Maybe NonEmptyString
      , message :: Maybe NonEmptyString
      , successMessage :: Maybe NonEmptyString
      , error :: Maybe NonEmptyString }
    initialState = { name: Nothing
      , email: Nothing
      , message: Nothing
      , error: Nothing
      , successMessage: Nothing }

    render self =
      let
        onChangeName :: Maybe NonEmptyString -> Effect Unit
        onChangeName n = self.setState (\s -> s { name = n })
        onChangeEmail :: Maybe NonEmptyString -> Effect Unit
        onChangeEmail n = self.setState (\s -> s { email = n })
        onChangeMessage :: Maybe NonEmptyString -> Effect Unit
        onChangeMessage n = self.setState (\s -> s { message = n })
        sendForm :: Unit -> Effect Unit
        sendForm = \_ -> case body of
          Nothing    -> self.setState (\s -> s { error = fromString "assicurati di aver compilato tutti i campi!" })
          Just _body -> Aff.runAff_  case _ of
            Left _ -> self.setState (\s -> s { error = fromString "si è verificato un errore nell'invio dei tuoi dati, riprova! :)" })
            Right r -> case r of
              Left _ -> self.setState (\s -> s { error = fromString "si è verificato un errore nell'invio dei tuoi dati, riprova! :)" })
              Right _ -> self.setState (\_ -> initialState { error = Nothing, successMessage = fromString "Il tuo messaggio è stato correttamente inviato :)" })
            $ Aff.attempt $ postAff $ Json.stringify $ Json.fromString $ show _body
        postAff :: String -> Aff.Aff M.Response
        postAff = \_body -> fetch (M.URL "https://formcarry.com/s/AT5pbHQiPY-") { method: M.postMethod
          , headers: M.makeHeaders { "Content-Type": "application/json"
            , "accept": "application/json" }
          , body: "{\"_replyto\":\"prova\",\"message\":\"pro\",\"name\":\"va\"}" }
        body :: Maybe { name :: String, _replyto :: String, message :: String }
        body = (\name -> \_replyto -> \message -> { name, _replyto, message }) <$> (map toString self.state.name)
          <*> (map toString self.state.email)
          <*> (map toString self.state.message)
      in
        R.div {id: "#contact-form"
          , style: S.footerStyle
          , children: [ R.h6 { style: S.title, children: [R.text "Su di me"] }
            , R.div { children: [R.text "Appassionata e \"curiosa\", termine inteso nella sua accezione \
                \ etimologica di \"prendersi cura\": della mia professione, \
                \di chi si rivolge a me e del mio desiderio di conoscenza."] }
            , R.div { style: S.iconRowWrapper
              , children: [iconRow { className: "fas fa-phone"
                  , rightSide: R.a { href: "callto:00393402341219"
                  , target: "_blank"
                  , style: R.css { color: "white", textDecoration: "none" }
                  , children: [R.text "+39 3402341219"] } }
                , iconRow { className: "fas fa-clock"
                    , rightSide: R.div { style: R.css { color: "white" }
                      , children: [R.text "Lunedì–Sabato: 7:30–20:30"] } }
                , iconRow { className: "fas fa-map-marker-alt"
                  , rightSide: R.a { href: "https://g.page/FiammettaFacchinettiPsicologa?share"
                    , target: "_blank"
                    , style: R.css { color: "white", textDecoration: "none" }
                    , children: [R.text "Via Trebbia 33, 20135 Milano"] } }]}
            , R.h6 { style: S.title, children: [R.text "Scrivimi"] }
            , input { value: self.state.name
              , style: S.inputStyle
              , onChange: onChangeName
              , placeholder: "il tuo nome"
              , required: false }
            , input { value: self.state.email
              , style: S.inputStyle
              , onChange: onChangeEmail
              , placeholder: "la tua email"
              , required: true }
            , textarea { value: self.state.message
              , style: S.inputStyle
              , onChange: onChangeMessage
              , placeholder: "il tuo messaggio"
              , required: true }
            , case self.state.error of
              Nothing -> R.div {}
              Just e -> R.div { style: S.error, children: [R.text $ toString e] }
            , case self.state.successMessage of
              Nothing -> R.div {}
              Just s -> R.div { style: S.success, children: [R.text $ toString s] }
            , R.div { style: R.css { margin: "0 auto" }
              , children: [ button { label: "invia"
                , disabled: false
                , onClick: sendForm }] }
            , R.div { style: R.css { margin: "10px 0" }
              , children: [R.text "Cliccando sul tasto \"invia\", \
                \autorizzi al trattamento dei tuoi dati ai sensi dell’art. 13 del D.lgs 196/03"] }]}
