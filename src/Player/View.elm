module Player.View exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import RemoteData exposing (..)
import Types exposing (..)
import Player.Types exposing (..)

-- view
view : Model -> Html Msg
view model =
    case model.players of
        NotAsked -> text "Initialising."

        Loading -> text "Loading."

        Failure err -> text ("Error: " ++ toString err)

        Success players -> viewPlayers players

viewPlayers : (List Player) -> Html Msg
viewPlayers players =
   div [  ]
           [ table []
               [ thead []
                   [ tr []
                       [ th [] [ text "Id" ]
                       , th [] [ text "Name" ]
                       , th [] [ text "Level" ]
                       ]
                   ]
               , tbody [] (List.map playerRow players)
               ]
           ]

playerRow : Player -> Html Msg
playerRow player =
    tr []
        [ td [] [ text player.id ]
        , td [] [ text player.name ]
        , td [] [ text player.level ]
        , td [] [ button [ onClick (ViewPlayer player.id)]
            [text "View"]
         ]
        ]