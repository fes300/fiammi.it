module Components.NavbarStyle where

import React.Basic.DOM as R

burger = R.css {
  "display": "inline-block",
  "position": "relative",
  "width": "48px",
  "height": "48px",
  "lineHeight": "48px",
  "cursor": "pointer",
  "color": "#fff",
  "backgroundColor": "transparent",
  "border": "none"
}

burgerCentral = R.css {
  "position": "relative",
  "display": "block",
  "margin": "auto",
  "transition": ".3s all ease",
  "WebkitTransform": "rotate(180deg)",
  "transform": "rotate(180deg)"
}

burgersTopAndBottom = R.css {
  "content": "\"\"",
  "position": "absolute",
  "transition": ".3s all ease",
  "WebkitTransformOrigin": "1.71429px center",
  "MozTransformOrigin": "1.71429px center",
  "MsTransformOrigin": "1.71429px center",
  "transformOrigin": "1.71429px center"
}

burgerBottom = R.css {
  "left": "12px",
  "top": "30px"
}

burgerTop = R.css {
  "left": "12px",
  "top": "14px"
}

allBurgers = R.css {
  "width": "24px",
  "height": "4px",
  "backgroundColor": "#fff",
  "backfaceVisibility": "hidden",
  "borderRadius": "2px"
}

burgerCentralActive = R.css {
  "WebkitTransform": "rotate(360deg)",
  "transform": "rotate(360deg)"
}

burgersTopAndBottomActive = R.css {
  "width": "15px",
  "top": "22px"
}

burgerTopActive = R.css {
  "WebkitTransform": "rotate3d(0, 0, 1, -40deg)",
  "transform": "rotate3d(0, 0, 1, -40deg)"
}

burgerBottomActive = R.css {
  "WebkitTransform": "rotate3d(0, 0, 1, 40deg)",
  "transform": "rotate3d(0, 0, 1, 40deg)"
}

topBurger = R.mergeStyles [allBurgers, burgersTopAndBottom, burgerTop]
topBurgerActive = R.mergeStyles [allBurgers, burgersTopAndBottom, burgerTop, burgersTopAndBottomActive, burgerTopActive]

bottomBurger = R.mergeStyles [allBurgers, burgersTopAndBottom, burgerBottom]
bottomBurgerActive = R.mergeStyles [allBurgers, burgersTopAndBottom, burgerBottom, burgersTopAndBottomActive, burgerBottomActive]

centralBurger = R.mergeStyles [allBurgers, burgerCentral]
centralBurgerActive = R.mergeStyles [allBurgers, burgerCentral, burgerCentralActive]
