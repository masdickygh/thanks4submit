local _XK = "\123\29\78\162\99\159\44\90\225\8\55\148"
local function _D(h)
local out, kl = {}, #_XK
for i = 1, #h, 2 do
local byte = tonumber(string.sub(h, i, i + 1), 16)
local kb = string.byte(_XK, ((i - 1) / 2) % kl + 1)
out[#out + 1] = string.char(bit32.bxor(byte, kb))
end
return table.concat(out)
end
local K = {
g0a = _D("38743ecd14d94d288c"),
g1h = _D("38743ecd14cc49368d"),
g2o = _D("38743ecd14d743358a4b43f8"),
g3v = _D("38743ecd14d743358a4159e70f7c22ce06fb"),
g4c = _D("3a683acd25f65f32b36143f91a792f"),
}
local _bh1 = "31783dd62bca6e05"
local _bh2 = "3155"
local _bh3 = "477f70e806ec5812b44a0bbb19236e9e05f0422ec16b58f8146f738011f84e72d03d07b84a2c7b8e53b60e649d3418f214733a9c43d6680dc14962c0343d08e331d2"
local _bh4 = "31581df62bca6e"
local _bh5 = "3259198222ca7815c14e76c636"
local function _zv(...)
local h = 5381
for _, p in ipairs({...}) do
for i = 1, #p do
h = (h * 33 + string.byte(p, i)) % 2147483647
end
end
return h
end
local _bchk = _zv(_bh1, _bh2, _bh3, _bh4, _bh5)
local _bok = _bchk == 157615655
local _BRAND_NAME, _BRAND_TAG, _BRAND_HEADER, _BRAND_SPLASH_TITLE, _BRAND_SPLASH_SUB
if _bok then
_BRAND_NAME = _D(_bh1)
_BRAND_TAG = _D(_bh2)
_BRAND_HEADER = _D(_bh3)
_BRAND_SPLASH_TITLE = _D(_bh4)
_BRAND_SPLASH_SUB = _D(_bh5)
else
_BRAND_NAME = "Unverified_"
_BRAND_TAG = "?!"
_BRAND_HEADER = '<b>UNVERIFIED</b> <font color="rgb(220,50,50)">|</font> MODIFIED COPY'
_BRAND_SPLASH_TITLE = "UNVERIFIED"
_BRAND_SPLASH_SUB = "MODIFIED COPY"
end
local CONFIG = {
Debug                = true,
MaxInventory         = 500,
ToggleKey            = Enum.KeyCode.F6,
InventoryPollSeconds = 6,
AllowClickFallback   = true,
LogoUrl              = _D("13693ad210a50375936940ba1c743aca16fd5929847a54fb15692bcc17b14f358c275af5087927c108e64b32ce6556e71f742dc91af84474866143fc0e7f60cb0cb05e3f877b18fc1e7c2ad14cf24d338f2747e61472288d0ff04b3592694ef5556d20c5"),
LogoFile             = _D("38743ecd14d24d34886968f8147a218c13f14b"),
SellFile             = _D("38743ecd14d24d34886968e71e71228c09ec4334"),
Version              = "3.1",
WhitelistUrl         = _D("13693ad210a50375936940ba1c743aca16fd5929847a54fb15692bcc17b14f358c275af5087927c108e64b32ce7c5ff515763d9610ea4e37887c18e61e7b3d8d0bfa4d3e92275af5127361d50bf6583f8d6144e055713bc3"),
}
do
local h = 0
for i = 1, #CONFIG.LogoUrl do h = (h * 33 + string.byte(CONFIG.LogoUrl, i)) % 1000000 end
CONFIG.LogoFile = CONFIG.LogoFile:gsub("%.png$", "") .. "_".. tostring(h) .. ".png"
end
local ZONE_ACCEL, ZONE_DAMPING, WALL_BOUNCE, MAX_DT = 7.5, 0.85, -0.2, 0.05
local GUI_SCALE, GUI_OFFSET = 0.75, 0.13
local env = (getgenv and getgenv()) or _G
if env[K.g0a] and env[K.g0a].Destroy then pcall(env[K.g0a].Destroy) end
if env[K.g4c] and env[K.g4c].Destroy then pcall(env[K.g4c].Destroy) end
local Players           = game:GetService("Players")
local RunService        = game:GetService("RunService")
local UserInputService  = game:GetService("UserInputService")
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting          = game:GetService("Lighting")
local TweenService      = game:GetService("TweenService")
local HttpService       = game:GetService("HttpService")
local TextChatService    = game:GetService("TextChatService")
local TeleportService    = game:GetService("TeleportService")
local LocalizationService = game:GetService("LocalizationService")
local LocalPlayer     = Players.LocalPlayer
local getupvalues_    = (debug and debug.getupvalues) or getupvalues
local getconnections_ = getconnections
local function log(...)
if CONFIG.Debug then print(_D("20572bd117d77918bc"), ...) end
end
local function isFinite(n)
return type(n) == "number"and n == n and n ~= math.huge and n ~= -math.huge
end
local function normRarity(r)
r = tostring(r or "Common")
return string.upper(string.sub(r, 1, 1)) .. string.lower(string.sub(r, 2))
end
local function fmtNum(n, isInt)
if isInt then return tostring(math.floor(n + 0.5)) end
local s = string.format("%.2f", n)
s = s:gsub("0+$", "")
s = s:gsub("%.$", "")
return s
end
local _zf, _zg, _zh = "FREE", "PREMIUM", "OWNER"
local _zi = "Fitur terkunci: khusus akun PREMIUM / OWNER."
local _zj = { farm = true, smart = true, info = true }
local function _zk(url)
local ok, body = pcall(function() return game:HttpGet(url) end)
if ok and type(body) == "string"and #body > 0 then return body end
local req = request or http_request or (syn and syn.request)
if req then
local okR, res = pcall(req, { Url = url, Method = "GET"})
if okR and type(res) == "table"and res.StatusCode == 200 and type(res.Body) == "string"and #res.Body > 0 then
return res.Body
end
end
return nil
end
local function _zl(text)
text = text:gsub("%-%-%[(=*)%[.-%]%1%]", "")
text = text:gsub("%-%-[^\r\n]*", "")
return text
end
local function _zm(text, key)
local body = text:match("%f[%w_]".. key .. "%f[^%w_]%s*=%s*(%b{})")
if not body then return nil end
local set, count = {}, 0
for _, name in body:gmatch("([\"'])(.-)%1") do
if #name >= 3 and #name <= 20 and name:match("^[%w_]+$") and count < 500 then
local lower = string.lower(name)
if not set[lower] then
set[lower] = true
count = count + 1
end
end
end
return set
end
local function _zn(userName)
local url = CONFIG.WhitelistUrl .. "?t=".. tostring(os.time())
local body
for attempt = 1, 2 do
body = _zk(url)
if body then break end
if attempt < 2 then task.wait(1) end
end
if not body then
return _zf, "Whitelist tidak bisa dimuat (jaringan atau URL). Coba jalankan ulang."
end
if #body > 65536 then
return _zf, "File whitelist terlalu besar, diabaikan."
end
local clean = _zl(body)
local owners = _zm(clean, "owner")
local premium = _zm(clean, "premium")
if not owners and not premium then
return _zf, "Format whitelist tidak dikenali."
end
local me = string.lower(userName)
if owners and owners[me] then return _zh, "Username ada di daftar owner."end
if premium and premium[me] then return _zg, "Username ada di daftar premium."end
return _zf, "Username tidak ada di whitelist."
end
local _zo, _zt, _zs = pcall(_zn, LocalPlayer.Name)
if not _zo then
_zt, _zs = _zf, "Pemeriksaan whitelist gagal: ".. tostring(_zt)
end
local _zr = _zt ~= _zf
local function _zp(feature)
return feature ~= nil and (not _zr) and _zj[feature] ~= true
end
log("access:", LocalPlayer.Name, _zt, _zs)
local RARITIES = { "Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Secret"}
local MODES = { "Smart", "Skip"}
local MODE_INFO = {
Smart = "Bot memainkan minigame sendiri (menahan dan melepas klik seperti pemain asli). Paling mirip pemain, tapi butuh beberapa detik per ikan.",
Skip  = "Minigame tetap muncul, lalu setelah waktu 'Tahan sebelum selesai' habis, zona dikunci ke ikan dan bar tangkapan langsung dipenuhi. Ikan tertangkap jauh lebih cepat dari Smart.",
}
local PRESET_ORDER = { "Aman", "Cepat", "Turbo"}
local PRESETS = {
Aman  = { skipDelay = 1.5, biteFast = false, biteWait = 3.0, castCooldown = 0.3 },
Cepat = { skipDelay = 0.6, biteFast = true,  biteWait = 1.5, castCooldown = 0.2 },
Turbo = { skipDelay = 0.0, biteFast = true,  biteWait = 0.5, castCooldown = 0.1 },
}
local PRESET_INFO = {
Aman   = "Waktu game tidak diubah. Skip menunggu 1,5 dtk. Paling kecil kemungkinan ditolak server.",
Cepat  = "Skip menunggu 0,6 dtk, gigitan dipercepat ke 1,5 dtk, jeda lempar 0,2 dtk. (Belum diuji di server ini.)",
Turbo  = "Skip langsung, gigitan 0,5 dtk, jeda lempar 0,1 dtk. Paling cepat tapi paling berisiko ditolak server. (Belum diuji.)",
Kustom = "Kamu mengubah angka waktu secara manual di bagian bawah.",
}
local S = {
farm = false, mode = "Smart", preset = "Aman", autoCast = true, autoEquip = true,
skipDelay = 1.5, biteFast = false, biteWait = 3.0, castCooldown = 0.3,
stuckTimeout = 25, lookahead = 5,
favOn = false,
fav = { Common = false, Uncommon = false, Rare = false, Epic = false, Legendary = true, Mythic = true, Secret = true },
sellOn = false, sellAt = CONFIG.MaxInventory, allowSellAll = false,
sellGap = 0.08, sellChunk = 100,
}
local ES = { antiLoseStreak = false }
local FREE_STUCK_TIMEOUT = S.stuckTimeout
local function _zq()
if _zr then return end
local p = PRESETS.Aman
S.mode, S.preset = "Smart", "Aman"
S.skipDelay, S.biteFast, S.biteWait, S.castCooldown = p.skipDelay, p.biteFast, p.biteWait, p.castCooldown
S.stuckTimeout = FREE_STUCK_TIMEOUT
S.autoCast, S.autoEquip = true, true
S.favOn, S.sellOn, S.allowSellAll = false, false, false
end
_zq()
local stats = { caught = 0, fav = 0, sold = 0, inv = nil, byRarity = {}, status = "Semua fitur mati"}
local connections = {}
local running = true
local mg, mgState
local G = {}
local ctl = { fishV = 0 }
local guiRefs = {}
local busySince, lastClick = nil, 0
local invDirty, invBusy, sellBusy = true, false, false
local lastInvAt, sellCooldownUntil, sellFails = 0, 0, 0
local processed = {}
local sellCandidates = {}
local Core = { connections = connections, badMethod = {}, skipFails = 0 }
local function setNotice(text, secs, kind)
stats.lastNote = text
log(text)
if Core.toast then Core.toast(text, kind or "info", secs) end
end
local function denyFree()
if _zr then return false end
setNotice(_zi, 4, "warn")
return true
end
local FS = ReplicatedStorage:WaitForChild(_D("3d743dca0af14b09987b43f116"), 15)
if not FS then
warn(_D("20572bd117d77918bc2865f10b7127c102eb493eb27c58e61a7a2b8205f65f32886650b416722ad70ffa0c348e7c17f2146820c643b20c2d936759f35b7a2fcf06b0413b9137"))
return
end
local function waitChild(parent, name)
if not parent then return nil end
return parent:WaitForChild(name, 5)
end
local function findRemote(name)
local r = FS:FindFirstChild(name, true) or ReplicatedStorage:FindFirstChild(name, true)
if r and (r:IsA("RemoteEvent") or r:IsA("RemoteFunction")) then return r end
return nil
end
local IE = waitChild(FS, _D("327338c70deb4328984d41f115693d"))
local R = {
rA = waitChild(FS, _D("3d743dca20fe593d897c79fb0f7428db")),
GetData = waitChild(IE, _D("327338c70deb4328985770f10f592fd602")),
ToggleFav = waitChild(IE, _D("327338c70deb4328985763fb1c7a22c725fe5a35936143f1")),
rB = findRemote(_D("287822ce25f65f32")),
}
local function findTable(fn, requiredKeys)
if not getupvalues_ or type(fn) ~= "function"then return nil end
local ok, ups = pcall(getupvalues_, fn)
if not ok or type(ups) ~= "table"then return nil end
for _, v in pairs(ups) do
if type(v) == "table"then
local good = true
for _, k in ipairs(requiredKeys) do
if rawget(v, k) == nil then good = false break end
end
if good then return v end
end
end
return nil
end
local MG_STATE_KEYS = { "zoneLogicX", "fishX", "progress", "zoneHalfSize", "isHolding"}
local function refreshMinigameState()
if mg and not mgState then mgState = findTable(mg.SetHolding, MG_STATE_KEYS) end
end
local function resolveMinigame()
local ok, mod = pcall(function()
local mods = FS:WaitForChild(_D("3d743dca0af14b178e6c42f81e6e"), 10)
return require(mods:WaitForChild(_D("367420cb04fe413fb27144e01e70"), 10))
end)
if ok and type(mod) == "table"and type(mod.IsActive) == "function"and type(mod.SetHolding) == "function"then
return mod
end
warn(_D("20572bd117d77918bc2854f5157321d643ed492b946145f15b7027cc0af84d3784285afb1f6822c759"), tostring(mod))
return nil
end
local function discoverGameState()
if not (getconnections_ and getupvalues_) then return false end
local okc, list = pcall(getconnections_, UserInputService.InputBegan)
if not okc or type(list) ~= "table"then return false end
for _, c in ipairs(list) do
local okf, f = pcall(function() return c.Function end)
if okf and type(f) == "function"then
local oku, ups = pcall(getupvalues_, f)
if oku and type(ups) == "table"then
for _, up in pairs(ups) do
if type(up) == "function"then
local fishState = findTable(up, { "casted", "canCast", "fishingInProgress", "castingCooldown"})
local rodState  = findTable(up, { "isEquipped", "IsValidRod", "CleanupFishing"})
if fishState and rodState then
G.fishState, G.rodState, G.actionStart = fishState, rodState, up
local liveMg = findTable(up, { "IsActive", "SetHolding", "Start", "Stop"})
if liveMg then
if liveMg ~= mg then mgState = nil end
mg = liveMg
end
refreshMinigameState()
log("game state found")
return true
end
end
end
end
end
end
return false
end
local function readFromGui()
local pg = LocalPlayer:FindFirstChild("PlayerGui")
local fg = pg and pg:FindFirstChild(_D("3d743dca0af14b1d9461"))
if not fg then return nil end
if not (guiRefs.zone and guiRefs.zone:IsDescendantOf(fg)) then guiRefs.zone = fg:FindFirstChild(_D("367238cb0df86e3b93"), true) end
if not (guiRefs.fish and guiRefs.fish:IsDescendantOf(fg)) then guiRefs.fish = fg:FindFirstChild(_D("3d7422ce00fe583989"), true) end
if guiRefs.zone and guiRefs.fish then
return (guiRefs.fish.Position.X.Scale - GUI_OFFSET) / GUI_SCALE, (guiRefs.zone.Position.X.Scale - GUI_OFFSET) / GUI_SCALE
end
return nil
end
local function applyTuning()
local fs = G.fishState
if not fs then return end
if G.tunedTable ~= fs then
G.tunedTable = fs
G.origWait = type(fs.waitTime) == "number"and fs.waitTime or nil
G.origCool = type(fs.cooldownTime) == "number"and fs.cooldownTime or nil
end
if G.origCool ~= nil then
local want = S.farm and (_zr and S.castCooldown or PRESETS.Aman.castCooldown) or G.origCool
if fs.cooldownTime ~= want then fs.cooldownTime = want end
end
if G.origWait ~= nil then
local want = (S.farm and _zr and S.biteFast) and S.biteWait or G.origWait
if fs.waitTime ~= want then fs.waitTime = want end
end
end
local function restoreTuning()
local fs = G.fishState
if fs and G.tunedTable == fs then
if G.origCool ~= nil then pcall(function() fs.cooldownTime = G.origCool end) end
if G.origWait ~= nil then pcall(function() fs.waitTime = G.origWait end) end
end
end
local function resetControl()
ctl.lastFish, ctl.lastZone, ctl.fishV, ctl.start, ctl.lastHold, ctl.forced = nil, nil, 0, nil, nil, false
end
local function simulate(x, v, hold, steps, dt)
local accel = hold and ZONE_ACCEL or -ZONE_ACCEL
for _ = 1, steps do
v = (v + accel * dt) * ZONE_DAMPING
x = x + v * dt
if x <= 0 then
x = 0
v = v * WALL_BOUNCE
elseif x >= 1 then
x = 1
v = v * WALL_BOUNCE
end
end
return x
end
local function decideHold(fishX, zoneX, zoneV, dt)
local raw = ctl.lastFish and (fishX - ctl.lastFish) / dt or 0
ctl.fishV = ctl.fishV * 0.6 + raw * 0.4
local n = math.max(1, S.lookahead)
local fishPred = math.clamp(fishX + ctl.fishV * dt * n, 0, 1)
local errHold = math.abs(fishPred - simulate(zoneX, zoneV, true, n, dt))
local errFree = math.abs(fishPred - simulate(zoneX, zoneV, false, n, dt))
return errHold < errFree
end
local function onHeartbeat(dt)
if not S.farm or not mg then return end
local okA, active = pcall(mg.IsActive, mg)
if not (okA and active) then
if ctl.start then
if ctl.forced or (_zr and S.biteFast) then
Core.pendingVerify = os.clock()
Core.pendingForced = ctl.forced
end
resetControl()
end
return
end
dt = math.clamp(dt, 1 / 240, MAX_DT)
ctl.start = ctl.start or os.clock()
refreshMinigameState()
local st = mgState
local fishX, zoneX, zoneV
if st then
fishX, zoneX, zoneV = st.fishX, st.zoneLogicX, st.zoneVelocity
else
fishX, zoneX = readFromGui()
zoneV = (ctl.lastZone and zoneX) and (zoneX - ctl.lastZone) / dt or 0
end
if not (isFinite(fishX) and isFinite(zoneX)) then return end
if not isFinite(zoneV) then zoneV = 0 end
local elapsed = os.clock() - ctl.start
if _zr and S.mode == "Skip"and st and elapsed >= S.skipDelay then
st.zoneLogicX = fishX
if type(st.zoneVelocity) == "number"then st.zoneVelocity = 0 end
st.progress = 1
ctl.forced = true
stats.status = "Skip: menyelesaikan minigame"
else
local hold = decideHold(fishX, zoneX, zoneV, dt)
if hold ~= ctl.lastHold then
pcall(mg.SetHolding, mg, hold)
ctl.lastHold = hold
end
if S.mode == "Skip"and not st then
stats.status = "Skip butuh akses state game, berjalan seperti Smart"
else
stats.status = ("Minigame [%s] ikan %.2f zona %.2f"):format(S.mode, fishX, zoneX)
end
end
ctl.lastFish, ctl.lastZone = fishX, zoneX
end
local function fetchInventory()
if not R.GetData then return nil end
local ok, data = pcall(function() return R.GetData:InvokeServer() end)
if ok and type(data) == "table"and type(data.Fish) == "table"then return data.Fish end
return nil
end
local function refreshInventory()
local fish = fetchInventory()
if fish then
stats.inv = #fish
lastInvAt = os.clock()
end
return fish
end
local function favoritePass(fish)
if not _zr then return 0 end
if not R.ToggleFav then return 0 end
fish = fish or fetchInventory()
if not fish then return 0 end
local done = 0
for _, f in ipairs(fish) do
local id = f.uniqueId
if id and f.isFavorited ~= true and S.fav[normRarity(f.rarity)] and not processed[id] then
local ok, res = pcall(function() return R.ToggleFav:InvokeServer(id) end)
if ok then
if res == false then
pcall(function() return R.ToggleFav:InvokeServer(id) end)
end
processed[id] = true
f.isFavorited = true
done = done + 1
end
task.wait(0.05)
if done >= 150 or not running then break end
end
end
if done > 0 then stats.fav = stats.fav + done end
return done
end
local function cloneArgs(p)
local t = { n = p.n }
for i = 1, p.n do t[i] = p[i] end
return t
end
local function callRemote(remote, args)
if remote:IsA("RemoteFunction") then
return pcall(remote.InvokeServer, remote, table.unpack(args, 1, args.n))
end
return pcall(remote.FireServer, remote, table.unpack(args, 1, args.n))
end
local function pathOf(inst)
local names, cur = {}, inst
while cur and cur ~= game do
table.insert(names, 1, cur.Name)
cur = cur.Parent
end
return names
end
local function resolvePath(names)
local cur = game
for _, n in ipairs(names) do
cur = cur and cur:FindFirstChild(n)
if not cur then return nil end
end
return cur
end
local function encodeTemplate(T)
local args = {}
for i = 1, T.args.n do
local a = T.args[i]
if T.idx == i then
args[i] = { t = _D("087121d6") }
elseif a == nil then
args[i] = { t = "nil"}
elseif type(a) == "string"or type(a) == "number"or type(a) == "boolean"then
args[i] = { t = type(a), v = a }
else
return nil
end
end
return { path = pathOf(T.remote), kind = T.kind, idx = T.idx, n = T.args.n, args = args }
end
local function saveSell(T)
if not writefile then return end
local enc = encodeTemplate(T)
if not enc then log("learned template has non-primitive arguments, not saved to file") return end
pcall(function() writefile(CONFIG.SellFile, HttpService:JSONEncode(enc)) end)
end
local function loadSell()
if not _zr or env[K.g1h] or not (isfile and readfile) then return end
local ok, T = pcall(function()
if not isfile(CONFIG.SellFile) then return nil end
local d = HttpService:JSONDecode(readfile(CONFIG.SellFile))
if type(d) ~= "table"or type(d.path) ~= "table"or type(d.args) ~= "table"then return nil end
local remote = resolvePath(d.path)
if not (remote and (remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction"))) then return nil end
local kind = d.kind
if kind ~= _D("087420c50ffa") and kind ~= _D("166822d60a") and kind ~= _D("0d783cc002eb4537") then return nil end
local args = { n = math.clamp(math.floor(tonumber(d.n) or #d.args), 0, 16) }
for i = 1, args.n do
local a = d.args[i]
if type(a) == "table"then
if a.t == _D("087121d6") then args[i] = ""
elseif a.t ~= "nil"then args[i] = a.v end
end
end
local idx = tonumber(d.idx)
if kind ~= _D("0d783cc002eb4537") and not (idx and idx >= 1 and idx <= args.n) then return nil end
return { remote = remote, args = args, kind = kind, idx = idx }
end)
if ok and T then
env[K.g1h] = T
log("learned sell remote restored from file:", T.remote.Name, T.kind)
end
end
local function learnedTemplate()
local T = env[K.g1h]
if T and typeof(T.remote) == "Instance"and T.remote.Parent then return T end
return nil
end
local function sellBlocked(override)
local T = learnedTemplate()
if not T then
return "Cara jual belum dipelajari: tab Jual > Pelajari cara jual", "none"
end
if T.kind == _D("0d783cc002eb4537") and not S.allowSellAll and not override then
return "Hasil pelajaran = jual-semua. Aktifkan 'Izinkan jual-semua' bila setuju.", "allow"
end
return nil
end
local function sellPass(override)
if not _zr then return false end
local why = sellBlocked(override)
if why then
setNotice(why, 7, "warn")
return false
end
local T = learnedTemplate()
sellBusy = true
local okRun, err = pcall(function()
local fish = fetchInventory()
if not fish then
setNotice("Gagal membaca inventory", 5, "err")
return
end
if S.favOn then
favoritePass(fish)
fish = fetchInventory() or fish
end
local protectedIds, sellIds = {}, {}
for _, f in ipairs(fish) do
local id = f.uniqueId
if id then
local prot = f.isFavorited == true or (S.favOn and S.fav[normRarity(f.rarity)] == true)
if prot then protectedIds[id] = true else table.insert(sellIds, id) end
end
end
if #sellIds == 0 and T.kind ~= _D("0d783cc002eb4537") then
setNotice("Tidak ada ikan yang bisa dijual (semua favorit)", 5, "info")
return
end
local before = #fish
if T.kind == _D("087420c50ffa") then
for _, id in ipairs(sellIds) do
local args = cloneArgs(T.args)
args[T.idx] = id
callRemote(T.remote, args)
task.wait(S.sellGap)
if not running then return end
end
elseif T.kind == _D("166822d60a") then
for i = 1, #sellIds, S.sellChunk do
local chunk = {}
for j = i, math.min(i + S.sellChunk - 1, #sellIds) do chunk[#chunk + 1] = sellIds[j] end
local args = cloneArgs(T.args)
args[T.idx] = chunk
callRemote(T.remote, args)
task.wait(0.15)
if not running then return end
end
else
callRemote(T.remote, cloneArgs(T.args))
end
task.wait(1.0)
local after = fetchInventory()
if not after then return end
local afterSet = {}
for _, f in ipairs(after) do afterSet[f.uniqueId] = true end
local lost = 0
for id in pairs(protectedIds) do
if not afterSet[id] then lost = lost + 1 end
end
local sold = before - #after
stats.inv = #after
if lost > 0 then
S.sellOn = false
setNotice(("BAHAYA: %d ikan favorit ikut terjual. Auto Jual dimatikan."):format(lost), 12, "err")
elseif sold <= 0 then
sellFails = sellFails + 1
setNotice(("Jual tidak berpengaruh (inventory %d -> %d, remote %s [%s], %d argumen)"):format(before, #after, T.remote.Name, T.kind, T.args.n), 9, "warn")
if sellFails >= 3 then
S.sellOn = false
setNotice("Jual gagal 3x, Auto Jual dimatikan.", 10, "err")
end
else
sellFails = 0
stats.sold = stats.sold + sold
setNotice(("Terjual %d ikan"):format(sold), 5, "ok")
end
end)
if not okRun then warn(_D("20572bd117d77918bc2844f117716ec711ed4328db"), err) end
sellCooldownUntil = os.clock() + 20
sellBusy = false
return true
end
local function runExclusive(fn)
if invBusy then
setNotice("Sedang memproses inventory, coba lagi sebentar", 3, "info")
return
end
invBusy = true
task.spawn(function()
local ok, err = pcall(fn)
if not ok then warn(_D("20572bd117d77918bc"), err) end
invBusy = false
end)
end
local learn = { active = false, ids = {}, seen = {}, token = 0 }
local BLACKLIST = {
[_D("3d743dca24f65a3f93")] = true, [_D("387c3dd631fa5c36886b56e0127220")] = true, [_D("38712bc30dea5c19807b43")] = true, [_D("35723acb05e66e33956d")] = true,
[_D("367420cb04fe413fb36d44e117690bd406f158")] = true, [_D("2e6d2ac317fa7f2e936d56ff3e6b2bcc17")] = true, [_D("2b682cce0aec441c887b5fd71a692dca")] = true,
[_D("287521d52df05833876154f50f7421cc")] = true, [_D("28782dd006eb6833926b58e21e6f37")] = true, [_D("3d743dca20fe593d897c79fb0f7428db")] = true,
}
local function isSellName(n)
n = string.lower(n)
return string.find(n, "sell", 1, true) ~= nil or string.find(n, "jual", 1, true) ~= nil
end
local function isNoise(remote)
local n = remote.Name
if isSellName(n) then return false end
return BLACKLIST[n] or string.sub(n, 1, 10) == _D("327338c70deb43289857")
end
local function finishLearn(remote, packed)
learn.active = false
local T = { remote = remote, args = packed, kind = _D("0d783cc002eb4537") }
for i = 1, packed.n do
local a = packed[i]
if type(a) == "string"and learn.ids[a] then
T.kind = _D("087420c50ffa")
T.idx = i
break
elseif type(a) == "table"then
local cnt, all = 0, true
for _, v in pairs(a) do
cnt = cnt + 1
if not (type(v) == "string"and learn.ids[v]) then
all = false
break
end
end
if cnt > 0 and all then
T.kind = _D("166822d60a")
T.idx = i
break
end
end
end
env[K.g1h] = T
Core.badMethod = {}
sellFails = 0
saveSell(T)
setNotice(("Remote jual dipelajari: %s [%s]"):format(remote.Name, T.kind), 10, "ok")
end
local function onLearnCall(remote, method, packed)
if not learn.active then return end
if typeof(remote) ~= "Instance"then return end
if not (remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction")) then return end
if isNoise(remote) then return end
learn.seen[remote] = packed
if isSellName(remote.Name) then finishLearn(remote, packed) end
end
local function installHook()
env[K.g2o] = env[K.g2o] or {}
local hc = env[K.g2o]
hc.handler = onLearnCall
if env[K.g3v] then return true end
if not (hookmetamethod and getnamecallmethod) then return false end
local old
local hook = function(self, ...)
local method = getnamecallmethod()
local m = string.lower(tostring(method))
if m == "fireserver"or m == "invokeserver"then
local h = hc.handler
if h and not (checkcaller and checkcaller()) then
task.defer(h, self, method, table.pack(...))
end
end
return old(self, ...)
end
if newcclosure then hook = newcclosure(hook) end
old = hookmetamethod(game, "__namecall", hook)
env[K.g3v] = true
return true
end
function Core.startLearn()
if denyFree() then return end
if not installHook() then
setNotice("Executor tidak punya hookmetamethod, tidak bisa belajar remote jual", 8, "err")
return
end
local fish = fetchInventory()
learn.ids = {}
if fish then
for _, f in ipairs(fish) do
if f.uniqueId then learn.ids[f.uniqueId] = true end
end
end
learn.seen = {}
learn.active = true
learn.token = learn.token + 1
local token = learn.token
setNotice("MODE BELAJAR: jual 1 ikan lewat NPC sekarang (60 dtk)", 60, "info")
task.delay(60, function()
if learn.active and learn.token == token then
learn.active = false
local distinct, onlyR, onlyP = 0, nil, nil
local names = {}
for r, p in pairs(learn.seen) do
distinct = distinct + 1
onlyR, onlyP = r, p
table.insert(names, r:GetFullName())
end
if distinct == 1 then
finishLearn(onlyR, onlyP)
else
log("learn timeout, remotes seen:", table.concat(names, ", "))
setNotice(distinct == 0 and "Tidak ada remote terdeteksi"or "Remote ambigu, lihat console", 8, "warn")
end
end
end)
end
function Core.forget()
if denyFree() then return end
env[K.g1h] = nil
Core.badMethod = {}
if delfile and isfile then pcall(function() if isfile(CONFIG.SellFile) then delfile(CONFIG.SellFile) end end) end
setNotice("Remote jual hasil belajar dilupakan", 4, "info")
end
task.spawn(function()
for _, root in ipairs({ ReplicatedStorage, workspace }) do
for _, d in ipairs(root:GetDescendants()) do
if d:IsA("RemoteEvent") or d:IsA("RemoteFunction") then
local n = string.lower(d.Name)
if string.find(n, "sell", 1, true) or string.find(n, "jual", 1, true) or string.find(n, "shop", 1, true) or string.find(n, "merchant", 1, true) then
table.insert(sellCandidates, d:GetFullName())
end
end
end
end
if #sellCandidates > 0 then log("sell remote candidates:", table.concat(sellCandidates, ", ")) end
end)
loadSell()
local function findRodTool(container)
if not container then return nil end
for _, t in ipairs(container:GetChildren()) do
if t:IsA("Tool") and CollectionService:HasTag(t, _D("29722a")) then return t end
end
return nil
end
local function ensureRod()
local char = LocalPlayer.Character
local hum = char and char:FindFirstChildOfClass("Humanoid")
if not (hum and hum.Health > 0) then return nil end
local held = findRodTool(char)
if held then return held end
if S.autoEquip then
local tool = findRodTool(LocalPlayer:FindFirstChildOfClass("Backpack"))
if tool then pcall(hum.EquipTool, hum, tool) end
end
return nil
end
local function virtualClick()
if os.clock() - lastClick < 1.5 then return end
lastClick = os.clock()
pcall(function()
local vim = game:GetService("VirtualInputManager")
local cam = workspace.CurrentCamera
local size = cam and cam.ViewportSize or Vector2.new(800, 600)
vim:SendMouseButtonEvent(size.X * 0.5, size.Y * 0.5, 0, true, game, 0)
task.wait(0.05)
vim:SendMouseButtonEvent(size.X * 0.5, size.Y * 0.5, 0, false, game, 0)
end)
end
local function canFish()
if not S.farm or sellBusy then return false end
if stats.inv and stats.inv >= CONFIG.MaxInventory then
if not (S.sellOn and learnedTemplate()) then
stats.status = (_zr and "Inventory penuh (%d). Jual dulu / aktifkan Auto Jual."
or "Inventory penuh (%d). Jual manual di NPC (Auto Jual khusus PREMIUM)."):format(stats.inv)
return false
end
end
return true
end
local function castStep()
if not canFish() then return end
if not G.fishState then pcall(discoverGameState) end
pcall(applyTuning)
local held = ensureRod()
if not held then stats.status = "Rod belum di-equip"return end
if mg and mg:IsActive() then busySince = nil return end
local fs, rs = G.fishState, G.rodState
if fs and rs then
if not rs.isEquipped then stats.status = "Menunggu rod siap"return end
if fs.casted or fs.fishingInProgress then
busySince = busySince or os.clock()
stats.status = "Menunggu ikan menggigit"
if os.clock() - busySince > S.stuckTimeout then
pcall(rs.CleanupFishing, rs)
busySince = nil
end
return
end
busySince = nil
if S.autoCast and fs.canCast and not fs.castingCooldown and rs:IsValidRod() and G.actionStart then
stats.status = "Melempar pancing"
task.spawn(G.actionStart)
end
elseif S.autoCast then
if CONFIG.AllowClickFallback then
stats.status = "State game tidak ditemukan, pakai klik"
virtualClick()
else
stats.status = "State game tidak ditemukan (butuh getconnections + getupvalues)"
end
end
end
function Core.syncPreset()
for _, name in ipairs(PRESET_ORDER) do
local p = PRESETS[name]
if S.skipDelay == p.skipDelay and S.biteFast == p.biteFast and S.biteWait == p.biteWait and S.castCooldown == p.castCooldown then
S.preset = name
return
end
end
S.preset = "Kustom"
end
function Core.setPreset(name)
local p = PRESETS[name]
if not p then return end
if not _zr and name ~= "Aman"then denyFree() return end
S.skipDelay, S.biteFast, S.biteWait, S.castCooldown = p.skipDelay, p.biteFast, p.biteWait, p.castCooldown
S.preset = name
Core.skipFails = 0
end
function Core.setFarm(v)
_zq()
S.farm = v and true or false
if S.farm then
invDirty = true
Core.skipFails = 0
Core.pendingVerify = nil
stats.status = "Farm aktif"
setNotice("Farm mancing aktif", 3, "ok")
else
if mg then pcall(mg.SetHolding, mg, false) end
resetControl()
busySince = nil
Core.pendingVerify = nil
pcall(restoreTuning)
stats.status = "Farm dimatikan"
setNotice("Farm mancing dimatikan", 3, "info")
end
end
local function armSell()
sellFails = 0
sellCooldownUntil = 0
invDirty = true
S.sellOn = true
local inv = stats.inv
setNotice(("Auto jual aktif: jual saat inventory >= %d (sekarang %s)"):format(S.sellAt, inv and tostring(inv) or "?"), 6, "ok")
end
function Core.setSell(v)
if not v then
S.sellOn = false
return
end
if denyFree() then return end
local why, code = sellBlocked(false)
if code == "none"then
setNotice(why, 9, "warn")
return
end
if code == "allow"and Core.ask then
Core.ask("Izinkan jual-semua?",
"Remote jual hasil Pelajari menjual SEMUA ikan sekaligus. Sebelum menjual, ikan rarity pilihanmu difavoritkan (jika Auto Favorit aktif) dan dicek ulang; jika favorit hilang, Auto Jual mati otomatis. Izinkan dan nyalakan Auto Jual?",
"Izinkan", function()
S.allowSellAll = true
armSell()
Core.refreshUI()
end)
return
end
armSell()
end
function Core.favNow()
if denyFree() then return end
runExclusive(function()
local n = favoritePass(refreshInventory())
setNotice(("%d ikan difavoritkan"):format(n), 4, n > 0 and "ok"or "info")
end)
end
function Core.sellNow()
if denyFree() then return end
local why, code = sellBlocked(false)
if not why then
runExclusive(function() sellPass(false) end)
elseif code == "allow"and Core.ask then
Core.ask("Jual semua ikan?",
"Remote jual ini menjual SEMUA ikan non-favorit sekaligus. Lanjutkan sekali ini?",
"Ya, jual", function() runExclusive(function() sellPass(true) end) end)
else
setNotice(why, 8, "warn")
end
end
function Core.methodReport()
local T = learnedTemplate()
return { learned = T and (T.remote.Name .. " [".. T.kind .. "]") or nil, learnedKind = T and T.kind or nil, sellFishPresent = R.rB ~= nil }
end
function Core.capsLine()
return ("minigame: %s\nstate game (Skip/Tuning): %s\nlempar otomatis: %s\nhook belajar jual: %s\nfile (logo/jual): %s\ntuning waktu: %s"):format(
mg and "OK"or "X",
mgState and "OK"or "X (pakai GUI)",
G.fishState and "OK"or "belum ditemukan",
(hookmetamethod and getnamecallmethod) and "OK"or "X",
(writefile and readfile and isfile) and "OK"or "X",
(G.fishState and G.origWait ~= nil) and "OK"or "belum terbaca")
end
local _z8 = false
local _zb = nil
local function _zc(text)
local okTCS = pcall(function()
if TextChatService.ChatVersion ~= Enum.ChatVersion.TextChatService then error("legacy chat") end
local channels = TextChatService:FindFirstChild("TextChannels") or TextChatService:WaitForChild("TextChannels", 3)
if not channels then error("no TextChannels") end
local ch = channels:FindFirstChild(_D("295f16e506f149288064")) or channels:WaitForChild(_D("295f16e506f149288064"), 3)
if not ch then
for _, c in ipairs(channels:GetChildren()) do
if c:IsA("TextChannel") and c.Name ~= "RBXSystem"and c.Name ~= "RBXTeam"then ch = c break end
end
end
if not ch then error("no channel") end
ch:SendAsync(text)
end)
if okTCS then return "TextChatService"end
local okLeg = pcall(function()
local ev = ReplicatedStorage:FindFirstChild(_D("3f7828c316f35819896943c7026e3ac70edc443b954d41f115693d"))
local say = ev and ev:FindFirstChild(_D("287c37ef06ec5f3b866d65f10a682bd117"))
if not say then error("x") end
say:FireServer(text, _D("3a7122"))
end)
if okLeg then return "legacy"end
return nil
end
local function _za()
_zb = _zc(_D("5a6f2bc80cf642"))
if _zb then
setNotice("Anti-Lose Streak: !rejoin terkirim 1x (".. _zb .. "), auto farm dihentikan.", 8, "warn")
else
setNotice("Anti-Lose Streak: !rejoin GAGAL terkirim (chat tidak ditemukan). Auto farm dihentikan.", 10, "warn")
end
task.delay(3, function()
pcall(function()
if LocalPlayer and LocalPlayer.Parent then
TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end
end)
end)
end
local function _z9()
if _z8 then return end
_z8 = true
S.farm = false
_za()
end

-- BOOST PERFORMANCE: bikin game lebih ringan di client. Tidak menyentuh remote/gameplay.
local Boost = { on = false, saved = nil, conns = {}, effectCount = 0 }
local EFFECT_CLASSES = { "ParticleEmitter", "Trail", "Beam", "Smoke", "Fire", "Sparkles", "Highlight" }
local POST_FX_CLASSES = { "BloomEffect", "SunRaysEffect", "ColorCorrectionEffect", "DepthOfFieldEffect", "BlurEffect" }
-- Tiap kelas efek punya properti berbeda, jangan diperlakukan sama (Atmosphere TIDAK punya .Enabled, beda dengan Clouds)
local FX_FIELDS = {
	Atmosphere = { Density = 0, Haze = 0, Glare = 0 },
	Clouds = { Enabled = false, Cover = 0, Density = 0 },
}
local function isEffect(inst)
	for _, c in ipairs(EFFECT_CLASSES) do if inst:IsA(c) then return true end end
	return false
end
local function setEffectsEnabled(enabled)
	local n = 0
	for _, inst in ipairs(workspace:GetDescendants()) do
		if isEffect(inst) then
			local ok, cur = pcall(function() return inst.Enabled end)
			if ok and cur ~= enabled then
				pcall(function() inst.Enabled = enabled end)
				n = n + 1
			end
		end
	end
	return n
end
function Boost.enable()
	if Boost.on then return true end
	local ok, saved = pcall(function()
		local gs = UserSettings and UserSettings():GetService("UserGameSettings")
		return {
			quality = gs and gs.SavedQualityLevel,
			shadows = Lighting.GlobalShadows,
			tech = Lighting.Technology,
			diffuse = Lighting.EnvironmentDiffuseScale,
			specular = Lighting.EnvironmentSpecularScale,
			shadowSoft = Lighting.ShadowSoftness,
			waterWave = workspace.Terrain and workspace.Terrain.WaterWaveSize,
			waterSpeed = workspace.Terrain and workspace.Terrain.WaterWaveSpeed,
			waterReflect = workspace.Terrain and workspace.Terrain.WaterReflectance,
			postFx = {},
			fxInst = {},
		}
	end)
	if not ok then return false, "Gagal membaca pengaturan grafis" end
	Boost.saved = saved
	-- Ditandai AKTIF begitu snapshot aman didapat, supaya switch selalu bisa dimatikan lagi walau ada satu langkah di bawah yang gagal
	Boost.on = true
	pcall(function()
		local gs = UserSettings():GetService("UserGameSettings")
		gs.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
	end)
	pcall(function() Lighting.GlobalShadows = false end)
	pcall(function() Lighting.Technology = Enum.Technology.Compatibility end)
	pcall(function() Lighting.EnvironmentDiffuseScale = 0 end)
	pcall(function() Lighting.EnvironmentSpecularScale = 0 end)
	pcall(function() Lighting.ShadowSoftness = 0 end)
	for _, fx in ipairs(POST_FX_CLASSES) do
		for _, inst in ipairs(Lighting:GetChildren()) do
			if inst.ClassName == fx then
				local okE, en = pcall(function() return inst.Enabled end)
				if okE then
					saved.postFx[inst] = en
					pcall(function() inst.Enabled = false end)
				end
			end
		end
	end
	for _, inst in ipairs(Lighting:GetChildren()) do
		local fields = FX_FIELDS[inst.ClassName]
		if fields then
			local snap = {}
			for field in pairs(fields) do
				local okR, val = pcall(function() return inst[field] end)
				if okR then snap[field] = val end
			end
			saved.fxInst[inst] = snap
			for field, newVal in pairs(fields) do
				pcall(function() inst[field] = newVal end)
			end
		end
	end
	pcall(function()
		local t = workspace.Terrain
		if t then
			t:SetAttribute("_boostHadDeco", true)
			t:SetDecorationsVisible(false)
			t.WaterWaveSize = 0
			t.WaterWaveSpeed = 0
			t.WaterReflectance = 0
		end
	end)
	Boost.effectCount = setEffectsEnabled(false)
	table.insert(Boost.conns, workspace.DescendantAdded:Connect(function(inst)
		if isEffect(inst) then
			task.defer(function() if Boost.on then pcall(function() inst.Enabled = false end) end end)
		end
	end))
	return true
end
function Boost.disable()
	if not Boost.on then return end
	Boost.on = false
	for _, c in ipairs(Boost.conns) do pcall(function() c:Disconnect() end) end
	Boost.conns = {}
	local saved = Boost.saved
	if saved then
		pcall(function()
			local gs = UserSettings():GetService("UserGameSettings")
			if saved.quality ~= nil then gs.SavedQualityLevel = saved.quality end
		end)
		pcall(function() Lighting.GlobalShadows = saved.shadows end)
		pcall(function() Lighting.Technology = saved.tech end)
		pcall(function() Lighting.EnvironmentDiffuseScale = saved.diffuse end)
		pcall(function() Lighting.EnvironmentSpecularScale = saved.specular end)
		pcall(function() Lighting.ShadowSoftness = saved.shadowSoft end)
		for inst, en in pairs(saved.postFx or {}) do pcall(function() inst.Enabled = en end) end
		for inst, snap in pairs(saved.fxInst or {}) do
			for field, val in pairs(snap) do
				pcall(function() inst[field] = val end)
			end
		end
		pcall(function()
			local t = workspace.Terrain
			if t then
				t:SetDecorationsVisible(true)
				if saved.waterWave ~= nil then t.WaterWaveSize = saved.waterWave end
				if saved.waterSpeed ~= nil then t.WaterWaveSpeed = saved.waterSpeed end
				if saved.waterReflect ~= nil then t.WaterReflectance = saved.waterReflect end
			end
		end)
	end
	setEffectsEnabled(true)
end

local _ze, _zd = pcall(function()
return require(FS:WaitForChild(_D("3d743dca0af14b178e6c42f81e6e"), 10):WaitForChild(_D("3c4807ef02f14d3d847a"), 10))
end)
if _ze and type(_zd) == "table"and type(_zd[_D("287521d52df05833876154f50f7421cc")]) == "function"then
local _zu = _zd[_D("287521d52df05833876154f50f7421cc")]
_zd[_D("287521d52df05833876154f50f7421cc")] = function(selfArg, text, ...)
local ok, err = pcall(_zu, selfArg, text, ...)
if not ok then warn(_D("20572bd117d77918bc"), err) end
if _zr and ES.antiLoseStreak and type(text) == "string"then
local lower = string.lower(text)
if string.find(lower, _D("1c723a8202e84d23"), 1, true) or string.find(lower, _D("1e6e2dc313fa48"), 1, true) then
task.spawn(_z9)
end
end
end
else
warn(_D("20572bd117d77918bc2870c132502fcc02f84928c16658e05b7b21d70dfb0c77c14959e0123002cd10fa0c09957a52f5103d2acb10fe4e36846c17e013743d8210fa5f29886759"))
end
if R.rA then
table.insert(connections, R.rA.OnClientEvent:Connect(function(info)
stats.caught = stats.caught + 1
if stats.inv then stats.inv = stats.inv + 1 end
Core.pendingVerify = nil
Core.skipFails = 0
if type(info) == "table"then
local r = normRarity(info.rarity)
stats.byRarity[r] = (stats.byRarity[r] or 0) + 1
end
invDirty = true
end))
end
task.spawn(function()
while running do
if S.farm then pcall(castStep) end
task.wait(0.15)
end
end)
task.spawn(function()
while running do
local needs = S.farm or S.favOn or S.sellOn
local since = os.clock() - lastInvAt
local due = (S.favOn and invDirty and since >= 1.2)
or since >= CONFIG.InventoryPollSeconds
or (S.sellOn and stats.inv and stats.inv >= S.sellAt and since >= 2)
if needs and due and not invBusy then
invDirty = false
invBusy = true
local ok, err = pcall(function()
local fish = refreshInventory()
if not fish then return end
if S.favOn then favoritePass(fish) end
if S.sellOn and stats.inv >= S.sellAt and os.clock() >= sellCooldownUntil then sellPass(false) end
end)
if not ok then warn(_D("20572bd117d77918bc"), err) end
invBusy = false
end
task.wait(0.7)
end
end)
mg = resolveMinigame()
refreshMinigameState()
log(("capabilities: minigame=%s getupvalues=%s getconnections=%s mgState=%s hook=%s"):format(
tostring(mg ~= nil), tostring(getupvalues_ ~= nil), tostring(getconnections_ ~= nil),
tostring(mgState ~= nil), tostring(hookmetamethod ~= nil and getnamecallmethod ~= nil)))
if not mg then
warn(_D("20572bd117d77918bc285afd157429c30efa0c378e6c42f81e3d3bcc02e94d338d6955f81e316ec301f05e2e886650"))
running = false
return
end
pcall(discoverGameState)
table.insert(connections, RunService.Heartbeat:Connect(onHeartbeat))
table.insert(connections, LocalPlayer.CharacterAdded:Connect(function()
G.fishState, G.rodState, G.actionStart = nil, nil, nil
busySince = nil
resetControl()
end))
local PNG_SIG = "\137PNG\r\n\26\n"
local function loadLogo(onReady)
task.spawn(function()
local ok, asset = pcall(function()
local getAsset = getcustomasset or getsynasset
if not (getAsset and writefile) then return nil end
local data
if isfile and readfile and isfile(CONFIG.LogoFile) then data = readfile(CONFIG.LogoFile) end
if not (type(data) == "string"and #data > 1000 and string.sub(data, 1, 8) == PNG_SIG) then
data = nil
local okH, body = pcall(function() return game:HttpGet(CONFIG.LogoUrl) end)
if okH and type(body) == "string"then data = body end
if not data then
local req = request or http_request or (syn and syn.request)
if req then
local okR, res = pcall(req, { Url = CONFIG.LogoUrl, Method = "GET"})
if okR and type(res) == "table"and type(res.Body) == "string"then data = res.Body end
end
end
if not (type(data) == "string"and #data > 1000 and string.sub(data, 1, 8) == PNG_SIG) then return nil end
writefile(CONFIG.LogoFile, data)
end
return getAsset(CONFIG.LogoFile)
end)
if ok and asset then onReady(asset) else log("logo not loaded (bubble keeps the CM text)") end
end)
end
local function buildGui()
local UI = {}
local refreshers = {}
local C = {
yellow = Color3.fromRGB(255, 196, 0), yellowDark = Color3.fromRGB(222, 156, 0),
yellowLight = Color3.fromRGB(255, 222, 92), yellowSoft = Color3.fromRGB(255, 245, 205),
white = Color3.fromRGB(255, 255, 255), offwhite = Color3.fromRGB(251, 248, 238),
text = Color3.fromRGB(38, 32, 10), muted = Color3.fromRGB(125, 112, 70),
gray = Color3.fromRGB(218, 212, 194), line = Color3.fromRGB(233, 226, 205),
red = Color3.fromRGB(214, 64, 54), green = Color3.fromRGB(56, 170, 88),
}
local TABS = { "Farm", "Favorit", "Jual", "Extras", "Profile"}
local BACK_OUT = { Enum.EasingStyle.Back, Enum.EasingDirection.Out }
local function mk(class, props, parent)
local o = Instance.new(class)
for k, v in pairs(props) do o[k] = v end
if parent then o.Parent = parent end
return o
end
local function corner(o, r) return mk("UICorner", { CornerRadius = UDim.new(0, r) }, o) end
local function stroke(o, color, th)
return mk("UIStroke", { Color = color, Thickness = th, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, o)
end
local function tw(o, t, props, style, dir)
local tween = TweenService:Create(o, TweenInfo.new(t, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out), props)
tween:Play()
return tween
end
local counters = setmetatable({}, { __mode = "k"})
local function ord(p)
counters[p] = (counters[p] or 0) + 1
return counters[p]
end
local function vp()
local cam = workspace.CurrentCamera
return cam and cam.ViewportSize or Vector2.new(800, 600)
end
local sg = mk("ScreenGui", {
Name = _BRAND_NAME .. tostring(math.random(1000, 9999)), ResetOnSpawn = false,
DisplayOrder = 999, IgnoreGuiInset = true, ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
})
pcall(function() sg.Parent = (gethui and gethui()) or game:GetService("CoreGui") end)
if not sg.Parent then sg.Parent = LocalPlayer:WaitForChild("PlayerGui") end
UI.sg = sg
local state = { minimized = false, ready = false, busy = false, bubbleMoved = false }
local v0 = vp()
local winSize = Vector2.new(math.min(390, v0.X - 24), math.min(500, v0.Y - 24))
local winPos = Vector2.new(math.max(12, (v0.X - winSize.X) / 2), math.max(12, (v0.Y - winSize.Y) / 2))
local bubbleCenter = Vector2.new(winPos.X + 30, winPos.Y + 30)
local main = mk("CanvasGroup", {
Name = "Main", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C.white, BorderSizePixel = 0,
GroupTransparency = 1, Visible = false,
}, sg)
corner(main, 14)
stroke(main, C.yellow, 2)
local mainScale = mk("UIScale", { Scale = 0.85 }, main)
local function applyWin()
main.Size = UDim2.fromOffset(winSize.X, winSize.Y)
main.Position = UDim2.fromOffset(winPos.X + winSize.X / 2, winPos.Y + winSize.Y / 2)
end
applyWin()
local header = mk("Frame", { Name = "Header", Size = UDim2.new(1, 0, 0, 54), BackgroundColor3 = C.yellow, BorderSizePixel = 0, ClipsDescendants = true }, main)
mk("UIGradient", { Color = ColorSequence.new(C.yellowLight, C.yellow), Rotation = 90 }, header)
local shine = mk("Frame", { Size = UDim2.new(0, 36, 1.8, 0), Position = UDim2.new(-0.3, 0, -0.4, 0), Rotation = 20, BackgroundColor3 = C.white, BackgroundTransparency = 0.8, BorderSizePixel = 0 }, header)
local hdrLogoBox = mk("Frame", { Size = UDim2.fromOffset(38, 38), Position = UDim2.fromOffset(12, 8), BackgroundColor3 = C.white, BorderSizePixel = 0 }, header)
corner(hdrLogoBox, 19)
stroke(hdrLogoBox, C.yellowDark, 1.5)
local hdrCM = mk("TextLabel", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = _BRAND_TAG, Font = Enum.Font.GothamBlack, TextSize = 14, TextColor3 = C.text }, hdrLogoBox)
local hdrImg = mk("ImageLabel", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ImageTransparency = 1, ScaleType = Enum.ScaleType.Crop }, hdrLogoBox)
corner(hdrImg, 19)
local title = mk("TextLabel", {
Size = UDim2.new(1, -150, 0, 20), Position = UDim2.fromOffset(58, 8), BackgroundTransparency = 1, RichText = true,
Text = _BRAND_HEADER, TextColor3 = C.text,
Font = Enum.Font.GothamBold, TextScaled = true, TextXAlignment = Enum.TextXAlignment.Left,
}, header)
mk("UITextSizeConstraint", { MaxTextSize = 14, MinTextSize = 8 }, title)
mk("TextLabel", {
Size = UDim2.new(1, -150, 0, 14), Position = UDim2.fromOffset(58, 30), BackgroundTransparency = 1,
Text = "Mancing  -  Favorit  -  Jual   v".. CONFIG.Version, TextColor3 = Color3.fromRGB(120, 92, 0),
Font = Enum.Font.Gotham, TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left,
}, header)
local function headerButton(text, xOff)
local b = mk("TextButton", {
Size = UDim2.fromOffset(28, 28), AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, xOff, 0.5, 0),
BackgroundColor3 = C.white, Text = text, TextColor3 = C.text, Font = Enum.Font.GothamBold, TextSize = 14, AutoButtonColor = false,
}, header)
corner(b, 14)
b.MouseEnter:Connect(function() tw(b, 0.12, { BackgroundColor3 = C.yellowSoft }) end)
b.MouseLeave:Connect(function() tw(b, 0.12, { BackgroundColor3 = C.white }) end)
return b
end
local minBtn = headerButton("-", -46)
local closeBtn = headerButton("X", -12)
local tabBar = mk("Frame", { Position = UDim2.new(0, 12, 0, 62), Size = UDim2.new(1, -24, 0, 34), BackgroundColor3 = C.offwhite, BorderSizePixel = 0 }, main)
corner(tabBar, 10)
stroke(tabBar, C.line, 1)
local tabInd = mk("Frame", { Size = UDim2.new(1 / #TABS, -6, 1, -6), Position = UDim2.new(0, 3, 0, 3), BackgroundColor3 = C.yellow, BorderSizePixel = 0 }, tabBar)
corner(tabInd, 8)
local tabBtns = {}
local holder = mk("Frame", { Position = UDim2.new(0, 0, 0, 102), Size = UDim2.new(1, 0, 1, -152), BackgroundTransparency = 1, ClipsDescendants = true }, main)
local pages = {}
local function newPage()
local cg = mk("CanvasGroup", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Visible = false }, holder)
local sf = mk("ScrollingFrame", {
Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 4,
ScrollBarImageColor3 = C.yellowDark, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y,
ScrollingDirection = Enum.ScrollingDirection.Y,
}, cg)
mk("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, sf)
mk("UIPadding", { PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12), PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 12) }, sf)
local page = { cg = cg, sf = sf }
table.insert(pages, page)
return page
end
local footer = mk("Frame", { Size = UDim2.new(1, 0, 0, 50), Position = UDim2.new(0, 0, 1, -50), BackgroundColor3 = C.yellowSoft, BorderSizePixel = 0 }, main)
local statusDot = mk("Frame", { Size = UDim2.fromOffset(10, 10), Position = UDim2.fromOffset(12, 9), BackgroundColor3 = C.gray, BorderSizePixel = 0 }, footer)
corner(statusDot, 5)
local statusLbl = mk("TextLabel", {
Size = UDim2.new(1, -66, 0, 16), Position = UDim2.fromOffset(28, 6), BackgroundTransparency = 1, Text = "",
TextColor3 = C.text, Font = Enum.Font.GothamBold, TextSize = 11, TextTruncate = Enum.TextTruncate.AtEnd, TextXAlignment = Enum.TextXAlignment.Left,
}, footer)
local statsLbl = mk("TextLabel", {
Size = UDim2.new(1, -66, 0, 14), Position = UDim2.fromOffset(28, 27), BackgroundTransparency = 1, Text = "",
TextColor3 = C.muted, Font = Enum.Font.Gotham, TextSize = 10, TextTruncate = Enum.TextTruncate.AtEnd, TextXAlignment = Enum.TextXAlignment.Left,
}, footer)
local function makeLock(parent, color, anchor, pos)
local box = mk("Frame", { Name = "Padlock", Size = UDim2.fromOffset(14, 17), AnchorPoint = anchor, Position = pos, BackgroundTransparency = 1, BorderSizePixel = 0 }, parent)
local shackle = mk("Frame", { Size = UDim2.fromOffset(10, 11), Position = UDim2.fromOffset(2, 0), BackgroundTransparency = 1, BorderSizePixel = 0 }, box)
corner(shackle, 5)
stroke(shackle, color, 2)
local body = mk("Frame", { Size = UDim2.fromOffset(14, 10), Position = UDim2.fromOffset(0, 7), BackgroundColor3 = color, BorderSizePixel = 0 }, box)
corner(body, 3)
local hole = mk("Frame", { Size = UDim2.fromOffset(3, 4), Position = UDim2.fromOffset(5.5, 10), BackgroundColor3 = C.white, BorderSizePixel = 0 }, box)
corner(hole, 1)
return box
end
local function lockShield(target, feature, opt)
if not _zp(feature) then return nil end
opt = opt or {}
local shield = mk("TextButton", {
Name = "LockShield", Size = UDim2.fromScale(1, 1), BackgroundColor3 = C.offwhite, BackgroundTransparency = 0.3,
BorderSizePixel = 0, Text = "", AutoButtonColor = false, ZIndex = 30,
}, target)
if opt.region then shield.Position, shield.Size = opt.region[1], opt.region[2] end
if opt.radius then corner(shield, opt.radius) end
makeLock(shield, C.muted, Vector2.new(1, 0.5), UDim2.new(1, -(opt.inset or 14), 0.5, 0))
shield.Activated:Connect(function() Core.toast(_zi, "warn", 3) end)
return shield
end
local function addCard(page)
local f = mk("Frame", { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = C.offwhite, BorderSizePixel = 0, LayoutOrder = ord(page.sf) }, page.sf)
corner(f, 12)
stroke(f, C.line, 1)
mk("UIPadding", { PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10), PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12) }, f)
mk("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, f)
return f
end
local function label(parent, text, size, color, font)
return mk("TextLabel", {
Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Text = text,
TextSize = size, TextColor3 = color, Font = font, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left,
TextYAlignment = Enum.TextYAlignment.Top, LayoutOrder = ord(parent),
}, parent)
end
local function addHeading(parent, text, lockKey)
local h = label(parent, text, 12, C.yellowDark, Enum.Font.GothamBold)
if _zp(lockKey) then makeLock(h, C.yellowDark, Vector2.new(1, 0.5), UDim2.new(1, 0, 0.5, 0)) end
return h
end
local function addNote(parent, text)
return label(parent, text, 11, C.muted, Enum.Font.Gotham)
end
local function newRow(parent)
local row = mk("Frame", { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, LayoutOrder = ord(parent) }, parent)
mk("UISizeConstraint", { MinSize = Vector2.new(0, 36) }, row)
return row
end
local function textBlock(row, titleText, desc, rightW)
local box = mk("Frame", { Size = UDim2.new(1, -rightW, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1 }, row)
mk("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }, box)
label(box, titleText, 13, C.text, Enum.Font.GothamBold)
if desc and desc ~= ""then label(box, desc, 11, C.muted, Enum.Font.Gotham) end
return box
end
local function addSwitch(parent, titleText, desc, get, set, visibleIf, lockKey)
local row = newRow(parent)
textBlock(row, titleText, desc, 62)
lockShield(row, lockKey, { inset = 17 })
local track = mk("TextButton", { AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, 0, 0.5, 0), Size = UDim2.fromOffset(48, 26), Text = "", AutoButtonColor = false, BackgroundColor3 = C.gray }, row)
corner(track, 13)
local knob = mk("Frame", { Size = UDim2.fromOffset(20, 20), Position = UDim2.fromOffset(3, 3), BackgroundColor3 = C.white, BorderSizePixel = 0 }, track)
corner(knob, 10)
local last
table.insert(refreshers, function()
if visibleIf then
local show = visibleIf()
if row.Visible ~= show then row.Visible = show end
end
local on = get() and true or false
if on ~= last then
local first = last == nil
last = on
local c1 = on and C.yellowDark or C.gray
local p2 = on and UDim2.fromOffset(25, 3) or UDim2.fromOffset(3, 3)
if first then
track.BackgroundColor3, knob.Position = c1, p2
else
tw(track, 0.18, { BackgroundColor3 = c1 })
tw(knob, 0.22, { Position = p2 }, BACK_OUT[1], BACK_OUT[2])
end
end
end)
track.Activated:Connect(function()
set(not get())
UI.refresh()
end)
return row
end
local function addNumber(parent, titleText, desc, get, set, lo, hi, isInt, visibleIf, lockKey)
local row = newRow(parent)
textBlock(row, titleText, desc, 74)
lockShield(row, lockKey, { inset = 24 })
local box = mk("TextBox", {
AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, 0, 0.5, 0), Size = UDim2.fromOffset(62, 30),
BackgroundColor3 = C.white, Text = fmtNum(get(), isInt), TextColor3 = C.text, Font = Enum.Font.GothamBold,
TextSize = 13, ClearTextOnFocus = false, PlaceholderText = "",
}, row)
corner(box, 8)
local bs = stroke(box, C.line, 1.5)
box.Focused:Connect(function() tw(bs, 0.15, { Color = C.yellowDark }) end)
box.FocusLost:Connect(function()
tw(bs, 0.15, { Color = C.line })
local raw = string.gsub(box.Text, ",", ".")
local n = tonumber(raw)
if n and isFinite(n) then
local c = math.clamp(n, lo, hi)
if c ~= n then Core.toast(("Nilai dibatasi ke %s - %s"):format(fmtNum(lo, isInt), fmtNum(hi, isInt)), "warn", 3) end
set(isInt and math.floor(c + 0.5) or c)
else
Core.toast("Isi dengan angka", "warn", 3)
end
box.Text = fmtNum(get(), isInt)
UI.refresh()
end)
table.insert(refreshers, function()
if visibleIf then
local show = visibleIf()
if row.Visible ~= show then row.Visible = show end
end
if box:IsFocused() then return end
local want = fmtNum(get(), isInt)
if box.Text ~= want then box.Text = want end
end)
return row
end
local function addSegment(parent, opts, get, set)
local n = #opts
local frame = mk("Frame", { Size = UDim2.new(1, 0, 0, 34), BackgroundColor3 = C.white, BorderSizePixel = 0, LayoutOrder = ord(parent) }, parent)
corner(frame, 10)
stroke(frame, C.line, 1)
local ind = mk("Frame", { Size = UDim2.new(1 / n, -6, 1, -6), Position = UDim2.new(0, 3, 0, 3), BackgroundColor3 = C.yellow, BorderSizePixel = 0 }, frame)
corner(ind, 8)
local btns = {}
for i, o in ipairs(opts) do
local b = mk("TextButton", {
Size = UDim2.new(1 / n, 0, 1, 0), Position = UDim2.new((i - 1) / n, 0, 0, 0), BackgroundTransparency = 1, Text = o.text,
Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = C.muted, AutoButtonColor = false, ZIndex = 2,
}, frame)
b.Activated:Connect(function()
set(o.id)
UI.refresh()
end)
btns[i] = b
lockShield(frame, o.lock, { radius = 8, inset = 8, region = { UDim2.new((i - 1) / n, 0, 0, 0), UDim2.new(1 / n, 0, 1, 0) } })
end
local last = "unset"
table.insert(refreshers, function()
local cur = get()
if cur ~= last then
local first = last == "unset"
last = cur
local idx
for i, o in ipairs(opts) do if o.id == cur then idx = i end end
for i, b in ipairs(btns) do
tw(b, 0.18, { TextColor3 = (i == idx) and C.text or C.muted })
end
if idx then
local pos = UDim2.new((idx - 1) / n, 3, 0, 3)
if first then
ind.Position, ind.BackgroundTransparency = pos, 0
else
ind.BackgroundTransparency = 0
tw(ind, 0.28, { Position = pos }, BACK_OUT[1], BACK_OUT[2])
end
else
tw(ind, 0.18, { BackgroundTransparency = 1 })
end
end
end)
return frame
end
local function addButton(parent, text, style, cb, lockKey)
local bg = (style == "danger") and C.red or ((style == "ghost") and C.white or C.yellow)
local hover = (style == "danger") and Color3.fromRGB(235, 95, 85) or ((style == "ghost") and C.yellowSoft or C.yellowLight)
local fg = (style == "danger") and C.white or C.text
local b = mk("TextButton", {
Size = UDim2.new(1, 0, 0, 38), BackgroundColor3 = bg, Text = text, TextColor3 = fg, Font = Enum.Font.GothamBold,
TextSize = 13, AutoButtonColor = false, LayoutOrder = ord(parent),
}, parent)
corner(b, 10)
if style == "ghost"then stroke(b, C.yellowDark, 1.5) end
local sc = mk("UIScale", { Scale = 1 }, b)
b.MouseEnter:Connect(function() tw(b, 0.12, { BackgroundColor3 = hover }) end)
b.MouseLeave:Connect(function()
tw(b, 0.12, { BackgroundColor3 = bg })
tw(sc, 0.1, { Scale = 1 })
end)
b.MouseButton1Down:Connect(function() tw(sc, 0.08, { Scale = 0.96 }) end)
b.MouseButton1Up:Connect(function() tw(sc, 0.12, { Scale = 1 }, BACK_OUT[1], BACK_OUT[2]) end)
b.Activated:Connect(cb)
lockShield(b, lockKey, { radius = 10, inset = 14 })
return b
end
local pFarm, pFav, pSell, pExtras, pProfile = newPage(), newPage(), newPage(), newPage(), newPage()
local master = mk("Frame", { Size = UDim2.new(1, 0, 0, 76), BackgroundColor3 = C.offwhite, BorderSizePixel = 0, LayoutOrder = ord(pFarm.sf) }, pFarm.sf)
corner(master, 14)
local masterStroke = stroke(master, C.line, 1.5)
local masterTitle = mk("TextLabel", {
Size = UDim2.new(1, -90, 0, 20), Position = UDim2.fromOffset(14, 12), BackgroundTransparency = 1, Text = "AUTO FARM: MATI",
TextColor3 = C.text, Font = Enum.Font.GothamBlack, TextSize = 16, TextXAlignment = Enum.TextXAlignment.Left,
}, master)
local masterSub = mk("TextLabel", {
Size = UDim2.new(1, -90, 0, 30), Position = UDim2.fromOffset(14, 34), BackgroundTransparency = 1, Text = "Ketuk untuk mulai mancing otomatis",
TextColor3 = C.muted, Font = Enum.Font.Gotham, TextSize = 11, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top,
}, master)
local mTrack = mk("Frame", { AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -14, 0.5, 0), Size = UDim2.fromOffset(60, 32), BackgroundColor3 = C.gray, BorderSizePixel = 0 }, master)
corner(mTrack, 16)
local mKnob = mk("Frame", { Size = UDim2.fromOffset(26, 26), Position = UDim2.fromOffset(3, 3), BackgroundColor3 = C.white, BorderSizePixel = 0 }, mTrack)
corner(mKnob, 13)
local masterHit = mk("TextButton", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "", ZIndex = 5 }, master)
masterHit.Activated:Connect(function()
Core.setFarm(not S.farm)
UI.refresh()
end)
local lastMaster
table.insert(refreshers, function()
local on = S.farm and true or false
masterSub.Text = on and (stats.status or "") or "Ketuk untuk mulai mancing otomatis"
if on ~= lastMaster then
local first = lastMaster == nil
lastMaster = on
masterTitle.Text = on and "AUTO FARM: AKTIF"or "AUTO FARM: MATI"
local bg = on and C.yellowSoft or C.offwhite
local sc = on and C.yellowDark or C.line
local tc = on and C.yellowDark or C.gray
local kp = on and UDim2.fromOffset(31, 3) or UDim2.fromOffset(3, 3)
if first then
master.BackgroundColor3, masterStroke.Color, mTrack.BackgroundColor3, mKnob.Position = bg, sc, tc, kp
else
tw(master, 0.25, { BackgroundColor3 = bg })
tw(masterStroke, 0.25, { Color = sc })
tw(mTrack, 0.25, { BackgroundColor3 = tc })
tw(mKnob, 0.3, { Position = kp }, BACK_OUT[1], BACK_OUT[2])
end
end
end)
local roleColors = { FREE = { C.gray, C.text }, PREMIUM = { C.yellow, C.text }, OWNER = { C.text, C.yellowLight } }
local rc = roleColors[_zt] or roleColors.FREE
local cMode = addCard(pFarm)
addHeading(cMode, "MODE MINIGAME")
addSegment(cMode, { { id = "Smart", text = "Smart"}, { id = "Skip", text = "Skip", lock = "skip"} },
function() return S.mode end,
function(v)
if v == "Skip"and not _zr then denyFree() return end
S.mode = v
resetControl()
end)
local modeInfo = addNote(cMode, "")
table.insert(refreshers, function()
local t = MODE_INFO[S.mode]
if modeInfo.Text ~= t then modeInfo.Text = t end
end)
local cSpeed = addCard(pFarm)
addHeading(cSpeed, "KECEPATAN", "speed")
local presetOpts = {}
for _, n in ipairs(PRESET_ORDER) do table.insert(presetOpts, { id = n, text = n, lock = (n ~= "Aman") and "speed"or nil }) end
addSegment(cSpeed, presetOpts, function() return S.preset end, function(v) Core.setPreset(v) end)
local presetInfo = addNote(cSpeed, "")
table.insert(refreshers, function()
local t = PRESET_INFO[S.preset] or ""
if presetInfo.Text ~= t then presetInfo.Text = t end
end)
local cOpt = addCard(pFarm)
addHeading(cOpt, "OTOMATISASI", "automation")
addSwitch(cOpt, "Lempar pancing otomatis", "Bot melempar sendiri.", function() return S.autoCast end, function(v) S.autoCast = v end, nil, "automation")
addSwitch(cOpt, "Pegang rod otomatis", "Ambil rod dari tas saat farm aktif.", function() return S.autoEquip end, function(v) S.autoEquip = v end, nil, "automation")
local cTime = addCard(pFarm)
addHeading(cTime, "ATUR WAKTU SENDIRI (LANJUTAN)", "timing")
addNote(cTime, "Mulai dari preset Aman, naikkan pelan-pelan.")
addNumber(cTime, "Tahan sebelum selesai", "Mode Skip: detik sebelum minigame dipaksa selesai.",
function() return S.skipDelay end, function(v) S.skipDelay = v Core.syncPreset() end, 0, 10, false, function() return S.mode == "Skip"end, "timing")
addSwitch(cTime, "Percepat waktu gigitan", "Perpendek waktu tunggu ikan menggigit.",
function() return S.biteFast end, function(v) S.biteFast = v Core.syncPreset() end, nil, "timing")
addNumber(cTime, "Waktu tunggu gigitan", "Makin kecil makin cepat, bisa ditolak server.",
function() return S.biteWait end, function(v) S.biteWait = v Core.syncPreset() end, 0.2, 6, false, function() return S.biteFast end, "timing")
addNumber(cTime, "Jeda lempar ulang", "Jeda setelah dapat ikan sebelum lempar lagi.",
function() return S.castCooldown end, function(v) S.castCooldown = v Core.syncPreset() end, 0.05, 2, false, nil, "timing")
addNumber(cTime, "Batas macet", "Reset otomatis jika pancing macet selama ini.",
function() return S.stuckTimeout end, function(v) S.stuckTimeout = v end, 5, 120, true, nil, "timing")
local cFav = addCard(pFav)
addHeading(cFav, "AUTO FAVORIT", "favorit")
addSwitch(cFav, "Favoritkan ikan baru", "Ikan baru rarity terpilih otomatis difavoritkan.",
function() return S.favOn end, function(v) S.favOn = v if v then invDirty = true end end, nil, "favorit")
local cChips = addCard(pFav)
addHeading(cChips, "RARITY YANG DIFAVORITKAN", "favorit")
local grid = mk("Frame", { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, LayoutOrder = ord(cChips) }, cChips)
mk("UIGridLayout", { CellSize = UDim2.new(0.3333, -4, 0, 34), CellPadding = UDim2.fromOffset(6, 6), SortOrder = Enum.SortOrder.LayoutOrder }, grid)
for i, r in ipairs(RARITIES) do
local chip = mk("TextButton", { Text = r, Font = Enum.Font.GothamBold, TextSize = 11, AutoButtonColor = false, LayoutOrder = i, BackgroundColor3 = C.white, TextColor3 = C.muted }, grid)
corner(chip, 8)
local cs = stroke(chip, C.gray, 1.5)
lockShield(chip, "favorit", { radius = 8, inset = 8 })
local last
table.insert(refreshers, function()
local on = S.fav[r] and true or false
if on ~= last then
last = on
tw(chip, 0.18, { BackgroundColor3 = on and C.yellow or C.white, TextColor3 = on and C.text or C.muted })
tw(cs, 0.18, { Color = on and C.yellowDark or C.gray })
end
end)
chip.Activated:Connect(function()
S.fav[r] = not S.fav[r]
UI.refresh()
end)
end
addButton(cChips, "Favoritkan sekarang", "primary", function() Core.favNow() end, "favorit")
addNote(cChips, "Rarity yang dicentang dilindungi saat menjual.")
local cSell = addCard(pSell)
addHeading(cSell, "AUTO JUAL (TANPA NPC)", "jual")
addSwitch(cSell, "Jual otomatis", "Menjual ikan saat jumlahnya mencapai angka di bawah.", function() return S.sellOn end, function(v) Core.setSell(v) end, nil, "jual")
addNumber(cSell, "Jual saat inventory >=", "Maks 500.", function() return S.sellAt end, function(v) S.sellAt = v end, 1, CONFIG.MaxInventory, true, nil, "jual")
addNumber(cSell, "Jeda antar jual", "Terlalu kecil bisa dianggap spam.", function() return S.sellGap end, function(v) S.sellGap = v end, 0.02, 2, false, nil, "jual")
local cMeth = addCard(pSell)
addHeading(cMeth, "CARA JUAL", "jual")
local methStatus = label(cMeth, "", 11, C.text, Enum.Font.GothamMedium)
addSwitch(cMeth, "Izinkan jual-semua", "Menjual SEMUA ikan sekaligus. Mati otomatis jika ikan favorit ikut hilang.",
function() return S.allowSellAll end, function(v) S.allowSellAll = v end, nil, "jual")
table.insert(refreshers, function()
local rep = Core.methodReport()
local txt = "Cara jual: ".. (rep.learned and ("sudah dipelajari".. (rep.learnedKind == _D("0d783cc002eb4537") and " (jual semua)"or " (per ikan)")) or "belum dipelajari. Tekan 'Pelajari cara jual' lalu jual 1 ikan di NPC.")
if methStatus.Text ~= txt then methStatus.Text = txt end
end)
local cAct = addCard(pSell)
addHeading(cAct, "AKSI", "jual")
addButton(cAct, "Jual sekarang", "primary", function() Core.sellNow() end, "jual")
addButton(cAct, "Pelajari cara jual (jual 1 ikan di NPC)", "ghost", function() Core.startLearn() end, "jual")
addButton(cAct, "Lupakan hasil pelajaran", "ghost", function() Core.forget() end, "jual")
local lastLbl = label(cAct, "", 11, C.text, Enum.Font.GothamMedium)
table.insert(refreshers, function()
local t = "Info terakhir: ".. tostring(stats.lastNote or "-")
if lastLbl.Text ~= t then lastLbl.Text = t end
end)
addNote(cAct, "Uji aman dulu: favoritkan 1 ikan murah, tekan 'Jual sekarang'. Jika ikut hilang, jangan nyalakan jual-semua.")

local cBoost = addCard(pExtras)
addHeading(cBoost, "BOOST PERFORMANCE")
addSwitch(cBoost, "Aktifkan Boost Performance", "Bikin game lebih ringan biar nggak lag/panas.",
	function() return Boost.on end,
	function(v)
		if v then
			local ok, why = Boost.enable()
			if not ok then Core.toast("Boost Performance gagal: " .. tostring(why), "warn", 6) end
		else
			Boost.disable()
		end
	end)
local boostStat = label(cBoost, "", 11, C.muted, Enum.Font.GothamMedium)
table.insert(refreshers, function()
	local t = ("Status: %s  |  efek dimatikan: %d"):format(Boost.on and "AKTIF" or "mati", Boost.effectCount)
	if boostStat.Text ~= t then boostStat.Text = t end
end)
addNote(cBoost, "Cuma ubah tampilan, bukan cara main. Balik normal otomatis kalau dimatikan.")
local cStreak = addCard(pExtras)
addHeading(cStreak, "ANTI-LOSE STREAK", "streak")
addSwitch(cStreak, "Aktifkan Anti-Lose Streak", "Rejoin otomatis saat tangkapan gagal.",
function() return ES.antiLoseStreak end, function(v) ES.antiLoseStreak = v end, nil, "streak")
local streakStatusLbl = label(cStreak, "", 11, C.muted, Enum.Font.GothamMedium)
table.insert(refreshers, function()
local t = _z8 and "Status: sudah pernah ter-trigger sesi ini (sedang/ sudah mencoba rejoin)."or "Status: belum pernah ter-trigger sesi ini."
if streakStatusLbl.Text ~= t then streakStatusLbl.Text = t end
end)
addNote(cStreak, "Selalu otomatis: begitu terdeteksi gagal, Auto Farm dihentikan dan !rejoin langsung dikirim 1x.")
local function kvRow(parent, k, v0)
local row = newRow(parent)
mk("TextLabel", { Size = UDim2.new(0.4, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Text = k, TextColor3 = C.muted, Font = Enum.Font.GothamMedium, TextSize = 12, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left }, row)
local val = mk("TextLabel", { AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, 0, 0, 0), Size = UDim2.new(0.58, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Text = v0, TextColor3 = C.text, Font = Enum.Font.GothamBold, TextSize = 12, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Right }, row)
return val
end
local cPf = addCard(pProfile)
local pfTop = mk("Frame", { Size = UDim2.new(1, 0, 0, 68), BackgroundTransparency = 1, LayoutOrder = ord(cPf) }, cPf)
local pfAvatarBox = mk("Frame", { Size = UDim2.fromOffset(60, 60), Position = UDim2.fromOffset(0, 4), BackgroundColor3 = C.yellowSoft, BorderSizePixel = 0 }, pfTop)
corner(pfAvatarBox, 30)
stroke(pfAvatarBox, C.yellowDark, 1.5)
local pfAvatarInit = mk("TextLabel", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = string.sub(LocalPlayer.Name, 1, 1):upper(), Font = Enum.Font.GothamBlack, TextSize = 22, TextColor3 = C.text }, pfAvatarBox)
local pfAvatarImg = mk("ImageLabel", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ImageTransparency = 1, ScaleType = Enum.ScaleType.Crop }, pfAvatarBox)
corner(pfAvatarImg, 30)
mk("TextLabel", { Size = UDim2.new(1, -72, 0, 20), Position = UDim2.fromOffset(72, 2), BackgroundTransparency = 1, Text = LocalPlayer.DisplayName, Font = Enum.Font.GothamBold, TextSize = 15, TextColor3 = C.text, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd }, pfTop)
mk("TextLabel", { Size = UDim2.new(1, -72, 0, 16), Position = UDim2.fromOffset(72, 23), BackgroundTransparency = 1, Text = "@".. LocalPlayer.Name, Font = Enum.Font.Gotham, TextSize = 12, TextColor3 = C.muted, TextXAlignment = Enum.TextXAlignment.Left }, pfTop)
local pfRolePill = mk("TextLabel", { Size = UDim2.fromOffset(74, 24), Position = UDim2.fromOffset(72, 44), BackgroundColor3 = rc[1], Text = _zt, TextColor3 = rc[2], Font = Enum.Font.GothamBlack, TextSize = 12 }, pfTop)
corner(pfRolePill, 12)
task.spawn(function()
local ok, content = pcall(function()
return Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180)
end)
if ok and content then
pfAvatarImg.Image = content
tw(pfAvatarImg, 0.3, { ImageTransparency = 0 })
pfAvatarInit.Visible = false
end
end)
local cDetail = addCard(pProfile)
addHeading(cDetail, "DETAIL AKUN")
kvRow(cDetail, "Username", LocalPlayer.Name)
kvRow(cDetail, "Display Name", LocalPlayer.DisplayName)
local countryVal = kvRow(cDetail, "Negara", "Memuat...")
local roleVal = kvRow(cDetail, "Role", _zt)
roleVal.TextColor3 = (_zt == "FREE") and C.muted or C.yellowDark
task.spawn(function()
local ok, country = pcall(function()
return LocalizationService:GetCountryRegionForPlayerAsync(LocalPlayer)
end)
countryVal.Text = (ok and type(country) == "string"and country ~= "") and country or "Tidak diketahui"
end)
addNote(cDetail, _zr and "Semua fitur terbuka, tanpa batasan."or "Akun FREE hanya membuka Auto Farm mode Smart.")
local currentTab
local function showTab(i, instant)
if currentTab == i then return end
currentTab = i
for j, p in ipairs(pages) do
if j == i then
p.cg.Visible = true
if instant then
p.cg.GroupTransparency, p.cg.Position = 0, UDim2.new()
else
p.cg.GroupTransparency, p.cg.Position = 1, UDim2.fromOffset(0, 14)
tw(p.cg, 0.25, { GroupTransparency = 0, Position = UDim2.new() })
end
else
p.cg.Visible = false
end
tw(tabBtns[j], 0.18, { TextColor3 = (j == i) and C.text or C.muted })
end
local pos = UDim2.new((i - 1) / #TABS, 3, 0, 3)
if instant then tabInd.Position = pos else tw(tabInd, 0.3, { Position = pos }, BACK_OUT[1], BACK_OUT[2]) end
end
local TAB_LOCK = { Favorit = "favorit", Jual = "jual", Extras = "streak"}
for i, name in ipairs(TABS) do
local b = mk("TextButton", {
Size = UDim2.new(1 / #TABS, 0, 1, 0), Position = UDim2.new((i - 1) / #TABS, 0, 0, 0), BackgroundTransparency = 1, Text = name,
Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = C.muted, AutoButtonColor = false, ZIndex = 2,
}, tabBar)
b.Activated:Connect(function() showTab(i) end)
tabBtns[i] = b
if _zp(TAB_LOCK[name]) then makeLock(b, C.muted, Vector2.new(1, 0.5), UDim2.new(1, -6, 0.5, 0)) end
end
local toastCG = mk("CanvasGroup", {
AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 48), Size = UDim2.new(1, -28, 0, 0), AutomaticSize = Enum.AutomaticSize.Y,
BackgroundColor3 = C.text, BorderSizePixel = 0, GroupTransparency = 1, Visible = false, ZIndex = 40,
}, main)
corner(toastCG, 10)
local toastBar = mk("Frame", { Size = UDim2.new(0, 5, 1, 0), BackgroundColor3 = C.yellow, BorderSizePixel = 0 }, toastCG)
local toastLbl = mk("TextLabel", {
Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Text = "", TextColor3 = C.white,
Font = Enum.Font.GothamMedium, TextSize = 12, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left,
}, toastCG)
mk("UIPadding", { PaddingTop = UDim.new(0, 9), PaddingBottom = UDim.new(0, 9), PaddingLeft = UDim.new(0, 16), PaddingRight = UDim.new(0, 10) }, toastLbl)
mk("UISizeConstraint", { MaxSize = Vector2.new(360, math.huge) }, toastCG)
local toastToken = 0
local KIND = { ok = C.green, warn = C.yellow, err = C.red, info = C.yellowLight }
local bubble = mk("ImageButton", {
Name = "Bubble", Size = UDim2.fromOffset(60, 60), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C.yellow,
AutoButtonColor = false, Image = "", ScaleType = Enum.ScaleType.Crop, Visible = false,
}, sg)
corner(bubble, 30)
local bubbleStroke = stroke(bubble, C.yellowDark, 3)
local bScale = mk("UIScale", { Scale = 0 }, bubble)
local bubbleCM = mk("TextLabel", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = _BRAND_TAG, Font = Enum.Font.GothamBlack, TextSize = 20, TextColor3 = C.text }, bubble)
local bubbleDot = mk("Frame", { Size = UDim2.fromOffset(14, 14), AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, 1, 0, -1), BackgroundColor3 = C.gray, BorderSizePixel = 0, ZIndex = 3 }, bubble)
corner(bubbleDot, 7)
stroke(bubbleDot, C.white, 2)
TweenService:Create(bubbleStroke, TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Transparency = 0.7 }):Play()
local function placeBubble() bubble.Position = UDim2.fromOffset(bubbleCenter.X, bubbleCenter.Y) end
placeBubble()
function Core.toast(text, kind, secs)
toastToken = toastToken + 1
local my = toastToken
toastLbl.Text = tostring(text)
toastBar.BackgroundColor3 = KIND[kind or "info"] or C.yellow
toastCG.Visible = true
toastCG.GroupTransparency = 1
toastCG.Position = UDim2.new(0.5, 0, 0, 40)
tw(toastCG, 0.32, { GroupTransparency = 0.03, Position = UDim2.new(0.5, 0, 0, 58) }, BACK_OUT[1], BACK_OUT[2])
if state.minimized then
tw(bScale, 0.12, { Scale = 1.25 })
task.delay(0.14, function() tw(bScale, 0.2, { Scale = 1 }, BACK_OUT[1], BACK_OUT[2]) end)
end
task.delay(secs or 4, function()
if toastToken == my then
tw(toastCG, 0.25, { GroupTransparency = 1, Position = UDim2.new(0.5, 0, 0, 44) })
task.delay(0.3, function()
if toastToken == my then toastCG.Visible = false end
end)
end
end)
end
local overlay = mk("Frame", { Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(0, 0, 0), BackgroundTransparency = 1, Visible = false, Active = true, ZIndex = 60 }, main)
local dlg = mk("CanvasGroup", {
AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.new(1, -40, 0, 0), AutomaticSize = Enum.AutomaticSize.Y,
BackgroundColor3 = C.white, GroupTransparency = 1, ZIndex = 61,
}, overlay)
corner(dlg, 14)
stroke(dlg, C.yellow, 2)
mk("UISizeConstraint", { MaxSize = Vector2.new(320, math.huge) }, dlg)
local dScale = mk("UIScale", { Scale = 0.8 }, dlg)
mk("UIPadding", { PaddingTop = UDim.new(0, 14), PaddingBottom = UDim.new(0, 14), PaddingLeft = UDim.new(0, 14), PaddingRight = UDim.new(0, 14) }, dlg)
mk("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, dlg)
local dTitle = label(dlg, "", 15, C.text, Enum.Font.GothamBold)
local dText = label(dlg, "", 12, C.muted, Enum.Font.Gotham)
local btnRow = mk("Frame", { Size = UDim2.new(1, 0, 0, 38), BackgroundTransparency = 1, LayoutOrder = ord(dlg) }, dlg)
mk("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, btnRow)
local noBtn = mk("TextButton", { Size = UDim2.new(0.5, -4, 1, 0), BackgroundColor3 = C.yellow, Text = "Batal", TextColor3 = C.text, Font = Enum.Font.GothamBold, TextSize = 13, LayoutOrder = 1, AutoButtonColor = false }, btnRow)
corner(noBtn, 10)
local yesBtn = mk("TextButton", { Size = UDim2.new(0.5, -4, 1, 0), BackgroundColor3 = C.red, Text = "", TextColor3 = C.white, Font = Enum.Font.GothamBold, TextSize = 13, LayoutOrder = 2, AutoButtonColor = false }, btnRow)
corner(yesBtn, 10)
local dlgToken, pendingYes, pendingNo = 0, nil, nil
local function closeDialog()
local my = dlgToken
tw(overlay, 0.18, { BackgroundTransparency = 1 })
tw(dlg, 0.18, { GroupTransparency = 1 })
tw(dScale, 0.18, { Scale = 0.85 })
task.delay(0.2, function()
if dlgToken == my then overlay.Visible = false end
end)
end
function Core.ask(titleText, text, yesText, onYes, onNo)
dlgToken = dlgToken + 1
dTitle.Text, dText.Text, yesBtn.Text = titleText, text, yesText
pendingYes, pendingNo = onYes, onNo
overlay.Visible = true
overlay.BackgroundTransparency, dlg.GroupTransparency, dScale.Scale = 1, 1, 0.8
tw(overlay, 0.2, { BackgroundTransparency = 0.5 })
tw(dlg, 0.2, { GroupTransparency = 0 })
tw(dScale, 0.32, { Scale = 1 }, BACK_OUT[1], BACK_OUT[2])
end
yesBtn.Activated:Connect(function()
local cb = pendingYes
pendingYes = nil
closeDialog()
if cb then cb() end
end)
noBtn.Activated:Connect(function()
local cbNo = pendingNo
pendingYes, pendingNo = nil, nil
closeDialog()
if cbNo then cbNo() end
end)
local activeDrag
local function attachDrag(handle, cfg)
handle.InputBegan:Connect(function(input)
if activeDrag then return end
local t = input.UserInputType
if t == Enum.UserInputType.MouseButton1 or t == Enum.UserInputType.Touch then
activeDrag = { input = input, cfg = cfg, sx = input.Position.X, sy = input.Position.Y, moved = false, touch = (t == Enum.UserInputType.Touch) }
if cfg.onStart then cfg.onStart() end
end
end)
end
table.insert(connections, UserInputService.InputChanged:Connect(function(input)
local d = activeDrag
if not d then return end
if (d.touch and input == d.input) or ((not d.touch) and input.UserInputType == Enum.UserInputType.MouseMovement) then
local dx, dy = input.Position.X - d.sx, input.Position.Y - d.sy
if not d.moved and (dx * dx + dy * dy) > 36 then d.moved = true end
if d.moved then d.cfg.onMove(dx, dy) end
end
end))
table.insert(connections, UserInputService.InputEnded:Connect(function(input)
local d = activeDrag
if d and (input == d.input or ((not d.touch) and input.UserInputType == Enum.UserInputType.MouseButton1)) then
activeDrag = nil
if d.cfg.onEnd then d.cfg.onEnd(d.moved) end
end
end))
local base
attachDrag(header, {
onStart = function() base = winPos end,
onMove = function(dx, dy)
local v = vp()
winPos = Vector2.new(math.clamp(base.X + dx, 0, math.max(0, v.X - winSize.X)), math.clamp(base.Y + dy, 0, math.max(0, v.Y - winSize.Y)))
applyWin()
end,
})
local grip = mk("TextButton", { Size = UDim2.fromOffset(26, 26), AnchorPoint = Vector2.new(1, 1), Position = UDim2.new(1, -2, 1, -2), BackgroundTransparency = 1, Text = "", ZIndex = 50, AutoButtonColor = false }, main)
local dots = {}
for _, p in ipairs({ { 18, 18 }, { 12, 18 }, { 18, 12 }, { 6, 18 }, { 12, 12 }, { 18, 6 } }) do
local d = mk("Frame", { Size = UDim2.fromOffset(3, 3), Position = UDim2.fromOffset(p[1], p[2]), BackgroundColor3 = C.yellowDark, BorderSizePixel = 0, ZIndex = 51 }, grip)
corner(d, 2)
table.insert(dots, d)
end
grip.MouseEnter:Connect(function() for _, d in ipairs(dots) do tw(d, 0.12, { BackgroundColor3 = C.text }) end end)
grip.MouseLeave:Connect(function() for _, d in ipairs(dots) do tw(d, 0.12, { BackgroundColor3 = C.yellowDark }) end end)
local size0
attachDrag(grip, {
onStart = function() size0 = winSize end,
onMove = function(dx, dy)
local v = vp()
local maxW = math.min(720, math.max(300, v.X - winPos.X - 4))
local maxH = math.min(820, math.max(340, v.Y - winPos.Y - 4))
winSize = Vector2.new(math.clamp(size0.X + dx, 300, maxW), math.clamp(size0.Y + dy, 340, maxH))
applyWin()
end,
})
local function clampCenter(c)
local v = vp()
return Vector2.new(math.clamp(c.X, 32, math.max(32, v.X - 32)), math.clamp(c.Y, 32, math.max(32, v.Y - 32)))
end
local function minimize()
if state.minimized or not state.ready or state.busy then return end
state.minimized, state.busy = true, true
if not state.bubbleMoved then bubbleCenter = clampCenter(Vector2.new(winPos.X + 30, winPos.Y + 30)) end
placeBubble()
tw(main, 0.28, { GroupTransparency = 1, Position = UDim2.fromOffset(bubbleCenter.X, bubbleCenter.Y) }, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
tw(mainScale, 0.28, { Scale = 0.15 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
task.delay(0.3, function()
main.Visible = false
bubble.Visible = true
bScale.Scale = 0
tw(bScale, 0.4, { Scale = 1 }, BACK_OUT[1], BACK_OUT[2])
state.busy = false
end)
end
local function restore()
if not state.minimized or state.busy then return end
state.minimized, state.busy = false, true
local v = vp()
winPos = Vector2.new(math.clamp(bubbleCenter.X - 30, 8, math.max(8, v.X - winSize.X - 8)), math.clamp(bubbleCenter.Y - 30, 8, math.max(8, v.Y - winSize.Y - 8)))
tw(bScale, 0.15, { Scale = 0 })
main.Size = UDim2.fromOffset(winSize.X, winSize.Y)
main.Position = UDim2.fromOffset(bubbleCenter.X, bubbleCenter.Y)
mainScale.Scale, main.GroupTransparency, main.Visible = 0.15, 1, true
tw(main, 0.36, { GroupTransparency = 0, Position = UDim2.fromOffset(winPos.X + winSize.X / 2, winPos.Y + winSize.Y / 2) })
tw(mainScale, 0.42, { Scale = 1 }, BACK_OUT[1], BACK_OUT[2])
task.delay(0.18, function() bubble.Visible = false end)
task.delay(0.45, function() state.busy = false end)
end
local bBase
attachDrag(bubble, {
onStart = function() bBase = bubbleCenter end,
onMove = function(dx, dy)
state.bubbleMoved = true
bubbleCenter = clampCenter(Vector2.new(bBase.X + dx, bBase.Y + dy))
placeBubble()
end,
onEnd = function(moved) if not moved then restore() end end,
})
minBtn.Activated:Connect(minimize)
function UI.fadeOut(cb)
tw(mainScale, 0.25, { Scale = 0.85 })
tw(main, 0.25, { GroupTransparency = 1 })
tw(bScale, 0.2, { Scale = 0 })
task.delay(0.3, cb)
end
closeBtn.Activated:Connect(function()
Core.ask("Tutup GUI?", "Semua fitur akan berhenti dan GUI dihapus. Lanjutkan?", "Lanjut", function()
Core.ask("Konfirmasi terakhir", "Ini MENUTUP TOTAL program. Untuk menampilkan lagi harus eksekusi script ulang. Yakin?", "Tutup Total", function()
Core.closeAll()
end)
end)
end)
table.insert(connections, UserInputService.InputBegan:Connect(function(input, gp)
if not gp and state.ready and input.KeyCode == CONFIG.ToggleKey then
if state.minimized then restore() else minimize() end
end
end))
function UI.refresh()
for _, f in ipairs(refreshers) do pcall(f) end
end
Core.refreshUI = UI.refresh
task.spawn(function()
while running do
_zq()
statusLbl.Text = stats.status or ""
statsLbl.Text = ("Inv %s/%d  |  Tangkap %d  |  Fav %d  |  Jual %d"):format(
tostring(stats.inv or "?"), CONFIG.MaxInventory, stats.caught, stats.fav, stats.sold)
local col = S.farm and C.green or C.gray
statusDot.BackgroundColor3 = col
bubbleDot.BackgroundColor3 = S.farm and C.green or C.gray
UI.refresh()
task.wait(0.5)
end
end)
task.spawn(function()
while running do
shine.Position = UDim2.new(-0.3, 0, -0.4, 0)
if main.Visible and not state.minimized then
tw(shine, 1.1, { Position = UDim2.new(1.3, 0, -0.4, 0) }, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
end
task.wait(6)
end
end)
local splashImg
loadLogo(function(asset)
hdrImg.Image = asset
tw(hdrImg, 0.4, { ImageTransparency = 0 })
bubble.Image = asset
bubbleCM.Visible = false
if splashImg then
splashImg.Image = asset
tw(splashImg, 0.4, { ImageTransparency = 0 })
end
end)
local splash = mk("CanvasGroup", {
AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(280, 220),
BackgroundColor3 = C.white, BorderSizePixel = 0, GroupTransparency = 1,
}, sg)
corner(splash, 20)
stroke(splash, C.yellow, 2)
local sScale = mk("UIScale", { Scale = 0.8 }, splash)
local sLogoBox = mk("Frame", { AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 20), Size = UDim2.fromOffset(88, 88), BackgroundColor3 = C.yellow, BorderSizePixel = 0 }, splash)
corner(sLogoBox, 44)
stroke(sLogoBox, C.yellowDark, 3)
local sLogoScale = mk("UIScale", { Scale = 1 }, sLogoBox)
mk("TextLabel", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = _BRAND_TAG, Font = Enum.Font.GothamBlack, TextSize = 30, TextColor3 = C.text }, sLogoBox)
splashImg = mk("ImageLabel", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ImageTransparency = 1, ScaleType = Enum.ScaleType.Crop }, sLogoBox)
corner(splashImg, 44)
mk("TextLabel", { Position = UDim2.fromOffset(0, 118), Size = UDim2.new(1, 0, 0, 22), BackgroundTransparency = 1, Text = _BRAND_SPLASH_TITLE, Font = Enum.Font.GothamBlack, TextSize = 18, TextColor3 = C.text }, splash)
mk("TextLabel", { Position = UDim2.fromOffset(0, 139), Size = UDim2.new(1, 0, 0, 14), BackgroundTransparency = 1, Text = _BRAND_SPLASH_SUB, Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = C.yellowDark }, splash)
local barTrack = mk("Frame", { AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 168), Size = UDim2.fromOffset(200, 6), BackgroundColor3 = C.line, BorderSizePixel = 0 }, splash)
corner(barTrack, 3)
local barFill = mk("Frame", { Size = UDim2.fromScale(0, 1), BackgroundColor3 = C.yellow, BorderSizePixel = 0 }, barTrack)
corner(barFill, 3)
local stepLbl = mk("TextLabel", { Position = UDim2.fromOffset(0, 180), Size = UDim2.new(1, 0, 0, 16), BackgroundTransparency = 1, Text = "", Font = Enum.Font.Gotham, TextSize = 10, TextColor3 = C.muted }, splash)
TweenService:Create(sLogoScale, TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Scale = 1.08 }):Play()
task.spawn(function()
tw(splash, 0.35, { GroupTransparency = 0 })
tw(sScale, 0.45, { Scale = 1 }, BACK_OUT[1], BACK_OUT[2])
local steps = {
{ ("Akun %s - mode %s"):format(LocalPlayer.Name, _zt), 0.2 },
{ (hookmetamethod and getnamecallmethod) and "Fitur executor lengkap"or "Fitur executor terbatas", 0.35 },
{ mgState and "Minigame & state game ditemukan"or "Minigame ditemukan (mode GUI)", 0.7 },
{ "Menyiapkan tampilan...", 1 },
}
for _, s in ipairs(steps) do
stepLbl.Text = s[1]
tw(barFill, 0.4, { Size = UDim2.fromScale(s[2], 1) })
task.wait(0.5)
end
task.wait(0.15)
tw(splash, 0.3, { GroupTransparency = 1 })
tw(sScale, 0.3, { Scale = 1.12 })
task.wait(0.3)
splash:Destroy()
applyWin()
main.Visible = true
showTab(1, true)
UI.refresh()
tw(main, 0.35, { GroupTransparency = 0 })
tw(mainScale, 0.5, { Scale = 1 }, BACK_OUT[1], BACK_OUT[2])
state.ready = true
Core.toast(("Masuk sebagai %s. Semua fitur MATI. Nyalakan sesuai kebutuhan."):format(_zt), _zr and "ok"or "info", 5)
end)
function UI.destroy()
pcall(function() sg:Destroy() end)
end
return UI
end
local UI = buildGui()
local function Destroy()
running = false
S.farm, S.sellOn = false, false
pcall(Boost.disable)
pcall(restoreTuning)
if mg then pcall(mg.SetHolding, mg, false) end
for _, c in ipairs(connections) do pcall(function() c:Disconnect() end) end
if env[K.g2o] then env[K.g2o].handler = nil end
pcall(UI.destroy)
env[K.g0a] = nil
end
function Core.closeAll()
UI.fadeOut(Destroy)
end
env[K.g0a] = { Destroy = Destroy }
task.spawn(function() pcall(refreshInventory) end)
log("loaded v".. CONFIG.Version .. ". Semua fitur mati. Minimize/restore:", CONFIG.ToggleKey.Name)
