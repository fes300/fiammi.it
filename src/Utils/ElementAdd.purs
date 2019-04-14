module Web.DOM.Element.Add (getBoundingClientRect) where

import Effect (Effect)
import Web.DOM.Internal.Types (Element)

foreign import getBoundingClientRect :: Element -> Effect Number
