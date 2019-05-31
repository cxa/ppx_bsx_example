external class_name : string = "welcome" [@@bs.module "./style"]

let make ~name  =
  [%bsx "
  <div className="class_name">
    <img src="[%bs.raw {|require('./logo.png')|}]" />
    <h1>
      "("Hello " ^ name |> React.string)"
    </h1>
    <p>"(React.string {j|你好，世界！|j})"</p>
  </div>
  "]
[@@react.component]

