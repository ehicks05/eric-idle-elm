module Game exposing (..)

import Dict exposing (Dict)
import Util exposing (..)
import Laborer exposing (..)
import Building exposing (..)
import Tech exposing (..)
import Resource exposing (..)

-- GameData


--type alias GameData =
--    { resources : List Resource.Resource
--    , laborers : List Laborer.Laborer
--    , buildings : List Building.Building
--    , technologies : List Tech.Tech
--    , prereqs : List PreReq
--    }
--
--
--getGameData : GameData
--getGameData =
--    GameData Resource.resources Laborer.laborers Building.buildings Tech.techs preReqs


preReqs =
    [ unlockHuts
    , unlockVillagers
    , unlockWoodConstruction
    , unlockLevelOneTech
    , unlockFarming
    , unlockStoneConstruction
    , unlockWheel
    , unlockSchools
    , unlockLibraries
    , unlockHunting
    , unlockBuilders
    ]


updatePreReqs : List PreReq -> List PreReq
updatePreReqs list =
    List.map updatePreReq (List.filter (\item -> item.status == Locked) list)


updatePreReq : PreReq -> PreReq
updatePreReq preReq =
    case preReq.name of
        "unlockHuts" ->
            if food.amount >= 1 then
                { preReq | status = Unlocked }

            else
                preReq

        "unlockVillagers" ->
            if villagers.amount >= 1 then
                { preReq | status = Unlocked }

            else
                preReq

        "unlockWoodConstruction" ->
            if woodConstruction.discovered then
                { preReq | status = Unlocked }

            else
                preReq

        "unlockLevelOneTech" ->
            if research.amount >= 1 then
                { preReq | status = Unlocked }

            else
                preReq

        "unlockFarming" ->
            if farming.discovered then
                { preReq | status = Unlocked }

            else
                preReq

        "unlockStoneConstruction" ->
            if stoneConstruction.discovered then
                { preReq | status = Unlocked }

            else
                preReq

        "unlockWheel" ->
            if wheel.discovered then
                { preReq | status = Unlocked }

            else
                preReq

        "unlockSchools" ->
            if villagers.amount >= 30 then
                { preReq | status = Unlocked }

            else
                preReq

        "unlockLibraries" ->
            if villagers.amount >= 50 then
                { preReq | status = Unlocked }

            else
                preReq

        "unlockHunting" ->
            if villagers.amount >= 50 then
                { preReq | status = Unlocked }

            else
                preReq

        "unlockBuilders" ->
            if villagers.amount >= 50 then
                { preReq | status = Unlocked }

            else
                preReq

        _ ->
            preReq


type alias PreReq =
    { name : String

    -- mutable
    , status : LockStatus
    }


noPreReq =
    PreReq "noPreReq" Unlocked


unlockHuts =
    PreReq "unlockHuts" Locked


unlockVillagers =
    PreReq "unlockVillagers" Locked


unlockWoodConstruction =
    PreReq "unlockWoodConstruction" Locked


unlockLevelOneTech =
    PreReq "unlockLevelOneTech" Locked


unlockFarming =
    PreReq "unlockFarming" Locked


unlockStoneConstruction =
    PreReq "unlockStoneConstruction" Locked


unlockWheel =
    PreReq "unlockWheel" Locked


unlockSchools =
    PreReq "unlockSchools" Locked


unlockLibraries =
    PreReq "unlockLibraries" Locked


unlockHunting =
    PreReq "unlockHunting" Locked


unlockBuilders =
    PreReq "unlockBuilders" Locked
