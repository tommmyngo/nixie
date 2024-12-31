import { App, Astal, Gtk, Gdk } from "astal/gtk3";

import { Separator } from "./UI";
import Workspaces from "./Workspaces";
import Wifi from "./Wifi";
import Time from "./Time";
import AstalHyprland from "gi://AstalHyprland";
import { bind } from "astal";

const marginForWideMonitor = 120;

export function Bar(monitor: Gdk.Monitor) {
  const hypr = AstalHyprland.get_default();
  const isWide = monitor.widthMm > 350;
  const focusedTitle = bind(hypr, "focusedClient").as((client) =>
    client ? client.class : ""
  );

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
          <button>{focusedTitle}</button>
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
