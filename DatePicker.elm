module DatePicker
  ( Model, Action
  , init, update, view
  ) where

import Html exposing (..)
import Moment exposing (Moment)

a : String
a = "placeholder module for future content"

---- MODEL ----

type alias Model =
  { visible : Moment
  , selected : Maybe Moment
  }


init : Moment -> Maybe Moment -> Model
init visible selected =
  { visible  = visible
  , selected = selected
  }


---- UPDATE ----

type Action
  = NoOp


update : Action -> Model -> Model
update action model =
  case action of
    NoOp -> model


view : Signal.Address Action -> Model -> Html
view address model =
  div [] [
    text "sample date picker"
  ]


-- INPUTS --
