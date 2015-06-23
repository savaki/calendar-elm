module Main where

import Html exposing (..)
import Page.Calendar as CalendarPage
import Moment exposing (Moment)


---- MODEL ----


type alias Model =
  { calendar : CalendarPage.Model
  }


emptyModel : Model
emptyModel =
  { calendar = CalendarPage.init Moment.epocStart
  }


init : Moment -> Model
init now =
  { calendar = CalendarPage.init now
  }


---- UPDATE ----


type Action
  = NoOp
  | Calendar CalendarPage.Action


update : Action -> Model -> Model
update action model =
  case action of
    NoOp -> model


view : Signal.Address Action -> Model -> Html
view address model =
  div [] [
    CalendarPage.view (Signal.forwardTo address Calendar) model.calendar
    , text "hello"
  ]


---- INPUTS ----


main : Signal Html
main =
  Signal.map (view actions.address) model


model : Signal Model
model =
  Signal.foldp update initialModel actions.signal


initialModel : Model
initialModel =
  let n = now
  in case n of
    Just value -> init (Moment.unix value)
    Nothing -> emptyModel


actions : Signal.Mailbox Action
actions =
  Signal.mailbox NoOp


port now : Maybe Int
