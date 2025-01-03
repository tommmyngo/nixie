import { bind, Variable } from "astal";

import AstalHyprland from "gi://AstalHyprland";

function Workspaces() {
  const hypr = AstalHyprland.get_default();

  return (
    <>
      {bind(hypr, "workspaces").as((wss) =>
        wss
          .sort((a, b) => a.id - b.id)
          .map((ws) => {
            const isActive = bind(ws.monitor, "activeWorkspace").as(
              (aws) => aws.id === ws.id
            );
            const hasWindows = bind(ws, "clients").as(
              (clients) => clients.length > 0
            );
            const buttonClass = isActive.as((active) =>
              active ? "enabled" : ""
            );

            const Icon = bind(
              Variable.derive([isActive, hasWindows], (active, hasWindows) => {
                if (active) {
                  return <icon icon="diamond_active" />;
                } else if (hasWindows) {
                  return <icon className="enabled" icon="diamond_filled" />;
                } else {
                  return <icon icon="diamond_empty" />;
                }
              })
            );
            return (
              <button className={buttonClass} onClicked={() => ws.focus()}>
                {Icon}
              </button>
            );
          })
      )}
    </>
  );
}

export default Workspaces;
