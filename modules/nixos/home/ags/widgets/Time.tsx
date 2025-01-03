import { Variable, GLib } from "astal";

function Time({ format = "%a %b %e %G %l:%M %p" }) {
  const time = Variable<string>("").poll(
    1000,
    () => GLib.DateTime.new_now_local().format(format)!
  );
  return <button onDestroy={() => time.drop()}>{time()}</button>;
}

export default Time;
