module Components.Divider where

import React.Basic (JSX)
import React.Basic.DOM as R
import Style.Divider (dividerStyle)

divider :: JSX
divider =
  R.div {
    style: dividerStyle
  }
