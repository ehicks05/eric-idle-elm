module Bulma exposing (hero, stylesheet)

import Html exposing (..)
import Html.Attributes exposing (class)


hero : String -> Html msg
hero title =
    section [ class "hero is-primary" ]
        [ div [ class "hero-body" ]
            [ div [ class "container" ]
                [ h1 [ class "title" ]
                    [ text title
                    ]
                ]
            ]
        ]


stylesheet : Bool -> Html msg
stylesheet isDarkly =
    Html.node "link"
        [ Html.Attributes.rel "stylesheet"
        , Html.Attributes.href (stylesheetAddress isDarkly)
        ]
        []


stylesheetAddress isDarkly =
    if isDarkly then
        "https://jenil.github.io/bulmaswatch/darkly/bulmaswatch.min.css"

    else
        "https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.css"
