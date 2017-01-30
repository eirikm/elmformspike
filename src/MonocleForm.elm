module MonocleForm exposing (..)

import Monocle.Lens exposing (Lens)
import Field exposing (Field, formValueLens)


type alias MonocleForm =
    { name : Field
    }


initForm : MonocleForm
initForm =
    { name = Field.newField "name"
    }


type alias MonocleFormLenses =
    { nameLens : Lens MonocleForm Field }


initLenses : MonocleFormLenses
initLenses =
    { nameLens =
        let
            get a =
                a.name

            set b a =
                { a | name = b }
        in
            Lens get set
    }

