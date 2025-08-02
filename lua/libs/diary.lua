local exports = {}

exports.create_diary = function()
  local today = os.date("%Y-%m-%d")
  local filepath = vim.fn.getcwd() .. "/" .. today .. ".md"
  local file, err = io.open(filepath, "w")

  if file then
    file:write("# " .. today .. "\n\n")
    print("Diary created at: " .. filepath)
  else
    print("Error creating diary: " .. err)
  end
end

return exports
