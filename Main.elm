module Main where

import Html exposing (..)
import Page.Calendar
import Page.Edit
import Moment exposing (Moment)


---- MODEL ----


type alias Model =
  { calendar : Page.Calendar.Model
  , edit     : Page.Edit.Model
  }


emptyModel : Model
emptyModel =
  { calendar = Page.Calendar.emptyModel
  , edit     = Page.Edit.emptyModel
  }


init : Moment -> Model
init now =
  let title       = ""
      description = ""
      location    = ""
  in
    { calendar = Page.Calendar.init now
    , edit     = Page.Edit.init now now title description location
    }


---- UPDATE ----


type Action
  = NoOp
  | Calendar Page.Calendar.Action
  | Edit Page.Edit.Action


update : Action -> Model -> Model
update action model =
  case action of
    NoOp         -> model
    Calendar act -> { model | calendar <- Page.Calendar.update act model.calendar }
    Edit act     -> { model | edit <- Page.Edit.update act model.edit }


view : Signal.Address Action -> Model -> Html
view address model =
  div [] [
    Page.Calendar.view (Signal.forwardTo address Calendar) model.calendar
    , Page.Edit.view (Signal.forwardTo address Edit) model.edit
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
