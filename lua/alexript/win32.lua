local ffi = require("ffi")

local exports = {}
exports.Lib = ffi.load("user32");


ffi.cdef [[
static const int KL_NAMELENGTH = 9;
static const int  CP_ACP                  =  0;           // default to ANSI code page

typedef char CHAR;
typedef  CHAR *NPSTR, *LPSTR, *PSTR;
typedef unsigned char       BYTE;
typedef BYTE  BOOLEAN;
typedef int                 BOOL;
typedef uint16_t WCHAR;
typedef  WCHAR *NWPSTR, *LPWSTR, *PWSTR;
typedef const WCHAR *LPCWCH, *PCWCH;
typedef const CHAR *LPCCH, *PCCH;
typedef BOOL             *LPBOOL;
typedef unsigned long       DWORD;
typedef unsigned int        UINT;
typedef DWORD LCID;


BOOL __stdcall GetKeyboardLayoutNameA( LPSTR pwszKLID);
BOOL __stdcall GetKeyboardLayoutNameW( LPWSTR pwszKLID);


int __stdcall WideCharToMultiByte( UINT CodePage, DWORD dwFlags, LPCWCH lpWideCharStr, int cchWideChar, LPSTR lpMultiByteStr, int cbMultiByte, LPCCH lpDefaultChar, LPBOOL lpUsedDefaultChar);

]]

local function toAnsi(in_Src, nsrcBytes)
    if in_Src == nil then
        return nil;
    end

    local cchWideChar = nsrcBytes or -1;

    -- find out how many characters needed
    local bytesneeded = ffi.C.WideCharToMultiByte(
        ffi.C.CP_ACP,
        0,
        ffi.cast("const uint16_t *", in_Src),
        cchWideChar,
        nil,
        0,
        nil,
        nil);

    --print("BN: ", bytesneeded);

    if bytesneeded <= 0 then
        return nil;
    end

    -- create a buffer to stuff the converted string into
    local buff = ffi.new("uint8_t[?]", bytesneeded)

    -- do the actual string conversion
    local byteswritten = ffi.C.WideCharToMultiByte(
        ffi.C.CP_ACP,
        0,
        ffi.cast("const uint16_t *", in_Src),
        cchWideChar,
        buff,
        bytesneeded,
        nil,
        nil);

    if cchWideChar == -1 then
        return ffi.string(buff, byteswritten - 1);
    end

    return ffi.string(buff, byteswritten)
end


-- https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/windows-language-pack-default-values?view=windows-11
function GetLayoutNameW()
    local buff = ffi.new("wchar_t[?]", ffi.C.KL_NAMELENGTH);
    local success = ffi.C.GetKeyboardLayoutNameW(buff)

    if success ~= 1 then
        print("failure: ", success)
        return false;
    end

    local name = toAnsi(buff)
    return name
end

function GetLayoutNameA()
    local buff = ffi.new("char[?]", ffi.C.KL_NAMELENGTH);
    local success = ffi.C.GetKeyboardLayoutNameA(buff)

    if success ~= 1 then
        print("failure: ", success)
        return false;
    end

    local name = ffi.string(buff)
    return name
end
