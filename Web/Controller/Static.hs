module Web.Controller.Static where
import Web.Controller.Prelude
import Web.View.Static.Welcome

sampleJson :: Value
sampleJson = object
    [ "message" .= ("Hello World" :: Text)
    , "numbers" .= ([1, 2, 3, 4, 5] :: [Int])
    ]

instance Controller StaticController where
    action WelcomeAction = renderJson sampleJson
