local function utf8_validate(input: string): boolean
   local _
   local i, len = 1, #input
   local byte, second, third, fourth = 0, 129, 129, 129
   local sbyte = string.byte
   local code_points = 0
   while i <= len do
      byte = sbyte(input, i)
      code_points = code_points + 1

      if byte <= 127 then
         i = i + 1
         --goto none

      elseif byte >= 194 and byte <= 223 then
         second = sbyte(input, i + 1)
         i = i + 2
         --goto second

      elseif byte == 224 then
         second = sbyte(input, i + 1)
		 third = sbyte(input, i + 2)

         if second ~= nil and second >= 128 and second <= 159 then return false, code_points end
         i = i + 3
         --goto third

      elseif byte == 237 then
         second = sbyte(input, i + 1)
		 third = sbyte(input, i + 2)

         if second ~= nil and second >= 160 and second <= 191 then return false, code_points end
         i = i + 3
         --goto third

      elseif (byte >= 225 and byte <= 236) or byte == 238 or byte == 239 then
         second = sbyte(input, i + 1)
		 third = sbyte(input, i + 2)
         i = i + 3
         --goto third

      elseif byte == 240 then
         second = sbyte(input, i + 1)
		 third = sbyte(input, i + 2)
		 fourth = sbyte(input, i + 3)

         if second ~= nil and second >= 128 and second <= 143 then return false, code_points end
         i = i + 4
         --goto fourth

      elseif byte == 241 or byte == 242 or byte == 243 then
         second = sbyte(input, i + 1)
		 third = sbyte(input, i + 2)
		 fourth = sbyte(input, i + 3)
         i = i + 4
         --goto fourth

      elseif byte == 244 then
         second = sbyte(input, i + 1)
		 third = sbyte(input, i + 2)
		 fourth = sbyte(input, i + 3)

         if second ~= nil and second >= 160 and second <= 191 then return false, code_points end
         i = i + 4
         --goto fourth

      else

         return false
      end

      -- for Lua 5.2+, you can uncomment the goto's above and the lines below for a bit of a speedup
      -- ::fourth:: if fourth == nil or fourth < 128 or fourth > 191 then return false, code_points end
      -- ::third:: if third == nil or third < 128 or third > 191 then return false, code_points end
      -- ::second:: if second == nil or second < 128 or second > 191 then return false, code_points end
      -- ::none::

      -- For Lua, but not LuaJIT, you can offload some of the processing to `find` to speed up validation
      -- _, i = input:find(".*", i)
      -- i = i + 1

      -- the below block handles the default use case for Lua 5.1 and LuaJIT
      if fourth == nil or fourth < 128 or fourth > 191 then return false, code_points end
      if third == nil or third < 128 or third > 191 then return false, code_points end
      if second == nil or second < 128 or second > 191 then return false, code_points end

   end
   return true
end

return utf8_validate