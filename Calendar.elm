module Calendar where

import Html exposing (..)
import DatePicker
import Moment exposing (Moment)

---- MODEL ----

type alias Model =
  { now : Moment
  }


epocStart : Moment
epocStart =
  Moment.unix 0


emptyModel : Model
emptyModel =
  { now = epocStart }


init : Moment -> Model
init now =
  { now = now }


---- UPDATE ----


type Action
  = NoOp


update : Action -> Model -> Model
update action model =
  case action of
    NoOp -> model


view : Signal.Address Action -> Model -> Html
view address model =
  let midnight        = (Moment.midnight model.now)
      tomorrow        = (Moment.add 1 Moment.DateOfMonth midnight)
      sunday          = (Moment.setDayOfWeek 0 midnight)
      lastDateOfMonth = (Moment.lastDateOfMonth midnight)
  in
    div [] [
      text (Moment.toString model.now)
      , Html.div [] []
      , text (Moment.toString tomorrow)
      , Html.div [] []
      , text (Moment.toString midnight)
      , Html.div [] []
      , text (Moment.toString lastDateOfMonth)
      , Html.div [] []
      , text (Moment.toString sunday)
      , Html.div [] []
      , text (toString (Moment.year model.now))
      , Html.div [] []
      , text (toString (Moment.month model.now))
      , Html.div [] []
      , text (toString (Moment.dateOfMonth model.now))
      , Html.div [] []
      , text (toString (Moment.dayOfWeek model.now))
      , Html.div [] []
      , text (toString (Moment.hour model.now))
      , Html.div [] []
      , text (toString (Moment.minute model.now))
      , Html.div [] []
      , text (toString (Moment.second model.now))
      , Html.div [] []
      , text (toString (Moment.millisecond model.now))
    ]


-- INPUTS --


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
