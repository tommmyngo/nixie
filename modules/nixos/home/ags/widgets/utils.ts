export const formatClientTitle = (initialTitle: string) => {
  return initialTitle.replace("Untitled - ", "").replace("-", " ");
};
