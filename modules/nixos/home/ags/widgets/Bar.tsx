import { App, Astal, Gtk } from "astal/gtk3";

import Time from "../widgets/Time";
import Workspaces from "../widgets/Workspaces";
import Wifi from "../widgets/Wifi";

const margin = 120;

export function Bar() {
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
      <centerbox className="bar">
        <box halign={Gtk.Align.START}>
          <button>
            <icon icon="nix" />
          </button>
        </box>
        <box>
          <Workspaces />
        </box>
        <box halign={Gtk.Align.END}>
          <Wifi />
          <Time />
        </box>
      </centerbox>
    </window>
  );
}
