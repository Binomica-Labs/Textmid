--[[
		Copyright 2022 - Sebastian S. Cocioba - Binomica Labs

		Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
		The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

local plasmidSequence = ""

local function fileExists(fileName)
	local f = io.open(fileName, "r")
	if f ~= nil then io.close(f)
	return true
	else
	return false
	end
end



function string:split(delimiter)
    local result = {}
    local from = 1
    local delim_from, delim_to = string.find(self, delimiter, from, true)
    while delim_from do
        if (delim_from ~= 1) then
            table.insert(result, string.sub(self, from, delim_from-1))
        end
   	    from = delim_to + 1
        delim_from, delim_to = string.find(self, delimiter, from, true)
    end
    if (from <= #self) then table.insert(result, string.sub(self, from)) end
    return result
end



local function splitBySep(inputstr, sep) 
	sep = sep or '%s' 

	local t={}  

	for field,s in string.gmatch(inputstr, "([^"..sep.."]*)("..sep.."?)") do 
		table.insert(t,field)  
		if s == "" then 
			return t 
		end 
	end 
end



local function splitByChunk(text, chunkSize)
	local s = {}
	for i=1, #text, chunkSize do
		s[#s+1] = text:sub(i,i+chunkSize - 1)
		end
	return s
end


if #arg < 1 then
	os.execute("clear")

	print("")
	print("Textmid v1.0 - CLI Plasmid Editor")
	print("----------------------------------------------------------------------------")
	print("")
	print("usage: lua " .. arg[0] .. " open " .. " [plasmid file fasta]")
	print("")
	print("example input: lua textmid.lua open plasmidFile.fa")
	print("")
	return
end

if arg[1] == "open" then
	local plasmidFile = io.open(arg[2], "r")
	plasmidSequence = plasmidFile:read("*a")
	io.write(plasmidSequence)
	plasmidFile:close()

	


end

local makeRevComp(plasmidSequence)
	
	
	return revComp
end
