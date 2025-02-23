-- Function to read a file
local function readFile(filePath)
    local file = io.open(filePath, "r")
    if not file then
        local errorcode = "Error code: 1"
        local errorMsg = "Error: Could not open file for reading. Details: " .. filePath .. " " .. errorcode
        print(errorMsg)
        os.execute('powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show(\'' .. errorMsg .. '\')"')  -- Show error message on-screen
        return nil
    end
    local content = file:read("*all")
    file:close()
    return content
end

-- Function to write to a file
local function writeFile(filePath, content)
    local file = io.open(filePath, "w")
    if not file then
        local errorMsg = "Error: Could not open file for writing. Details: " .. filePath
        print(errorMsg)
        os.execute('powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show(\'' .. errorMsg .. '\')"')  -- Show error message on-screen
        return false
    end
    file:write(content)
    file:close()
    return true
end

-- Example usage
local inputFilePath = "input.txt"
local outputFilePath = "output.txt"

local content = readFile(inputFilePath)
if content then
    print("File content read successfully:")
    print(content)
    local success = writeFile(outputFilePath, content)
    if success then
        print("File written successfully to " .. outputFilePath)
    end
end

-- Removed unnecessary call to readFile("aaaaaaa.lua")