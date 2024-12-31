import { App, Astal, Gtk, Gdk } from "astal/gtk3";

import { Separator } from "./UI";
import Workspaces from "./Workspaces";
import Wifi from "./Wifi";
import Time from "./Time";

const marginForWideMonitor = 120;

export function Bar(monitor: Gdk.Monitor) {
  const isWide = monitor.widthMm > 350;
  return (
    <window
      name="bar"
      application={App}
      gdkmonitor={monitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.LEFT |
        Astal.WindowAnchor.RIGHT
      }
      marginLeft={isWide ? marginForWideMonitor : 0}
      marginRight={isWide ? marginForWideMonitor : 0}
    >
      <centerbox>
        <box halign={Gtk.Align.START}>
          <button>
            <icon icon="nix" />
          </button>
          <Separator />
          <button>{monitor.widthMm}</button>
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
