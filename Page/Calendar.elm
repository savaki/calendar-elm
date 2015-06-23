module Page.Calendar
  ( Action, Model, view, update, init
  ) where

import Html exposing (..)
import DatePicker
import Moment exposing (Moment)
import DatePicker exposing (Model, Action(..), view, update)

---- MODEL ----

type alias Model =
  { now : Moment
  }


emptyModel : Model
emptyModel =
  { now = Moment.epocStart }


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


