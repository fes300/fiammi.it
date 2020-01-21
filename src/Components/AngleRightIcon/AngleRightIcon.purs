module Components.AngleRight where

import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM.SVG (path, svg)

type QuoteProps = { color :: String, height :: String, width :: String }

angleRightComponent :: Component QuoteProps
angleRightComponent = createComponent "AngleRight"

angleRight :: QuoteProps -> JSX
angleRight = makeStateless angleRightComponent \props ->
  svg { fill: props.color
      , width: props.width
      , height: props.height
      , viewBox: "0 0 284.935 284.936"
      , children: [ path { d: "M222.701 135.9L89.652 2.857C87.748.955 85.557 0 83.084 0c-2.474 0-4.664.955-6.567 2.857L62.244 17.133c-1.906 1.903-2.855 4.089-2.855 6.567 0 2.478.949 4.664 2.855 6.567l112.204 112.204L62.244 254.677c-1.906 1.903-2.855 4.093-2.855 6.564 0 2.477.949 4.667 2.855 6.57l14.274 14.271c1.903 1.905 4.093 2.854 6.567 2.854 2.473 0 4.663-.951 6.567-2.854l133.042-133.044c1.902-1.902 2.854-4.093 2.854-6.567s-.945-4.664-2.847-6.571z" } ] }

