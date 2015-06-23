module Page.Edit
  ( Action, Model, init, view, update, emptyModel
  ) where


import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events as Events exposing (on, targetValue)
import Moment exposing (Moment)


---- MODEL ----


type alias Model =
  { start       : Moment
  , end         : Moment
  , title       : String
  , description : String
  , location    : String
  }


emptyModel : Model
emptyModel =
  { start       = Moment.epocStart
  , end         = Moment.epocStart
  , title       = ""
  , description = ""
  , location    = ""
  }


init : Moment -> Moment -> String -> String -> String -> Model
init start end title description location =
  { start       = start
  , end         = end
  , title       = title
  , description = description
  , location    = location
  }


---- UPDATE ----


type Action
  = NoOp
  | UpdateTitle String
  | UpdateDescription String
  | UpdateLocation String


update : Action -> Model -> Model
update action model =
  case action of
    NoOp                  -> model
    UpdateTitle str       -> { model | title <- str }
    UpdateDescription str -> { model | description <- str }
    UpdateLocation str    -> { model | location <- str }


view : Signal.Address Action -> Model -> Html
view address model =
  div [] [
    inputText "title" model.title UpdateTitle
    , inputText "description" model.description UpdateDescription
    , inputText "location" model.location UpdateLocation
  ]


---- STYLE ----


inputStyle : Attribute
inputStyle =
  style
    [ ("font-size", "20px")
    ]


inputText : String -> String -> Action -> Html
inputText p v act =
    input [ placeholder p
          , value v
          , on "input" targetValue (Signal.message address << act)
          , inputStyle
          ]
          []
