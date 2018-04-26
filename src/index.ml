let () =
  ReactDOMRe.renderToElementWithId
    [%bsx "<Welcome name='ReasonML' />"]
    "root";

  [%raw {|
    (() => {
      if (!module.hot) return;
      module.hot.accept("./welcome.bs", () => {
        const next = require("./welcome.bs");
        // tips: you can copy from lib/js/index.js
        ReactDOMRe.renderToElementWithId(
          ReasonReact.element(0, 0, next.make("ReasonML", [])),
          "root"
        );
      });
    })()
  |}]
