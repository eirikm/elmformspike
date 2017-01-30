module App exposing (..)

import Field exposing (Field, updateModelUsingLenses)
import Html exposing (Html, div, h1, input, text)
import Html.Attributes exposing (value)
import Html.Events exposing (onInput)
import Model exposing (Model, Msg(NoOp, UpdateMonocleField), monocleFormLens)
import MonocleForm exposing (MonocleForm, MonocleFormLenses)


init : String -> ( Model, Cmd Msg )
init path =
    ( { monocleForm = MonocleForm.initForm
      , monocleFormLenses = MonocleForm.initLenses
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateMonocleField fieldLens value ->
            model |> Field.updateModelUsingLenses monocleFormLens fieldLens value

        NoOp ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "MonocleForm" ]
        , viewMonocleForm model
        ]


viewMonocleForm : Model -> Html Msg
viewMonocleForm model =
    div []
        [ model.monocleForm.name
            |> Field.label
            |> text
        , input
            [ model.monocleForm.name
                |> Field.formValue
                |> value
            , onInput
                (UpdateMonocleField
                    model.monocleFormLenses.nameLens
                )
            ]
            []
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
