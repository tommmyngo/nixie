-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then
  return {
    { 
      "lunarvim/horizon.nvim",
      opts = {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        }
      }
    },

  }
end
