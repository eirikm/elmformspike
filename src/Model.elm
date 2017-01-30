module Model exposing (..)

import Field exposing (Field)
import Monocle.Lens exposing (Lens)
import MonocleForm exposing (MonocleForm, MonocleFormLenses)

type alias Model =
    { monocleForm : MonocleForm
    , monocleFormLenses : MonocleFormLenses
    }

type Msg
    = NoOp
    | UpdateMonocleField (Lens MonocleForm Field) String


monocleFormLens : Lens Model MonocleForm
monocleFormLens =
    let
        get a =
            a.monocleForm

        set mf m =
            { m | monocleForm = mf }
    in
        Lens get set
