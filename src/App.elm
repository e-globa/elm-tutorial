module App exposing (main)

import Html
import State exposing (..)
import View exposing (..)


-- main
--main : Program Never
main =
    Html.program
        { init = State.initState
        , update = State.update
        , view = View.rootView
        , subscriptions = State.subscriptions
        }