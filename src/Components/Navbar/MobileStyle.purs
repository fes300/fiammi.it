module Style.MobileNavbar where

import Constants (style)
import React.Basic.DOM as R
import React.Basic.DOM.Internal (CSS)

navbarStyle :: CSS
navbarStyle = R.css {
  position: "fixed",
  backgroundColor: "#343944",
  color: "white",
  height: "56px",
  width: "100%",
  zIndex: 999,
  display: "flex",
  alignItems: "center"
}

burger :: CSS
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

burgerCentral :: CSS
burgerCentral = R.css {
  "position": "relative",
  "display": "block",
  "margin": "auto",
  "transition": ".3s all ease",
  "WebkitTransform": "rotate(180deg)",
  "transform": "rotate(180deg)"
}

burgersTopAndBottom :: CSS
burgersTopAndBottom = R.css {
  "content": "\"\"",
  "position": "absolute",
  "transition": ".3s all ease",
  "WebkitTransformOrigin": "1.71429px center",
  "MozTransformOrigin": "1.71429px center",
  "MsTransformOrigin": "1.71429px center",
  "transformOrigin": "1.71429px center"
}

burgerBottom :: CSS
burgerBottom = R.css {
  "left": "12px",
  "top": "30px"
}

burgerTop :: CSS
burgerTop = R.css {
  "left": "12px",
  "top": "14px"
}

allBurgers :: CSS
allBurgers = R.css {
  "width": "24px",
  "height": "4px",
  "backgroundColor": "#fff",
  "backfaceVisibility": "hidden",
  "borderRadius": "2px"
}

burgerCentralActive :: CSS
burgerCentralActive = R.css {
  "WebkitTransform": "rotate(360deg)",
  "transform": "rotate(360deg)"
}

burgersTopAndBottomActive :: CSS
burgersTopAndBottomActive = R.css {
  "width": "15px",
  "top": "22px"
}

burgerTopActive :: CSS
burgerTopActive = R.css {
  "WebkitTransform": "rotate3d(0, 0, 1, -40deg)",
  "transform": "rotate3d(0, 0, 1, -40deg)"
}

burgerBottomActive :: CSS
burgerBottomActive = R.css {
  "WebkitTransform": "rotate3d(0, 0, 1, 40deg)",
  "transform": "rotate3d(0, 0, 1, 40deg)"
}

menuStyle :: CSS
menuStyle = R.css {
  "position": "fixed",
  "top": "-56px",
  "left": 0,
  "width": "232px",
  "height": "100%",
  "bottom": "-56px",
  "transition": "0.3s all cubic-bezier(0.785, 0.135, 0.15, 0.86)",
  "padding": "112px 0 56px",
  "color": "#fff",
  "backgroundColor": style.bluePalette,
  "zIndex": 15,
  "WebkitTransform": "translateX(-120%)",
  "transform": "translateX(-120%)"
}

menuStyleActive :: CSS
menuStyleActive = R.css {
  "WebkitTransform": "translateX(0)",
  "transform": "translateX(0)"
}

menuLinkStyle :: CSS
menuLinkStyle = R.css {
  "fontSize": "16px",
  "height": "50px",
  "display": "flex",
  "alignItems": "center",
  "paddingLeft": "40px",
  "borderTop": "2px solid"
}

menuLinkActiveStyle :: CSS
menuLinkActiveStyle = R.mergeStyles [
  menuLinkStyle
  , R.css { backgroundColor: style.bluePaletteLight }
]

topBurger :: CSS
topBurger = R.mergeStyles [allBurgers, burgersTopAndBottom, burgerTop]
topBurgerActive :: CSS
topBurgerActive = R.mergeStyles [allBurgers, burgersTopAndBottom, burgerTop, burgersTopAndBottomActive, burgerTopActive]

bottomBurger :: CSS
bottomBurger = R.mergeStyles [allBurgers, burgersTopAndBottom, burgerBottom]
bottomBurgerActive :: CSS
bottomBurgerActive = R.mergeStyles [allBurgers, burgersTopAndBottom, burgerBottom, burgersTopAndBottomActive, burgerBottomActive]

centralBurger :: CSS
centralBurger = R.mergeStyles [allBurgers, burgerCentral]
centralBurgerActive :: CSS
centralBurgerActive = R.mergeStyles [allBurgers, burgerCentral, burgerCentralActive]
