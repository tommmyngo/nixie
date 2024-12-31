import { exec, monitorFile } from "astal";
import { App, Widget } from "astal/gtk3";

import style from "./scss/style.scss";

import { Bar } from "./widgets/Bar";

monitorFile("./scss", () => {
  const scss = "./scss/style.scss";
  const css = "./css/style.css";
  exec(`sass ${scss} ${css}`);
  App.reset_css();
  App.apply_css(css);
});

App.start({
  icons: "./icons",
  css: style,
  requestHandler(request, response) {
    print(request);
    response("Okay");
  },
  main() {
    App.get_monitors().map(Bar);
  },
});
