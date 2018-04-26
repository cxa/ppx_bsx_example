external class_name : string = "welcome" [@@bs.module "./style"]

let comp = ReasonReact.statelessComponent "Welcome"

let make ~name _ =
  { comp with
    render =
      (fun _ ->
         [%bsx "
         <div className="class_name">
           <img src="[%bs.raw {|require('./logo.png')|}]" />
           <h1>
             "("Hello " ^ name |> ReasonReact.string)"
          </h1>
          <p>"{|你好，世界！|}"</p>
         </div>
        "]
      )
  };
