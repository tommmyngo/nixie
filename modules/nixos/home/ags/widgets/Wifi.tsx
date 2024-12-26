import { bind, Variable } from "astal";

import AstalNetwork from "gi://AstalNetwork";

function Wifi() {
  const { wifi } = AstalNetwork.get_default();
  return (
    <>
      <box className="icon">{getNetworkIconBinding()}</box>
      {bind(wifi, "ssid").as(String)}
    </>
  );
}

export function getNetworkIconBinding() {
  const network = AstalNetwork.get_default();

  if (network.wifi !== null) {
    return Variable.derive([
      bind(network, "connectivity"),
      bind(network.wifi, "strength"),
      bind(network, "primary"),
    ])(() => getNetworkIcon(network));
  } else {
    return Variable.derive([
      bind(network, "connectivity"),
      bind(network, "primary"),
    ])(() => getNetworkIcon(network));
  }
}

export function getNetworkIcon(network: AstalNetwork.Network) {
  const { connectivity, wifi } = network;

  // Handle Wi-Fi connection
  if (wifi !== null) {
    const { strength, internet, enabled } = wifi;

    // If Wi-Fi is disabled or there is no connectivity
    if (!enabled || connectivity === AstalNetwork.Connectivity.NONE) {
      return "󰤭";
    }

    // Based on Wi-Fi signal strength and internet status
    if (strength <= 25) {
      if (internet === AstalNetwork.Internet.DISCONNECTED) {
        return "󰤠";
      } else if (internet === AstalNetwork.Internet.CONNECTED) {
        return "󰤟";
      } else if (internet === AstalNetwork.Internet.CONNECTING) {
        return "󰤡";
      }
    } else if (strength <= 50) {
      if (internet === AstalNetwork.Internet.DISCONNECTED) {
        return "󰤣";
      } else if (internet === AstalNetwork.Internet.CONNECTED) {
        return "󰤢";
      } else if (internet === AstalNetwork.Internet.CONNECTING) {
        return "󰤤";
      }
    } else if (strength <= 75) {
      if (internet === AstalNetwork.Internet.DISCONNECTED) {
        return "󰤦";
      } else if (internet === AstalNetwork.Internet.CONNECTED) {
        return "󰤥";
      } else if (internet === AstalNetwork.Internet.CONNECTING) {
        return "󰤧";
      }
    } else {
      if (internet === AstalNetwork.Internet.DISCONNECTED) {
        return "󰤩";
      } else if (internet === AstalNetwork.Internet.CONNECTED) {
        return "󰤨";
      } else if (internet === AstalNetwork.Internet.CONNECTING) {
        return "󰤪";
      }
    }

    // Fallback if none of the conditions are met
    return "󰤯";
  }

  // Default or unknown status
  return "󰤮";
}

export default Wifi;
