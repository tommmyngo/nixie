export const Separator = ({ vertical = false }) => {
  return <box className={`separator_${vertical ? "v" : "h"}`} />;
};
