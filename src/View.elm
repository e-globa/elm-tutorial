module View exposing (..)


import Html exposing (..)
import Types exposing (..)
import Player.View

-- rootView
rootView : Model -> Html Msg
rootView model =
    div []
       [ h1 []
        [text "Hello"]
        , Player.View.view model
       ]

