import { bind } from "astal";

import AstalHyprland from "gi://AstalHyprland";

function Workspaces() {
  const hypr = AstalHyprland.get_default();

  return (
    <>
      {bind(hypr, "workspaces").as((wss) =>
        wss
          .sort((a, b) => a.id - b.id)
          .map((ws) => {
            const className = bind(ws.monitor, "activeWorkspace").as((aws) =>
              aws.id === ws.id ? "enabled" : ""
            );
            return (
              <button className={className} onClicked={() => ws.focus()}>
                <icon icon="hex" />
              </button>
            );
          })
      )}
    </>
  );
}

export default Workspaces;
