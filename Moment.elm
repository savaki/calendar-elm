module Moment
  ( Moment
  , unix
  , Unit(..)
  , get, millisecond, second, minute, hour, dateOfMonth, dayOfWeek, month, year
  , set, setMillisecond, setSecond, setMinute, setHour, setDateOfMonth, setDayOfWeek, setMonth, setYear
  , midnight, lastDateOfMonth
  , epocStart
  , add
  , toString
  ) where

import Native.Moment

---- MODEL ----

type Moment = Moment

type Unit = Millisecond
  | Second
  | Minute
  | Hour
  | DateOfMonth
  | DayOfWeek
  | Month
  | Year

epocStart : Moment
epocStart =
  unix 0

---- FACTORY ----

unix : Int -> Moment
unix =
  Native.Moment.unix

---- GET ----

get : Unit -> Moment -> Int
get unit =
  case unit of
    Millisecond -> Native.Moment.millisecond
    Second      -> Native.Moment.second
    Minute      -> Native.Moment.minute
    Hour        -> Native.Moment.hour
    DateOfMonth -> Native.Moment.dateOfMonth
    DayOfWeek   -> Native.Moment.dayOfWeek
    Month       -> Native.Moment.month
    Year        -> Native.Moment.year


millisecond : Moment -> Int
millisecond =
  get Millisecond


second : Moment -> Int
second =
  get Second


minute : Moment -> Int
minute =
  get Minute


hour : Moment -> Int
hour =
  get Hour


dateOfMonth : Moment -> Int
dateOfMonth =
  get DateOfMonth


dayOfWeek : Moment -> Int
dayOfWeek =
  get DayOfWeek


month : Moment -> Int
month =
  get Month


year : Moment -> Int
year =
  get Year


---- SET ----


set : Unit -> Int -> Moment -> Moment
set unit value moment =
  case unit of
    Millisecond -> Native.Moment.setMillisecond (value, moment)
    Second      -> Native.Moment.setSecond (value, moment)
    Minute      -> Native.Moment.setMinute (value, moment)
    Hour        -> Native.Moment.setHour (value, moment)
    DateOfMonth -> Native.Moment.setDateOfMonth (value, moment)
    DayOfWeek   -> Native.Moment.setDayOfWeek (value, moment)
    Month       -> Native.Moment.setMonth (value, moment)
    Year        -> Native.Moment.setYear (value, moment)


setMillisecond : Int -> Moment -> Moment
setMillisecond =
  set Millisecond


setSecond : Int -> Moment -> Moment
setSecond =
  set Second


setMinute : Int -> Moment -> Moment
setMinute =
  set Minute


setHour : Int -> Moment -> Moment
setHour =
  set Hour


setDateOfMonth : Int -> Moment -> Moment
setDateOfMonth =
  set DateOfMonth


setDayOfWeek : Int -> Moment -> Moment
setDayOfWeek =
  set DayOfWeek


setMonth : Int -> Moment -> Moment
setMonth =
  set Month


setYear : Int -> Moment -> Moment
setYear =
  set Year


midnight : Moment -> Moment
midnight moment =
  let y = year moment
      m = month moment
      d = dateOfMonth moment
  in Native.Moment.create (y, m, d, 0, 0, 0, 0)


lastDateOfMonth : Moment -> Moment
lastDateOfMonth moment =
  add 1 Month moment
  |> setDateOfMonth 1
  |> subtract 1 DateOfMonth


---- DELTA ----

add : Int -> Unit -> Moment -> Moment
add value unit moment =
  let current = get unit moment
      updated = current + value
  in set unit updated moment


subtract : Int -> Unit -> Moment -> Moment
subtract value unit moment =
  let current = get unit moment
      updated = current - value
  in set unit updated moment


---- DISPLAY ----

toString : Moment -> String
toString =
  Native.Moment.toString






