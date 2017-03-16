module Types exposing (..)

import RemoteData exposing (..)
import Player.Types exposing (..)

-- model
type alias Model =
    { players : WebData (List Player)
    , currentPlayer : WebData Player
    }

-- init
initModel : (Model)
initModel =
   ( { players = Loading
   , currentPlayer = Loading
   }
   )

type Route =
    Home
    | About
    | NotFound


-- Msg
type Msg =
    NoOp
    | PlayersResponse (WebData (List Player))
    | ViewPlayer String
    | ViewPlayerInfo (WebData Player)