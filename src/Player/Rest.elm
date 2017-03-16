module Player.Rest exposing (..)

import Http exposing (..)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Json.Encode as Encode
import RemoteData
import Types exposing (..)
import Player.Types exposing (..)


getPlayers : Cmd Msg
getPlayers =
    Http.get "http://localhost:4000/players" decodePlayers
        |> RemoteData.sendRequest
        |> Cmd.map PlayersResponse

decodePlayers : Decode.Decoder (List Player)
decodePlayers =
    Decode.list playerDecoder

playerDecoder : Decode.Decoder Player
playerDecoder =
    decode Player
        |> required "id" Decode.string
        |> required "name" Decode.string
        |> required "level" Decode.string


getPlayer : String -> Cmd Msg
getPlayer id =
    Http.get ("http://localhost:4000/players/" ++ id) playerDecoder
        |> RemoteData.sendRequest
        |> Cmd.map ViewPlayerInfo