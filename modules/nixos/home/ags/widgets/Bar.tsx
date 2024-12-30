import { App, Astal, Gtk } from "astal/gtk3";

import { Separator } from "./UI";
import Workspaces from "./Workspaces";
import Wifi from "./Wifi";
import Time from "./Time";

const margin = 120;

export function Bar() {
  // TODO: calc margin based on Monitor width - laptop and lower should be full width
  return (
    <window
      name="bar"
      application={App}
      monitor={0}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.LEFT |
        Astal.WindowAnchor.RIGHT
      }
      marginLeft={margin}
      marginRight={margin}
    >
      <centerbox>
        <box halign={Gtk.Align.START}>
          <button>
            <icon icon="nix" />
          </button>
          <Separator />
          <button>Title</button>
        </box>
        <box>
          <Workspaces />
        </box>
        <box halign={Gtk.Align.END}>
          <Wifi />
          <Separator />
          <Time />
        </box>
      </centerbox>
    </window>
  );
}
