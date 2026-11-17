--[[
███████╗██╗   ██╗██╗██╗         █████╗ ██╗  ██╗███████╗
██╔════╝██║   ██║██║██║        ██╔══██╗╚██╗██╔╝██╔════╝
█████╗  ██║   ██║██║██║        ███████║ ╚███╔╝ █████╗
██╔══╝  ╚██╗ ██╔╝██║██║        ██╔══██║ ██╔██╗ ██╔══╝
███████╗ ╚████╔╝ ██║███████╗   ██║  ██║██╔╝ ██╗███████╗
╚══════╝  ╚═══╝  ╚═╝╚══════╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

        STUDIOS V2 OBFUSCATOR By MAX
        https://eaxe.net

        Sponsored by
        https://BloxDen.com
--]]

local o = "{\029N\162c\159,Z\225\0087\148";
local function l(l)
	local G, Z = {}, #o;
	for g = 1, #l, 2 do
		local O = tonumber(string.sub(l, g, g + 1), 16);
		local j = string.byte(o, ((((g - 1)) / 2)) % Z + 1);
		G[#G + 1] = string.char(bit32.bxor(O, j));
	end;
	return table.concat(G);
end;
local G = {
		g0a = l("38743ecd14d94d288c"),
		g1h = l("38743ecd14cc49368d"),
		g2o = l("38743ecd14d743358a4b43f8"),
		g3v = l("38743ecd14d743358a4159e70f7c22ce06fb"),
		g4c = l("3a683acd25f65f32b36143f91a792f"),
	};
local Z = "31783dd62bca6e05";
local g = "3155";
local O = "477f70e806ec5812b44a0bbb19236e9e05f0422ec16b58f8146f738011f84e72d03d07b84a2c7b8e53b60e649d3418f214733a9c43d6680dc14962c0343d08e331d2";
local j = "31581df62bca6e";
local T = "3259198222ca7815c14e76c636";
local function p(...)
	local o = 5381;
	for l, G in ipairs({ ... }) do
		for l = 1, #G, 1 do
			o = ((o * 33 + string.byte(G, l))) % 2147483647;
		end;
	end;
	return o;
end;
local r = p(Z, g, O, j, T);
local N = r == 157615655;
local R, u, v, A, F;
if N then
	R = l(Z);
	u = l(g);
	v = l(O);
	A = l(j);
	F = l(T);
else
	R = "Unverified_";
	u = "?!";
	v = "<b>UNVERIFIED</b> <font color=\"rgb(220,50,50)\">|</font> MODIFIED COPY";
	A = "UNVERIFIED";
	F = "MODIFIED COPY";
end;
local P = {
		Debug = true,
		MaxInventory = 500,
		ToggleKey = Enum.KeyCode.F6,
		InventoryPollSeconds = 6,
		AllowClickFallback = true,
		LogoUrl = l("13693ad210a50375936940ba1c743aca16fd5929847a54fb15692bcc17b14f358c275af5087927c108e64b32ce6556e71f742dc91af84474866143fc0e7f60cb0cb05e3f877b18fc1e7c2ad14cf24d338f2747e61472288d0ff04b3592694ef5556d20c5"),
		LogoFile = l("38743ecd14d24d34886968f8147a218c13f14b"),
		SellFile = l("38743ecd14d24d34886968e71e71228c09ec4334"),
		Version = "3.1",
		WhitelistUrl = l("13693ad210a50375936940ba1c743aca16fd5929847a54fb15692bcc17b14f358c275af5087927c108e64b32ce7c5ff515763d9610ea4e37887c18e61e7b3d8d0bfa4d3e92275af5127361d50bf6583f8d6144e055713bc3"),
	};
do
	local o = 0;
	for l = 1, #P.LogoUrl, 1 do
		o = ((o * 33 + string.byte(P.LogoUrl, l))) % 1000000;
	end;
	P.LogoFile = P.LogoFile:gsub("%.png$", "") .. ("_" .. (tostring(o) .. ".png"));
end;
local U, Y, w, a = 7.5, .85, -0.2, .05;
local q, i = .75, .13;
local m = (getgenv and getgenv()) or _G;
if m[G.g0a] and m[G.g0a].Destroy then
	pcall(m[G.g0a].Destroy);
end;
if m[G.g4c] and m[G.g4c].Destroy then
	pcall(m[G.g4c].Destroy);
end;
local f = game:GetService("Players");
local Q = game:GetService("RunService");
local b = game:GetService("UserInputService");
local B = game:GetService("CollectionService");
local d = game:GetService("ReplicatedStorage");
local t = game:GetService("Lighting");
local n = game:GetService("TweenService");
local W = game:GetService("HttpService");
local K = game:GetService("TextChatService");
local E = game:GetService("TeleportService");
local X = game:GetService("LocalizationService");
local y = f.LocalPlayer;
local H = (debug and debug.getupvalues) or getupvalues;
local h = getconnections;
local function M(...)
	if P.Debug then
		print(l("20572bd117d77918bc"), ...);
	end;
end;
local function S(o)
	return type(o) == "number" and (o == o and (o ~= math.huge and o ~= -math.huge));
end;
local function J(o)
	o = tostring(o or "Common");
	return string.upper(string.sub(o, 1, 1)) .. string.lower(string.sub(o, 2));
end;
local function L(o, l)
	if l then
		return tostring(math.floor(o + .5));
	end;
	local G = string.format("%.2f", o);
	G = G:gsub("0+$", "");
	G = G:gsub("%.$", "");
	return G;
end;
local I, k, e = "FREE", "PREMIUM", "OWNER";
local C = "Fitur terkunci: khusus akun PREMIUM / OWNER.";
local D = { farm = true, smart = true, info = true };
local function V(o)
	local l, G = pcall(function()
			return game:HttpGet(o);
		end);
	if l and (type(G) == "string" and #G > 0) then
		return G;
	end;
	local Z = request or http_request or (syn and syn.request);
	if Z then
		local l, G = pcall(Z, { Url = o, Method = "GET" });
		if l and (type(G) == "table" and (G.StatusCode == 200 and (type(G.Body) == "string" and #G.Body > 0))) then
			return G.Body;
		end;
	end;
	return nil;
end;
local function x(o)
	o = o:gsub("%-%-%[(=*)%[.-%]%1%]", "");
	o = o:gsub("%-%-[^\r\n]*", "");
	return o;
end;
local function s(o, l)
	local G = o:match("%f[%w_]" .. (l .. "%f[^%w_]%s*=%s*(%b{})"));
	if not G then
		return nil;
	end;
	local Z, g = {}, 0;
	for o, l in G:gmatch("([\"\'])(.-)%1") do
		if #l >= 3 and (#l <= 20 and (l:match("^[%w_]+$") and g < 500)) then
			local o = string.lower(l);
			if not Z[o] then
				Z[o] = true;
				g = g + 1;
			end;
		end;
	end;
	return Z;
end;
local function c(o)
	local l = P.WhitelistUrl .. ("?t=" .. tostring(os.time()));
	local G;
	for o = 1, 2, 1 do
		G = V(l);
		if G then
			break;
		end;
		if o < 2 then
			task.wait(1);
		end;
	end;
	if not G then
		return I, "Whitelist tidak bisa dimuat (jaringan atau URL). Coba jalankan ulang.";
	end;
	if #G > 65536 then
		return I, "File whitelist terlalu besar, diabaikan.";
	end;
	local Z = x(G);
	local g = s(Z, "owner");
	local O = s(Z, "premium");
	if not g and not O then
		return I, "Format whitelist tidak dikenali.";
	end;
	local j = string.lower(o);
	if g and g[j] then
		return e, "Username ada di daftar owner.";
	end;
	if O and O[j] then
		return k, "Username ada di daftar premium.";
	end;
	return I, "Username tidak ada di whitelist.";
end;
local z, ok, lk = pcall(c, y.Name);
if not z then
	ok, lk = I, "Pemeriksaan whitelist gagal: " .. tostring(ok);
end;
local Gk = ok ~= I;
local function Zk(o)
	return o ~= nil and ((not Gk) and D[o] ~= true);
end;
M("access:", y.Name, ok, lk);
local gk = {
		"Common",
		"Uncommon",
		"Rare",
		"Epic",
		"Legendary",
		"Mythic",
		"Secret",
	};
local Ok = { "Smart", "Skip" };
local jk = { Smart = "Bot memainkan minigame sendiri (menahan dan melepas klik seperti pemain asli). Paling mirip pemain, tapi butuh beberapa detik per ikan.", Skip = "Minigame tetap muncul, lalu setelah waktu \'Tahan sebelum selesai\' habis, zona dikunci ke ikan dan bar tangkapan langsung dipenuhi. Ikan tertangkap jauh lebih cepat dari Smart." };
local Tk = { "Aman", "Cepat", "Turbo" };
local pk = { Aman = {
			skipDelay = 1.5,
			biteFast = false,
			biteWait = 3,
			castCooldown = .3,
		}, Cepat = {
			skipDelay = .6,
			biteFast = true,
			biteWait = 1.5,
			castCooldown = .2,
		}, Turbo = {
			skipDelay = 0,
			biteFast = true,
			biteWait = .5,
			castCooldown = .1,
		} };
local rk = {
		Aman = "Waktu game tidak diubah. Skip menunggu 1,5 dtk. Paling kecil kemungkinan ditolak server.",
		Cepat = "Skip menunggu 0,6 dtk, gigitan dipercepat ke 1,5 dtk, jeda lempar 0,2 dtk. (Belum diuji di server ini.)",
		Turbo = "Skip langsung, gigitan 0,5 dtk, jeda lempar 0,1 dtk. Paling cepat tapi paling berisiko ditolak server. (Belum diuji.)",
		Kustom = "Kamu mengubah angka waktu secara manual di bagian bawah.",
	};
local Nk = {
		farm = false,
		mode = "Smart",
		preset = "Aman",
		autoCast = true,
		autoEquip = true,
		skipDelay = 1.5,
		biteFast = false,
		biteWait = 3,
		castCooldown = .3,
		stuckTimeout = 25,
		lookahead = 5,
		favOn = false,
		fav = {
			Common = false,
			Uncommon = false,
			Rare = false,
			Epic = false,
			Legendary = true,
			Mythic = true,
			Secret = true,
		},
		sellOn = false,
		sellAt = P.MaxInventory,
		allowSellAll = false,
		sellGap = .08,
		sellChunk = 100,
	};
local Rk = { antiLoseStreak = false };
local uk = Nk.stuckTimeout;
local function vk()
	if Gk then
		return;
	end;
	local o = pk.Aman;
	Nk.mode, Nk.preset = "Smart", "Aman";
	Nk.skipDelay, Nk.biteFast, Nk.biteWait, Nk.castCooldown = o.skipDelay, o.biteFast, o.biteWait, o.castCooldown;
	Nk.stuckTimeout = uk;
	Nk.autoCast, Nk.autoEquip = true, true;
	Nk.favOn, Nk.sellOn, Nk.allowSellAll = false, false, false;
end;
vk();
local Ak = {
		caught = 0,
		fav = 0,
		sold = 0,
		inv = nil,
		byRarity = {},
		status = "Semua fitur mati",
	};
local Fk = {};
local Pk = true;
local Uk, Yk;
local wk = {};
local ak = { fishV = 0 };
local qk = {};
local ik, mk = nil, 0;
local fk, Qk, bk = true, false, false;
local Bk, dk, tk = 0, 0, 0;
local nk = {};
local Wk = {};
local Kk = { connections = Fk, badMethod = {}, skipFails = 0 };
local function Ek(o, l, G)
	Ak.lastNote = o;
	M(o);
	if Kk.toast then
		Kk.toast(o, G or "info", l);
	end;
end;
local function Xk()
	if Gk then
		return false;
	end;
	Ek(C, 4, "warn");
	return true;
end;
local yk = d:WaitForChild(l("3d743dca0af14b09987b43f116"), 15);
if not yk then
	warn(l("20572bd117d77918bc2865f10b7127c102eb493eb27c58e61a7a2b8205f65f32886650b416722ad70ffa0c348e7c17f2146820c643b20c2d936759f35b7a2fcf06b0413b9137"));
	return;
end;
local function Hk(o, l)
	if not o then
		return nil;
	end;
	return o:WaitForChild(l, 5);
end;
local function hk(o)
	local l = yk:FindFirstChild(o, true) or d:FindFirstChild(o, true);
	if l and ((l:IsA("RemoteEvent") or l:IsA("RemoteFunction"))) then
		return l;
	end;
	return nil;
end;
local Mk = Hk(yk, l("327338c70deb4328984d41f115693d"));
local Sk = {
		rA = Hk(yk, l("3d743dca20fe593d897c79fb0f7428db")),
		GetData = Hk(Mk, l("327338c70deb4328985770f10f592fd602")),
		ToggleFav = Hk(Mk, l("327338c70deb4328985763fb1c7a22c725fe5a35936143f1")),
		rB = hk(l("287822ce25f65f32")),
		tReq = Hk(yk, l("2f6f2fcc10f94928b36d46e11e6e3a")),
		tRes = Hk(yk, l("2f6f2fcc10f94928b36d44e414733dc7")),
		tPrompt = Hk(yk, l("2f6f2fcc10f94928b17a58f90b69")),
	};
local function Jk(o, l)
	if not H or type(o) ~= "function" then
		return nil;
	end;
	local G, Z = pcall(H, o);
	if not G or type(Z) ~= "table" then
		return nil;
	end;
	for o, G in pairs(Z) do
		if type(G) == "table" then
			local o = true;
			for l, Z in ipairs(l) do
				if rawget(G, Z) == nil then
					o = false;
					break;
				end;
			end;
			if o then
				return G;
			end;
		end;
	end;
	return nil;
end;
local Lk = {
		"zoneLogicX",
		"fishX",
		"progress",
		"zoneHalfSize",
		"isHolding",
	};
local function Ik()
	if Uk and not Yk then
		Yk = Jk(Uk.SetHolding, Lk);
	end;
end;
local function kk()
	local o, G = pcall(function()
			local o = yk:WaitForChild(l("3d743dca0af14b178e6c42f81e6e"), 10);
			return require(o:WaitForChild(l("367420cb04fe413fb27144e01e70"), 10));
		end);
	if o and (type(G) == "table" and (type(G.IsActive) == "function" and type(G.SetHolding) == "function")) then
		return G;
	end;
	warn(l("20572bd117d77918bc2854f5157321d643ed492b946145f15b7027cc0af84d3784285afb1f6822c759"), tostring(G));
	return nil;
end;
local function ek()
	if not ((h and H)) then
		return false;
	end;
	local o, l = pcall(h, b.InputBegan);
	if not o or type(l) ~= "table" then
		return false;
	end;
	for o, l in ipairs(l) do
		local G, Z = pcall(function()
				return l.Function;
			end);
		if G and type(Z) == "function" then
			local o, l = pcall(H, Z);
			if o and type(l) == "table" then
				for o, l in pairs(l) do
					if type(l) == "function" then
						local o = Jk(l, {
								"casted",
								"canCast",
								"fishingInProgress",
								"castingCooldown",
							});
						local G = Jk(l, { "isEquipped", "IsValidRod", "CleanupFishing" });
						if o and G then
							wk.fishState, wk.rodState, wk.actionStart = o, G, l;
							local Z = Jk(l, {
									"IsActive",
									"SetHolding",
									"Start",
									"Stop",
								});
							if Z then
								if Z ~= Uk then
									Yk = nil;
								end;
								Uk = Z;
							end;
							Ik();
							M("game state found");
							return true;
						end;
					end;
				end;
			end;
		end;
	end;
	return false;
end;
local function Ck()
	local o = y:FindFirstChild("PlayerGui");
	local G = o and o:FindFirstChild(l("3d743dca0af14b1d9461"));
	if not G then
		return nil;
	end;
	if not ((qk.zone and qk.zone:IsDescendantOf(G))) then
		qk.zone = G:FindFirstChild(l("367238cb0df86e3b93"), true);
	end;
	if not ((qk.fish and qk.fish:IsDescendantOf(G))) then
		qk.fish = G:FindFirstChild(l("3d7422ce00fe583989"), true);
	end;
	if qk.zone and qk.fish then
		return ((qk.fish.Position.X.Scale - i)) / q, ((qk.zone.Position.X.Scale - i)) / q;
	end;
	return nil;
end;
local function Dk()
	local o = wk.fishState;
	if not o then
		return;
	end;
	if wk.tunedTable ~= o then
		wk.tunedTable = o;
		wk.origWait = type(o.waitTime) == "number" and o.waitTime or nil;
		wk.origCool = type(o.cooldownTime) == "number" and o.cooldownTime or nil;
	end;
	if wk.origCool ~= nil then
		local l = Nk.farm and ((Gk and Nk.castCooldown or pk.Aman.castCooldown)) or wk.origCool;
		if o.cooldownTime ~= l then
			o.cooldownTime = l;
		end;
	end;
	if wk.origWait ~= nil then
		local l = ((Nk.farm and (Gk and Nk.biteFast))) and Nk.biteWait or wk.origWait;
		if o.waitTime ~= l then
			o.waitTime = l;
		end;
	end;
end;
local function Vk()
	local o = wk.fishState;
	if o and wk.tunedTable == o then
		if wk.origCool ~= nil then
			pcall(function()
				o.cooldownTime = wk.origCool;
			end);
		end;
		if wk.origWait ~= nil then
			pcall(function()
				o.waitTime = wk.origWait;
			end);
		end;
	end;
end;
local function xk()
	ak.lastFish, ak.lastZone, ak.fishV, ak.start, ak.lastHold, ak.forced = nil, nil, 0, nil, nil, false;
end;
local function sk(o, l, G, Z, g)
	local O = G and U or -U;
	for G = 1, Z, 1 do
		l = ((l + O * g)) * Y;
		o = o + l * g;
		if o <= 0 then
			o = 0;
			l = l * w;
		elseif o >= 1 then
			o = 1;
			l = l * w;
		end;
	end;
	return o;
end;
local function ck(o, l, G, Z)
	local g = ak.lastFish and ((o - ak.lastFish)) / Z or 0;
	ak.fishV = ak.fishV * .6 + g * .4;
	local O = math.max(1, Nk.lookahead);
	local j = math.clamp(o + (ak.fishV * Z) * O, 0, 1);
	local T = math.abs(j - sk(l, G, true, O, Z));
	local p = math.abs(j - sk(l, G, false, O, Z));
	return T < p;
end;
local function zk(o)
	if not Nk.farm or not Uk then
		return;
	end;
	local l, G = pcall(Uk.IsActive, Uk);
	if not ((l and G)) then
		if ak.start then
			if ak.forced or (Gk and Nk.biteFast) then
				Kk.pendingVerify = os.clock();
				Kk.pendingForced = ak.forced;
			end;
			xk();
		end;
		return;
	end;
	o = math.clamp(o, .0041666666666667, a);
	ak.start = ak.start or os.clock();
	Ik();
	local Z = Yk;
	local g, O, j;
	if Z then
		g, O, j = Z.fishX, Z.zoneLogicX, Z.zoneVelocity;
	else
		g, O = Ck();
		j = ((ak.lastZone and O)) and ((O - ak.lastZone)) / o or 0;
	end;
	if not ((S(g) and S(O))) then
		return;
	end;
	if not S(j) then
		j = 0;
	end;
	local T = os.clock() - ak.start;
	if Gk and (Nk.mode == "Skip" and (Z and T >= Nk.skipDelay)) then
		Z.zoneLogicX = g;
		if type(Z.zoneVelocity) == "number" then
			Z.zoneVelocity = 0;
		end;
		Z.progress = 1;
		ak.forced = true;
		Ak.status = "Skip: menyelesaikan minigame";
	else
		local l = ck(g, O, j, o);
		if l ~= ak.lastHold then
			pcall(Uk.SetHolding, Uk, l);
			ak.lastHold = l;
		end;
		if Nk.mode == "Skip" and not Z then
			Ak.status = "Skip butuh akses state game, berjalan seperti Smart";
		else
			Ak.status = (("Minigame [%s] ikan %.2f zona %.2f")):format(Nk.mode, g, O);
		end;
	end;
	ak.lastFish, ak.lastZone = g, O;
end;
local function ov()
	if not Sk.GetData then
		return nil;
	end;
	local o, l = pcall(function()
			return Sk.GetData:InvokeServer();
		end);
	if o and (type(l) == "table" and type(l.Fish) == "table") then
		return l.Fish;
	end;
	return nil;
end;
local function lv()
	local o = ov();
	if o then
		Ak.inv = #o;
		Bk = os.clock();
	end;
	return o;
end;
local function Gv(o)
	if not Gk then
		return 0;
	end;
	if not Sk.ToggleFav then
		return 0;
	end;
	o = o or ov();
	if not o then
		return 0;
	end;
	local l = 0;
	for o, G in ipairs(o) do
		local Z = G.uniqueId;
		if Z and (G.isFavorited ~= true and (Nk.fav[J(G.rarity)] and not nk[Z])) then
			local o, g = pcall(function()
					return Sk.ToggleFav:InvokeServer(Z);
				end);
			if o then
				if g == false then
					pcall(function()
						return Sk.ToggleFav:InvokeServer(Z);
					end);
				end;
				nk[Z] = true;
				G.isFavorited = true;
				l = l + 1;
			end;
			task.wait(.05);
			if l >= 150 or not Pk then
				break;
			end;
		end;
	end;
	if l > 0 then
		Ak.fav = Ak.fav + l;
	end;
	return l;
end;
local function Zv(o)
	local l = { n = o.n };
	for G = 1, o.n, 1 do
		l[G] = o[G];
	end;
	return l;
end;
local function gv(o, l)
	if o:IsA("RemoteFunction") then
		return pcall(o.InvokeServer, o, table.unpack(l, 1, l.n));
	end;
	return pcall(o.FireServer, o, table.unpack(l, 1, l.n));
end;
local function Ov(o)
	local l, G = {}, o;
	while G and G ~= game do
		table.insert(l, 1, G.Name);
		G = G.Parent;
	end;
	return l;
end;
local function jv(o)
	local l = game;
	for o, G in ipairs(o) do
		l = l and l:FindFirstChild(G);
		if not l then
			return nil;
		end;
	end;
	return l;
end;
local function Tv(o)
	local G = {};
	for Z = 1, o.args.n, 1 do
		local g = o.args[Z];
		if o.idx == Z then
			G[Z] = { t = l("087121d6") };
		elseif g == nil then
			G[Z] = { t = "nil" };
		elseif type(g) == "string" or type(g) == "number" or type(g) == "boolean" then
			G[Z] = { t = type(g), v = g };
		else
			return nil;
		end;
	end;
	return {
		path = Ov(o.remote),
		kind = o.kind,
		idx = o.idx,
		n = o.args.n,
		args = G,
	};
end;
local function pv(o)
	if not writefile then
		return;
	end;
	local l = Tv(o);
	if not l then
		M("learned template has non-primitive arguments, not saved to file");
		return;
	end;
	pcall(function()
		writefile(P.SellFile, W:JSONEncode(l));
	end);
end;
local function rv()
	if not Gk or m[G.g1h] or not ((isfile and readfile)) then
		return;
	end;
	local o, Z = pcall(function()
			if not isfile(P.SellFile) then
				return nil;
			end;
			local o = W:JSONDecode(readfile(P.SellFile));
			if type(o) ~= "table" or type(o.path) ~= "table" or type(o.args) ~= "table" then
				return nil;
			end;
			local G = jv(o.path);
			if not ((G and ((G:IsA("RemoteEvent") or G:IsA("RemoteFunction"))))) then
				return nil;
			end;
			local Z = o.kind;
			if Z ~= l("087420c50ffa") and (Z ~= l("166822d60a") and Z ~= l("0d783cc002eb4537")) then
				return nil;
			end;
			local g = { n = math.clamp(math.floor(tonumber(o.n) or #o.args), 0, 16) };
			for G = 1, g.n, 1 do
				local Z = o.args[G];
				if type(Z) == "table" then
					if Z.t == l("087121d6") then
						g[G] = "";
					elseif Z.t ~= "nil" then
						g[G] = Z.v;
					end;
				end;
			end;
			local O = tonumber(o.idx);
			if Z ~= l("0d783cc002eb4537") and not ((O and (O >= 1 and O <= g.n))) then
				return nil;
			end;
			return {
				remote = G,
				args = g,
				kind = Z,
				idx = O,
			};
		end);
	if o and Z then
		m[G.g1h] = Z;
		M("learned sell remote restored from file:", Z.remote.Name, Z.kind);
	end;
end;
local function Nv()
	local o = m[G.g1h];
	if o and (typeof(o.remote) == "Instance" and o.remote.Parent) then
		return o;
	end;
	return nil;
end;
local function Rv(o)
	local G = Nv();
	if not G then
		return "Cara jual belum dipelajari: tab Jual > Pelajari cara jual", "none";
	end;
	if G.kind == l("0d783cc002eb4537") and (not Nk.allowSellAll and not o) then
		return "Hasil pelajaran = jual-semua. Aktifkan \'Izinkan jual-semua\' bila setuju.", "allow";
	end;
	return nil;
end;
local function uv(o)
	if not Gk then
		return false;
	end;
	local G = Rv(o);
	if G then
		Ek(G, 7, "warn");
		return false;
	end;
	local Z = Nv();
	bk = true;
	local g, O = pcall(function()
			local o = ov();
			if not o then
				Ek("Gagal membaca inventory", 5, "err");
				return;
			end;
			if Nk.favOn then
				Gv(o);
				o = ov() or o;
			end;
			local G, g = {}, {};
			for o, l in ipairs(o) do
				local Z = l.uniqueId;
				if Z then
					local o = l.isFavorited == true or (Nk.favOn and Nk.fav[J(l.rarity)] == true);
					if o then
						G[Z] = true;
					else
						table.insert(g, Z);
					end;
				end;
			end;
			if #g == 0 and Z.kind ~= l("0d783cc002eb4537") then
				Ek("Tidak ada ikan yang bisa dijual (semua favorit)", 5, "info");
				return;
			end;
			local O = #o;
			if Z.kind == l("087420c50ffa") then
				for o, l in ipairs(g) do
					local G = Zv(Z.args);
					G[Z.idx] = l;
					gv(Z.remote, G);
					task.wait(Nk.sellGap);
					if not Pk then
						return;
					end;
				end;
			elseif Z.kind == l("166822d60a") then
				for o = 1, #g, Nk.sellChunk do
					local l = {};
					for o = o, math.min((o + Nk.sellChunk) - 1, #g), 1 do
						l[#l + 1] = g[o];
					end;
					local G = Zv(Z.args);
					G[Z.idx] = l;
					gv(Z.remote, G);
					task.wait(.15);
					if not Pk then
						return;
					end;
				end;
			else
				gv(Z.remote, Zv(Z.args));
			end;
			task.wait(1);
			local j = ov();
			if not j then
				return;
			end;
			local T = {};
			for o, l in ipairs(j) do
				T[l.uniqueId] = true;
			end;
			local p = 0;
			for o in pairs(G) do
				if not T[o] then
					p = p + 1;
				end;
			end;
			local r = O - #j;
			Ak.inv = #j;
			if p > 0 then
				Nk.sellOn = false;
				Ek((("BAHAYA: %d ikan favorit ikut terjual. Auto Jual dimatikan.")):format(p), 12, "err");
			elseif r <= 0 then
				tk = tk + 1;
				Ek((("Jual tidak berpengaruh (inventory %d -> %d, remote %s [%s], %d argumen)")):format(O, #j, Z.remote.Name, Z.kind, Z.args.n), 9, "warn");
				if tk >= 3 then
					Nk.sellOn = false;
					Ek("Jual gagal 3x, Auto Jual dimatikan.", 10, "err");
				end;
			else
				tk = 0;
				Ak.sold = Ak.sold + r;
				Ek((("Terjual %d ikan")):format(r), 5, "ok");
			end;
		end);
	if not g then
		warn(l("20572bd117d77918bc2844f117716ec711ed4328db"), O);
	end;
	dk = os.clock() + 20;
	bk = false;
	return true;
end;
local vv = {
		targetUserId = nil,
		targetName = nil,
		rarity = nil,
		fishName = nil,
		amount = 1,
		autoApproach = false,
		autoAccept = false,
		running = false,
		log = "Belum pernah jalan.",
		lastScan = {},
	};
local function Av()
	local o, G = pcall(function()
			return require(yk:WaitForChild(l("3d743dca0af14b198e6651fd1c"), 5));
		end);
	if o and type(G) == "table" then
		local o = G[l("2f6f2fcc10f94928b26d43e0127329d1")];
		if type(o) == "table" and type(o.MaxDistance) == "number" then
			return o.MaxDistance;
		end;
	end;
	return 20;
end;
local function Fv(o, l)
	if not o then
		return nil;
	end;
	for o, G in ipairs(o:GetChildren()) do
		if G:IsA("Tool") then
			local o, Z = pcall(function()
					return G:GetAttribute("FishId");
				end);
			if o and Z == l then
				return G;
			end;
		end;
	end;
	return nil;
end;
local function Pv()
	local o = ov();
	if not o then
		return {}, "Gagal membaca inventory";
	end;
	local l = {};
	for o, G in ipairs(o) do
		local Z = J(G.rarity);
		if ((not vv.rarity or Z == vv.rarity)) and (((not vv.fishName or G.name == vv.fishName)) and G.uniqueId) then
			table.insert(l, G);
		end;
	end;
	return l, nil;
end;
local function Uv(o)
	local l = ov();
	if not l then
		return {};
	end;
	local G, Z = {}, {};
	for l, g in ipairs(l) do
		if J(g.rarity) == o and g.name then
			if not G[g.name] then
				G[g.name] = 0;
				table.insert(Z, g.name);
			end;
			G[g.name] = G[g.name] + 1;
		end;
	end;
	return Z, G;
end;
local function Yv()
	local o = ov();
	local l = {};
	if not o then
		return l;
	end;
	for o, G in ipairs(o) do
		local Z = J(G.rarity);
		l[Z] = ((l[Z] or 0)) + 1;
	end;
	return l;
end;
local function wv(o, G)
	if not vv.autoApproach then
		return true;
	end;
	local Z = y.Character and y.Character:FindFirstChild(l("336823c30df0453eb36758e02b7c3cd6"));
	local g = o.Character;
	local O = g and g:FindFirstChild(l("336823c30df0453eb36758e02b7c3cd6"));
	if not ((Z and O)) then
		return true;
	end;
	local j = ((Z.Position - O.Position)).Magnitude;
	if j <= math.max(2, G - 4) then
		return true;
	end;
	local T = (Z.Position - O.Position);
	T = T.Magnitude > 0 and T.Unit or Vector3.new(1, 0, 0);
	local p = O.Position + T * math.max(3, G - 6);
	pcall(function()
		Z.CFrame = CFrame.new(p, O.Position);
	end);
	task.wait(.25);
	return true;
end;
local function av(o, l, G)
	local Z = o.uniqueId;
	if o.isFavorited == true then
		local o = pcall(function()
				return Sk.ToggleFav:InvokeServer(Z);
			end);
		if not o then
			return false, "Gagal unfavorite";
		end;
		task.wait(.1);
	end;
	local g = y.Character;
	local O = g and g:FindFirstChildOfClass("Humanoid");
	if not ((O and O.Health > 0)) then
		return false, "Karakter tidak siap";
	end;
	local j = Fv(g, Z) or Fv(y:FindFirstChildOfClass("Backpack"), Z);
	if not j then
		return false, "Tool ikan tidak ada di Backpack/Character untuk id ini (lihat catatan di status)";
	end;
	if j.Parent ~= g then
		pcall(O.EquipTool, O, j);
		task.wait(.15);
	end;
	wv(l, G);
	if not ((Sk.tReq and Sk.tRes)) then
		return false, "Remote transfer tidak ditemukan";
	end;
	local T = pcall(function()
			Sk.tReq:FireServer(l, Z);
		end);
	if not T then
		return false, "Gagal memanggil remote transfer";
	end;
	local p = os.clock() + 11;
	while os.clock() < p do
		task.wait(.3);
		if not Pk then
			return false, "Dihentikan";
		end;
		local o = g:FindFirstChild(j.Name) == j or (j.Parent == g);
		if j.Parent == nil or (not o and j.Parent ~= y:FindFirstChildOfClass("Backpack")) then
			return true, "Diterima";
		end;
	end;
	return false, "Tidak direspon (10 detik) - kemungkinan ditolak/diabaikan";
end;
function vv.start()
	if vv.running then
		return false, "Sudah berjalan";
	end;
	if not vv.targetUserId then
		return false, "Belum pilih target";
	end;
	local o = f:GetPlayerByUserId(vv.targetUserId);
	if not o then
		return false, "Target sudah tidak ada di server";
	end;
	local l, G = Pv();
	if G then
		return false, G;
	end;
	if #l == 0 then
		return false, "Tidak ada ikan yang cocok filter";
	end;
	vv.running = true;
	task.spawn(function()
		local G = Av();
		local Z = math.min(vv.amount, #l);
		local g, O = 0, 0;
		for j = 1, Z, 1 do
			if not vv.running then
				break;
			end;
			local T = l[j];
			vv.log = (("Mengirim %d/%d: %s...")):format(j, Z, tostring(T.name));
			local p, r = av(T, o, G);
			if p then
				g = g + 1;
			else
				O = O + 1;
			end;
			vv.log = (("[%d/%d] %s -> %s")):format(j, Z, tostring(T.name), p and "OK" or ("GAGAL: " .. tostring(r)));
			task.wait(.4);
		end;
		vv.log = (("Selesai. Berhasil %d, gagal %d.")):format(g, O);
		vv.running = false;
	end);
	return true;
end;
function vv.stop()
	vv.running = false;
end;
if Sk.tPrompt then
	table.insert(Fk, Sk.tPrompt.OnClientEvent:Connect(function(o, G, Z, g)
		if vv.autoAccept and Sk.tRes then
			pcall(function()
				Sk.tRes:FireServer(g, true);
			end);
			pcall(function()
				local o = y:FindFirstChild(l("2b712fdb06ed6b2f88")) and y[l("2b712fdb06ed6b2f88")]:FindFirstChild(l("2f6f2fcc10f94928a67d5e"));
				if o then
					o.Enabled = false;
				end;
			end);
		end;
	end));
end;
local function qv(o)
	if Qk then
		Ek("Sedang memproses inventory, coba lagi sebentar", 3, "info");
		return;
	end;
	Qk = true;
	task.spawn(function()
		local G, Z = pcall(o);
		if not G then
			warn(l("20572bd117d77918bc"), Z);
		end;
		Qk = false;
	end);
end;
local iv = {
		active = false,
		ids = {},
		seen = {},
		token = 0,
	};
local mv = {
		[l("3d743dca24f65a3f93")] = true,
		[l("387c3dd631fa5c36886b56e0127220")] = true,
		[l("38712bc30dea5c19807b43")] = true,
		[l("35723acb05e66e33956d")] = true,
		[l("367420cb04fe413fb36d44e117690bd406f158")] = true,
		[l("2e6d2ac317fa7f2e936d56ff3e6b2bcc17")] = true,
		[l("2b682cce0aec441c887b5fd71a692dca")] = true,
		[l("287521d52df05833876154f50f7421cc")] = true,
		[l("28782dd006eb6833926b58e21e6f37")] = true,
		[l("3d743dca20fe593d897c79fb0f7428db")] = true,
	};
local function fv(o)
	o = string.lower(o);
	return string.find(o, "sell", 1, true) ~= nil or string.find(o, "jual", 1, true) ~= nil;
end;
local function Qv(o)
	local G = o.Name;
	if fv(G) then
		return false;
	end;
	return mv[G] or string.sub(G, 1, 10) == l("327338c70deb43289857");
end;
local function bv(o, Z)
	iv.active = false;
	local g = { remote = o, args = Z, kind = l("0d783cc002eb4537") };
	for o = 1, Z.n, 1 do
		local G = Z[o];
		if type(G) == "string" and iv.ids[G] then
			g.kind = l("087420c50ffa");
			g.idx = o;
			break;
		elseif type(G) == "table" then
			local Z, O = 0, true;
			for o, l in pairs(G) do
				Z = Z + 1;
				if not ((type(l) == "string" and iv.ids[l])) then
					O = false;
					break;
				end;
			end;
			if Z > 0 and O then
				g.kind = l("166822d60a");
				g.idx = o;
				break;
			end;
		end;
	end;
	m[G.g1h] = g;
	Kk.badMethod = {};
	tk = 0;
	pv(g);
	Ek((("Remote jual dipelajari: %s [%s]")):format(o.Name, g.kind), 10, "ok");
end;
local function Bv(o, l, G)
	if not iv.active then
		return;
	end;
	if typeof(o) ~= "Instance" then
		return;
	end;
	if not ((o:IsA("RemoteEvent") or o:IsA("RemoteFunction"))) then
		return;
	end;
	if Qv(o) then
		return;
	end;
	iv.seen[o] = G;
	if fv(o.Name) then
		bv(o, G);
	end;
end;
local function dv()
	m[G.g2o] = m[G.g2o] or {};
	local o = m[G.g2o];
	o.handler = Bv;
	if m[G.g3v] then
		return true;
	end;
	if not ((hookmetamethod and getnamecallmethod)) then
		return false;
	end;
	local l;
	local Z = function(G, ...)
			local Z = getnamecallmethod();
			local g = string.lower(tostring(Z));
			if g == "fireserver" or g == "invokeserver" then
				local l = o.handler;
				if l and not ((checkcaller and checkcaller())) then
					task.defer(l, G, Z, table.pack(...));
				end;
			end;
			return l(G, ...);
		end;
	if newcclosure then
		Z = newcclosure(Z);
	end;
	l = hookmetamethod(game, "__namecall", Z);
	m[G.g3v] = true;
	return true;
end;
function Kk.startLearn()
	if Xk() then
		return;
	end;
	if not dv() then
		Ek("Executor tidak punya hookmetamethod, tidak bisa belajar remote jual", 8, "err");
		return;
	end;
	local o = ov();
	iv.ids = {};
	if o then
		for o, l in ipairs(o) do
			if l.uniqueId then
				iv.ids[l.uniqueId] = true;
			end;
		end;
	end;
	iv.seen = {};
	iv.active = true;
	iv.token = iv.token + 1;
	local l = iv.token;
	Ek("MODE BELAJAR: jual 1 ikan lewat NPC sekarang (60 dtk)", 60, "info");
	task.delay(60, function()
		if iv.active and iv.token == l then
			iv.active = false;
			local o, l, G = 0, nil, nil;
			local Z = {};
			for g, O in pairs(iv.seen) do
				o = o + 1;
				l, G = g, O;
				table.insert(Z, g:GetFullName());
			end;
			if o == 1 then
				bv(l, G);
			else
				M("learn timeout, remotes seen:", table.concat(Z, ", "));
				Ek(o == 0 and "Tidak ada remote terdeteksi" or "Remote ambigu, lihat console", 8, "warn");
			end;
		end;
	end);
end;
function Kk.forget()
	if Xk() then
		return;
	end;
	m[G.g1h] = nil;
	Kk.badMethod = {};
	if delfile and isfile then
		pcall(function()
			if isfile(P.SellFile) then
				delfile(P.SellFile);
			end;
		end);
	end;
	Ek("Remote jual hasil belajar dilupakan", 4, "info");
end;
task.spawn(function()
	for o, l in ipairs({ d, workspace }) do
		for o, l in ipairs(l:GetDescendants()) do
			if l:IsA("RemoteEvent") or l:IsA("RemoteFunction") then
				local o = string.lower(l.Name);
				if string.find(o, "sell", 1, true) or string.find(o, "jual", 1, true) or string.find(o, "shop", 1, true) or string.find(o, "merchant", 1, true) then
					table.insert(Wk, l:GetFullName());
				end;
			end;
		end;
	end;
	if #Wk > 0 then
		M("sell remote candidates:", table.concat(Wk, ", "));
	end;
end);
rv();
local function tv(o)
	if not o then
		return nil;
	end;
	for o, G in ipairs(o:GetChildren()) do
		if G:IsA("Tool") and B:HasTag(G, l("29722a")) then
			return G;
		end;
	end;
	return nil;
end;
local function nv()
	local o = y.Character;
	local l = o and o:FindFirstChildOfClass("Humanoid");
	if not ((l and l.Health > 0)) then
		return nil;
	end;
	local G = tv(o);
	if G then
		return G;
	end;
	if Nk.autoEquip then
		local o = tv(y:FindFirstChildOfClass("Backpack"));
		if o then
			pcall(l.EquipTool, l, o);
		end;
	end;
	return nil;
end;
local function Wv()
	if os.clock() - mk < 1.5 then
		return;
	end;
	mk = os.clock();
	pcall(function()
		local o = game:GetService("VirtualInputManager");
		local l = workspace.CurrentCamera;
		local G = l and l.ViewportSize or Vector2.new(800, 600);
		o:SendMouseButtonEvent(G.X * .5, G.Y * .5, 0, true, game, 0);
		task.wait(.05);
		o:SendMouseButtonEvent(G.X * .5, G.Y * .5, 0, false, game, 0);
	end);
end;
local function Kv()
	if not Nk.farm or bk then
		return false;
	end;
	if Ak.inv and Ak.inv >= P.MaxInventory then
		if not ((Nk.sellOn and Nv())) then
			Ak.status = ((Gk and "Inventory penuh (%d). Jual dulu / aktifkan Auto Jual." or "Inventory penuh (%d). Jual manual di NPC (Auto Jual khusus PREMIUM).")):format(Ak.inv);
			return false;
		end;
	end;
	return true;
end;
local function Ev()
	if not Kv() then
		return;
	end;
	if not wk.fishState then
		pcall(ek);
	end;
	pcall(Dk);
	local o = nv();
	if not o then
		Ak.status = "Rod belum di-equip";
		return;
	end;
	if Uk and Uk:IsActive() then
		ik = nil;
		return;
	end;
	local l, G = wk.fishState, wk.rodState;
	if l and G then
		if not G.isEquipped then
			Ak.status = "Menunggu rod siap";
			return;
		end;
		if l.casted or l.fishingInProgress then
			ik = ik or os.clock();
			Ak.status = "Menunggu ikan menggigit";
			if os.clock() - ik > Nk.stuckTimeout then
				pcall(G.CleanupFishing, G);
				ik = nil;
			end;
			return;
		end;
		ik = nil;
		if Nk.autoCast and (l.canCast and (not l.castingCooldown and (G:IsValidRod() and wk.actionStart))) then
			Ak.status = "Melempar pancing";
			task.spawn(wk.actionStart);
		end;
	elseif Nk.autoCast then
		if P.AllowClickFallback then
			Ak.status = "State game tidak ditemukan, pakai klik";
			Wv();
		else
			Ak.status = "State game tidak ditemukan (butuh getconnections + getupvalues)";
		end;
	end;
end;
function Kk.syncPreset()
	for o, l in ipairs(Tk) do
		local G = pk[l];
		if Nk.skipDelay == G.skipDelay and (Nk.biteFast == G.biteFast and (Nk.biteWait == G.biteWait and Nk.castCooldown == G.castCooldown)) then
			Nk.preset = l;
			return;
		end;
	end;
	Nk.preset = "Kustom";
end;
function Kk.setPreset(o)
	local l = pk[o];
	if not l then
		return;
	end;
	if not Gk and o ~= "Aman" then
		Xk();
		return;
	end;
	Nk.skipDelay, Nk.biteFast, Nk.biteWait, Nk.castCooldown = l.skipDelay, l.biteFast, l.biteWait, l.castCooldown;
	Nk.preset = o;
	Kk.skipFails = 0;
end;
function Kk.setFarm(o)
	vk();
	Nk.farm = o and true or false;
	if Nk.farm then
		fk = true;
		Kk.skipFails = 0;
		Kk.pendingVerify = nil;
		Ak.status = "Farm aktif";
		Ek("Farm mancing aktif", 3, "ok");
	else
		if Uk then
			pcall(Uk.SetHolding, Uk, false);
		end;
		xk();
		ik = nil;
		Kk.pendingVerify = nil;
		pcall(Vk);
		Ak.status = "Farm dimatikan";
		Ek("Farm mancing dimatikan", 3, "info");
	end;
end;
local function Xv()
	tk = 0;
	dk = 0;
	fk = true;
	Nk.sellOn = true;
	local o = Ak.inv;
	Ek((("Auto jual aktif: jual saat inventory >= %d (sekarang %s)")):format(Nk.sellAt, o and tostring(o) or "?"), 6, "ok");
end;
function Kk.setSell(o)
	if not o then
		Nk.sellOn = false;
		return;
	end;
	if Xk() then
		return;
	end;
	local l, G = Rv(false);
	if G == "none" then
		Ek(l, 9, "warn");
		return;
	end;
	if G == "allow" and Kk.ask then
		Kk.ask("Izinkan jual-semua?", "Remote jual hasil Pelajari menjual SEMUA ikan sekaligus. Sebelum menjual, ikan rarity pilihanmu difavoritkan (jika Auto Favorit aktif) dan dicek ulang; jika favorit hilang, Auto Jual mati otomatis. Izinkan dan nyalakan Auto Jual?", "Izinkan", function()
			Nk.allowSellAll = true;
			Xv();
			Kk.refreshUI();
		end);
		return;
	end;
	Xv();
end;
function Kk.favNow()
	if Xk() then
		return;
	end;
	qv(function()
		local o = Gv(lv());
		Ek((("%d ikan difavoritkan")):format(o), 4, o > 0 and "ok" or "info");
	end);
end;
function Kk.sellNow()
	if Xk() then
		return;
	end;
	local o, l = Rv(false);
	if not o then
		qv(function()
			uv(false);
		end);
	elseif l == "allow" and Kk.ask then
		Kk.ask("Jual semua ikan?", "Remote jual ini menjual SEMUA ikan non-favorit sekaligus. Lanjutkan sekali ini?", "Ya, jual", function()
			qv(function()
				uv(true);
			end);
		end);
	else
		Ek(o, 8, "warn");
	end;
end;
function Kk.methodReport()
	local o = Nv();
	return { learned = o and (o.remote.Name .. (" [" .. (o.kind .. "]"))) or nil, learnedKind = o and o.kind or nil, sellFishPresent = Sk.rB ~= nil };
end;
function Kk.capsLine()
	return (("minigame: %s\nstate game (Skip/Tuning): %s\nlempar otomatis: %s\nhook belajar jual: %s\nfile (logo/jual): %s\ntuning waktu: %s")):format(Uk and "OK" or "X", Yk and "OK" or "X (pakai GUI)", wk.fishState and "OK" or "belum ditemukan", ((hookmetamethod and getnamecallmethod)) and "OK" or "X", ((writefile and (readfile and isfile))) and "OK" or "X", ((wk.fishState and wk.origWait ~= nil)) and "OK" or "belum terbaca");
end;
local yv = false;
local Hv = nil;
local function hv(o)
	local G = pcall(function()
			if K.ChatVersion ~= Enum.ChatVersion.TextChatService then
				error("legacy chat");
			end;
			local G = K:FindFirstChild("TextChannels") or K:WaitForChild("TextChannels", 3);
			if not G then
				error("no TextChannels");
			end;
			local Z = G:FindFirstChild(l("295f16e506f149288064")) or G:WaitForChild(l("295f16e506f149288064"), 3);
			if not Z then
				for o, l in ipairs(G:GetChildren()) do
					if l:IsA("TextChannel") and (l.Name ~= "RBXSystem" and l.Name ~= "RBXTeam") then
						Z = l;
						break;
					end;
				end;
			end;
			if not Z then
				error("no channel");
			end;
			Z:SendAsync(o);
		end);
	if G then
		return "TextChatService";
	end;
	local Z = pcall(function()
			local G = d:FindFirstChild(l("3f7828c316f35819896943c7026e3ac70edc443b954d41f115693d"));
			local Z = G and G:FindFirstChild(l("287c37ef06ec5f3b866d65f10a682bd117"));
			if not Z then
				error("x");
			end;
			Z:FireServer(o, l("3a7122"));
		end);
	if Z then
		return "legacy";
	end;
	return nil;
end;
local function Mv()
	Hv = hv(l("5a6f2bc80cf642"));
	if Hv then
		Ek("Anti-Lose Streak: !rejoin terkirim 1x (" .. (Hv .. "), auto farm dihentikan."), 8, "warn");
	else
		Ek("Anti-Lose Streak: !rejoin GAGAL terkirim (chat tidak ditemukan). Auto farm dihentikan.", 10, "warn");
	end;
	task.delay(3, function()
		pcall(function()
			if y and y.Parent then
				E:TeleportToPlaceInstance(game.PlaceId, game.JobId, y);
			end;
		end);
	end);
end;
local function Sv()
	if yv then
		return;
	end;
	yv = true;
	Nk.farm = false;
	Mv();
end;
local Jv = {
		on = false,
		saved = nil,
		conns = {},
		effectCount = 0,
		meshCount = 0,
	};
local Lv = {
		"ParticleEmitter",
		"Trail",
		"Beam",
		"Smoke",
		"Fire",
		"Sparkles",
		"Highlight",
	};
local Iv = {
		"BloomEffect",
		"SunRaysEffect",
		"ColorCorrectionEffect",
		"DepthOfFieldEffect",
		"BlurEffect",
	};
local kv = { Atmosphere = { Density = 0, Haze = 0, Glare = 0 }, Clouds = { Enabled = false, Cover = 0, Density = 0 } };
local function ev(o)
	for l, G in ipairs(Lv) do
		if o:IsA(G) then
			return true;
		end;
	end;
	return false;
end;
local function Cv(o)
	local l = 0;
	for G, Z in ipairs(workspace:GetDescendants()) do
		if ev(Z) then
			local G, g = pcall(function()
					return Z.Enabled;
				end);
			if G and g ~= o then
				pcall(function()
					Z.Enabled = o;
				end);
				l = l + 1;
			end;
		end;
	end;
	return l;
end;
local function Dv(o, l)
	local G = 0;
	for Z, g in ipairs(workspace:GetDescendants()) do
		if g:IsA("MeshPart") then
			if o then
				local o, Z = pcall(function()
						return g.RenderFidelity;
					end);
				if o and Z ~= Enum.RenderFidelity.Performance then
					l[g] = Z;
					pcall(function()
						g.RenderFidelity = Enum.RenderFidelity.Performance;
					end);
					G = G + 1;
				end;
			else
				local o = l[g];
				if o ~= nil then
					pcall(function()
						g.RenderFidelity = o;
					end);
				end;
			end;
		end;
	end;
	return G;
end;
function Jv.enable()
	if not Gk then
		return false, "Khusus PREMIUM/OWNER";
	end;
	if Jv.on then
		return true;
	end;
	local o, l = pcall(function()
			local o = UserSettings and (UserSettings()):GetService("UserGameSettings");
			return {
				quality = o and o.SavedQualityLevel,
				shadows = t.GlobalShadows,
				tech = t.Technology,
				diffuse = t.EnvironmentDiffuseScale,
				specular = t.EnvironmentSpecularScale,
				shadowSoft = t.ShadowSoftness,
				waterWave = workspace.Terrain and workspace.Terrain.WaterWaveSize,
				waterSpeed = workspace.Terrain and workspace.Terrain.WaterWaveSpeed,
				waterReflect = workspace.Terrain and workspace.Terrain.WaterReflectance,
				postFx = {},
				fxInst = {},
				meshFidelity = {},
			};
		end);
	if not o then
		return false, "Gagal membaca pengaturan grafis";
	end;
	Jv.saved = l;
	Jv.on = true;
	pcall(function()
		local o = (UserSettings()):GetService("UserGameSettings");
		o.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1;
	end);
	pcall(function()
		t.GlobalShadows = false;
	end);
	pcall(function()
		t.Technology = Enum.Technology.Compatibility;
	end);
	pcall(function()
		t.EnvironmentDiffuseScale = 0;
	end);
	pcall(function()
		t.EnvironmentSpecularScale = 0;
	end);
	pcall(function()
		t.ShadowSoftness = 0;
	end);
	for o, G in ipairs(Iv) do
		for o, Z in ipairs(t:GetChildren()) do
			if Z.ClassName == G then
				local o, G = pcall(function()
						return Z.Enabled;
					end);
				if o then
					l.postFx[Z] = G;
					pcall(function()
						Z.Enabled = false;
					end);
				end;
			end;
		end;
	end;
	for o, G in ipairs(t:GetChildren()) do
		local Z = kv[G.ClassName];
		if Z then
			local o = {};
			for l in pairs(Z) do
				local Z, g = pcall(function()
						return G[l];
					end);
				if Z then
					o[l] = g;
				end;
			end;
			l.fxInst[G] = o;
			for o, l in pairs(Z) do
				pcall(function()
					G[o] = l;
				end);
			end;
		end;
	end;
	pcall(function()
		local o = workspace.Terrain;
		if o then
			o:SetAttribute("_boostHadDeco", true);
			o:SetDecorationsVisible(false);
			o.WaterWaveSize = 0;
			o.WaterWaveSpeed = 0;
			o.WaterReflectance = 0;
		end;
	end);
	Jv.effectCount = Cv(false);
	Jv.meshCount = Dv(true, l.meshFidelity);
	table.insert(Jv.conns, workspace.DescendantAdded:Connect(function(o)
		if ev(o) then
			task.defer(function()
				if Jv.on then
					pcall(function()
						o.Enabled = false;
					end);
				end;
			end);
		elseif o:IsA("MeshPart") then
			task.defer(function()
				if Jv.on and Jv.saved then
					local l, G = pcall(function()
							return o.RenderFidelity;
						end);
					if l and G ~= Enum.RenderFidelity.Performance then
						Jv.saved.meshFidelity[o] = G;
						pcall(function()
							o.RenderFidelity = Enum.RenderFidelity.Performance;
						end);
					end;
				end;
			end);
		end;
	end));
	return true;
end;
function Jv.disable()
	if not Jv.on then
		return;
	end;
	Jv.on = false;
	for o, l in ipairs(Jv.conns) do
		pcall(function()
			l:Disconnect();
		end);
	end;
	Jv.conns = {};
	local o = Jv.saved;
	if o then
		pcall(function()
			local l = (UserSettings()):GetService("UserGameSettings");
			if o.quality ~= nil then
				l.SavedQualityLevel = o.quality;
			end;
		end);
		pcall(function()
			t.GlobalShadows = o.shadows;
		end);
		pcall(function()
			t.Technology = o.tech;
		end);
		pcall(function()
			t.EnvironmentDiffuseScale = o.diffuse;
		end);
		pcall(function()
			t.EnvironmentSpecularScale = o.specular;
		end);
		pcall(function()
			t.ShadowSoftness = o.shadowSoft;
		end);
		for o, l in pairs(o.postFx or {}) do
			pcall(function()
				o.Enabled = l;
			end);
		end;
		for o, l in pairs(o.fxInst or {}) do
			for l, G in pairs(l) do
				pcall(function()
					o[l] = G;
				end);
			end;
		end;
		Dv(false, o.meshFidelity or {});
		pcall(function()
			local l = workspace.Terrain;
			if l then
				l:SetDecorationsVisible(true);
				if o.waterWave ~= nil then
					l.WaterWaveSize = o.waterWave;
				end;
				if o.waterSpeed ~= nil then
					l.WaterWaveSpeed = o.waterSpeed;
				end;
				if o.waterReflect ~= nil then
					l.WaterReflectance = o.waterReflect;
				end;
			end;
		end);
	end;
	Cv(true);
end;
local Vv, xv = pcall(function()
		return require((yk:WaitForChild(l("3d743dca0af14b178e6c42f81e6e"), 10)):WaitForChild(l("3c4807ef02f14d3d847a"), 10));
	end);
if Vv and (type(xv) == "table" and type(xv[l("287521d52df05833876154f50f7421cc")]) == "function") then
	local o = xv[l("287521d52df05833876154f50f7421cc")];
	xv[l("287521d52df05833876154f50f7421cc")] = function(G, Z, ...)
			local g, O = pcall(o, G, Z, ...);
			if not g then
				warn(l("20572bd117d77918bc"), O);
			end;
			if Gk and (Rk.antiLoseStreak and type(Z) == "string") then
				local o = string.lower(Z);
				if string.find(o, l("1c723a8202e84d23"), 1, true) or string.find(o, l("1e6e2dc313fa48"), 1, true) then
					task.spawn(Sv);
				end;
			end;
		end;
else
	warn(l("20572bd117d77918bc2870c132502fcc02f84928c16658e05b7b21d70dfb0c77c14959e0123002cd10fa0c09957a52f5103d2acb10fe4e36846c17e013743d8210fa5f29886759"));
end;
if Sk.rA then
	table.insert(Fk, Sk.rA.OnClientEvent:Connect(function(o)
		Ak.caught = Ak.caught + 1;
		if Ak.inv then
			Ak.inv = Ak.inv + 1;
		end;
		Kk.pendingVerify = nil;
		Kk.skipFails = 0;
		if type(o) == "table" then
			local l = J(o.rarity);
			Ak.byRarity[l] = ((Ak.byRarity[l] or 0)) + 1;
		end;
		fk = true;
	end));
end;
task.spawn(function()
	while Pk do
		if Nk.farm then
			pcall(Ev);
		end;
		task.wait(.15);
	end;
end);
task.spawn(function()
	while Pk do
		local o = Nk.farm or Nk.favOn or Nk.sellOn;
		local G = os.clock() - Bk;
		local Z = (Nk.favOn and (fk and G >= 1.2)) or G >= P.InventoryPollSeconds or (Nk.sellOn and (Ak.inv and (Ak.inv >= Nk.sellAt and G >= 2)));
		if o and (Z and not Qk) then
			fk = false;
			Qk = true;
			local o, G = pcall(function()
					local o = lv();
					if not o then
						return;
					end;
					if Nk.favOn then
						Gv(o);
					end;
					if Nk.sellOn and (Ak.inv >= Nk.sellAt and os.clock() >= dk) then
						uv(false);
					end;
				end);
			if not o then
				warn(l("20572bd117d77918bc"), G);
			end;
			Qk = false;
		end;
		task.wait(.7);
	end;
end);
Uk = kk();
Ik();
M((("capabilities: minigame=%s getupvalues=%s getconnections=%s mgState=%s hook=%s")):format(tostring(Uk ~= nil), tostring(H ~= nil), tostring(h ~= nil), tostring(Yk ~= nil), tostring(hookmetamethod ~= nil and getnamecallmethod ~= nil)));
if not Uk then
	warn(l("20572bd117d77918bc285afd157429c30efa0c378e6c42f81e3d3bcc02e94d338d6955f81e316ec301f05e2e886650"));
	Pk = false;
	return;
end;
pcall(ek);
table.insert(Fk, Q.Heartbeat:Connect(zk));
table.insert(Fk, y.CharacterAdded:Connect(function()
	wk.fishState, wk.rodState, wk.actionStart = nil, nil, nil;
	ik = nil;
	xk();
end));
local sv = "\137PNG\r\n\026\n";
local function cv(o)
	task.spawn(function()
		local l, G = pcall(function()
				local o = getcustomasset or getsynasset;
				if not ((o and writefile)) then
					return nil;
				end;
				local l;
				if isfile and (readfile and isfile(P.LogoFile)) then
					l = readfile(P.LogoFile);
				end;
				if not ((type(l) == "string" and (#l > 1000 and string.sub(l, 1, 8) == sv))) then
					l = nil;
					local o, G = pcall(function()
							return game:HttpGet(P.LogoUrl);
						end);
					if o and type(G) == "string" then
						l = G;
					end;
					if not l then
						local o = request or http_request or (syn and syn.request);
						if o then
							local G, Z = pcall(o, { Url = P.LogoUrl, Method = "GET" });
							if G and (type(Z) == "table" and type(Z.Body) == "string") then
								l = Z.Body;
							end;
						end;
					end;
					if not ((type(l) == "string" and (#l > 1000 and string.sub(l, 1, 8) == sv))) then
						return nil;
					end;
					writefile(P.LogoFile, l);
				end;
				return o(P.LogoFile);
			end);
		if l and G then
			o(G);
		else
			M("logo not loaded (bubble keeps the CM text)");
		end;
	end);
end;
local function zv()
	local o = {};
	local G = {};
	local Z = {
			yellow = Color3.fromRGB(255, 196, 0),
			yellowDark = Color3.fromRGB(222, 156, 0),
			yellowLight = Color3.fromRGB(255, 222, 92),
			yellowSoft = Color3.fromRGB(255, 245, 205),
			white = Color3.fromRGB(255, 255, 255),
			offwhite = Color3.fromRGB(251, 248, 238),
			text = Color3.fromRGB(38, 32, 10),
			muted = Color3.fromRGB(125, 112, 70),
			gray = Color3.fromRGB(218, 212, 194),
			line = Color3.fromRGB(233, 226, 205),
			red = Color3.fromRGB(214, 64, 54),
			green = Color3.fromRGB(56, 170, 88),
		};
	local g = {
			"Farm",
			"Favorit",
			"Jual",
			"Trade",
			"Extras",
			"Profile",
		};
	local O = { Enum.EasingStyle.Back, Enum.EasingDirection.Out };
	local function j(o, l, G)
		local Z = Instance.new(o);
		for o, l in pairs(l) do
			Z[o] = l;
		end;
		if G then
			Z.Parent = G;
		end;
		return Z;
	end;
	local function T(o, l)
		return j("UICorner", { CornerRadius = UDim.new(0, l) }, o);
	end;
	local function p(o, l, G)
		return j("UIStroke", { Color = l, Thickness = G, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, o);
	end;
	local function r(o, l, G, Z, g)
		local O = n:Create(o, TweenInfo.new(l, Z or Enum.EasingStyle.Quad, g or Enum.EasingDirection.Out), G);
		O:Play();
		return O;
	end;
	local N = setmetatable({}, { __mode = "k" });
	local function U(o)
		N[o] = ((N[o] or 0)) + 1;
		return N[o];
	end;
	local function Y()
		local o = workspace.CurrentCamera;
		return o and o.ViewportSize or Vector2.new(800, 600);
	end;
	local w = j("ScreenGui", {
			Name = R .. tostring(math.random(1000, 9999)),
			ResetOnSpawn = false,
			DisplayOrder = 999,
			IgnoreGuiInset = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		});
	pcall(function()
		w.Parent = (gethui and gethui()) or game:GetService("CoreGui");
	end);
	if not w.Parent then
		w.Parent = y:WaitForChild("PlayerGui");
	end;
	o.sg = w;
	local a = {
			minimized = false,
			ready = false,
			busy = false,
			bubbleMoved = false,
		};
	local q = Y();
	local i = Vector2.new(math.min(390, q.X - 24), math.min(500, q.Y - 24));
	local m = Vector2.new(math.max(12, ((q.X - i.X)) / 2), math.max(12, ((q.Y - i.Y)) / 2));
	local Q = Vector2.new(m.X + 30, m.Y + 30);
	local B = j("CanvasGroup", {
			Name = "Main",
			AnchorPoint = Vector2.new(.5, .5),
			BackgroundColor3 = Z.white,
			BorderSizePixel = 0,
			GroupTransparency = 1,
			Visible = false,
		}, w);
	T(B, 14);
	p(B, Z.yellow, 2);
	local d = j("UIScale", { Scale = .85 }, B);
	local function t()
		B.Size = UDim2.fromOffset(i.X, i.Y);
		B.Position = UDim2.fromOffset(m.X + i.X / 2, m.Y + i.Y / 2);
	end;
	t();
	local W = j("Frame", {
			Name = "Header",
			Size = UDim2.new(1, 0, 0, 54),
			BackgroundColor3 = Z.yellow,
			BorderSizePixel = 0,
			ClipsDescendants = true,
		}, B);
	j("UIGradient", { Color = ColorSequence.new(Z.yellowLight, Z.yellow), Rotation = 90 }, W);
	local K = j("Frame", {
			Size = UDim2.new(0, 36, 1.8, 0),
			Position = UDim2.new(-0.3, 0, -0.4, 0),
			Rotation = 20,
			BackgroundColor3 = Z.white,
			BackgroundTransparency = .8,
			BorderSizePixel = 0,
		}, W);
	local E = j("Frame", {
			Size = UDim2.fromOffset(38, 38),
			Position = UDim2.fromOffset(12, 8),
			BackgroundColor3 = Z.white,
			BorderSizePixel = 0,
		}, W);
	T(E, 19);
	p(E, Z.yellowDark, 1.5);
	local H = j("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = u,
			Font = Enum.Font.GothamBlack,
			TextSize = 14,
			TextColor3 = Z.text,
		}, E);
	local h = j("ImageLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Crop,
		}, E);
	T(h, 19);
	local M = j("TextLabel", {
			Size = UDim2.new(1, -150, 0, 20),
			Position = UDim2.fromOffset(58, 8),
			BackgroundTransparency = 1,
			RichText = true,
			Text = v,
			TextColor3 = Z.text,
			Font = Enum.Font.GothamBold,
			TextScaled = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, W);
	j("UITextSizeConstraint", { MaxTextSize = 14, MinTextSize = 8 }, M);
	j("TextLabel", {
		Size = UDim2.new(1, -150, 0, 14),
		Position = UDim2.fromOffset(58, 30),
		BackgroundTransparency = 1,
		Text = "Mancing  -  Favorit  -  Jual   v" .. P.Version,
		TextColor3 = Color3.fromRGB(120, 92, 0),
		Font = Enum.Font.Gotham,
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, W);
	local function J(o, l)
		local G = j("TextButton", {
				Size = UDim2.fromOffset(28, 28),
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, l, .5, 0),
				BackgroundColor3 = Z.white,
				Text = o,
				TextColor3 = Z.text,
				Font = Enum.Font.GothamBold,
				TextSize = 14,
				AutoButtonColor = false,
			}, W);
		T(G, 14);
		G.MouseEnter:Connect(function()
			r(G, .12, { BackgroundColor3 = Z.yellowSoft });
		end);
		G.MouseLeave:Connect(function()
			r(G, .12, { BackgroundColor3 = Z.white });
		end);
		return G;
	end;
	local I = J("-", -46);
	local k = J("X", -12);
	local e = j("Frame", {
			Position = UDim2.new(0, 12, 0, 62),
			Size = UDim2.new(1, -24, 0, 34),
			BackgroundColor3 = Z.offwhite,
			BorderSizePixel = 0,
		}, B);
	T(e, 10);
	p(e, Z.line, 1);
	local D = j("Frame", {
			Size = UDim2.new(1 / #g, -6, 1, -6),
			Position = UDim2.new(0, 3, 0, 3),
			BackgroundColor3 = Z.yellow,
			BorderSizePixel = 0,
		}, e);
	T(D, 8);
	local V = {};
	local x = j("Frame", {
			Position = UDim2.new(0, 0, 0, 102),
			Size = UDim2.new(1, 0, 1, -152),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
		}, B);
	local s = {};
	local function c()
		local o = j("CanvasGroup", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Visible = false }, x);
		local l = j("ScrollingFrame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 4,
				ScrollBarImageColor3 = Z.yellowDark,
				CanvasSize = UDim2.new(),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				ScrollingDirection = Enum.ScrollingDirection.Y,
			}, o);
		j("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, l);
		j("UIPadding", {
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			PaddingTop = UDim.new(0, 4),
			PaddingBottom = UDim.new(0, 12),
		}, l);
		local G = { cg = o, sf = l };
		table.insert(s, G);
		return G;
	end;
	local z = j("Frame", {
			Size = UDim2.new(1, 0, 0, 50),
			Position = UDim2.new(0, 0, 1, -50),
			BackgroundColor3 = Z.yellowSoft,
			BorderSizePixel = 0,
		}, B);
	local lk = j("Frame", {
			Size = UDim2.fromOffset(10, 10),
			Position = UDim2.fromOffset(12, 9),
			BackgroundColor3 = Z.gray,
			BorderSizePixel = 0,
		}, z);
	T(lk, 5);
	local Ok = j("TextLabel", {
			Size = UDim2.new(1, -66, 0, 16),
			Position = UDim2.fromOffset(28, 6),
			BackgroundTransparency = 1,
			Text = "",
			TextColor3 = Z.text,
			Font = Enum.Font.GothamBold,
			TextSize = 11,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, z);
	local pk = j("TextLabel", {
			Size = UDim2.new(1, -66, 0, 14),
			Position = UDim2.fromOffset(28, 27),
			BackgroundTransparency = 1,
			Text = "",
			TextColor3 = Z.muted,
			Font = Enum.Font.Gotham,
			TextSize = 10,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, z);
	local function uk(o, l, G, g)
		local O = j("Frame", {
				Name = "Padlock",
				Size = UDim2.fromOffset(14, 17),
				AnchorPoint = G,
				Position = g,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
			}, o);
		local r = j("Frame", {
				Size = UDim2.fromOffset(10, 11),
				Position = UDim2.fromOffset(2, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
			}, O);
		T(r, 5);
		p(r, l, 2);
		local N = j("Frame", {
				Size = UDim2.fromOffset(14, 10),
				Position = UDim2.fromOffset(0, 7),
				BackgroundColor3 = l,
				BorderSizePixel = 0,
			}, O);
		T(N, 3);
		local R = j("Frame", {
				Size = UDim2.fromOffset(3, 4),
				Position = UDim2.fromOffset(5.5, 10),
				BackgroundColor3 = Z.white,
				BorderSizePixel = 0,
			}, O);
		T(R, 1);
		return O;
	end;
	local function Uk(o, l, G)
		if not Zk(l) then
			return nil;
		end;
		G = G or {};
		local g = j("TextButton", {
				Name = "LockShield",
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = Z.offwhite,
				BackgroundTransparency = .3,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 30,
			}, o);
		if G.region then
			g.Position, g.Size = G.region[1], G.region[2];
		end;
		if G.radius then
			T(g, G.radius);
		end;
		uk(g, Z.muted, Vector2.new(1, .5), UDim2.new(1, -((G.inset or 14)), .5, 0));
		g.Activated:Connect(function()
			Kk.toast(C, "warn", 3);
		end);
		return g;
	end;
	local function wk(o)
		local l = j("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = Z.offwhite,
				BorderSizePixel = 0,
				LayoutOrder = U(o.sf),
			}, o.sf);
		T(l, 12);
		p(l, Z.line, 1);
		j("UIPadding", {
			PaddingTop = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
		}, l);
		j("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, l);
		return l;
	end;
	local function ak(o, l, G, Z, g)
		return j("TextLabel", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = l,
			TextSize = G,
			TextColor3 = Z,
			Font = g,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			LayoutOrder = U(o),
		}, o);
	end;
	local function qk(o, l, G)
		local g = ak(o, l, 12, Z.yellowDark, Enum.Font.GothamBold);
		if Zk(G) then
			uk(g, Z.yellowDark, Vector2.new(1, .5), UDim2.new(1, 0, .5, 0));
		end;
		return g;
	end;
	local function ik(o, l)
		return ak(o, l, 11, Z.muted, Enum.Font.Gotham);
	end;
	local function mk(o)
		local l = j("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = U(o),
			}, o);
		j("UISizeConstraint", { MinSize = Vector2.new(0, 36) }, l);
		return l;
	end;
	local function Qk(o, l, G, g)
		local O = j("Frame", { Size = UDim2.new(1, -g, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1 }, o);
		j("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }, O);
		ak(O, l, 13, Z.text, Enum.Font.GothamBold);
		if G and G ~= "" then
			ak(O, G, 11, Z.muted, Enum.Font.Gotham);
		end;
		return O;
	end;
	local function bk(l, g, p, N, R, u, v)
		local A = mk(l);
		Qk(A, g, p, 62);
		Uk(A, v, { inset = 17 });
		local F = j("TextButton", {
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, 0, .5, 0),
				Size = UDim2.fromOffset(48, 26),
				Text = "",
				AutoButtonColor = false,
				BackgroundColor3 = Z.gray,
			}, A);
		T(F, 13);
		local P = j("Frame", {
				Size = UDim2.fromOffset(20, 20),
				Position = UDim2.fromOffset(3, 3),
				BackgroundColor3 = Z.white,
				BorderSizePixel = 0,
			}, F);
		T(P, 10);
		local U;
		table.insert(G, function()
			if u then
				local o = u();
				if A.Visible ~= o then
					A.Visible = o;
				end;
			end;
			local o = N() and true or false;
			if o ~= U then
				local l = U == nil;
				U = o;
				local G = o and Z.yellowDark or Z.gray;
				local g = o and UDim2.fromOffset(25, 3) or UDim2.fromOffset(3, 3);
				if l then
					F.BackgroundColor3, P.Position = G, g;
				else
					r(F, .18, { BackgroundColor3 = G });
					r(P, .22, { Position = g }, O[1], O[2]);
				end;
			end;
		end);
		F.Activated:Connect(function()
			R(not N());
			o.refresh();
		end);
		return A;
	end;
	local function Bk(l, g, O, N, R, u, v, A, F, P)
		local U = mk(l);
		Qk(U, g, O, 74);
		Uk(U, P, { inset = 24 });
		local Y = j("TextBox", {
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, 0, .5, 0),
				Size = UDim2.fromOffset(62, 30),
				BackgroundColor3 = Z.white,
				Text = L(N(), A),
				TextColor3 = Z.text,
				Font = Enum.Font.GothamBold,
				TextSize = 13,
				ClearTextOnFocus = false,
				PlaceholderText = "",
			}, U);
		T(Y, 8);
		local w = p(Y, Z.line, 1.5);
		Y.Focused:Connect(function()
			r(w, .15, { Color = Z.yellowDark });
		end);
		Y.FocusLost:Connect(function()
			r(w, .15, { Color = Z.line });
			local l = string.gsub(Y.Text, ",", ".");
			local G = tonumber(l);
			if G and S(G) then
				local o = math.clamp(G, u, v);
				if o ~= G then
					Kk.toast((("Nilai dibatasi ke %s - %s")):format(L(u, A), L(v, A)), "warn", 3);
				end;
				R(A and math.floor(o + .5) or o);
			else
				Kk.toast("Isi dengan angka", "warn", 3);
			end;
			Y.Text = L(N(), A);
			o.refresh();
		end);
		table.insert(G, function()
			if F then
				local o = F();
				if U.Visible ~= o then
					U.Visible = o;
				end;
			end;
			if Y:IsFocused() then
				return;
			end;
			local o = L(N(), A);
			if Y.Text ~= o then
				Y.Text = o;
			end;
		end);
		return U;
	end;
	local function dk(l, g, N, R)
		local u = #g;
		local v = j("Frame", {
				Size = UDim2.new(1, 0, 0, 34),
				BackgroundColor3 = Z.white,
				BorderSizePixel = 0,
				LayoutOrder = U(l),
			}, l);
		T(v, 10);
		p(v, Z.line, 1);
		local A = j("Frame", {
				Size = UDim2.new(1 / u, -6, 1, -6),
				Position = UDim2.new(0, 3, 0, 3),
				BackgroundColor3 = Z.yellow,
				BorderSizePixel = 0,
			}, v);
		T(A, 8);
		local F = {};
		for l, G in ipairs(g) do
			local g = j("TextButton", {
					Size = UDim2.new(1 / u, 0, 1, 0),
					Position = UDim2.new(((l - 1)) / u, 0, 0, 0),
					BackgroundTransparency = 1,
					Text = G.text,
					Font = Enum.Font.GothamBold,
					TextSize = 12,
					TextColor3 = Z.muted,
					AutoButtonColor = false,
					ZIndex = 2,
				}, v);
			g.Activated:Connect(function()
				R(G.id);
				o.refresh();
			end);
			F[l] = g;
			Uk(v, G.lock, { radius = 8, inset = 8, region = { UDim2.new(((l - 1)) / u, 0, 0, 0), UDim2.new(1 / u, 0, 1, 0) } });
		end;
		local P = "unset";
		table.insert(G, function()
			local o = N();
			if o ~= P then
				local l = P == "unset";
				P = o;
				local G;
				for l, Z in ipairs(g) do
					if Z.id == o then
						G = l;
					end;
				end;
				for o, l in ipairs(F) do
					r(l, .18, { TextColor3 = (o == G) and Z.text or Z.muted });
				end;
				if G then
					local o = UDim2.new(((G - 1)) / u, 3, 0, 3);
					if l then
						A.Position, A.BackgroundTransparency = o, 0;
					else
						A.BackgroundTransparency = 0;
						r(A, .28, { Position = o }, O[1], O[2]);
					end;
				else
					r(A, .18, { BackgroundTransparency = 1 });
				end;
			end;
		end);
		return v;
	end;
	local function tk(o, l, G, g, N)
		local R = (G == "danger") and Z.red or ((G == "ghost") and Z.white or Z.yellow);
		local u = (G == "danger") and Color3.fromRGB(235, 95, 85) or ((G == "ghost") and Z.yellowSoft or Z.yellowLight);
		local v = (G == "danger") and Z.white or Z.text;
		local A = j("TextButton", {
				Size = UDim2.new(1, 0, 0, 38),
				BackgroundColor3 = R,
				Text = l,
				TextColor3 = v,
				Font = Enum.Font.GothamBold,
				TextSize = 13,
				AutoButtonColor = false,
				LayoutOrder = U(o),
			}, o);
		T(A, 10);
		if G == "ghost" then
			p(A, Z.yellowDark, 1.5);
		end;
		local F = j("UIScale", { Scale = 1 }, A);
		A.MouseEnter:Connect(function()
			r(A, .12, { BackgroundColor3 = u });
		end);
		A.MouseLeave:Connect(function()
			r(A, .12, { BackgroundColor3 = R });
			r(F, .1, { Scale = 1 });
		end);
		A.MouseButton1Down:Connect(function()
			r(F, .08, { Scale = .96 });
		end);
		A.MouseButton1Up:Connect(function()
			r(F, .12, { Scale = 1 }, O[1], O[2]);
		end);
		A.Activated:Connect(g);
		Uk(A, N, { radius = 10, inset = 14 });
		return A;
	end;
	local nk, Wk, Ek, yk, Hk, hk = c(), c(), c(), c(), c(), c();
	local Mk = j("Frame", {
			Size = UDim2.new(1, 0, 0, 76),
			BackgroundColor3 = Z.offwhite,
			BorderSizePixel = 0,
			LayoutOrder = U(nk.sf),
		}, nk.sf);
	T(Mk, 14);
	local Sk = p(Mk, Z.line, 1.5);
	local Jk = j("TextLabel", {
			Size = UDim2.new(1, -90, 0, 20),
			Position = UDim2.fromOffset(14, 12),
			BackgroundTransparency = 1,
			Text = "AUTO FARM: MATI",
			TextColor3 = Z.text,
			Font = Enum.Font.GothamBlack,
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, Mk);
	local Lk = j("TextLabel", {
			Size = UDim2.new(1, -90, 0, 30),
			Position = UDim2.fromOffset(14, 34),
			BackgroundTransparency = 1,
			Text = "Ketuk untuk mulai mancing otomatis",
			TextColor3 = Z.muted,
			Font = Enum.Font.Gotham,
			TextSize = 11,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
		}, Mk);
	local Ik = j("Frame", {
			AnchorPoint = Vector2.new(1, .5),
			Position = UDim2.new(1, -14, .5, 0),
			Size = UDim2.fromOffset(60, 32),
			BackgroundColor3 = Z.gray,
			BorderSizePixel = 0,
		}, Mk);
	T(Ik, 16);
	local kk = j("Frame", {
			Size = UDim2.fromOffset(26, 26),
			Position = UDim2.fromOffset(3, 3),
			BackgroundColor3 = Z.white,
			BorderSizePixel = 0,
		}, Ik);
	T(kk, 13);
	local ek = j("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			ZIndex = 5,
		}, Mk);
	ek.Activated:Connect(function()
		Kk.setFarm(not Nk.farm);
		o.refresh();
	end);
	local Ck;
	table.insert(G, function()
		local o = Nk.farm and true or false;
		Lk.Text = o and ((Ak.status or "")) or "Ketuk untuk mulai mancing otomatis";
		if o ~= Ck then
			local l = Ck == nil;
			Ck = o;
			Jk.Text = o and "AUTO FARM: AKTIF" or "AUTO FARM: MATI";
			local G = o and Z.yellowSoft or Z.offwhite;
			local g = o and Z.yellowDark or Z.line;
			local j = o and Z.yellowDark or Z.gray;
			local T = o and UDim2.fromOffset(31, 3) or UDim2.fromOffset(3, 3);
			if l then
				Mk.BackgroundColor3, Sk.Color, Ik.BackgroundColor3, kk.Position = G, g, j, T;
			else
				r(Mk, .25, { BackgroundColor3 = G });
				r(Sk, .25, { Color = g });
				r(Ik, .25, { BackgroundColor3 = j });
				r(kk, .3, { Position = T }, O[1], O[2]);
			end;
		end;
	end);
	local Dk = { FREE = { Z.gray, Z.text }, PREMIUM = { Z.yellow, Z.text }, OWNER = { Z.text, Z.yellowLight } };
	local Vk = Dk[ok] or Dk.FREE;
	local sk = wk(nk);
	qk(sk, "MODE MINIGAME");
	dk(sk, { { id = "Smart", text = "Smart" }, { id = "Skip", text = "Skip", lock = "skip" } }, function()
		return Nk.mode;
	end, function(o)
		if o == "Skip" and not Gk then
			Xk();
			return;
		end;
		Nk.mode = o;
		xk();
	end);
	local ck = ik(sk, "");
	table.insert(G, function()
		local o = jk[Nk.mode];
		if ck.Text ~= o then
			ck.Text = o;
		end;
	end);
	local zk = wk(nk);
	qk(zk, "KECEPATAN", "speed");
	local ov = {};
	for o, l in ipairs(Tk) do
		table.insert(ov, { id = l, text = l, lock = (l ~= "Aman") and "speed" or nil });
	end;
	dk(zk, ov, function()
		return Nk.preset;
	end, function(o)
		Kk.setPreset(o);
	end);
	local lv = ik(zk, "");
	table.insert(G, function()
		local o = rk[Nk.preset] or "";
		if lv.Text ~= o then
			lv.Text = o;
		end;
	end);
	local Gv = wk(nk);
	qk(Gv, "OTOMATISASI", "automation");
	bk(Gv, "Lempar pancing otomatis", "Bot melempar sendiri.", function()
		return Nk.autoCast;
	end, function(o)
		Nk.autoCast = o;
	end, nil, "automation");
	bk(Gv, "Pegang rod otomatis", "Ambil rod dari tas saat farm aktif.", function()
		return Nk.autoEquip;
	end, function(o)
		Nk.autoEquip = o;
	end, nil, "automation");
	local Zv = wk(nk);
	qk(Zv, "ATUR WAKTU SENDIRI (LANJUTAN)", "timing");
	ik(Zv, "Mulai dari preset Aman, naikkan pelan-pelan.");
	Bk(Zv, "Tahan sebelum selesai", "Mode Skip: detik sebelum minigame dipaksa selesai.", function()
		return Nk.skipDelay;
	end, function(o)
		Nk.skipDelay = o;
		Kk.syncPreset();
	end, 0, 10, false, function()
		return Nk.mode == "Skip";
	end, "timing");
	bk(Zv, "Percepat waktu gigitan", "Perpendek waktu tunggu ikan menggigit.", function()
		return Nk.biteFast;
	end, function(o)
		Nk.biteFast = o;
		Kk.syncPreset();
	end, nil, "timing");
	Bk(Zv, "Waktu tunggu gigitan", "Makin kecil makin cepat, bisa ditolak server.", function()
		return Nk.biteWait;
	end, function(o)
		Nk.biteWait = o;
		Kk.syncPreset();
	end, .2, 6, false, function()
		return Nk.biteFast;
	end, "timing");
	Bk(Zv, "Jeda lempar ulang", "Jeda setelah dapat ikan sebelum lempar lagi.", function()
		return Nk.castCooldown;
	end, function(o)
		Nk.castCooldown = o;
		Kk.syncPreset();
	end, .05, 2, false, nil, "timing");
	Bk(Zv, "Batas macet", "Reset otomatis jika pancing macet selama ini.", function()
		return Nk.stuckTimeout;
	end, function(o)
		Nk.stuckTimeout = o;
	end, 5, 120, true, nil, "timing");
	local gv = wk(Wk);
	qk(gv, "AUTO FAVORIT", "favorit");
	bk(gv, "Favoritkan ikan baru", "Ikan baru rarity terpilih otomatis difavoritkan.", function()
		return Nk.favOn;
	end, function(o)
		Nk.favOn = o;
		if o then
			fk = true;
		end;
	end, nil, "favorit");
	local Ov = wk(Wk);
	qk(Ov, "RARITY YANG DIFAVORITKAN", "favorit");
	local jv = j("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = U(Ov),
		}, Ov);
	j("UIGridLayout", { CellSize = UDim2.new(.3333, -4, 0, 34), CellPadding = UDim2.fromOffset(6, 6), SortOrder = Enum.SortOrder.LayoutOrder }, jv);
	for l, g in ipairs(gk) do
		local O = j("TextButton", {
				Text = g,
				Font = Enum.Font.GothamBold,
				TextSize = 11,
				AutoButtonColor = false,
				LayoutOrder = l,
				BackgroundColor3 = Z.white,
				TextColor3 = Z.muted,
			}, jv);
		T(O, 8);
		local N = p(O, Z.gray, 1.5);
		Uk(O, "favorit", { radius = 8, inset = 8 });
		local R;
		table.insert(G, function()
			local o = Nk.fav[g] and true or false;
			if o ~= R then
				R = o;
				r(O, .18, { BackgroundColor3 = o and Z.yellow or Z.white, TextColor3 = o and Z.text or Z.muted });
				r(N, .18, { Color = o and Z.yellowDark or Z.gray });
			end;
		end);
		O.Activated:Connect(function()
			Nk.fav[g] = not Nk.fav[g];
			o.refresh();
		end);
	end;
	tk(Ov, "Favoritkan sekarang", "primary", function()
		Kk.favNow();
	end, "favorit");
	ik(Ov, "Rarity yang dicentang dilindungi saat menjual.");
	local Tv = wk(Ek);
	qk(Tv, "AUTO JUAL (TANPA NPC)", "jual");
	bk(Tv, "Jual otomatis", "Menjual ikan saat jumlahnya mencapai angka di bawah.", function()
		return Nk.sellOn;
	end, function(o)
		Kk.setSell(o);
	end, nil, "jual");
	Bk(Tv, "Jual saat inventory >=", "Maks 500.", function()
		return Nk.sellAt;
	end, function(o)
		Nk.sellAt = o;
	end, 1, P.MaxInventory, true, nil, "jual");
	Bk(Tv, "Jeda antar jual", "Terlalu kecil bisa dianggap spam.", function()
		return Nk.sellGap;
	end, function(o)
		Nk.sellGap = o;
	end, .02, 2, false, nil, "jual");
	local pv = wk(Ek);
	qk(pv, "CARA JUAL", "jual");
	local rv = ak(pv, "", 11, Z.text, Enum.Font.GothamMedium);
	bk(pv, "Izinkan jual-semua", "Menjual SEMUA ikan sekaligus. Mati otomatis jika ikan favorit ikut hilang.", function()
		return Nk.allowSellAll;
	end, function(o)
		Nk.allowSellAll = o;
	end, nil, "jual");
	table.insert(G, function()
		local o = Kk.methodReport();
		local G = "Cara jual: " .. ((o.learned and ("sudah dipelajari" .. ((o.learnedKind == l("0d783cc002eb4537") and " (jual semua)" or " (per ikan)"))) or "belum dipelajari. Tekan \'Pelajari cara jual\' lalu jual 1 ikan di NPC."));
		if rv.Text ~= G then
			rv.Text = G;
		end;
	end);
	local Nv = wk(Ek);
	qk(Nv, "AKSI", "jual");
	tk(Nv, "Jual sekarang", "primary", function()
		Kk.sellNow();
	end, "jual");
	tk(Nv, "Pelajari cara jual (jual 1 ikan di NPC)", "ghost", function()
		Kk.startLearn();
	end, "jual");
	tk(Nv, "Lupakan hasil pelajaran", "ghost", function()
		Kk.forget();
	end, "jual");
	local Rv = ak(Nv, "", 11, Z.text, Enum.Font.GothamMedium);
	table.insert(G, function()
		local o = "Info terakhir: " .. tostring(Ak.lastNote or "-");
		if Rv.Text ~= o then
			Rv.Text = o;
		end;
	end);
	ik(Nv, "Uji aman dulu: favoritkan 1 ikan murah, tekan \'Jual sekarang\'. Jika ikut hilang, jangan nyalakan jual-semua.");
	local function uv(o, l)
		local G = j("Frame", { Size = UDim2.new(1, 0, 0, 38), BackgroundColor3 = Z.white, LayoutOrder = U(o) }, o);
		T(G, 10);
		local g = p(G, Z.gray, 1.5);
		local O = j("TextLabel", {
				Size = UDim2.new(1, -34, 1, 0),
				Position = UDim2.fromOffset(12, 0),
				BackgroundTransparency = 1,
				Text = "",
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = Z.muted,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
			}, G);
		local r = j("TextLabel", {
				Size = UDim2.fromOffset(20, 20),
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, -10, .5, 0),
				BackgroundTransparency = 1,
				Text = "v",
				TextColor3 = Z.muted,
				Font = Enum.Font.GothamBold,
				TextSize = 12,
			}, G);
		local N = j("TextButton", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Text = "",
				AutoButtonColor = false,
			}, G);
		Uk(G, l, { radius = 10, inset = 12 });
		local R = j("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				LayoutOrder = U(o),
			}, o);
		local u = j("ScrollingFrame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = Z.offwhite,
				BorderSizePixel = 0,
				ScrollBarThickness = 4,
				ScrollBarImageColor3 = Z.yellowDark,
				CanvasSize = UDim2.new(),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				ScrollingDirection = Enum.ScrollingDirection.Y,
			}, R);
		T(u, 8);
		j("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }, u);
		j("UIPadding", {
			PaddingTop = UDim.new(0, 4),
			PaddingBottom = UDim.new(0, 4),
			PaddingLeft = UDim.new(0, 4),
			PaddingRight = UDim.new(0, 4),
		}, u);
		local v = false;
		local function A(o)
			v = o;
			R.Size = o and UDim2.new(1, 0, 0, 160) or UDim2.new(1, 0, 0, 0);
			r.Text = o and "^" or "v";
		end;
		N.Activated:Connect(function()
			A(not v);
		end);
		return {
			lbl = O,
			sf = u,
			setOpen = A,
			isOpen = function()
				return v;
			end,
		};
	end;
	local function Av(o, l, G)
		local g = j("TextButton", {
				Size = UDim2.new(1, 0, 0, 32),
				BackgroundColor3 = Z.white,
				Text = "",
				AutoButtonColor = false,
			}, o);
		T(g, 6);
		local O = j("TextLabel", {
				Size = UDim2.new(1, -16, 1, 0),
				Position = UDim2.fromOffset(8, 0),
				BackgroundTransparency = 1,
				Text = l,
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = Z.text,
				TextXAlignment = Enum.TextXAlignment.Left,
			}, g);
		g.Activated:Connect(G);
		return g, O;
	end;
	local Fv = wk(yk);
	qk(Fv, "PILIH TARGET", "trade");
	local Pv = uv(Fv, "trade");
	Pv.lbl.Text = "Belum dipilih";
	do
		local o, l = nil, {};
		table.insert(G, function()
			local G, Z = {}, {};
			for o, l in ipairs(f:GetPlayers()) do
				if l ~= y then
					table.insert(G, l);
					table.insert(Z, tostring(l.UserId));
				end;
			end;
			Z = table.concat(Z, "|");
			if Z ~= o then
				o = Z;
				for o, l in ipairs(l) do
					l:Destroy();
				end;
				l = {};
				for o, G in ipairs(G) do
					local Z = Av(Pv.sf, G.Name, function()
							vv.targetUserId, vv.targetName = G.UserId, G.Name;
							Pv.lbl.Text = G.Name;
							Pv.setOpen(false);
						end);
					table.insert(l, Z);
				end;
			end;
			if vv.targetName and not f:GetPlayerByUserId(vv.targetUserId or 0) then
				Pv.lbl.Text = vv.targetName .. " (sudah keluar)";
			end;
		end);
	end;
	local wv = wk(yk);
	qk(wv, "PILIH RARITY", "trade");
	local av = uv(wv, "trade");
	av.lbl.Text = "Belum dipilih";
	do
		local l = {};
		for G, Z in ipairs(gk) do
			local g, O = Av(av.sf, Z, function()
					vv.rarity, vv.fishName = Z, nil;
					av.lbl.Text = Z;
					av.setOpen(false);
					o.refresh();
				end);
			l[Z] = O;
		end;
		table.insert(G, function()
			local o = Yv();
			for l, G in pairs(l) do
				local Z = (("%s (x%d)")):format(l, o[l] or 0);
				if G.Text ~= Z then
					G.Text = Z;
				end;
			end;
			if vv.rarity then
				local l = (("%s (x%d)")):format(vv.rarity, o[vv.rarity] or 0);
				if av.lbl.Text ~= l then
					av.lbl.Text = l;
				end;
			end;
		end);
	end;
	local qv = wk(yk);
	qk(qv, "NAMA IKAN (OPSIONAL)", "trade");
	local iv = uv(qv, "trade");
	iv.lbl.Text = "Semua nama";
	do
		local o, l = nil, {};
		table.insert(G, function()
			if not vv.rarity then
				if o ~= "" then
					o = "";
					for o, l in ipairs(l) do
						l.row:Destroy();
					end;
					l = {};
				end;
				return;
			end;
			local G, Z = Uv(vv.rarity);
			local g = vv.rarity .. (":" .. table.concat(G, "|"));
			if g ~= o then
				o = g;
				for o, l in ipairs(l) do
					l.row:Destroy();
				end;
				l = {};
				local O = Av(iv.sf, "Semua nama", function()
						vv.fishName = nil;
						iv.lbl.Text = "Semua nama";
						iv.setOpen(false);
					end);
				table.insert(l, { row = O, txt = nil, name = nil });
				for o, G in ipairs(G) do
					local g, O = Av(iv.sf, (("%s (x%d)")):format(G, Z[G] or 0), function()
							vv.fishName = G;
							iv.lbl.Text = (("%s (x%d)")):format(G, Z[G] or 0);
							iv.setOpen(false);
						end);
					table.insert(l, { row = g, txt = O, name = G });
				end;
			else
				for o, l in ipairs(l) do
					if l.name then
						local o = (("%s (x%d)")):format(l.name, Z[l.name] or 0);
						if l.txt.Text ~= o then
							l.txt.Text = o;
						end;
						if vv.fishName == l.name and iv.lbl.Text ~= o then
							iv.lbl.Text = o;
						end;
					end;
				end;
			end;
		end);
	end;
	local mv = wk(yk);
	qk(mv, "JUMLAH & AKSI", "trade");
	Bk(mv, "Jumlah ikan", "Berapa ekor yang mau dikirim.", function()
		return vv.amount;
	end, function(o)
		vv.amount = math.max(1, math.floor(o));
	end, 1, 500, true, nil, "trade");
	bk(mv, "Auto dekati target", "Biasanya tidak perlu. Nyalakan kalau kirim jarak jauh gagal terus.", function()
		return vv.autoApproach;
	end, function(o)
		vv.autoApproach = o;
	end, nil, "trade");
	local fv = ak(mv, "", 11, Z.muted, Enum.Font.GothamMedium);
	table.insert(G, function()
		if fv.Text ~= vv.log then
			fv.Text = vv.log;
		end;
	end);
	tk(mv, "Mulai Give", "primary", function()
		local o, l = vv.start();
		if not o then
			Kk.toast("Trade gagal mulai: " .. tostring(l), "warn", 6);
		end;
	end, "trade");
	tk(mv, "Stop", "ghost", function()
		vv.stop();
	end, "trade");
	ik(mv, "Ikan favorit otomatis di-unfavorite dulu. Dikirim satu-satu, tunggu respons baru lanjut.");
	local Qv = wk(yk);
	qk(Qv, "TERIMA KIRIMAN MASUK", "trade");
	bk(Qv, "Auto Accept", "Otomatis terima kiriman ikan yang masuk.", function()
		return vv.autoAccept;
	end, function(o)
		vv.autoAccept = o;
	end, nil, "trade");
	ik(Qv, "Popup bawaan game mungkin sempat kelihatan sebentar, itu wajar.");
	local bv = wk(Hk);
	qk(bv, "BOOST PERFORMANCE", "boost");
	bk(bv, "Aktifkan Boost Performance", "Bikin game lebih ringan biar nggak lag/panas.", function()
		return Jv.on;
	end, function(o)
		if o then
			local o, l = Jv.enable();
			if not o then
				Kk.toast("Boost Performance gagal: " .. tostring(l), "warn", 6);
			end;
		else
			Jv.disable();
		end;
	end, nil, "boost");
	local Bv = ak(bv, "", 11, Z.muted, Enum.Font.GothamMedium);
	table.insert(G, function()
		local o = (("Status: %s  |  efek mati: %d  |  model disederhanakan: %d")):format(Jv.on and "AKTIF" or "mati", Jv.effectCount, Jv.meshCount);
		if Bv.Text ~= o then
			Bv.Text = o;
		end;
	end);
	ik(bv, "Cuma ubah tampilan, bukan cara main. Balik normal otomatis kalau dimatikan.");
	local dv = wk(Hk);
	qk(dv, "ANTI-LOSE STREAK", "streak");
	bk(dv, "Aktifkan Anti-Lose Streak", "Rejoin otomatis saat tangkapan gagal.", function()
		return Rk.antiLoseStreak;
	end, function(o)
		Rk.antiLoseStreak = o;
	end, nil, "streak");
	local tv = ak(dv, "", 11, Z.muted, Enum.Font.GothamMedium);
	table.insert(G, function()
		local o = yv and "Status: sudah pernah ter-trigger sesi ini (sedang/ sudah mencoba rejoin)." or "Status: belum pernah ter-trigger sesi ini.";
		if tv.Text ~= o then
			tv.Text = o;
		end;
	end);
	ik(dv, "Selalu otomatis: begitu terdeteksi gagal, Auto Farm dihentikan dan !rejoin langsung dikirim 1x.");
	local function nv(o, l, G)
		local g = mk(o);
		j("TextLabel", {
			Size = UDim2.new(.4, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = l,
			TextColor3 = Z.muted,
			Font = Enum.Font.GothamMedium,
			TextSize = 12,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, g);
		local O = j("TextLabel", {
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(.58, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Text = G,
				TextColor3 = Z.text,
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Right,
			}, g);
		return O;
	end;
	local Wv = wk(hk);
	local Kv = j("Frame", { Size = UDim2.new(1, 0, 0, 68), BackgroundTransparency = 1, LayoutOrder = U(Wv) }, Wv);
	local Ev = j("Frame", {
			Size = UDim2.fromOffset(60, 60),
			Position = UDim2.fromOffset(0, 4),
			BackgroundColor3 = Z.yellowSoft,
			BorderSizePixel = 0,
		}, Kv);
	T(Ev, 30);
	p(Ev, Z.yellowDark, 1.5);
	local Xv = j("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = (string.sub(y.Name, 1, 1)):upper(),
			Font = Enum.Font.GothamBlack,
			TextSize = 22,
			TextColor3 = Z.text,
		}, Ev);
	local Hv = j("ImageLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Crop,
		}, Ev);
	T(Hv, 30);
	j("TextLabel", {
		Size = UDim2.new(1, -72, 0, 20),
		Position = UDim2.fromOffset(72, 2),
		BackgroundTransparency = 1,
		Text = y.DisplayName,
		Font = Enum.Font.GothamBold,
		TextSize = 15,
		TextColor3 = Z.text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
	}, Kv);
	j("TextLabel", {
		Size = UDim2.new(1, -72, 0, 16),
		Position = UDim2.fromOffset(72, 23),
		BackgroundTransparency = 1,
		Text = "@" .. y.Name,
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextColor3 = Z.muted,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, Kv);
	local hv = j("TextLabel", {
			Size = UDim2.fromOffset(74, 24),
			Position = UDim2.fromOffset(72, 44),
			BackgroundColor3 = Vk[1],
			Text = ok,
			TextColor3 = Vk[2],
			Font = Enum.Font.GothamBlack,
			TextSize = 12,
		}, Kv);
	T(hv, 12);
	task.spawn(function()
		local o, l = pcall(function()
				return f:GetUserThumbnailAsync(y.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180);
			end);
		if o and l then
			Hv.Image = l;
			r(Hv, .3, { ImageTransparency = 0 });
			Xv.Visible = false;
		end;
	end);
	local Mv = wk(hk);
	qk(Mv, "DETAIL AKUN");
	nv(Mv, "Username", y.Name);
	nv(Mv, "Display Name", y.DisplayName);
	local Sv = nv(Mv, "Negara", "Memuat...");
	local Lv = nv(Mv, "Role", ok);
	Lv.TextColor3 = (ok == "FREE") and Z.muted or Z.yellowDark;
	task.spawn(function()
		local o, l = pcall(function()
				return X:GetCountryRegionForPlayerAsync(y);
			end);
		Sv.Text = ((o and (type(l) == "string" and l ~= ""))) and l or "Tidak diketahui";
	end);
	ik(Mv, Gk and "Semua fitur terbuka, tanpa batasan." or "Akun FREE hanya membuka Auto Farm mode Smart.");
	local Iv;
	local function kv(o, l)
		if Iv == o then
			return;
		end;
		Iv = o;
		for G, g in ipairs(s) do
			if G == o then
				g.cg.Visible = true;
				if l then
					g.cg.GroupTransparency, g.cg.Position = 0, UDim2.new();
				else
					g.cg.GroupTransparency, g.cg.Position = 1, UDim2.fromOffset(0, 14);
					r(g.cg, .25, { GroupTransparency = 0, Position = UDim2.new() });
				end;
			else
				g.cg.Visible = false;
			end;
			r(V[G], .18, { TextColor3 = (G == o) and Z.text or Z.muted });
		end;
		local G = UDim2.new(((o - 1)) / #g, 3, 0, 3);
		if l then
			D.Position = G;
		else
			r(D, .3, { Position = G }, O[1], O[2]);
		end;
	end;
	local ev = {
			Favorit = "favorit",
			Jual = "jual",
			Trade = "trade",
			Extras = "streak",
		};
	for o, l in ipairs(g) do
		local G = j("TextButton", {
				Size = UDim2.new(1 / #g, 0, 1, 0),
				Position = UDim2.new(((o - 1)) / #g, 0, 0, 0),
				BackgroundTransparency = 1,
				Text = l,
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextColor3 = Z.muted,
				AutoButtonColor = false,
				ZIndex = 2,
			}, e);
		G.Activated:Connect(function()
			kv(o);
		end);
		V[o] = G;
		if Zk(ev[l]) then
			uk(G, Z.muted, Vector2.new(1, .5), UDim2.new(1, -6, .5, 0));
		end;
	end;
	local Cv = j("CanvasGroup", {
			AnchorPoint = Vector2.new(.5, 0),
			Position = UDim2.new(.5, 0, 0, 48),
			Size = UDim2.new(1, -28, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = Z.text,
			BorderSizePixel = 0,
			GroupTransparency = 1,
			Visible = false,
			ZIndex = 40,
		}, B);
	T(Cv, 10);
	local Dv = j("Frame", { Size = UDim2.new(0, 5, 1, 0), BackgroundColor3 = Z.yellow, BorderSizePixel = 0 }, Cv);
	local Vv = j("TextLabel", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = "",
			TextColor3 = Z.white,
			Font = Enum.Font.GothamMedium,
			TextSize = 12,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, Cv);
	j("UIPadding", {
		PaddingTop = UDim.new(0, 9),
		PaddingBottom = UDim.new(0, 9),
		PaddingLeft = UDim.new(0, 16),
		PaddingRight = UDim.new(0, 10),
	}, Vv);
	j("UISizeConstraint", { MaxSize = Vector2.new(360, math.huge) }, Cv);
	local xv = 0;
	local sv = {
			ok = Z.green,
			warn = Z.yellow,
			err = Z.red,
			info = Z.yellowLight,
		};
	local zv = j("ImageButton", {
			Name = "Bubble",
			Size = UDim2.fromOffset(60, 60),
			AnchorPoint = Vector2.new(.5, .5),
			BackgroundColor3 = Z.yellow,
			AutoButtonColor = false,
			Image = "",
			ScaleType = Enum.ScaleType.Crop,
			Visible = false,
		}, w);
	T(zv, 30);
	local o4 = p(zv, Z.yellowDark, 3);
	local l4 = j("UIScale", { Scale = 0 }, zv);
	local G4 = j("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = u,
			Font = Enum.Font.GothamBlack,
			TextSize = 20,
			TextColor3 = Z.text,
		}, zv);
	local Z4 = j("Frame", {
			Size = UDim2.fromOffset(14, 14),
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 1, 0, -1),
			BackgroundColor3 = Z.gray,
			BorderSizePixel = 0,
			ZIndex = 3,
		}, zv);
	T(Z4, 7);
	p(Z4, Z.white, 2);
	(n:Create(o4, TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Transparency = .7 })):Play();
	local function g4()
		zv.Position = UDim2.fromOffset(Q.X, Q.Y);
	end;
	g4();
	function Kk.toast(o, l, G)
		xv = xv + 1;
		local g = xv;
		Vv.Text = tostring(o);
		Dv.BackgroundColor3 = sv[l or "info"] or Z.yellow;
		Cv.Visible = true;
		Cv.GroupTransparency = 1;
		Cv.Position = UDim2.new(.5, 0, 0, 40);
		r(Cv, .32, { GroupTransparency = .03, Position = UDim2.new(.5, 0, 0, 58) }, O[1], O[2]);
		if a.minimized then
			r(l4, .12, { Scale = 1.25 });
			task.delay(.14, function()
				r(l4, .2, { Scale = 1 }, O[1], O[2]);
			end);
		end;
		task.delay(G or 4, function()
			if xv == g then
				r(Cv, .25, { GroupTransparency = 1, Position = UDim2.new(.5, 0, 0, 44) });
				task.delay(.3, function()
					if xv == g then
						Cv.Visible = false;
					end;
				end);
			end;
		end);
	end;
	local O4 = j("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			Visible = false,
			Active = true,
			ZIndex = 60,
		}, B);
	local j4 = j("CanvasGroup", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.new(1, -40, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = Z.white,
			GroupTransparency = 1,
			ZIndex = 61,
		}, O4);
	T(j4, 14);
	p(j4, Z.yellow, 2);
	j("UISizeConstraint", { MaxSize = Vector2.new(320, math.huge) }, j4);
	local T4 = j("UIScale", { Scale = .8 }, j4);
	j("UIPadding", {
		PaddingTop = UDim.new(0, 14),
		PaddingBottom = UDim.new(0, 14),
		PaddingLeft = UDim.new(0, 14),
		PaddingRight = UDim.new(0, 14),
	}, j4);
	j("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, j4);
	local p4 = ak(j4, "", 15, Z.text, Enum.Font.GothamBold);
	local r4 = ak(j4, "", 12, Z.muted, Enum.Font.Gotham);
	local N4 = j("Frame", { Size = UDim2.new(1, 0, 0, 38), BackgroundTransparency = 1, LayoutOrder = U(j4) }, j4);
	j("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, N4);
	local R4 = j("TextButton", {
			Size = UDim2.new(.5, -4, 1, 0),
			BackgroundColor3 = Z.yellow,
			Text = "Batal",
			TextColor3 = Z.text,
			Font = Enum.Font.GothamBold,
			TextSize = 13,
			LayoutOrder = 1,
			AutoButtonColor = false,
		}, N4);
	T(R4, 10);
	local u4 = j("TextButton", {
			Size = UDim2.new(.5, -4, 1, 0),
			BackgroundColor3 = Z.red,
			Text = "",
			TextColor3 = Z.white,
			Font = Enum.Font.GothamBold,
			TextSize = 13,
			LayoutOrder = 2,
			AutoButtonColor = false,
		}, N4);
	T(u4, 10);
	local v4, A4, F4 = 0, nil, nil;
	local function P4()
		local o = v4;
		r(O4, .18, { BackgroundTransparency = 1 });
		r(j4, .18, { GroupTransparency = 1 });
		r(T4, .18, { Scale = .85 });
		task.delay(.2, function()
			if v4 == o then
				O4.Visible = false;
			end;
		end);
	end;
	function Kk.ask(o, l, G, Z, g)
		v4 = v4 + 1;
		p4.Text, r4.Text, u4.Text = o, l, G;
		A4, F4 = Z, g;
		O4.Visible = true;
		O4.BackgroundTransparency, j4.GroupTransparency, T4.Scale = 1, 1, .8;
		r(O4, .2, { BackgroundTransparency = .5 });
		r(j4, .2, { GroupTransparency = 0 });
		r(T4, .32, { Scale = 1 }, O[1], O[2]);
	end;
	u4.Activated:Connect(function()
		local o = A4;
		A4 = nil;
		P4();
		if o then
			o();
		end;
	end);
	R4.Activated:Connect(function()
		local o = F4;
		A4, F4 = nil, nil;
		P4();
		if o then
			o();
		end;
	end);
	local U4;
	local function Y4(o, l)
		o.InputBegan:Connect(function(o)
			if U4 then
				return;
			end;
			local G = o.UserInputType;
			if G == Enum.UserInputType.MouseButton1 or G == Enum.UserInputType.Touch then
				U4 = {
						input = o,
						cfg = l,
						sx = o.Position.X,
						sy = o.Position.Y,
						moved = false,
						touch = (G == Enum.UserInputType.Touch),
					};
				if l.onStart then
					l.onStart();
				end;
			end;
		end);
	end;
	table.insert(Fk, b.InputChanged:Connect(function(o)
		local l = U4;
		if not l then
			return;
		end;
		if (l.touch and o == l.input) or ((not l.touch) and o.UserInputType == Enum.UserInputType.MouseMovement) then
			local G, Z = o.Position.X - l.sx, o.Position.Y - l.sy;
			if not l.moved and (G * G + Z * Z) > 36 then
				l.moved = true;
			end;
			if l.moved then
				l.cfg.onMove(G, Z);
			end;
		end;
	end));
	table.insert(Fk, b.InputEnded:Connect(function(o)
		local l = U4;
		if l and ((o == l.input or ((not l.touch) and o.UserInputType == Enum.UserInputType.MouseButton1))) then
			U4 = nil;
			if l.cfg.onEnd then
				l.cfg.onEnd(l.moved);
			end;
		end;
	end));
	local w4;
	Y4(W, { onStart = function()
			w4 = m;
		end, onMove = function(o, l)
			local G = Y();
			m = Vector2.new(math.clamp(w4.X + o, 0, math.max(0, G.X - i.X)), math.clamp(w4.Y + l, 0, math.max(0, G.Y - i.Y)));
			t();
		end });
	local a4 = j("TextButton", {
			Size = UDim2.fromOffset(26, 26),
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -2, 1, -2),
			BackgroundTransparency = 1,
			Text = "",
			ZIndex = 50,
			AutoButtonColor = false,
		}, B);
	local q4 = {};
	for o, l in ipairs({
		{ 18, 18 },
		{ 12, 18 },
		{ 18, 12 },
		{ 6, 18 },
		{ 12, 12 },
		{ 18, 6 },
	}) do
		local G = j("Frame", {
				Size = UDim2.fromOffset(3, 3),
				Position = UDim2.fromOffset(l[1], l[2]),
				BackgroundColor3 = Z.yellowDark,
				BorderSizePixel = 0,
				ZIndex = 51,
			}, a4);
		T(G, 2);
		table.insert(q4, G);
	end;
	a4.MouseEnter:Connect(function()
		for o, l in ipairs(q4) do
			r(l, .12, { BackgroundColor3 = Z.text });
		end;
	end);
	a4.MouseLeave:Connect(function()
		for o, l in ipairs(q4) do
			r(l, .12, { BackgroundColor3 = Z.yellowDark });
		end;
	end);
	local i4;
	Y4(a4, { onStart = function()
			i4 = i;
		end, onMove = function(o, l)
			local G = Y();
			local Z = math.min(720, math.max(300, (G.X - m.X) - 4));
			local g = math.min(820, math.max(340, (G.Y - m.Y) - 4));
			i = Vector2.new(math.clamp(i4.X + o, 300, Z), math.clamp(i4.Y + l, 340, g));
			t();
		end });
	local function m4(o)
		local l = Y();
		return Vector2.new(math.clamp(o.X, 32, math.max(32, l.X - 32)), math.clamp(o.Y, 32, math.max(32, l.Y - 32)));
	end;
	local function f4()
		if a.minimized or not a.ready or a.busy then
			return;
		end;
		a.minimized, a.busy = true, true;
		if not a.bubbleMoved then
			Q = m4(Vector2.new(m.X + 30, m.Y + 30));
		end;
		g4();
		r(B, .28, { GroupTransparency = 1, Position = UDim2.fromOffset(Q.X, Q.Y) }, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
		r(d, .28, { Scale = .15 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
		task.delay(.3, function()
			B.Visible = false;
			zv.Visible = true;
			l4.Scale = 0;
			r(l4, .4, { Scale = 1 }, O[1], O[2]);
			a.busy = false;
		end);
	end;
	local function Q4()
		if not a.minimized or a.busy then
			return;
		end;
		a.minimized, a.busy = false, true;
		local o = Y();
		m = Vector2.new(math.clamp(Q.X - 30, 8, math.max(8, (o.X - i.X) - 8)), math.clamp(Q.Y - 30, 8, math.max(8, (o.Y - i.Y) - 8)));
		r(l4, .15, { Scale = 0 });
		B.Size = UDim2.fromOffset(i.X, i.Y);
		B.Position = UDim2.fromOffset(Q.X, Q.Y);
		d.Scale, B.GroupTransparency, B.Visible = .15, 1, true;
		r(B, .36, { GroupTransparency = 0, Position = UDim2.fromOffset(m.X + i.X / 2, m.Y + i.Y / 2) });
		r(d, .42, { Scale = 1 }, O[1], O[2]);
		task.delay(.18, function()
			zv.Visible = false;
		end);
		task.delay(.45, function()
			a.busy = false;
		end);
	end;
	local b4;
	Y4(zv, { onStart = function()
			b4 = Q;
		end, onMove = function(o, l)
			a.bubbleMoved = true;
			Q = m4(Vector2.new(b4.X + o, b4.Y + l));
			g4();
		end, onEnd = function(o)
			if not o then
				Q4();
			end;
		end });
	I.Activated:Connect(f4);
	function o.fadeOut(o)
		r(d, .25, { Scale = .85 });
		r(B, .25, { GroupTransparency = 1 });
		r(l4, .2, { Scale = 0 });
		task.delay(.3, o);
	end;
	k.Activated:Connect(function()
		Kk.ask("Tutup GUI?", "Semua fitur akan berhenti dan GUI dihapus. Lanjutkan?", "Lanjut", function()
			Kk.ask("Konfirmasi terakhir", "Ini MENUTUP TOTAL program. Untuk menampilkan lagi harus eksekusi script ulang. Yakin?", "Tutup Total", function()
				Kk.closeAll();
			end);
		end);
	end);
	table.insert(Fk, b.InputBegan:Connect(function(o, l)
		if not l and (a.ready and o.KeyCode == P.ToggleKey) then
			if a.minimized then
				Q4();
			else
				f4();
			end;
		end;
	end));
	function o.refresh()
		for o, l in ipairs(G) do
			pcall(l);
		end;
	end;
	Kk.refreshUI = o.refresh;
	task.spawn(function()
		while Pk do
			vk();
			Ok.Text = Ak.status or "";
			pk.Text = (("Inv %s/%d  |  Tangkap %d  |  Fav %d  |  Jual %d")):format(tostring(Ak.inv or "?"), P.MaxInventory, Ak.caught, Ak.fav, Ak.sold);
			local l = Nk.farm and Z.green or Z.gray;
			lk.BackgroundColor3 = l;
			Z4.BackgroundColor3 = Nk.farm and Z.green or Z.gray;
			o.refresh();
			task.wait(.5);
		end;
	end);
	task.spawn(function()
		while Pk do
			K.Position = UDim2.new(-0.3, 0, -0.4, 0);
			if B.Visible and not a.minimized then
				r(K, 1.1, { Position = UDim2.new(1.3, 0, -0.4, 0) }, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
			end;
			task.wait(6);
		end;
	end);
	local B4;
	cv(function(o)
		h.Image = o;
		r(h, .4, { ImageTransparency = 0 });
		zv.Image = o;
		G4.Visible = false;
		if B4 then
			B4.Image = o;
			r(B4, .4, { ImageTransparency = 0 });
		end;
	end);
	local d4 = j("CanvasGroup", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.fromOffset(280, 220),
			BackgroundColor3 = Z.white,
			BorderSizePixel = 0,
			GroupTransparency = 1,
		}, w);
	T(d4, 20);
	p(d4, Z.yellow, 2);
	local t4 = j("UIScale", { Scale = .8 }, d4);
	local n4 = j("Frame", {
			AnchorPoint = Vector2.new(.5, 0),
			Position = UDim2.new(.5, 0, 0, 20),
			Size = UDim2.fromOffset(88, 88),
			BackgroundColor3 = Z.yellow,
			BorderSizePixel = 0,
		}, d4);
	T(n4, 44);
	p(n4, Z.yellowDark, 3);
	local W4 = j("UIScale", { Scale = 1 }, n4);
	j("TextLabel", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = u,
		Font = Enum.Font.GothamBlack,
		TextSize = 30,
		TextColor3 = Z.text,
	}, n4);
	B4 = j("ImageLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Crop,
		}, n4);
	T(B4, 44);
	j("TextLabel", {
		Position = UDim2.fromOffset(0, 118),
		Size = UDim2.new(1, 0, 0, 22),
		BackgroundTransparency = 1,
		Text = A,
		Font = Enum.Font.GothamBlack,
		TextSize = 18,
		TextColor3 = Z.text,
	}, d4);
	j("TextLabel", {
		Position = UDim2.fromOffset(0, 139),
		Size = UDim2.new(1, 0, 0, 14),
		BackgroundTransparency = 1,
		Text = F,
		Font = Enum.Font.GothamBold,
		TextSize = 11,
		TextColor3 = Z.yellowDark,
	}, d4);
	local K4 = j("Frame", {
			AnchorPoint = Vector2.new(.5, 0),
			Position = UDim2.new(.5, 0, 0, 168),
			Size = UDim2.fromOffset(200, 6),
			BackgroundColor3 = Z.line,
			BorderSizePixel = 0,
		}, d4);
	T(K4, 3);
	local E4 = j("Frame", { Size = UDim2.fromScale(0, 1), BackgroundColor3 = Z.yellow, BorderSizePixel = 0 }, K4);
	T(E4, 3);
	local X4 = j("TextLabel", {
			Position = UDim2.fromOffset(0, 180),
			Size = UDim2.new(1, 0, 0, 16),
			BackgroundTransparency = 1,
			Text = "",
			Font = Enum.Font.Gotham,
			TextSize = 10,
			TextColor3 = Z.muted,
		}, d4);
	(n:Create(W4, TweenInfo.new(.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Scale = 1.08 })):Play();
	task.spawn(function()
		r(d4, .35, { GroupTransparency = 0 });
		r(t4, .45, { Scale = 1 }, O[1], O[2]);
		local l = {
				{ (("Akun %s - mode %s")):format(y.Name, ok), .2 },
				{ ((hookmetamethod and getnamecallmethod)) and "Fitur executor lengkap" or "Fitur executor terbatas", .35 },
				{ Yk and "Minigame & state game ditemukan" or "Minigame ditemukan (mode GUI)", .7 },
				{ "Menyiapkan tampilan...", 1 },
			};
		for o, l in ipairs(l) do
			X4.Text = l[1];
			r(E4, .4, { Size = UDim2.fromScale(l[2], 1) });
			task.wait(.5);
		end;
		task.wait(.15);
		r(d4, .3, { GroupTransparency = 1 });
		r(t4, .3, { Scale = 1.12 });
		task.wait(.3);
		d4:Destroy();
		t();
		B.Visible = true;
		kv(1, true);
		o.refresh();
		r(B, .35, { GroupTransparency = 0 });
		r(d, .5, { Scale = 1 }, O[1], O[2]);
		a.ready = true;
		Kk.toast((("Masuk sebagai %s. Semua fitur MATI. Nyalakan sesuai kebutuhan.")):format(ok), Gk and "ok" or "info", 5);
	end);
	function o.destroy()
		pcall(function()
			w:Destroy();
		end);
	end;
	return o;
end;
local o4 = zv();
local function l4()
	Pk = false;
	Nk.farm, Nk.sellOn = false, false;
	pcall(Jv.disable);
	pcall(Vk);
	if Uk then
		pcall(Uk.SetHolding, Uk, false);
	end;
	for o, l in ipairs(Fk) do
		pcall(function()
			l:Disconnect();
		end);
	end;
	if m[G.g2o] then
		m[G.g2o].handler = nil;
	end;
	pcall(o4.destroy);
	m[G.g0a] = nil;
end;
function Kk.closeAll()
	o4.fadeOut(l4);
end;
m[G.g0a] = { Destroy = l4 };
task.spawn(function()
	pcall(lv);
end);
M("loaded v" .. (P.Version .. ". Semua fitur mati. Minimize/restore:"), P.ToggleKey.Name);
