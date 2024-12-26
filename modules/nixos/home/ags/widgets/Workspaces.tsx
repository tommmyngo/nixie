import { bind } from "astal";

import AstalHyprland from "gi://AstalHyprland";

function Workspaces() {
  const hypr = AstalHyprland.get_default();

  return (
    <box className="workspaces">
      {bind(hypr, "workspaces").as((wss) =>
        wss
          .sort((a, b) => a.id - b.id)
          .map((ws) => {
            const initialClassName = "icon";
            const className = bind(ws.monitor, "activeWorkspace").as((aws) =>
              aws.id === ws.id
                ? `${initialClassName} btn-enabled`
                : `${initialClassName} btn-ghost`
            );
            return (
              <button className={className} onClicked={() => ws.focus()}>
                
              </button>
            );
          })
      )}
    </box>
  );
}

export default Workspaces;
