function ExportLazyPlugins()
  local path = vim.fn.stdpath("config") .. "/lua/plugins/exported.lua"
  local file = io.open(path, "w")
  file:write("return {\n")
  for _, plugin in pairs(require("lazy.core.config").plugins) do
    local name = plugin.name
    local url = plugin.dir and plugin.url or plugin[1]
    if url then
      file:write(string.format("  { \"%s\" },\n", url))
    end
  end
  file:write("}\n")
  file:close()
  print("Exported plugins to: " .. path)
end
