module Field exposing (..)

import Monocle.Lens exposing (Lens)


type Field
    = Field
        { label : String
        , formValue : String
        }


newField : String -> Field
newField label =
    Field { label = label, formValue = "" }


label : Field -> String
label (Field { label }) =
    label


formValue : Field -> String
formValue (Field { formValue }) =
    formValue


updateFormValue : String -> Field -> Field
updateFormValue newValue (Field field) =
    Field { field | formValue = newValue }

formValueLens : Lens Field String
formValueLens =
    let
        get f =
            formValue f

        set s f =
            updateFormValue s f
    in
        Lens get set

updateModelUsingLenses : Lens model form -> Lens form Field -> String -> model -> ( model, Cmd msg )
updateModelUsingLenses formLens fieldLens value model =
    let
        composedLens =
            Monocle.Lens.compose formLens <|
                Monocle.Lens.compose fieldLens formValueLens
    in
        (composedLens.set value model) ! []

