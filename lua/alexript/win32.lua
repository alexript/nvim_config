local ffi = require("ffi")

local exports = {}
exports.Lib = ffi.load("user32");


ffi.cdef [[
static const int KL_NAMELENGTH = 9;

typedef char CHAR;
typedef  CHAR *NPSTR, *LPSTR, *PSTR;
typedef unsigned char       BYTE;
typedef BYTE  BOOLEAN;
typedef int                 BOOL;
typedef uint16_t WCHAR;
typedef  WCHAR *NWPSTR, *LPWSTR, *PWSTR;


BOOL
__stdcall
GetKeyboardLayoutNameA(
    LPSTR pwszKLID);
BOOL
__stdcall
GetKeyboardLayoutNameW(
    LPWSTR pwszKLID);
]]

-- https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/windows-language-pack-default-values?view=windows-11
function GetLayoutName()
    local buff = ffi.new("char[?]", ffi.C.KL_NAMELENGTH);
    local success = ffi.C.GetKeyboardLayoutNameA(buff)

    if success ~= 1 then
        print("failure: ", success)
        return false;
    end

    local name = ffi.string(buff)
    return name
end
