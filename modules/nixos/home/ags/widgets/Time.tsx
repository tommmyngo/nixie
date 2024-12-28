import { Variable, GLib } from "astal";

function Time({ format = "%I:%M %p" }) {
  const time = Variable<string>("").poll(
    1000,
    () => GLib.DateTime.new_now_local().format(format)!
  );
  return (
    <button onDestroy={() => time.drop()}>
      <label className="Time" label={time()} />
    </button>
  );
}

export default Time;
