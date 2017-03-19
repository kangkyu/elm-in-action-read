module PhotoGroove exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


urlPrefix =
    "http://elm-in-action.com/"


viewThumbnail selectedUrl thumbnail =
    if selectedUrl == thumbnail.url then
        img
            [ src (urlPrefix ++ thumbnail.url)
            , class "selected"
            ]
            []
    else
        img [ src (urlPrefix ++ thumbnail.url) ] []


view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
        , div [ id "thumbnails" ]
            (List.map (viewThumbnail model.selectedUrl) model.photos)
        ]


initialModel =
    { photos =
        [ { url = "1.jpeg" }
        , { url = "2.jpeg" }
        , { url = "3.jpeg" }
        ]
    , selectedUrl =
        "1.jpeg"
        -- select the first photo by default
    }


main =
    view initialModel
