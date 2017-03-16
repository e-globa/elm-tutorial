module State exposing (..)

import Types exposing (..)
import Player.Rest exposing (..)

-- update
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        PlayersResponse response ->
            ( {model | players = response }
            , Cmd.none
            )
        ViewPlayer id ->
            (model
            , getPlayer id
            )

        ViewPlayerInfo response ->
            ( {model | currentPlayer = response}
            , Cmd.none
            )
        _ -> (model, Cmd.none)


--init
initState : ( Model, Cmd Msg )
initState =
--    (initModel, getPlayers)
    (initModel, getPlayers)


-- subscriptions
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
