let () =
  ReactDOMRe.renderToElementWithId
    [%bsx "<Welcome name='ReasonML' />"]
    "root";

  [%bs.raw {|
    (() => {
      if (!module.hot) return;
      module.hot.accept("./welcome.ml", () => {
        const next = require("./welcome.ml");
        // tips: you can copy from lib/js/index.js
        ReactDOMRe.renderToElementWithId(
          ReasonReact.element(0, 0, next.make("ReasonML", [])),
          "root"
        );
      });
    })()
|}]
