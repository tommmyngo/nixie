import { bind, Variable } from "astal";

import AstalNetwork from "gi://AstalNetwork";

function Wifi() {
  const { wifi } = AstalNetwork.get_default();
  return <button className="btn-ghost icon">{getNetworkIconBinding()}</button>;
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
      return <icon icon="wifi_off" />;
    }

    // Based on Wi-Fi signal strength and internet status
    if (strength <= 25) {
      if (internet === AstalNetwork.Internet.DISCONNECTED) {
        return <icon icon="wifi_bad" />;
      } else if (internet === AstalNetwork.Internet.CONNECTED) {
        return <icon icon="wifi_1" />;
      } else if (internet === AstalNetwork.Internet.CONNECTING) {
        return <icon icon="wifi_find" />;
      }
    } else if (strength <= 50) {
      if (internet === AstalNetwork.Internet.DISCONNECTED) {
        return <icon icon="wifi_bad" />;
      } else if (internet === AstalNetwork.Internet.CONNECTED) {
        return <icon icon="wifi_2" />;
      } else if (internet === AstalNetwork.Internet.CONNECTING) {
        return <icon icon="wifi_find" />;
      }
    } else if (strength <= 75) {
      if (internet === AstalNetwork.Internet.DISCONNECTED) {
        return <icon icon="wifi_bad" />;
      } else if (internet === AstalNetwork.Internet.CONNECTED) {
        return <icon icon="wifi_3" />;
      } else if (internet === AstalNetwork.Internet.CONNECTING) {
        return <icon icon="wifi_find" />;
      }
    } else {
      if (internet === AstalNetwork.Internet.DISCONNECTED) {
        return <icon icon="wifi_bad" />;
      } else if (internet === AstalNetwork.Internet.CONNECTED) {
        return <icon icon="wifi_4" />;
      } else if (internet === AstalNetwork.Internet.CONNECTING) {
        return <icon icon="wifi_find" />;
      }
    }

    // Fallback if none of the conditions are met
    return <icon icon="wifi_0" />;
  }

  // Default or unknown status
  return <icon icon="wifi_unknown" />;
}

export default Wifi;
