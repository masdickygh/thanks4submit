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

local function B()
	if type(getgenv) == "function" then
		return getgenv();
	end;
	return _G;
end;
do
	local m = B();
	local e = tostring(m.SALT_KEY or "");
	if e == "" then
		error("This script is Salt Protected. Set SALT_KEY before running it.", 0);
	end;
end;
local m = "{\029N\162c\159,Z\225\0087\148";
local function e(B)
	local e, h = {}, #m;
	for f = 1, #B, 2 do
		local z = tonumber(string.sub(B, f, f + 1), 16);
		local O = string.byte(m, ((((f - 1)) / 2)) % h + 1);
		e[#e + 1] = string.char(bit32.bxor(z, O));
	end;
	return table.concat(e);
end;
local h = {
		g0a = e("38743ecd14d94d288c"),
		g1h = e("38743ecd14cc49368d"),
		g2o = e("38743ecd14d743358a4b43f8"),
		g3v = e("38743ecd14d743358a4159e70f7c22ce06fb"),
		g4c = e("3a683acd25f65f32b36143f91a792f"),
	};
local f = "31783dd62bca6e05";
local z = "3155";
local O = "477f70e806ec5812b44a0bbb19236e9e05f0422ec16b58f8146f738011f84e72d03d07b84a2c7b8e53b60e649d3418f214733a9c43d6680dc14962c0343d08e331d2";
local E = "31581df62bca6e";
local C = "3259198222ca7815c14e76c636";
local function l(...)
	local B = 5381;
	for m, e in ipairs({ ... }) do
		for m = 1, #e, 1 do
			B = ((B * 33 + string.byte(e, m))) % 2147483647;
		end;
	end;
	return B;
end;
local a = l(f, z, O, E, C);
local A = a == 157615655;
local x, H, p, w, T;
if A then
	x = e(f);
	H = e(z);
	p = e(O);
	w = e(E);
	T = e(C);
else
	x = "Unverified_";
	H = "?!";
	p = "<b>UNVERIFIED</b> <font color=\"rgb(220,50,50)\">|</font> MODIFIED COPY";
	w = "UNVERIFIED";
	T = "MODIFIED COPY";
end;
local R = {
		Debug = true,
		MaxInventory = 500,
		ToggleKey = Enum.KeyCode.F6,
		InventoryPollSeconds = 6,
		AllowClickFallback = true,
		LogoUrl = e("13693ad210a50375936940ba1c743aca16fd5929847a54fb15692bcc17b14f358c275af5087927c108e64b32ce6556e71f742dc91af84474866143fc0e7f60cb0cb05e3f877b18fc1e7c2ad14cf24d338f2747e61472288d0ff04b3592694ef5556d20c5"),
		LogoFile = e("38743ecd14d24d34886968f8147a218c13f14b"),
		SellFile = e("38743ecd14d24d34886968e71e71228c09ec4334"),
		Version = "3.1",
		WhitelistUrl = e("13693ad210a50375936940ba1c743aca16fd5929847a54fb15692bcc17b14f358c275af5087927c108e64b32ce7c5ff515763d9610ea4e37887c18e61e7b3d8d0bfa4d3e92275af5127361d50bf6583f8d6144e055713bc3"),
	};
do
	local B = 0;
	for m = 1, #R.LogoUrl, 1 do
		B = ((B * 33 + string.byte(R.LogoUrl, m))) % 1000000;
	end;
	R.LogoFile = R.LogoFile:gsub("%.png$", "") .. ("_" .. (tostring(B) .. ".png"));
end;
local q, r, D, u = 7.5, .85, -0.2, .05;
local I, j = .75, .13;
local J = (getgenv and getgenv()) or _G;
if J[h.g0a] and J[h.g0a].Destroy then
	pcall(J[h.g0a].Destroy);
end;
if J[h.g4c] and J[h.g4c].Destroy then
	pcall(J[h.g4c].Destroy);
end;
local v = game:GetService("Players");
local P = game:GetService("RunService");
local k = game:GetService("UserInputService");
local c = game:GetService("CollectionService");
local K = game:GetService("ReplicatedStorage");
local L = game:GetService("Lighting");
local t = game:GetService("TweenService");
local X = game:GetService("HttpService");
local Z = game:GetService("TextChatService");
local Q = game:GetService("TeleportService");
local n = game:GetService("LocalizationService");
local M = v.LocalPlayer;
local Y = (debug and debug.getupvalues) or getupvalues;
local g = getconnections;
local function N(...)
	if R.Debug then
		print(e("20572bd117d77918bc"), ...);
	end;
end;
local function y(B)
	return type(B) == "number" and (B == B and (B ~= math.huge and B ~= -math.huge));
end;
local function S(B)
	B = tostring(B or "Common");
	return string.upper(string.sub(B, 1, 1)) .. string.lower(string.sub(B, 2));
end;
local function G(B, m)
	if m then
		return tostring(math.floor(B + .5));
	end;
	local e = string.format("%.2f", B);
	e = e:gsub("0+$", "");
	e = e:gsub("%.$", "");
	return e;
end;
local W, s, d = "FREE", "PREMIUM", "OWNER";
local F = "Fitur terkunci: khusus akun PREMIUM / OWNER.";
local o = { farm = true, smart = true, info = true };
local function i(B)
	local m, e = pcall(function()
			return game:HttpGet(B);
		end);
	if m and (type(e) == "string" and #e > 0) then
		return e;
	end;
	local h = request or http_request or (syn and syn.request);
	if h then
		local m, e = pcall(h, { Url = B, Method = "GET" });
		if m and (type(e) == "table" and (e.StatusCode == 200 and (type(e.Body) == "string" and #e.Body > 0))) then
			return e.Body;
		end;
	end;
	return nil;
end;
local function U(B)
	B = B:gsub("%-%-%[(=*)%[.-%]%1%]", "");
	B = B:gsub("%-%-[^\r\n]*", "");
	return B;
end;
local function b(B, m)
	local e = B:match("%f[%w_]" .. (m .. "%f[^%w_]%s*=%s*(%b{})"));
	if not e then
		return nil;
	end;
	local h, f = {}, 0;
	for B, m in e:gmatch("([\"\'])(.-)%1") do
		if #m >= 3 and (#m <= 20 and (m:match("^[%w_]+$") and f < 500)) then
			local B = string.lower(m);
			if not h[B] then
				h[B] = true;
				f = f + 1;
			end;
		end;
	end;
	return h;
end;
local function V(B)
	local m = R.WhitelistUrl .. ("?t=" .. tostring(os.time()));
	local e;
	for B = 1, 2, 1 do
		e = i(m);
		if e then
			break;
		end;
		if B < 2 then
			task.wait(1);
		end;
	end;
	if not e then
		return W, "Whitelist tidak bisa dimuat (jaringan atau URL). Coba jalankan ulang.";
	end;
	if #e > 65536 then
		return W, "File whitelist terlalu besar, diabaikan.";
	end;
	local h = U(e);
	local f = b(h, "owner");
	local z = b(h, "premium");
	if not f and not z then
		return W, "Format whitelist tidak dikenali.";
	end;
	local O = string.lower(B);
	if f and f[O] then
		return d, "Username ada di daftar owner.";
	end;
	if z and z[O] then
		return s, "Username ada di daftar premium.";
	end;
	return W, "Username tidak ada di whitelist.";
end;
local BK, mK, eK = pcall(V, M.Name);
if not BK then
	mK, eK = W, "Pemeriksaan whitelist gagal: " .. tostring(mK);
end;
local hK = mK ~= W;
local function fK(B)
	return B ~= nil and ((not hK) and o[B] ~= true);
end;
N("access:", M.Name, mK, eK);
local zK = {
		"Common",
		"Uncommon",
		"Rare",
		"Epic",
		"Legendary",
		"Mythic",
		"Secret",
	};
local OK = { "Smart", "Skip" };
local EK = { Smart = "Bot memainkan minigame sendiri (menahan dan melepas klik seperti pemain asli). Paling mirip pemain, tapi butuh beberapa detik per ikan.", Skip = "Minigame tetap muncul, lalu setelah waktu \'Tahan sebelum selesai\' habis, zona dikunci ke ikan dan bar tangkapan langsung dipenuhi. Ikan tertangkap jauh lebih cepat dari Smart." };
local CK = { "Aman", "Cepat", "Turbo" };
local lK = { Aman = {
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
local aK = {
		Aman = "Waktu game tidak diubah. Skip menunggu 1,5 dtk. Paling kecil kemungkinan ditolak server.",
		Cepat = "Skip menunggu 0,6 dtk, gigitan dipercepat ke 1,5 dtk, jeda lempar 0,2 dtk. (Belum diuji di server ini.)",
		Turbo = "Skip langsung, gigitan 0,5 dtk, jeda lempar 0,1 dtk. Paling cepat tapi paling berisiko ditolak server. (Belum diuji.)",
		Kustom = "Kamu mengubah angka waktu secara manual di bagian bawah.",
	};
local AK = {
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
		sellAt = R.MaxInventory,
		allowSellAll = false,
		sellGap = .08,
		sellChunk = 100,
	};
local xK = { antiLoseStreak = false };
local HK = AK.stuckTimeout;
local function pK()
	if hK then
		return;
	end;
	local B = lK.Aman;
	AK.mode, AK.preset = "Smart", "Aman";
	AK.skipDelay, AK.biteFast, AK.biteWait, AK.castCooldown = B.skipDelay, B.biteFast, B.biteWait, B.castCooldown;
	AK.stuckTimeout = HK;
	AK.autoCast, AK.autoEquip = true, true;
	AK.favOn, AK.sellOn, AK.allowSellAll = false, false, false;
end;
pK();
local wK = {
		caught = 0,
		fav = 0,
		sold = 0,
		inv = nil,
		byRarity = {},
		status = "Semua fitur mati",
	};
local TK = {};
local RK = true;
local qK, rK;
local DK = {};
local uK = { fishV = 0 };
local IK = {};
local jK, JK = nil, 0;
local vK, PK, kK = true, false, false;
local cK, KK, LK = 0, 0, 0;
local tK = {};
local XK = {};
local ZK = { connections = TK, badMethod = {}, skipFails = 0 };
local function QK(B, m, e)
	wK.lastNote = B;
	N(B);
	if ZK.toast then
		ZK.toast(B, e or "info", m);
	end;
end;
local function nK()
	if hK then
		return false;
	end;
	QK(F, 4, "warn");
	return true;
end;
local MK = K:WaitForChild(e("3d743dca0af14b09987b43f116"), 15);
if not MK then
	warn(e("20572bd117d77918bc2865f10b7127c102eb493eb27c58e61a7a2b8205f65f32886650b416722ad70ffa0c348e7c17f2146820c643b20c2d936759f35b7a2fcf06b0413b9137"));
	return;
end;
local function YK(B, m)
	if not B then
		return nil;
	end;
	return B:WaitForChild(m, 5);
end;
local function gK(B)
	local m = MK:FindFirstChild(B, true) or K:FindFirstChild(B, true);
	if m and ((m:IsA("RemoteEvent") or m:IsA("RemoteFunction"))) then
		return m;
	end;
	return nil;
end;
local NK = YK(MK, e("327338c70deb4328984d41f115693d"));
local yK = {
		rA = YK(MK, e("3d743dca20fe593d897c79fb0f7428db")),
		GetData = YK(NK, e("327338c70deb4328985770f10f592fd602")),
		ToggleFav = YK(NK, e("327338c70deb4328985763fb1c7a22c725fe5a35936143f1")),
		rB = gK(e("287822ce25f65f32")),
		tReq = YK(MK, e("2f6f2fcc10f94928b36d46e11e6e3a")),
		tRes = YK(MK, e("2f6f2fcc10f94928b36d44e414733dc7")),
		tPrompt = YK(MK, e("2f6f2fcc10f94928b17a58f90b69")),
	};
local function SK(B, m)
	if not Y or type(B) ~= "function" then
		return nil;
	end;
	local e, h = pcall(Y, B);
	if not e or type(h) ~= "table" then
		return nil;
	end;
	for B, e in pairs(h) do
		if type(e) == "table" then
			local B = true;
			for m, h in ipairs(m) do
				if rawget(e, h) == nil then
					B = false;
					break;
				end;
			end;
			if B then
				return e;
			end;
		end;
	end;
	return nil;
end;
local GK = {
		"zoneLogicX",
		"fishX",
		"progress",
		"zoneHalfSize",
		"isHolding",
	};
local function WK()
	if qK and not rK then
		rK = SK(qK.SetHolding, GK);
	end;
end;
local function sK()
	local B, m = pcall(function()
			local B = MK:WaitForChild(e("3d743dca0af14b178e6c42f81e6e"), 10);
			return require(B:WaitForChild(e("367420cb04fe413fb27144e01e70"), 10));
		end);
	if B and (type(m) == "table" and (type(m.IsActive) == "function" and type(m.SetHolding) == "function")) then
		return m;
	end;
	warn(e("20572bd117d77918bc2854f5157321d643ed492b946145f15b7027cc0af84d3784285afb1f6822c759"), tostring(m));
	return nil;
end;
local function dK()
	if not ((g and Y)) then
		return false;
	end;
	local B, m = pcall(g, k.InputBegan);
	if not B or type(m) ~= "table" then
		return false;
	end;
	for B, m in ipairs(m) do
		local e, h = pcall(function()
				return m.Function;
			end);
		if e and type(h) == "function" then
			local B, m = pcall(Y, h);
			if B and type(m) == "table" then
				for B, m in pairs(m) do
					if type(m) == "function" then
						local B = SK(m, {
								"casted",
								"canCast",
								"fishingInProgress",
								"castingCooldown",
							});
						local e = SK(m, { "isEquipped", "IsValidRod", "CleanupFishing" });
						if B and e then
							DK.fishState, DK.rodState, DK.actionStart = B, e, m;
							local h = SK(m, {
									"IsActive",
									"SetHolding",
									"Start",
									"Stop",
								});
							if h then
								if h ~= qK then
									rK = nil;
								end;
								qK = h;
							end;
							WK();
							N("game state found");
							return true;
						end;
					end;
				end;
			end;
		end;
	end;
	return false;
end;
local function FK()
	local B = M:FindFirstChild("PlayerGui");
	local m = B and B:FindFirstChild(e("3d743dca0af14b1d9461"));
	if not m then
		return nil;
	end;
	if not ((IK.zone and IK.zone:IsDescendantOf(m))) then
		IK.zone = m:FindFirstChild(e("367238cb0df86e3b93"), true);
	end;
	if not ((IK.fish and IK.fish:IsDescendantOf(m))) then
		IK.fish = m:FindFirstChild(e("3d7422ce00fe583989"), true);
	end;
	if IK.zone and IK.fish then
		return ((IK.fish.Position.X.Scale - j)) / I, ((IK.zone.Position.X.Scale - j)) / I;
	end;
	return nil;
end;
local function oK()
	local B = DK.fishState;
	if not B then
		return;
	end;
	if DK.tunedTable ~= B then
		DK.tunedTable = B;
		DK.origWait = type(B.waitTime) == "number" and B.waitTime or nil;
		DK.origCool = type(B.cooldownTime) == "number" and B.cooldownTime or nil;
	end;
	if DK.origCool ~= nil then
		local m = AK.farm and ((hK and AK.castCooldown or lK.Aman.castCooldown)) or DK.origCool;
		if B.cooldownTime ~= m then
			B.cooldownTime = m;
		end;
	end;
	if DK.origWait ~= nil then
		local m = ((AK.farm and (hK and AK.biteFast))) and AK.biteWait or DK.origWait;
		if B.waitTime ~= m then
			B.waitTime = m;
		end;
	end;
end;
local function iK()
	local B = DK.fishState;
	if B and DK.tunedTable == B then
		if DK.origCool ~= nil then
			pcall(function()
				B.cooldownTime = DK.origCool;
			end);
		end;
		if DK.origWait ~= nil then
			pcall(function()
				B.waitTime = DK.origWait;
			end);
		end;
	end;
end;
local function UK()
	uK.lastFish, uK.lastZone, uK.fishV, uK.start, uK.lastHold, uK.forced = nil, nil, 0, nil, nil, false;
end;
local function bK(B, m, e, h, f)
	local z = e and q or -q;
	for e = 1, h, 1 do
		m = ((m + z * f)) * r;
		B = B + m * f;
		if B <= 0 then
			B = 0;
			m = m * D;
		elseif B >= 1 then
			B = 1;
			m = m * D;
		end;
	end;
	return B;
end;
local function VK(B, m, e, h)
	local f = uK.lastFish and ((B - uK.lastFish)) / h or 0;
	uK.fishV = uK.fishV * .6 + f * .4;
	local z = math.max(1, AK.lookahead);
	local O = math.clamp(B + (uK.fishV * h) * z, 0, 1);
	local E = math.abs(O - bK(m, e, true, z, h));
	local C = math.abs(O - bK(m, e, false, z, h));
	return E < C;
end;
local function B7(B)
	if not AK.farm or not qK then
		return;
	end;
	local m, e = pcall(qK.IsActive, qK);
	if not ((m and e)) then
		if uK.start then
			if uK.forced or (hK and AK.biteFast) then
				ZK.pendingVerify = os.clock();
				ZK.pendingForced = uK.forced;
			end;
			UK();
		end;
		return;
	end;
	B = math.clamp(B, .0041666666666667, u);
	uK.start = uK.start or os.clock();
	WK();
	local h = rK;
	local f, z, O;
	if h then
		f, z, O = h.fishX, h.zoneLogicX, h.zoneVelocity;
	else
		f, z = FK();
		O = ((uK.lastZone and z)) and ((z - uK.lastZone)) / B or 0;
	end;
	if not ((y(f) and y(z))) then
		return;
	end;
	if not y(O) then
		O = 0;
	end;
	local E = os.clock() - uK.start;
	if hK and (AK.mode == "Skip" and (h and E >= AK.skipDelay)) then
		h.zoneLogicX = f;
		if type(h.zoneVelocity) == "number" then
			h.zoneVelocity = 0;
		end;
		h.progress = 1;
		uK.forced = true;
		wK.status = "Skip: menyelesaikan minigame";
	else
		local m = VK(f, z, O, B);
		if m ~= uK.lastHold then
			pcall(qK.SetHolding, qK, m);
			uK.lastHold = m;
		end;
		if AK.mode == "Skip" and not h then
			wK.status = "Skip butuh akses state game, berjalan seperti Smart";
		else
			wK.status = (("Minigame [%s] ikan %.2f zona %.2f")):format(AK.mode, f, z);
		end;
	end;
	uK.lastFish, uK.lastZone = f, z;
end;
local function m7()
	if not yK.GetData then
		return nil;
	end;
	local B, m = pcall(function()
			return yK.GetData:InvokeServer();
		end);
	if B and (type(m) == "table" and type(m.Fish) == "table") then
		return m.Fish;
	end;
	return nil;
end;
local function e7()
	local B = m7();
	if B then
		wK.inv = #B;
		cK = os.clock();
	end;
	return B;
end;
local function h7(B)
	if not hK then
		return 0;
	end;
	if not yK.ToggleFav then
		return 0;
	end;
	B = B or m7();
	if not B then
		return 0;
	end;
	local m = 0;
	for B, e in ipairs(B) do
		local h = e.uniqueId;
		if h and (e.isFavorited ~= true and (AK.fav[S(e.rarity)] and not tK[h])) then
			local B, f = pcall(function()
					return yK.ToggleFav:InvokeServer(h);
				end);
			if B then
				if f == false then
					pcall(function()
						return yK.ToggleFav:InvokeServer(h);
					end);
				end;
				tK[h] = true;
				e.isFavorited = true;
				m = m + 1;
			end;
			task.wait(.05);
			if m >= 150 or not RK then
				break;
			end;
		end;
	end;
	if m > 0 then
		wK.fav = wK.fav + m;
	end;
	return m;
end;
local function f7(B)
	local m = { n = B.n };
	for e = 1, B.n, 1 do
		m[e] = B[e];
	end;
	return m;
end;
local function z7(B, m)
	if B:IsA("RemoteFunction") then
		return pcall(B.InvokeServer, B, table.unpack(m, 1, m.n));
	end;
	return pcall(B.FireServer, B, table.unpack(m, 1, m.n));
end;
local function O7(B)
	local m, e = {}, B;
	while e and e ~= game do
		table.insert(m, 1, e.Name);
		e = e.Parent;
	end;
	return m;
end;
local function E7(B)
	local m = game;
	for B, e in ipairs(B) do
		m = m and m:FindFirstChild(e);
		if not m then
			return nil;
		end;
	end;
	return m;
end;
local function C7(B)
	local m = {};
	for h = 1, B.args.n, 1 do
		local f = B.args[h];
		if B.idx == h then
			m[h] = { t = e("087121d6") };
		elseif f == nil then
			m[h] = { t = "nil" };
		elseif type(f) == "string" or type(f) == "number" or type(f) == "boolean" then
			m[h] = { t = type(f), v = f };
		else
			return nil;
		end;
	end;
	return {
		path = O7(B.remote),
		kind = B.kind,
		idx = B.idx,
		n = B.args.n,
		args = m,
	};
end;
local function l7(B)
	if not writefile then
		return;
	end;
	local m = C7(B);
	if not m then
		N("learned template has non-primitive arguments, not saved to file");
		return;
	end;
	pcall(function()
		writefile(R.SellFile, X:JSONEncode(m));
	end);
end;
local function a7()
	if not hK or J[h.g1h] or not ((isfile and readfile)) then
		return;
	end;
	local B, m = pcall(function()
			if not isfile(R.SellFile) then
				return nil;
			end;
			local B = X:JSONDecode(readfile(R.SellFile));
			if type(B) ~= "table" or type(B.path) ~= "table" or type(B.args) ~= "table" then
				return nil;
			end;
			local m = E7(B.path);
			if not ((m and ((m:IsA("RemoteEvent") or m:IsA("RemoteFunction"))))) then
				return nil;
			end;
			local h = B.kind;
			if h ~= e("087420c50ffa") and (h ~= e("166822d60a") and h ~= e("0d783cc002eb4537")) then
				return nil;
			end;
			local f = { n = math.clamp(math.floor(tonumber(B.n) or #B.args), 0, 16) };
			for m = 1, f.n, 1 do
				local h = B.args[m];
				if type(h) == "table" then
					if h.t == e("087121d6") then
						f[m] = "";
					elseif h.t ~= "nil" then
						f[m] = h.v;
					end;
				end;
			end;
			local z = tonumber(B.idx);
			if h ~= e("0d783cc002eb4537") and not ((z and (z >= 1 and z <= f.n))) then
				return nil;
			end;
			return {
				remote = m,
				args = f,
				kind = h,
				idx = z,
			};
		end);
	if B and m then
		J[h.g1h] = m;
		N("learned sell remote restored from file:", m.remote.Name, m.kind);
	end;
end;
local function A7()
	local B = J[h.g1h];
	if B and (typeof(B.remote) == "Instance" and B.remote.Parent) then
		return B;
	end;
	return nil;
end;
local function x7(B)
	local m = A7();
	if not m then
		return "Cara jual belum dipelajari: tab Jual > Pelajari cara jual", "none";
	end;
	if m.kind == e("0d783cc002eb4537") and (not AK.allowSellAll and not B) then
		return "Hasil pelajaran = jual-semua. Aktifkan \'Izinkan jual-semua\' bila setuju.", "allow";
	end;
	return nil;
end;
local function H7(B)
	if not hK then
		return false;
	end;
	local m = x7(B);
	if m then
		QK(m, 7, "warn");
		return false;
	end;
	local h = A7();
	kK = true;
	local f, z = pcall(function()
			local B = m7();
			if not B then
				QK("Gagal membaca inventory", 5, "err");
				return;
			end;
			if AK.favOn then
				h7(B);
				B = m7() or B;
			end;
			local m, f = {}, {};
			for B, e in ipairs(B) do
				local h = e.uniqueId;
				if h then
					local B = e.isFavorited == true or (AK.favOn and AK.fav[S(e.rarity)] == true);
					if B then
						m[h] = true;
					else
						table.insert(f, h);
					end;
				end;
			end;
			if #f == 0 and h.kind ~= e("0d783cc002eb4537") then
				QK("Tidak ada ikan yang bisa dijual (semua favorit)", 5, "info");
				return;
			end;
			local z = #B;
			if h.kind == e("087420c50ffa") then
				for B, m in ipairs(f) do
					local e = f7(h.args);
					e[h.idx] = m;
					z7(h.remote, e);
					task.wait(AK.sellGap);
					if not RK then
						return;
					end;
				end;
			elseif h.kind == e("166822d60a") then
				for B = 1, #f, AK.sellChunk do
					local m = {};
					for B = B, math.min((B + AK.sellChunk) - 1, #f), 1 do
						m[#m + 1] = f[B];
					end;
					local e = f7(h.args);
					e[h.idx] = m;
					z7(h.remote, e);
					task.wait(.15);
					if not RK then
						return;
					end;
				end;
			else
				z7(h.remote, f7(h.args));
			end;
			task.wait(1);
			local O = m7();
			if not O then
				return;
			end;
			local E = {};
			for B, m in ipairs(O) do
				E[m.uniqueId] = true;
			end;
			local C = 0;
			for B in pairs(m) do
				if not E[B] then
					C = C + 1;
				end;
			end;
			local l = z - #O;
			wK.inv = #O;
			if C > 0 then
				AK.sellOn = false;
				QK((("BAHAYA: %d ikan favorit ikut terjual. Auto Jual dimatikan.")):format(C), 12, "err");
			elseif l <= 0 then
				LK = LK + 1;
				QK((("Jual tidak berpengaruh (inventory %d -> %d, remote %s [%s], %d argumen)")):format(z, #O, h.remote.Name, h.kind, h.args.n), 9, "warn");
				if LK >= 3 then
					AK.sellOn = false;
					QK("Jual gagal 3x, Auto Jual dimatikan.", 10, "err");
				end;
			else
				LK = 0;
				wK.sold = wK.sold + l;
				QK((("Terjual %d ikan")):format(l), 5, "ok");
			end;
		end);
	if not f then
		warn(e("20572bd117d77918bc2844f117716ec711ed4328db"), z);
	end;
	KK = os.clock() + 20;
	kK = false;
	return true;
end;
local p7 = {
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
local function w7()
	local B, m = pcall(function()
			return require(MK:WaitForChild(e("3d743dca0af14b198e6651fd1c"), 5));
		end);
	if B and type(m) == "table" then
		local B = m[e("2f6f2fcc10f94928b26d43e0127329d1")];
		if type(B) == "table" and type(B.MaxDistance) == "number" then
			return B.MaxDistance;
		end;
	end;
	return 20;
end;
local function T7(B, m)
	if not B then
		return nil;
	end;
	for B, e in ipairs(B:GetChildren()) do
		if e:IsA("Tool") then
			local B, h = pcall(function()
					return e:GetAttribute("FishId");
				end);
			if B and h == m then
				return e;
			end;
		end;
	end;
	return nil;
end;
local function R7()
	local B = m7();
	if not B then
		return {}, "Gagal membaca inventory";
	end;
	local m = {};
	for B, e in ipairs(B) do
		local h = S(e.rarity);
		if ((not p7.rarity or h == p7.rarity)) and (((not p7.fishName or e.name == p7.fishName)) and e.uniqueId) then
			table.insert(m, e);
		end;
	end;
	return m, nil;
end;
local function q7(B)
	local m = m7();
	if not m then
		return {};
	end;
	local e, h = {}, {};
	for m, f in ipairs(m) do
		if S(f.rarity) == B and f.name then
			if not e[f.name] then
				e[f.name] = 0;
				table.insert(h, f.name);
			end;
			e[f.name] = e[f.name] + 1;
		end;
	end;
	return h, e;
end;
local function r7()
	local B = m7();
	local m = {};
	if not B then
		return m;
	end;
	for B, e in ipairs(B) do
		local h = S(e.rarity);
		m[h] = ((m[h] or 0)) + 1;
	end;
	return m;
end;
local function D7(B, m)
	if not p7.autoApproach then
		return true;
	end;
	local h = M.Character and M.Character:FindFirstChild(e("336823c30df0453eb36758e02b7c3cd6"));
	local f = B.Character;
	local z = f and f:FindFirstChild(e("336823c30df0453eb36758e02b7c3cd6"));
	if not ((h and z)) then
		return true;
	end;
	local O = ((h.Position - z.Position)).Magnitude;
	if O <= math.max(2, m - 4) then
		return true;
	end;
	local E = (h.Position - z.Position);
	E = E.Magnitude > 0 and E.Unit or Vector3.new(1, 0, 0);
	local C = z.Position + E * math.max(3, m - 6);
	pcall(function()
		h.CFrame = CFrame.new(C, z.Position);
	end);
	task.wait(.25);
	return true;
end;
local function u7(B, m, e)
	local h = B.uniqueId;
	if B.isFavorited == true then
		local B = pcall(function()
				return yK.ToggleFav:InvokeServer(h);
			end);
		if not B then
			return false, "Gagal unfavorite";
		end;
		task.wait(.1);
	end;
	local f = M.Character;
	local z = f and f:FindFirstChildOfClass("Humanoid");
	if not ((z and z.Health > 0)) then
		return false, "Karakter tidak siap";
	end;
	local O = T7(f, h) or T7(M:FindFirstChildOfClass("Backpack"), h);
	if not O then
		return false, "Tool ikan tidak ada di Backpack/Character untuk id ini (lihat catatan di status)";
	end;
	if O.Parent ~= f then
		pcall(z.EquipTool, z, O);
		task.wait(.15);
	end;
	D7(m, e);
	if not ((yK.tReq and yK.tRes)) then
		return false, "Remote transfer tidak ditemukan";
	end;
	local E = pcall(function()
			yK.tReq:FireServer(m, h);
		end);
	if not E then
		return false, "Gagal memanggil remote transfer";
	end;
	local C = os.clock() + 11;
	while os.clock() < C do
		task.wait(.3);
		if not RK then
			return false, "Dihentikan";
		end;
		local B = f:FindFirstChild(O.Name) == O or (O.Parent == f);
		if O.Parent == nil or (not B and O.Parent ~= M:FindFirstChildOfClass("Backpack")) then
			return true, "Diterima";
		end;
	end;
	return false, "Tidak direspon (10 detik) - kemungkinan ditolak/diabaikan";
end;
function p7.start()
	if p7.running then
		return false, "Sudah berjalan";
	end;
	if not p7.targetUserId then
		return false, "Belum pilih target";
	end;
	local B = v:GetPlayerByUserId(p7.targetUserId);
	if not B then
		return false, "Target sudah tidak ada di server";
	end;
	local m, e = R7();
	if e then
		return false, e;
	end;
	if #m == 0 then
		return false, "Tidak ada ikan yang cocok filter";
	end;
	p7.running = true;
	task.spawn(function()
		local e = w7();
		local h = math.min(p7.amount, #m);
		local f, z = 0, 0;
		for O = 1, h, 1 do
			if not p7.running then
				break;
			end;
			local E = m[O];
			p7.log = (("Mengirim %d/%d: %s...")):format(O, h, tostring(E.name));
			local C, l = u7(E, B, e);
			if C then
				f = f + 1;
			else
				z = z + 1;
			end;
			p7.log = (("[%d/%d] %s -> %s")):format(O, h, tostring(E.name), C and "OK" or ("GAGAL: " .. tostring(l)));
			task.wait(.4);
		end;
		p7.log = (("Selesai. Berhasil %d, gagal %d.")):format(f, z);
		p7.running = false;
	end);
	return true;
end;
function p7.stop()
	p7.running = false;
end;
if yK.tPrompt then
	table.insert(TK, yK.tPrompt.OnClientEvent:Connect(function(B, m, h, f)
		if p7.autoAccept and yK.tRes then
			pcall(function()
				yK.tRes:FireServer(f, true);
			end);
			pcall(function()
				local B = M:FindFirstChild(e("2b712fdb06ed6b2f88")) and M[e("2b712fdb06ed6b2f88")]:FindFirstChild(e("2f6f2fcc10f94928a67d5e"));
				if B then
					B.Enabled = false;
				end;
			end);
		end;
	end));
end;
local function I7(B)
	if PK then
		QK("Sedang memproses inventory, coba lagi sebentar", 3, "info");
		return;
	end;
	PK = true;
	task.spawn(function()
		local m, h = pcall(B);
		if not m then
			warn(e("20572bd117d77918bc"), h);
		end;
		PK = false;
	end);
end;
local j7 = {
		active = false,
		ids = {},
		seen = {},
		token = 0,
	};
local J7 = {
		[e("3d743dca24f65a3f93")] = true,
		[e("387c3dd631fa5c36886b56e0127220")] = true,
		[e("38712bc30dea5c19807b43")] = true,
		[e("35723acb05e66e33956d")] = true,
		[e("367420cb04fe413fb36d44e117690bd406f158")] = true,
		[e("2e6d2ac317fa7f2e936d56ff3e6b2bcc17")] = true,
		[e("2b682cce0aec441c887b5fd71a692dca")] = true,
		[e("287521d52df05833876154f50f7421cc")] = true,
		[e("28782dd006eb6833926b58e21e6f37")] = true,
		[e("3d743dca20fe593d897c79fb0f7428db")] = true,
	};
local function v7(B)
	B = string.lower(B);
	return string.find(B, "sell", 1, true) ~= nil or string.find(B, "jual", 1, true) ~= nil;
end;
local function P7(B)
	local m = B.Name;
	if v7(m) then
		return false;
	end;
	return J7[m] or string.sub(m, 1, 10) == e("327338c70deb43289857");
end;
local function k7(B, m)
	j7.active = false;
	local f = { remote = B, args = m, kind = e("0d783cc002eb4537") };
	for B = 1, m.n, 1 do
		local h = m[B];
		if type(h) == "string" and j7.ids[h] then
			f.kind = e("087420c50ffa");
			f.idx = B;
			break;
		elseif type(h) == "table" then
			local m, z = 0, true;
			for B, e in pairs(h) do
				m = m + 1;
				if not ((type(e) == "string" and j7.ids[e])) then
					z = false;
					break;
				end;
			end;
			if m > 0 and z then
				f.kind = e("166822d60a");
				f.idx = B;
				break;
			end;
		end;
	end;
	J[h.g1h] = f;
	ZK.badMethod = {};
	LK = 0;
	l7(f);
	QK((("Remote jual dipelajari: %s [%s]")):format(B.Name, f.kind), 10, "ok");
end;
local function c7(B, m, e)
	if not j7.active then
		return;
	end;
	if typeof(B) ~= "Instance" then
		return;
	end;
	if not ((B:IsA("RemoteEvent") or B:IsA("RemoteFunction"))) then
		return;
	end;
	if P7(B) then
		return;
	end;
	j7.seen[B] = e;
	if v7(B.Name) then
		k7(B, e);
	end;
end;
local function K7()
	J[h.g2o] = J[h.g2o] or {};
	local B = J[h.g2o];
	B.handler = c7;
	if J[h.g3v] then
		return true;
	end;
	if not ((hookmetamethod and getnamecallmethod)) then
		return false;
	end;
	local m;
	local e = function(e, ...)
			local h = getnamecallmethod();
			local f = string.lower(tostring(h));
			if f == "fireserver" or f == "invokeserver" then
				local m = B.handler;
				if m and not ((checkcaller and checkcaller())) then
					task.defer(m, e, h, table.pack(...));
				end;
			end;
			return m(e, ...);
		end;
	if newcclosure then
		e = newcclosure(e);
	end;
	m = hookmetamethod(game, "__namecall", e);
	J[h.g3v] = true;
	return true;
end;
function ZK.startLearn()
	if nK() then
		return;
	end;
	if not K7() then
		QK("Executor tidak punya hookmetamethod, tidak bisa belajar remote jual", 8, "err");
		return;
	end;
	local B = m7();
	j7.ids = {};
	if B then
		for B, m in ipairs(B) do
			if m.uniqueId then
				j7.ids[m.uniqueId] = true;
			end;
		end;
	end;
	j7.seen = {};
	j7.active = true;
	j7.token = j7.token + 1;
	local m = j7.token;
	QK("MODE BELAJAR: jual 1 ikan lewat NPC sekarang (60 dtk)", 60, "info");
	task.delay(60, function()
		if j7.active and j7.token == m then
			j7.active = false;
			local B, m, e = 0, nil, nil;
			local h = {};
			for f, z in pairs(j7.seen) do
				B = B + 1;
				m, e = f, z;
				table.insert(h, f:GetFullName());
			end;
			if B == 1 then
				k7(m, e);
			else
				N("learn timeout, remotes seen:", table.concat(h, ", "));
				QK(B == 0 and "Tidak ada remote terdeteksi" or "Remote ambigu, lihat console", 8, "warn");
			end;
		end;
	end);
end;
function ZK.forget()
	if nK() then
		return;
	end;
	J[h.g1h] = nil;
	ZK.badMethod = {};
	if delfile and isfile then
		pcall(function()
			if isfile(R.SellFile) then
				delfile(R.SellFile);
			end;
		end);
	end;
	QK("Remote jual hasil belajar dilupakan", 4, "info");
end;
task.spawn(function()
	for B, m in ipairs({ K, workspace }) do
		for B, m in ipairs(m:GetDescendants()) do
			if m:IsA("RemoteEvent") or m:IsA("RemoteFunction") then
				local B = string.lower(m.Name);
				if string.find(B, "sell", 1, true) or string.find(B, "jual", 1, true) or string.find(B, "shop", 1, true) or string.find(B, "merchant", 1, true) then
					table.insert(XK, m:GetFullName());
				end;
			end;
		end;
	end;
	if #XK > 0 then
		N("sell remote candidates:", table.concat(XK, ", "));
	end;
end);
a7();
local function L7(B)
	if not B then
		return nil;
	end;
	for B, m in ipairs(B:GetChildren()) do
		if m:IsA("Tool") and c:HasTag(m, e("29722a")) then
			return m;
		end;
	end;
	return nil;
end;
local function t7()
	local B = M.Character;
	local m = B and B:FindFirstChildOfClass("Humanoid");
	if not ((m and m.Health > 0)) then
		return nil;
	end;
	local e = L7(B);
	if e then
		return e;
	end;
	if AK.autoEquip then
		local B = L7(M:FindFirstChildOfClass("Backpack"));
		if B then
			pcall(m.EquipTool, m, B);
		end;
	end;
	return nil;
end;
local function X7()
	if os.clock() - JK < 1.5 then
		return;
	end;
	JK = os.clock();
	pcall(function()
		local B = game:GetService("VirtualInputManager");
		local m = workspace.CurrentCamera;
		local e = m and m.ViewportSize or Vector2.new(800, 600);
		B:SendMouseButtonEvent(e.X * .5, e.Y * .5, 0, true, game, 0);
		task.wait(.05);
		B:SendMouseButtonEvent(e.X * .5, e.Y * .5, 0, false, game, 0);
	end);
end;
local function Z7()
	if not AK.farm or kK then
		return false;
	end;
	if wK.inv and wK.inv >= R.MaxInventory then
		if not ((AK.sellOn and A7())) then
			wK.status = ((hK and "Inventory penuh (%d). Jual dulu / aktifkan Auto Jual." or "Inventory penuh (%d). Jual manual di NPC (Auto Jual khusus PREMIUM).")):format(wK.inv);
			return false;
		end;
	end;
	return true;
end;
local function Q7()
	if not Z7() then
		return;
	end;
	if not DK.fishState then
		pcall(dK);
	end;
	pcall(oK);
	local B = t7();
	if not B then
		wK.status = "Rod belum di-equip";
		return;
	end;
	if qK and qK:IsActive() then
		jK = nil;
		return;
	end;
	local m, e = DK.fishState, DK.rodState;
	if m and e then
		if not e.isEquipped then
			wK.status = "Menunggu rod siap";
			return;
		end;
		if m.casted or m.fishingInProgress then
			jK = jK or os.clock();
			wK.status = "Menunggu ikan menggigit";
			if os.clock() - jK > AK.stuckTimeout then
				pcall(e.CleanupFishing, e);
				jK = nil;
			end;
			return;
		end;
		jK = nil;
		if AK.autoCast and (m.canCast and (not m.castingCooldown and (e:IsValidRod() and DK.actionStart))) then
			wK.status = "Melempar pancing";
			task.spawn(DK.actionStart);
		end;
	elseif AK.autoCast then
		if R.AllowClickFallback then
			wK.status = "State game tidak ditemukan, pakai klik";
			X7();
		else
			wK.status = "State game tidak ditemukan (butuh getconnections + getupvalues)";
		end;
	end;
end;
function ZK.syncPreset()
	for B, m in ipairs(CK) do
		local e = lK[m];
		if AK.skipDelay == e.skipDelay and (AK.biteFast == e.biteFast and (AK.biteWait == e.biteWait and AK.castCooldown == e.castCooldown)) then
			AK.preset = m;
			return;
		end;
	end;
	AK.preset = "Kustom";
end;
function ZK.setPreset(B)
	local m = lK[B];
	if not m then
		return;
	end;
	if not hK and B ~= "Aman" then
		nK();
		return;
	end;
	AK.skipDelay, AK.biteFast, AK.biteWait, AK.castCooldown = m.skipDelay, m.biteFast, m.biteWait, m.castCooldown;
	AK.preset = B;
	ZK.skipFails = 0;
end;
function ZK.setFarm(B)
	pK();
	AK.farm = B and true or false;
	if AK.farm then
		vK = true;
		ZK.skipFails = 0;
		ZK.pendingVerify = nil;
		wK.status = "Farm aktif";
		QK("Farm mancing aktif", 3, "ok");
	else
		if qK then
			pcall(qK.SetHolding, qK, false);
		end;
		UK();
		jK = nil;
		ZK.pendingVerify = nil;
		pcall(iK);
		wK.status = "Farm dimatikan";
		QK("Farm mancing dimatikan", 3, "info");
	end;
end;
local function n7()
	LK = 0;
	KK = 0;
	vK = true;
	AK.sellOn = true;
	local B = wK.inv;
	QK((("Auto jual aktif: jual saat inventory >= %d (sekarang %s)")):format(AK.sellAt, B and tostring(B) or "?"), 6, "ok");
end;
function ZK.setSell(B)
	if not B then
		AK.sellOn = false;
		return;
	end;
	if nK() then
		return;
	end;
	local m, e = x7(false);
	if e == "none" then
		QK(m, 9, "warn");
		return;
	end;
	if e == "allow" and ZK.ask then
		ZK.ask("Izinkan jual-semua?", "Remote jual hasil Pelajari menjual SEMUA ikan sekaligus. Sebelum menjual, ikan rarity pilihanmu difavoritkan (jika Auto Favorit aktif) dan dicek ulang; jika favorit hilang, Auto Jual mati otomatis. Izinkan dan nyalakan Auto Jual?", "Izinkan", function()
			AK.allowSellAll = true;
			n7();
			ZK.refreshUI();
		end);
		return;
	end;
	n7();
end;
function ZK.favNow()
	if nK() then
		return;
	end;
	I7(function()
		local B = h7(e7());
		QK((("%d ikan difavoritkan")):format(B), 4, B > 0 and "ok" or "info");
	end);
end;
function ZK.sellNow()
	if nK() then
		return;
	end;
	local B, m = x7(false);
	if not B then
		I7(function()
			H7(false);
		end);
	elseif m == "allow" and ZK.ask then
		ZK.ask("Jual semua ikan?", "Remote jual ini menjual SEMUA ikan non-favorit sekaligus. Lanjutkan sekali ini?", "Ya, jual", function()
			I7(function()
				H7(true);
			end);
		end);
	else
		QK(B, 8, "warn");
	end;
end;
function ZK.methodReport()
	local B = A7();
	return { learned = B and (B.remote.Name .. (" [" .. (B.kind .. "]"))) or nil, learnedKind = B and B.kind or nil, sellFishPresent = yK.rB ~= nil };
end;
function ZK.capsLine()
	return (("minigame: %s\nstate game (Skip/Tuning): %s\nlempar otomatis: %s\nhook belajar jual: %s\nfile (logo/jual): %s\ntuning waktu: %s")):format(qK and "OK" or "X", rK and "OK" or "X (pakai GUI)", DK.fishState and "OK" or "belum ditemukan", ((hookmetamethod and getnamecallmethod)) and "OK" or "X", ((writefile and (readfile and isfile))) and "OK" or "X", ((DK.fishState and DK.origWait ~= nil)) and "OK" or "belum terbaca");
end;
local M7 = false;
local Y7 = nil;
local function g7(B)
	local m = pcall(function()
			if Z.ChatVersion ~= Enum.ChatVersion.TextChatService then
				error("legacy chat");
			end;
			local m = Z:FindFirstChild("TextChannels") or Z:WaitForChild("TextChannels", 3);
			if not m then
				error("no TextChannels");
			end;
			local h = m:FindFirstChild(e("295f16e506f149288064")) or m:WaitForChild(e("295f16e506f149288064"), 3);
			if not h then
				for B, m in ipairs(m:GetChildren()) do
					if m:IsA("TextChannel") and (m.Name ~= "RBXSystem" and m.Name ~= "RBXTeam") then
						h = m;
						break;
					end;
				end;
			end;
			if not h then
				error("no channel");
			end;
			h:SendAsync(B);
		end);
	if m then
		return "TextChatService";
	end;
	local h = pcall(function()
			local m = K:FindFirstChild(e("3f7828c316f35819896943c7026e3ac70edc443b954d41f115693d"));
			local h = m and m:FindFirstChild(e("287c37ef06ec5f3b866d65f10a682bd117"));
			if not h then
				error("x");
			end;
			h:FireServer(B, e("3a7122"));
		end);
	if h then
		return "legacy";
	end;
	return nil;
end;
local function N7()
	Y7 = g7(e("5a6f2bc80cf642"));
	if Y7 then
		QK("Anti-Lose Streak: !rejoin terkirim 1x (" .. (Y7  .. "), auto farm dihentikan."), 8, "warn");
	else
		QK("Anti-Lose Streak: !rejoin GAGAL terkirim (chat tidak ditemukan). Auto farm dihentikan.", 10, "warn");
	end;
	task.delay(3, function()
		pcall(function()
			if M and M.Parent then
				Q:TeleportToPlaceInstance(game.PlaceId, game.JobId, M);
			end;
		end);
	end);
end;
local function y7()
	if M7 then
		return;
	end;
	M7 = true;
	AK.farm = false;
	N7();
end;
local S7 = {
		on = false,
		saved = nil,
		conns = {},
		effectCount = 0,
		meshCount = 0,
	};
local G7 = {
		"ParticleEmitter",
		"Trail",
		"Beam",
		"Smoke",
		"Fire",
		"Sparkles",
		"Highlight",
	};
local W7 = {
		"BloomEffect",
		"SunRaysEffect",
		"ColorCorrectionEffect",
		"DepthOfFieldEffect",
		"BlurEffect",
	};
local s7 = { Atmosphere = { Density = 0, Haze = 0, Glare = 0 }, Clouds = { Enabled = false, Cover = 0, Density = 0 } };
local function d7(B)
	for m, e in ipairs(G7) do
		if B:IsA(e) then
			return true;
		end;
	end;
	return false;
end;
local function F7(B)
	local m = 0;
	for e, h in ipairs(workspace:GetDescendants()) do
		if d7(h) then
			local e, f = pcall(function()
					return h.Enabled;
				end);
			if e and f ~= B then
				pcall(function()
					h.Enabled = B;
				end);
				m = m + 1;
			end;
		end;
	end;
	return m;
end;
local function o7(B, m)
	local e = 0;
	for h, f in ipairs(workspace:GetDescendants()) do
		if f:IsA("MeshPart") then
			if B then
				local B, h = pcall(function()
						return f.RenderFidelity;
					end);
				if B and h ~= Enum.RenderFidelity.Performance then
					m[f] = h;
					pcall(function()
						f.RenderFidelity = Enum.RenderFidelity.Performance;
					end);
					e = e + 1;
				end;
			else
				local B = m[f];
				if B ~= nil then
					pcall(function()
						f.RenderFidelity = B;
					end);
				end;
			end;
		end;
	end;
	return e;
end;
function S7.enable()
	if not hK then
		return false, "Khusus PREMIUM/OWNER";
	end;
	if S7.on then
		return true;
	end;
	local B, m = pcall(function()
			local B = UserSettings and (UserSettings()):GetService("UserGameSettings");
			return {
				quality = B and B.SavedQualityLevel,
				shadows = L.GlobalShadows,
				tech = L.Technology,
				diffuse = L.EnvironmentDiffuseScale,
				specular = L.EnvironmentSpecularScale,
				shadowSoft = L.ShadowSoftness,
				waterWave = workspace.Terrain and workspace.Terrain.WaterWaveSize,
				waterSpeed = workspace.Terrain and workspace.Terrain.WaterWaveSpeed,
				waterReflect = workspace.Terrain and workspace.Terrain.WaterReflectance,
				postFx = {},
				fxInst = {},
				meshFidelity = {},
			};
		end);
	if not B then
		return false, "Gagal membaca pengaturan grafis";
	end;
	S7.saved = m;
	S7.on = true;
	pcall(function()
		local B = (UserSettings()):GetService("UserGameSettings");
		B.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1;
	end);
	pcall(function()
		L.GlobalShadows = false;
	end);
	pcall(function()
		L.Technology = Enum.Technology.Compatibility;
	end);
	pcall(function()
		L.EnvironmentDiffuseScale = 0;
	end);
	pcall(function()
		L.EnvironmentSpecularScale = 0;
	end);
	pcall(function()
		L.ShadowSoftness = 0;
	end);
	for B, e in ipairs(W7) do
		for B, h in ipairs(L:GetChildren()) do
			if h.ClassName == e then
				local B, e = pcall(function()
						return h.Enabled;
					end);
				if B then
					m.postFx[h] = e;
					pcall(function()
						h.Enabled = false;
					end);
				end;
			end;
		end;
	end;
	for B, e in ipairs(L:GetChildren()) do
		local h = s7[e.ClassName];
		if h then
			local B = {};
			for m in pairs(h) do
				local h, f = pcall(function()
						return e[m];
					end);
				if h then
					B[m] = f;
				end;
			end;
			m.fxInst[e] = B;
			for B, m in pairs(h) do
				pcall(function()
					e[B] = m;
				end);
			end;
		end;
	end;
	pcall(function()
		local B = workspace.Terrain;
		if B then
			B:SetAttribute("_boostHadDeco", true);
			B:SetDecorationsVisible(false);
			B.WaterWaveSize = 0;
			B.WaterWaveSpeed = 0;
			B.WaterReflectance = 0;
		end;
	end);
	S7.effectCount = F7(false);
	S7.meshCount = o7(true, m.meshFidelity);
	table.insert(S7.conns, workspace.DescendantAdded:Connect(function(B)
		if d7(B) then
			task.defer(function()
				if S7.on then
					pcall(function()
						B.Enabled = false;
					end);
				end;
			end);
		elseif B:IsA("MeshPart") then
			task.defer(function()
				if S7.on and S7.saved then
					local m, e = pcall(function()
							return B.RenderFidelity;
						end);
					if m and e ~= Enum.RenderFidelity.Performance then
						S7.saved.meshFidelity[B] = e;
						pcall(function()
							B.RenderFidelity = Enum.RenderFidelity.Performance;
						end);
					end;
				end;
			end);
		end;
	end));
	return true;
end;
function S7.disable()
	if not S7.on then
		return;
	end;
	S7.on = false;
	for B, m in ipairs(S7.conns) do
		pcall(function()
			m:Disconnect();
		end);
	end;
	S7.conns = {};
	local B = S7.saved;
	if B then
		pcall(function()
			local m = (UserSettings()):GetService("UserGameSettings");
			if B.quality ~= nil then
				m.SavedQualityLevel = B.quality;
			end;
		end);
		pcall(function()
			L.GlobalShadows = B.shadows;
		end);
		pcall(function()
			L.Technology = B.tech;
		end);
		pcall(function()
			L.EnvironmentDiffuseScale = B.diffuse;
		end);
		pcall(function()
			L.EnvironmentSpecularScale = B.specular;
		end);
		pcall(function()
			L.ShadowSoftness = B.shadowSoft;
		end);
		for B, m in pairs(B.postFx or {}) do
			pcall(function()
				B.Enabled = m;
			end);
		end;
		for B, m in pairs(B.fxInst or {}) do
			for m, e in pairs(m) do
				pcall(function()
					B[m] = e;
				end);
			end;
		end;
		o7(false, B.meshFidelity or {});
		pcall(function()
			local m = workspace.Terrain;
			if m then
				m:SetDecorationsVisible(true);
				if B.waterWave ~= nil then
					m.WaterWaveSize = B.waterWave;
				end;
				if B.waterSpeed ~= nil then
					m.WaterWaveSpeed = B.waterSpeed;
				end;
				if B.waterReflect ~= nil then
					m.WaterReflectance = B.waterReflect;
				end;
			end;
		end);
	end;
	F7(true);
end;
local i7, U7 = pcall(function()
		return require((MK:WaitForChild(e("3d743dca0af14b178e6c42f81e6e"), 10)):WaitForChild(e("3c4807ef02f14d3d847a"), 10));
	end);
if i7 and (type(U7) == "table" and type(U7[e("287521d52df05833876154f50f7421cc")]) == "function") then
	local B = U7[e("287521d52df05833876154f50f7421cc")];
	U7[e("287521d52df05833876154f50f7421cc")] = function(m, h, ...)
			local f, z = pcall(B, m, h, ...);
			if not f then
				warn(e("20572bd117d77918bc"), z);
			end;
			if hK and (xK.antiLoseStreak and type(h) == "string") then
				local B = string.lower(h);
				if string.find(B, e("1c723a8202e84d23"), 1, true) or string.find(B, e("1e6e2dc313fa48"), 1, true) then
					task.spawn(y7);
				end;
			end;
		end;
else
	warn(e("20572bd117d77918bc2870c132502fcc02f84928c16658e05b7b21d70dfb0c77c14959e0123002cd10fa0c09957a52f5103d2acb10fe4e36846c17e013743d8210fa5f29886759"));
end;
if yK.rA then
	table.insert(TK, yK.rA.OnClientEvent:Connect(function(B)
		wK.caught = wK.caught + 1;
		if wK.inv then
			wK.inv = wK.inv + 1;
		end;
		ZK.pendingVerify = nil;
		ZK.skipFails = 0;
		if type(B) == "table" then
			local m = S(B.rarity);
			wK.byRarity[m] = ((wK.byRarity[m] or 0)) + 1;
		end;
		vK = true;
	end));
end;
task.spawn(function()
	while RK do
		if AK.farm then
			pcall(Q7);
		end;
		task.wait(.15);
	end;
end);
task.spawn(function()
	while RK do
		local B = AK.farm or AK.favOn or AK.sellOn;
		local m = os.clock() - cK;
		local h = (AK.favOn and (vK and m >= 1.2)) or m >= R.InventoryPollSeconds or (AK.sellOn and (wK.inv and (wK.inv >= AK.sellAt and m >= 2)));
		if B and (h and not PK) then
			vK = false;
			PK = true;
			local B, m = pcall(function()
					local B = e7();
					if not B then
						return;
					end;
					if AK.favOn then
						h7(B);
					end;
					if AK.sellOn and (wK.inv >= AK.sellAt and os.clock() >= KK) then
						H7(false);
					end;
				end);
			if not B then
				warn(e("20572bd117d77918bc"), m);
			end;
			PK = false;
		end;
		task.wait(.7);
	end;
end);
qK = sK();
WK();
N((("capabilities: minigame=%s getupvalues=%s getconnections=%s mgState=%s hook=%s")):format(tostring(qK ~= nil), tostring(Y ~= nil), tostring(g ~= nil), tostring(rK ~= nil), tostring(hookmetamethod ~= nil and getnamecallmethod ~= nil)));
if not qK then
	warn(e("20572bd117d77918bc285afd157429c30efa0c378e6c42f81e3d3bcc02e94d338d6955f81e316ec301f05e2e886650"));
	RK = false;
	return;
end;
pcall(dK);
table.insert(TK, P.Heartbeat:Connect(B7));
table.insert(TK, M.CharacterAdded:Connect(function()
	DK.fishState, DK.rodState, DK.actionStart = nil, nil, nil;
	jK = nil;
	UK();
end));
local b7 = "\137PNG\r\n\026\n";
local function V7(B)
	task.spawn(function()
		local m, e = pcall(function()
				local B = getcustomasset or getsynasset;
				if not ((B and writefile)) then
					return nil;
				end;
				local m;
				if isfile and (readfile and isfile(R.LogoFile)) then
					m = readfile(R.LogoFile);
				end;
				if not ((type(m) == "string" and (#m > 1000 and string.sub(m, 1, 8) == b7))) then
					m = nil;
					local B, e = pcall(function()
							return game:HttpGet(R.LogoUrl);
						end);
					if B and type(e) == "string" then
						m = e;
					end;
					if not m then
						local B = request or http_request or (syn and syn.request);
						if B then
							local e, h = pcall(B, { Url = R.LogoUrl, Method = "GET" });
							if e and (type(h) == "table" and type(h.Body) == "string") then
								m = h.Body;
							end;
						end;
					end;
					if not ((type(m) == "string" and (#m > 1000 and string.sub(m, 1, 8) == b7))) then
						return nil;
					end;
					writefile(R.LogoFile, m);
				end;
				return B(R.LogoFile);
			end);
		if m and e then
			B(e);
		else
			N("logo not loaded (bubble keeps the CM text)");
		end;
	end);
end;
local function Bz()
	local B = {};
	local m = {};
	local h = {
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
	local f = {
			"Farm",
			"Favorit",
			"Jual",
			"Trade",
			"Extras",
			"Profile",
		};
	local z = { Enum.EasingStyle.Back, Enum.EasingDirection.Out };
	local function O(B, m, e)
		local h = Instance.new(B);
		for B, m in pairs(m) do
			h[B] = m;
		end;
		if e then
			h.Parent = e;
		end;
		return h;
	end;
	local function E(B, m)
		return O("UICorner", { CornerRadius = UDim.new(0, m) }, B);
	end;
	local function C(B, m, e)
		return O("UIStroke", { Color = m, Thickness = e, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, B);
	end;
	local function l(B, m, e, h, f)
		local z = t:Create(B, TweenInfo.new(m, h or Enum.EasingStyle.Quad, f or Enum.EasingDirection.Out), e);
		z:Play();
		return z;
	end;
	local a = setmetatable({}, { __mode = "k" });
	local function A(B)
		a[B] = ((a[B] or 0)) + 1;
		return a[B];
	end;
	local function q()
		local B = workspace.CurrentCamera;
		return B and B.ViewportSize or Vector2.new(800, 600);
	end;
	local r = O("ScreenGui", {
			Name = x .. tostring(math.random(1000, 9999)),
			ResetOnSpawn = false,
			DisplayOrder = 999,
			IgnoreGuiInset = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		});
	pcall(function()
		r.Parent = (gethui and gethui()) or game:GetService("CoreGui");
	end);
	if not r.Parent then
		r.Parent = M:WaitForChild("PlayerGui");
	end;
	B.sg = r;
	local D = {
			minimized = false,
			ready = false,
			busy = false,
			bubbleMoved = false,
		};
	local u = q();
	local I = Vector2.new(math.min(390, u.X - 24), math.min(500, u.Y - 24));
	local j = Vector2.new(math.max(12, ((u.X - I.X)) / 2), math.max(12, ((u.Y - I.Y)) / 2));
	local J = Vector2.new(j.X + 30, j.Y + 30);
	local P = O("CanvasGroup", {
			Name = "Main",
			AnchorPoint = Vector2.new(.5, .5),
			BackgroundColor3 = h.white,
			BorderSizePixel = 0,
			GroupTransparency = 1,
			Visible = false,
		}, r);
	E(P, 14);
	C(P, h.yellow, 2);
	local c = O("UIScale", { Scale = .85 }, P);
	local function K()
		P.Size = UDim2.fromOffset(I.X, I.Y);
		P.Position = UDim2.fromOffset(j.X + I.X / 2, j.Y + I.Y / 2);
	end;
	K();
	local L = O("Frame", {
			Name = "Header",
			Size = UDim2.new(1, 0, 0, 54),
			BackgroundColor3 = h.yellow,
			BorderSizePixel = 0,
			ClipsDescendants = true,
		}, P);
	O("UIGradient", { Color = ColorSequence.new(h.yellowLight, h.yellow), Rotation = 90 }, L);
	local X = O("Frame", {
			Size = UDim2.new(0, 36, 1.8, 0),
			Position = UDim2.new(-0.3, 0, -0.4, 0),
			Rotation = 20,
			BackgroundColor3 = h.white,
			BackgroundTransparency = .8,
			BorderSizePixel = 0,
		}, L);
	local Z = O("Frame", {
			Size = UDim2.fromOffset(38, 38),
			Position = UDim2.fromOffset(12, 8),
			BackgroundColor3 = h.white,
			BorderSizePixel = 0,
		}, L);
	E(Z, 19);
	C(Z, h.yellowDark, 1.5);
	local Q = O("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = H,
			Font = Enum.Font.GothamBlack,
			TextSize = 14,
			TextColor3 = h.text,
		}, Z);
	local Y = O("ImageLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Crop,
		}, Z);
	E(Y, 19);
	local g = O("TextLabel", {
			Size = UDim2.new(1, -150, 0, 20),
			Position = UDim2.fromOffset(58, 8),
			BackgroundTransparency = 1,
			RichText = true,
			Text = p,
			TextColor3 = h.text,
			Font = Enum.Font.GothamBold,
			TextScaled = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, L);
	O("UITextSizeConstraint", { MaxTextSize = 14, MinTextSize = 8 }, g);
	O("TextLabel", {
		Size = UDim2.new(1, -150, 0, 14),
		Position = UDim2.fromOffset(58, 30),
		BackgroundTransparency = 1,
		Text = "Mancing  -  Favorit  -  Jual   v" .. R.Version,
		TextColor3 = Color3.fromRGB(120, 92, 0),
		Font = Enum.Font.Gotham,
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, L);
	local function N(B, m)
		local e = O("TextButton", {
				Size = UDim2.fromOffset(28, 28),
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, m, .5, 0),
				BackgroundColor3 = h.white,
				Text = B,
				TextColor3 = h.text,
				Font = Enum.Font.GothamBold,
				TextSize = 14,
				AutoButtonColor = false,
			}, L);
		E(e, 14);
		e.MouseEnter:Connect(function()
			l(e, .12, { BackgroundColor3 = h.yellowSoft });
		end);
		e.MouseLeave:Connect(function()
			l(e, .12, { BackgroundColor3 = h.white });
		end);
		return e;
	end;
	local S = N("-", -46);
	local W = N("X", -12);
	local s = O("Frame", {
			Position = UDim2.new(0, 12, 0, 62),
			Size = UDim2.new(1, -24, 0, 34),
			BackgroundColor3 = h.offwhite,
			BorderSizePixel = 0,
		}, P);
	E(s, 10);
	C(s, h.line, 1);
	local d = O("Frame", {
			Size = UDim2.new(1 / #f, -6, 1, -6),
			Position = UDim2.new(0, 3, 0, 3),
			BackgroundColor3 = h.yellow,
			BorderSizePixel = 0,
		}, s);
	E(d, 8);
	local o = {};
	local i = O("Frame", {
			Position = UDim2.new(0, 0, 0, 102),
			Size = UDim2.new(1, 0, 1, -152),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
		}, P);
	local U = {};
	local function b()
		local B = O("CanvasGroup", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Visible = false }, i);
		local m = O("ScrollingFrame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 4,
				ScrollBarImageColor3 = h.yellowDark,
				CanvasSize = UDim2.new(),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				ScrollingDirection = Enum.ScrollingDirection.Y,
			}, B);
		O("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, m);
		O("UIPadding", {
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			PaddingTop = UDim.new(0, 4),
			PaddingBottom = UDim.new(0, 12),
		}, m);
		local e = { cg = B, sf = m };
		table.insert(U, e);
		return e;
	end;
	local V = O("Frame", {
			Size = UDim2.new(1, 0, 0, 50),
			Position = UDim2.new(0, 0, 1, -50),
			BackgroundColor3 = h.yellowSoft,
			BorderSizePixel = 0,
		}, P);
	local BK = O("Frame", {
			Size = UDim2.fromOffset(10, 10),
			Position = UDim2.fromOffset(12, 9),
			BackgroundColor3 = h.gray,
			BorderSizePixel = 0,
		}, V);
	E(BK, 5);
	local eK = O("TextLabel", {
			Size = UDim2.new(1, -66, 0, 16),
			Position = UDim2.fromOffset(28, 6),
			BackgroundTransparency = 1,
			Text = "",
			TextColor3 = h.text,
			Font = Enum.Font.GothamBold,
			TextSize = 11,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, V);
	local OK = O("TextLabel", {
			Size = UDim2.new(1, -66, 0, 14),
			Position = UDim2.fromOffset(28, 27),
			BackgroundTransparency = 1,
			Text = "",
			TextColor3 = h.muted,
			Font = Enum.Font.Gotham,
			TextSize = 10,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, V);
	local function lK(B, m, e, f)
		local z = O("Frame", {
				Name = "Padlock",
				Size = UDim2.fromOffset(14, 17),
				AnchorPoint = e,
				Position = f,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
			}, B);
		local l = O("Frame", {
				Size = UDim2.fromOffset(10, 11),
				Position = UDim2.fromOffset(2, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
			}, z);
		E(l, 5);
		C(l, m, 2);
		local a = O("Frame", {
				Size = UDim2.fromOffset(14, 10),
				Position = UDim2.fromOffset(0, 7),
				BackgroundColor3 = m,
				BorderSizePixel = 0,
			}, z);
		E(a, 3);
		local A = O("Frame", {
				Size = UDim2.fromOffset(3, 4),
				Position = UDim2.fromOffset(5.5, 10),
				BackgroundColor3 = h.white,
				BorderSizePixel = 0,
			}, z);
		E(A, 1);
		return z;
	end;
	local function HK(B, m, e)
		if not fK(m) then
			return nil;
		end;
		e = e or {};
		local f = O("TextButton", {
				Name = "LockShield",
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = h.offwhite,
				BackgroundTransparency = .3,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 30,
			}, B);
		if e.region then
			f.Position, f.Size = e.region[1], e.region[2];
		end;
		if e.radius then
			E(f, e.radius);
		end;
		lK(f, h.muted, Vector2.new(1, .5), UDim2.new(1, -((e.inset or 14)), .5, 0));
		f.Activated:Connect(function()
			ZK.toast(F, "warn", 3);
		end);
		return f;
	end;
	local function qK(B)
		local m = O("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = h.offwhite,
				BorderSizePixel = 0,
				LayoutOrder = A(B.sf),
			}, B.sf);
		E(m, 12);
		C(m, h.line, 1);
		O("UIPadding", {
			PaddingTop = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
		}, m);
		O("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, m);
		return m;
	end;
	local function DK(B, m, e, h, f)
		return O("TextLabel", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = m,
			TextSize = e,
			TextColor3 = h,
			Font = f,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			LayoutOrder = A(B),
		}, B);
	end;
	local function uK(B, m, e)
		local f = DK(B, m, 12, h.yellowDark, Enum.Font.GothamBold);
		if fK(e) then
			lK(f, h.yellowDark, Vector2.new(1, .5), UDim2.new(1, 0, .5, 0));
		end;
		return f;
	end;
	local function IK(B, m)
		return DK(B, m, 11, h.muted, Enum.Font.Gotham);
	end;
	local function jK(B)
		local m = O("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = A(B),
			}, B);
		O("UISizeConstraint", { MinSize = Vector2.new(0, 36) }, m);
		return m;
	end;
	local function JK(B, m, e, f)
		local z = O("Frame", { Size = UDim2.new(1, -f, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1 }, B);
		O("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }, z);
		DK(z, m, 13, h.text, Enum.Font.GothamBold);
		if e and e ~= "" then
			DK(z, e, 11, h.muted, Enum.Font.Gotham);
		end;
		return z;
	end;
	local function PK(e, f, C, a, A, x, H)
		local p = jK(e);
		JK(p, f, C, 62);
		HK(p, H, { inset = 17 });
		local w = O("TextButton", {
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, 0, .5, 0),
				Size = UDim2.fromOffset(48, 26),
				Text = "",
				AutoButtonColor = false,
				BackgroundColor3 = h.gray,
			}, p);
		E(w, 13);
		local T = O("Frame", {
				Size = UDim2.fromOffset(20, 20),
				Position = UDim2.fromOffset(3, 3),
				BackgroundColor3 = h.white,
				BorderSizePixel = 0,
			}, w);
		E(T, 10);
		local R;
		table.insert(m, function()
			if x then
				local B = x();
				if p.Visible ~= B then
					p.Visible = B;
				end;
			end;
			local B = a() and true or false;
			if B ~= R then
				local m = R == nil;
				R = B;
				local e = B and h.yellowDark or h.gray;
				local f = B and UDim2.fromOffset(25, 3) or UDim2.fromOffset(3, 3);
				if m then
					w.BackgroundColor3, T.Position = e, f;
				else
					l(w, .18, { BackgroundColor3 = e });
					l(T, .22, { Position = f }, z[1], z[2]);
				end;
			end;
		end);
		w.Activated:Connect(function()
			A(not a());
			B.refresh();
		end);
		return p;
	end;
	local function kK(e, f, z, a, A, x, H, p, w, T)
		local R = jK(e);
		JK(R, f, z, 74);
		HK(R, T, { inset = 24 });
		local q = O("TextBox", {
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, 0, .5, 0),
				Size = UDim2.fromOffset(62, 30),
				BackgroundColor3 = h.white,
				Text = G(a(), p),
				TextColor3 = h.text,
				Font = Enum.Font.GothamBold,
				TextSize = 13,
				ClearTextOnFocus = false,
				PlaceholderText = "",
			}, R);
		E(q, 8);
		local r = C(q, h.line, 1.5);
		q.Focused:Connect(function()
			l(r, .15, { Color = h.yellowDark });
		end);
		q.FocusLost:Connect(function()
			l(r, .15, { Color = h.line });
			local m = string.gsub(q.Text, ",", ".");
			local e = tonumber(m);
			if e and y(e) then
				local B = math.clamp(e, x, H);
				if B ~= e then
					ZK.toast((("Nilai dibatasi ke %s - %s")):format(G(x, p), G(H, p)), "warn", 3);
				end;
				A(p and math.floor(B + .5) or B);
			else
				ZK.toast("Isi dengan angka", "warn", 3);
			end;
			q.Text = G(a(), p);
			B.refresh();
		end);
		table.insert(m, function()
			if w then
				local B = w();
				if R.Visible ~= B then
					R.Visible = B;
				end;
			end;
			if q:IsFocused() then
				return;
			end;
			local B = G(a(), p);
			if q.Text ~= B then
				q.Text = B;
			end;
		end);
		return R;
	end;
	local function cK(e, f, a, x)
		local H = #f;
		local p = O("Frame", {
				Size = UDim2.new(1, 0, 0, 34),
				BackgroundColor3 = h.white,
				BorderSizePixel = 0,
				LayoutOrder = A(e),
			}, e);
		E(p, 10);
		C(p, h.line, 1);
		local w = O("Frame", {
				Size = UDim2.new(1 / H, -6, 1, -6),
				Position = UDim2.new(0, 3, 0, 3),
				BackgroundColor3 = h.yellow,
				BorderSizePixel = 0,
			}, p);
		E(w, 8);
		local T = {};
		for m, e in ipairs(f) do
			local f = O("TextButton", {
					Size = UDim2.new(1 / H, 0, 1, 0),
					Position = UDim2.new(((m - 1)) / H, 0, 0, 0),
					BackgroundTransparency = 1,
					Text = e.text,
					Font = Enum.Font.GothamBold,
					TextSize = 12,
					TextColor3 = h.muted,
					AutoButtonColor = false,
					ZIndex = 2,
				}, p);
			f.Activated:Connect(function()
				x(e.id);
				B.refresh();
			end);
			T[m] = f;
			HK(p, e.lock, { radius = 8, inset = 8, region = { UDim2.new(((m - 1)) / H, 0, 0, 0), UDim2.new(1 / H, 0, 1, 0) } });
		end;
		local R = "unset";
		table.insert(m, function()
			local B = a();
			if B ~= R then
				local m = R == "unset";
				R = B;
				local e;
				for m, h in ipairs(f) do
					if h.id == B then
						e = m;
					end;
				end;
				for B, m in ipairs(T) do
					l(m, .18, { TextColor3 = (B == e) and h.text or h.muted });
				end;
				if e then
					local B = UDim2.new(((e - 1)) / H, 3, 0, 3);
					if m then
						w.Position, w.BackgroundTransparency = B, 0;
					else
						w.BackgroundTransparency = 0;
						l(w, .28, { Position = B }, z[1], z[2]);
					end;
				else
					l(w, .18, { BackgroundTransparency = 1 });
				end;
			end;
		end);
		return p;
	end;
	local function KK(B, m, e, f, a)
		local x = (e == "danger") and h.red or ((e == "ghost") and h.white or h.yellow);
		local H = (e == "danger") and Color3.fromRGB(235, 95, 85) or ((e == "ghost") and h.yellowSoft or h.yellowLight);
		local p = (e == "danger") and h.white or h.text;
		local w = O("TextButton", {
				Size = UDim2.new(1, 0, 0, 38),
				BackgroundColor3 = x,
				Text = m,
				TextColor3 = p,
				Font = Enum.Font.GothamBold,
				TextSize = 13,
				AutoButtonColor = false,
				LayoutOrder = A(B),
			}, B);
		E(w, 10);
		if e == "ghost" then
			C(w, h.yellowDark, 1.5);
		end;
		local T = O("UIScale", { Scale = 1 }, w);
		w.MouseEnter:Connect(function()
			l(w, .12, { BackgroundColor3 = H });
		end);
		w.MouseLeave:Connect(function()
			l(w, .12, { BackgroundColor3 = x });
			l(T, .1, { Scale = 1 });
		end);
		w.MouseButton1Down:Connect(function()
			l(T, .08, { Scale = .96 });
		end);
		w.MouseButton1Up:Connect(function()
			l(T, .12, { Scale = 1 }, z[1], z[2]);
		end);
		w.Activated:Connect(f);
		HK(w, a, { radius = 10, inset = 14 });
		return w;
	end;
	local LK, tK, XK, QK, MK, YK = b(), b(), b(), b(), b(), b();
	local gK = O("Frame", {
			Size = UDim2.new(1, 0, 0, 76),
			BackgroundColor3 = h.offwhite,
			BorderSizePixel = 0,
			LayoutOrder = A(LK.sf),
		}, LK.sf);
	E(gK, 14);
	local NK = C(gK, h.line, 1.5);
	local yK = O("TextLabel", {
			Size = UDim2.new(1, -90, 0, 20),
			Position = UDim2.fromOffset(14, 12),
			BackgroundTransparency = 1,
			Text = "AUTO FARM: MATI",
			TextColor3 = h.text,
			Font = Enum.Font.GothamBlack,
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, gK);
	local SK = O("TextLabel", {
			Size = UDim2.new(1, -90, 0, 30),
			Position = UDim2.fromOffset(14, 34),
			BackgroundTransparency = 1,
			Text = "Ketuk untuk mulai mancing otomatis",
			TextColor3 = h.muted,
			Font = Enum.Font.Gotham,
			TextSize = 11,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
		}, gK);
	local GK = O("Frame", {
			AnchorPoint = Vector2.new(1, .5),
			Position = UDim2.new(1, -14, .5, 0),
			Size = UDim2.fromOffset(60, 32),
			BackgroundColor3 = h.gray,
			BorderSizePixel = 0,
		}, gK);
	E(GK, 16);
	local WK = O("Frame", {
			Size = UDim2.fromOffset(26, 26),
			Position = UDim2.fromOffset(3, 3),
			BackgroundColor3 = h.white,
			BorderSizePixel = 0,
		}, GK);
	E(WK, 13);
	local sK = O("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			ZIndex = 5,
		}, gK);
	sK.Activated:Connect(function()
		ZK.setFarm(not AK.farm);
		B.refresh();
	end);
	local dK;
	table.insert(m, function()
		local B = AK.farm and true or false;
		SK.Text = B and ((wK.status or "")) or "Ketuk untuk mulai mancing otomatis";
		if B ~= dK then
			local m = dK == nil;
			dK = B;
			yK.Text = B and "AUTO FARM: AKTIF" or "AUTO FARM: MATI";
			local e = B and h.yellowSoft or h.offwhite;
			local f = B and h.yellowDark or h.line;
			local O = B and h.yellowDark or h.gray;
			local E = B and UDim2.fromOffset(31, 3) or UDim2.fromOffset(3, 3);
			if m then
				gK.BackgroundColor3, NK.Color, GK.BackgroundColor3, WK.Position = e, f, O, E;
			else
				l(gK, .25, { BackgroundColor3 = e });
				l(NK, .25, { Color = f });
				l(GK, .25, { BackgroundColor3 = O });
				l(WK, .3, { Position = E }, z[1], z[2]);
			end;
		end;
	end);
	local FK = { FREE = { h.gray, h.text }, PREMIUM = { h.yellow, h.text }, OWNER = { h.text, h.yellowLight } };
	local oK = FK[mK] or FK.FREE;
	local iK = qK(LK);
	uK(iK, "MODE MINIGAME");
	cK(iK, { { id = "Smart", text = "Smart" }, { id = "Skip", text = "Skip", lock = "skip" } }, function()
		return AK.mode;
	end, function(B)
		if B == "Skip" and not hK then
			nK();
			return;
		end;
		AK.mode = B;
		UK();
	end);
	local bK = IK(iK, "");
	table.insert(m, function()
		local B = EK[AK.mode];
		if bK.Text ~= B then
			bK.Text = B;
		end;
	end);
	local VK = qK(LK);
	uK(VK, "KECEPATAN", "speed");
	local B7 = {};
	for B, m in ipairs(CK) do
		table.insert(B7, { id = m, text = m, lock = (m ~= "Aman") and "speed" or nil });
	end;
	cK(VK, B7, function()
		return AK.preset;
	end, function(B)
		ZK.setPreset(B);
	end);
	local m7 = IK(VK, "");
	table.insert(m, function()
		local B = aK[AK.preset] or "";
		if m7.Text ~= B then
			m7.Text = B;
		end;
	end);
	local e7 = qK(LK);
	uK(e7, "OTOMATISASI", "automation");
	PK(e7, "Lempar pancing otomatis", "Bot melempar sendiri.", function()
		return AK.autoCast;
	end, function(B)
		AK.autoCast = B;
	end, nil, "automation");
	PK(e7, "Pegang rod otomatis", "Ambil rod dari tas saat farm aktif.", function()
		return AK.autoEquip;
	end, function(B)
		AK.autoEquip = B;
	end, nil, "automation");
	local h7 = qK(LK);
	uK(h7, "ATUR WAKTU SENDIRI (LANJUTAN)", "timing");
	IK(h7, "Mulai dari preset Aman, naikkan pelan-pelan.");
	kK(h7, "Tahan sebelum selesai", "Mode Skip: detik sebelum minigame dipaksa selesai.", function()
		return AK.skipDelay;
	end, function(B)
		AK.skipDelay = B;
		ZK.syncPreset();
	end, 0, 10, false, function()
		return AK.mode == "Skip";
	end, "timing");
	PK(h7, "Percepat waktu gigitan", "Perpendek waktu tunggu ikan menggigit.", function()
		return AK.biteFast;
	end, function(B)
		AK.biteFast = B;
		ZK.syncPreset();
	end, nil, "timing");
	kK(h7, "Waktu tunggu gigitan", "Makin kecil makin cepat, bisa ditolak server.", function()
		return AK.biteWait;
	end, function(B)
		AK.biteWait = B;
		ZK.syncPreset();
	end, .2, 6, false, function()
		return AK.biteFast;
	end, "timing");
	kK(h7, "Jeda lempar ulang", "Jeda setelah dapat ikan sebelum lempar lagi.", function()
		return AK.castCooldown;
	end, function(B)
		AK.castCooldown = B;
		ZK.syncPreset();
	end, .05, 2, false, nil, "timing");
	kK(h7, "Batas macet", "Reset otomatis jika pancing macet selama ini.", function()
		return AK.stuckTimeout;
	end, function(B)
		AK.stuckTimeout = B;
	end, 5, 120, true, nil, "timing");
	local f7 = qK(tK);
	uK(f7, "AUTO FAVORIT", "favorit");
	PK(f7, "Favoritkan ikan baru", "Ikan baru rarity terpilih otomatis difavoritkan.", function()
		return AK.favOn;
	end, function(B)
		AK.favOn = B;
		if B then
			vK = true;
		end;
	end, nil, "favorit");
	local z7 = qK(tK);
	uK(z7, "RARITY YANG DIFAVORITKAN", "favorit");
	local O7 = O("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = A(z7),
		}, z7);
	O("UIGridLayout", { CellSize = UDim2.new(.3333, -4, 0, 34), CellPadding = UDim2.fromOffset(6, 6), SortOrder = Enum.SortOrder.LayoutOrder }, O7);
	for e, f in ipairs(zK) do
		local z = O("TextButton", {
				Text = f,
				Font = Enum.Font.GothamBold,
				TextSize = 11,
				AutoButtonColor = false,
				LayoutOrder = e,
				BackgroundColor3 = h.white,
				TextColor3 = h.muted,
			}, O7);
		E(z, 8);
		local a = C(z, h.gray, 1.5);
		HK(z, "favorit", { radius = 8, inset = 8 });
		local A;
		table.insert(m, function()
			local B = AK.fav[f] and true or false;
			if B ~= A then
				A = B;
				l(z, .18, { BackgroundColor3 = B and h.yellow or h.white, TextColor3 = B and h.text or h.muted });
				l(a, .18, { Color = B and h.yellowDark or h.gray });
			end;
		end);
		z.Activated:Connect(function()
			AK.fav[f] = not AK.fav[f];
			B.refresh();
		end);
	end;
	KK(z7, "Favoritkan sekarang", "primary", function()
		ZK.favNow();
	end, "favorit");
	IK(z7, "Rarity yang dicentang dilindungi saat menjual.");
	local E7 = qK(XK);
	uK(E7, "AUTO JUAL (TANPA NPC)", "jual");
	PK(E7, "Jual otomatis", "Menjual ikan saat jumlahnya mencapai angka di bawah.", function()
		return AK.sellOn;
	end, function(B)
		ZK.setSell(B);
	end, nil, "jual");
	kK(E7, "Jual saat inventory >=", "Maks 500.", function()
		return AK.sellAt;
	end, function(B)
		AK.sellAt = B;
	end, 1, R.MaxInventory, true, nil, "jual");
	kK(E7, "Jeda antar jual", "Terlalu kecil bisa dianggap spam.", function()
		return AK.sellGap;
	end, function(B)
		AK.sellGap = B;
	end, .02, 2, false, nil, "jual");
	local C7 = qK(XK);
	uK(C7, "CARA JUAL", "jual");
	local l7 = DK(C7, "", 11, h.text, Enum.Font.GothamMedium);
	PK(C7, "Izinkan jual-semua", "Menjual SEMUA ikan sekaligus. Mati otomatis jika ikan favorit ikut hilang.", function()
		return AK.allowSellAll;
	end, function(B)
		AK.allowSellAll = B;
	end, nil, "jual");
	table.insert(m, function()
		local B = ZK.methodReport();
		local m = "Cara jual: " .. ((B.learned and ("sudah dipelajari" .. ((B.learnedKind == e("0d783cc002eb4537") and " (jual semua)" or " (per ikan)"))) or "belum dipelajari. Tekan \'Pelajari cara jual\' lalu jual 1 ikan di NPC."));
		if l7.Text ~= m then
			l7.Text = m;
		end;
	end);
	local a7 = qK(XK);
	uK(a7, "AKSI", "jual");
	KK(a7, "Jual sekarang", "primary", function()
		ZK.sellNow();
	end, "jual");
	KK(a7, "Pelajari cara jual (jual 1 ikan di NPC)", "ghost", function()
		ZK.startLearn();
	end, "jual");
	KK(a7, "Lupakan hasil pelajaran", "ghost", function()
		ZK.forget();
	end, "jual");
	local A7 = DK(a7, "", 11, h.text, Enum.Font.GothamMedium);
	table.insert(m, function()
		local B = "Info terakhir: " .. tostring(wK.lastNote or "-");
		if A7.Text ~= B then
			A7.Text = B;
		end;
	end);
	IK(a7, "Uji aman dulu: favoritkan 1 ikan murah, tekan \'Jual sekarang\'. Jika ikut hilang, jangan nyalakan jual-semua.");
	local function x7(B, m)
		local e = O("Frame", { Size = UDim2.new(1, 0, 0, 38), BackgroundColor3 = h.white, LayoutOrder = A(B) }, B);
		E(e, 10);
		local f = C(e, h.gray, 1.5);
		local z = O("TextLabel", {
				Size = UDim2.new(1, -34, 1, 0),
				Position = UDim2.fromOffset(12, 0),
				BackgroundTransparency = 1,
				Text = "",
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = h.muted,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
			}, e);
		local l = O("TextLabel", {
				Size = UDim2.fromOffset(20, 20),
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, -10, .5, 0),
				BackgroundTransparency = 1,
				Text = "v",
				TextColor3 = h.muted,
				Font = Enum.Font.GothamBold,
				TextSize = 12,
			}, e);
		local a = O("TextButton", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Text = "",
				AutoButtonColor = false,
			}, e);
		HK(e, m, { radius = 10, inset = 12 });
		local x = O("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				LayoutOrder = A(B),
			}, B);
		local H = O("ScrollingFrame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = h.offwhite,
				BorderSizePixel = 0,
				ScrollBarThickness = 4,
				ScrollBarImageColor3 = h.yellowDark,
				CanvasSize = UDim2.new(),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				ScrollingDirection = Enum.ScrollingDirection.Y,
			}, x);
		E(H, 8);
		O("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }, H);
		O("UIPadding", {
			PaddingTop = UDim.new(0, 4),
			PaddingBottom = UDim.new(0, 4),
			PaddingLeft = UDim.new(0, 4),
			PaddingRight = UDim.new(0, 4),
		}, H);
		local p = false;
		local function w(B)
			p = B;
			x.Size = B and UDim2.new(1, 0, 0, 160) or UDim2.new(1, 0, 0, 0);
			l.Text = B and "^" or "v";
		end;
		a.Activated:Connect(function()
			w(not p);
		end);
		return {
			lbl = z,
			sf = H,
			setOpen = w,
			isOpen = function()
				return p;
			end,
		};
	end;
	local function H7(B, m, e)
		local f = O("TextButton", {
				Size = UDim2.new(1, 0, 0, 32),
				BackgroundColor3 = h.white,
				Text = "",
				AutoButtonColor = false,
			}, B);
		E(f, 6);
		local z = O("TextLabel", {
				Size = UDim2.new(1, -16, 1, 0),
				Position = UDim2.fromOffset(8, 0),
				BackgroundTransparency = 1,
				Text = m,
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = h.text,
				TextXAlignment = Enum.TextXAlignment.Left,
			}, f);
		f.Activated:Connect(e);
		return f, z;
	end;
	local w7 = qK(QK);
	uK(w7, "PILIH TARGET", "trade");
	local T7 = x7(w7, "trade");
	T7.lbl.Text = "Belum dipilih";
	do
		local B, e = nil, {};
		table.insert(m, function()
			local m, h = {}, {};
			for B, e in ipairs(v:GetPlayers()) do
				if e ~= M then
					table.insert(m, e);
					table.insert(h, tostring(e.UserId));
				end;
			end;
			h = table.concat(h, "|");
			if h ~= B then
				B = h;
				for B, m in ipairs(e) do
					m:Destroy();
				end;
				e = {};
				for B, m in ipairs(m) do
					local h = H7(T7.sf, m.Name, function()
							p7.targetUserId, p7.targetName = m.UserId, m.Name;
							T7.lbl.Text = m.Name;
							T7.setOpen(false);
						end);
					table.insert(e, h);
				end;
			end;
			if p7.targetName and not v:GetPlayerByUserId(p7.targetUserId or 0) then
				T7.lbl.Text = p7.targetName .. " (sudah keluar)";
			end;
		end);
	end;
	local R7 = qK(QK);
	uK(R7, "PILIH RARITY", "trade");
	local D7 = x7(R7, "trade");
	D7.lbl.Text = "Belum dipilih";
	do
		local e = {};
		for m, h in ipairs(zK) do
			local f, z = H7(D7.sf, h, function()
					p7.rarity, p7.fishName = h, nil;
					D7.lbl.Text = h;
					D7.setOpen(false);
					B.refresh();
				end);
			e[h] = z;
		end;
		table.insert(m, function()
			local B = r7();
			for m, e in pairs(e) do
				local h = (("%s (x%d)")):format(m, B[m] or 0);
				if e.Text ~= h then
					e.Text = h;
				end;
			end;
			if p7.rarity then
				local m = (("%s (x%d)")):format(p7.rarity, B[p7.rarity] or 0);
				if D7.lbl.Text ~= m then
					D7.lbl.Text = m;
				end;
			end;
		end);
	end;
	local u7 = qK(QK);
	uK(u7, "NAMA IKAN (OPSIONAL)", "trade");
	local I7 = x7(u7, "trade");
	I7.lbl.Text = "Semua nama";
	do
		local B, e = nil, {};
		table.insert(m, function()
			if not p7.rarity then
				if B ~= "" then
					B = "";
					for B, m in ipairs(e) do
						m.row:Destroy();
					end;
					e = {};
				end;
				return;
			end;
			local m, h = q7(p7.rarity);
			local f = p7.rarity .. (":" .. table.concat(m, "|"));
			if f ~= B then
				B = f;
				for B, m in ipairs(e) do
					m.row:Destroy();
				end;
				e = {};
				local z = H7(I7.sf, "Semua nama", function()
						p7.fishName = nil;
						I7.lbl.Text = "Semua nama";
						I7.setOpen(false);
					end);
				table.insert(e, { row = z, txt = nil, name = nil });
				for B, m in ipairs(m) do
					local f, z = H7(I7.sf, (("%s (x%d)")):format(m, h[m] or 0), function()
							p7.fishName = m;
							I7.lbl.Text = (("%s (x%d)")):format(m, h[m] or 0);
							I7.setOpen(false);
						end);
					table.insert(e, { row = f, txt = z, name = m });
				end;
			else
				for B, m in ipairs(e) do
					if m.name then
						local B = (("%s (x%d)")):format(m.name, h[m.name] or 0);
						if m.txt.Text ~= B then
							m.txt.Text = B;
						end;
						if p7.fishName == m.name and I7.lbl.Text ~= B then
							I7.lbl.Text = B;
						end;
					end;
				end;
			end;
		end);
	end;
	local j7 = qK(QK);
	uK(j7, "JUMLAH & AKSI", "trade");
	kK(j7, "Jumlah ikan", "Berapa ekor yang mau dikirim.", function()
		return p7.amount;
	end, function(B)
		p7.amount = math.max(1, math.floor(B));
	end, 1, 500, true, nil, "trade");
	PK(j7, "Auto dekati target", "Biasanya tidak perlu. Nyalakan kalau kirim jarak jauh gagal terus.", function()
		return p7.autoApproach;
	end, function(B)
		p7.autoApproach = B;
	end, nil, "trade");
	local J7 = DK(j7, "", 11, h.muted, Enum.Font.GothamMedium);
	table.insert(m, function()
		if J7.Text ~= p7.log then
			J7.Text = p7.log;
		end;
	end);
	KK(j7, "Mulai Give", "primary", function()
		local B, m = p7.start();
		if not B then
			ZK.toast("Trade gagal mulai: " .. tostring(m), "warn", 6);
		end;
	end, "trade");
	KK(j7, "Stop", "ghost", function()
		p7.stop();
	end, "trade");
	IK(j7, "Ikan favorit otomatis di-unfavorite dulu. Dikirim satu-satu, tunggu respons baru lanjut.");
	local v7 = qK(QK);
	uK(v7, "TERIMA KIRIMAN MASUK", "trade");
	PK(v7, "Auto Accept", "Otomatis terima kiriman ikan yang masuk.", function()
		return p7.autoAccept;
	end, function(B)
		p7.autoAccept = B;
	end, nil, "trade");
	IK(v7, "Popup bawaan game mungkin sempat kelihatan sebentar, itu wajar.");
	local P7 = qK(MK);
	uK(P7, "BOOST PERFORMANCE", "boost");
	PK(P7, "Aktifkan Boost Performance", "Bikin game lebih ringan biar nggak lag/panas.", function()
		return S7.on;
	end, function(B)
		if B then
			local B, m = S7.enable();
			if not B then
				ZK.toast("Boost Performance gagal: " .. tostring(m), "warn", 6);
			end;
		else
			S7.disable();
		end;
	end, nil, "boost");
	local k7 = DK(P7, "", 11, h.muted, Enum.Font.GothamMedium);
	table.insert(m, function()
		local B = (("Status: %s  |  efek mati: %d  |  model disederhanakan: %d")):format(S7.on and "AKTIF" or "mati", S7.effectCount, S7.meshCount);
		if k7.Text ~= B then
			k7.Text = B;
		end;
	end);
	IK(P7, "Cuma ubah tampilan, bukan cara main. Balik normal otomatis kalau dimatikan.");
	local c7 = qK(MK);
	uK(c7, "ANTI-LOSE STREAK", "streak");
	PK(c7, "Aktifkan Anti-Lose Streak", "Rejoin otomatis saat tangkapan gagal.", function()
		return xK.antiLoseStreak;
	end, function(B)
		xK.antiLoseStreak = B;
	end, nil, "streak");
	local K7 = DK(c7, "", 11, h.muted, Enum.Font.GothamMedium);
	table.insert(m, function()
		local B = M7 and "Status: sudah pernah ter-trigger sesi ini (sedang/ sudah mencoba rejoin)." or "Status: belum pernah ter-trigger sesi ini.";
		if K7.Text ~= B then
			K7.Text = B;
		end;
	end);
	IK(c7, "Selalu otomatis: begitu terdeteksi gagal, Auto Farm dihentikan dan !rejoin langsung dikirim 1x.");
	local function L7(B, m, e)
		local f = jK(B);
		O("TextLabel", {
			Size = UDim2.new(.4, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = m,
			TextColor3 = h.muted,
			Font = Enum.Font.GothamMedium,
			TextSize = 12,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, f);
		local z = O("TextLabel", {
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(.58, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Text = e,
				TextColor3 = h.text,
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Right,
			}, f);
		return z;
	end;
	local t7 = qK(YK);
	local X7 = O("Frame", { Size = UDim2.new(1, 0, 0, 68), BackgroundTransparency = 1, LayoutOrder = A(t7) }, t7);
	local Z7 = O("Frame", {
			Size = UDim2.fromOffset(60, 60),
			Position = UDim2.fromOffset(0, 4),
			BackgroundColor3 = h.yellowSoft,
			BorderSizePixel = 0,
		}, X7);
	E(Z7, 30);
	C(Z7, h.yellowDark, 1.5);
	local Q7 = O("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = (string.sub(M.Name, 1, 1)):upper(),
			Font = Enum.Font.GothamBlack,
			TextSize = 22,
			TextColor3 = h.text,
		}, Z7);
	local n7 = O("ImageLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Crop,
		}, Z7);
	E(n7, 30);
	O("TextLabel", {
		Size = UDim2.new(1, -72, 0, 20),
		Position = UDim2.fromOffset(72, 2),
		BackgroundTransparency = 1,
		Text = M.DisplayName,
		Font = Enum.Font.GothamBold,
		TextSize = 15,
		TextColor3 = h.text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
	}, X7);
	O("TextLabel", {
		Size = UDim2.new(1, -72, 0, 16),
		Position = UDim2.fromOffset(72, 23),
		BackgroundTransparency = 1,
		Text = "@" .. M.Name,
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextColor3 = h.muted,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, X7);
	local Y7 = O("TextLabel", {
			Size = UDim2.fromOffset(74, 24),
			Position = UDim2.fromOffset(72, 44),
			BackgroundColor3 = oK[1],
			Text = mK,
			TextColor3 = oK[2],
			Font = Enum.Font.GothamBlack,
			TextSize = 12,
		}, X7);
	E(Y7, 12);
	task.spawn(function()
		local B, m = pcall(function()
				return v:GetUserThumbnailAsync(M.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180);
			end);
		if B and m then
			n7.Image = m;
			l(n7, .3, { ImageTransparency = 0 });
			Q7.Visible = false;
		end;
	end);
	local g7 = qK(YK);
	uK(g7, "DETAIL AKUN");
	L7(g7, "Username", M.Name);
	L7(g7, "Display Name", M.DisplayName);
	local N7 = L7(g7, "Negara", "Memuat...");
	local y7 = L7(g7, "Role", mK);
	y7.TextColor3 = (mK == "FREE") and h.muted or h.yellowDark;
	task.spawn(function()
		local B, m = pcall(function()
				return n:GetCountryRegionForPlayerAsync(M);
			end);
		N7.Text = ((B and (type(m) == "string" and m ~= ""))) and m or "Tidak diketahui";
	end);
	IK(g7, hK and "Semua fitur terbuka, tanpa batasan." or "Akun FREE hanya membuka Auto Farm mode Smart.");
	local G7;
	local function W7(B, m)
		if G7 == B then
			return;
		end;
		G7 = B;
		for e, f in ipairs(U) do
			if e == B then
				f.cg.Visible = true;
				if m then
					f.cg.GroupTransparency, f.cg.Position = 0, UDim2.new();
				else
					f.cg.GroupTransparency, f.cg.Position = 1, UDim2.fromOffset(0, 14);
					l(f.cg, .25, { GroupTransparency = 0, Position = UDim2.new() });
				end;
			else
				f.cg.Visible = false;
			end;
			l(o[e], .18, { TextColor3 = (e == B) and h.text or h.muted });
		end;
		local e = UDim2.new(((B - 1)) / #f, 3, 0, 3);
		if m then
			d.Position = e;
		else
			l(d, .3, { Position = e }, z[1], z[2]);
		end;
	end;
	local s7 = {
			Favorit = "favorit",
			Jual = "jual",
			Trade = "trade",
			Extras = "streak",
		};
	for B, m in ipairs(f) do
		local e = O("TextButton", {
				Size = UDim2.new(1 / #f, 0, 1, 0),
				Position = UDim2.new(((B - 1)) / #f, 0, 0, 0),
				BackgroundTransparency = 1,
				Text = m,
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextColor3 = h.muted,
				AutoButtonColor = false,
				ZIndex = 2,
			}, s);
		e.Activated:Connect(function()
			W7(B);
		end);
		o[B] = e;
		if fK(s7[m]) then
			lK(e, h.muted, Vector2.new(1, .5), UDim2.new(1, -6, .5, 0));
		end;
	end;
	local d7 = O("CanvasGroup", {
			AnchorPoint = Vector2.new(.5, 0),
			Position = UDim2.new(.5, 0, 0, 48),
			Size = UDim2.new(1, -28, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = h.text,
			BorderSizePixel = 0,
			GroupTransparency = 1,
			Visible = false,
			ZIndex = 40,
		}, P);
	E(d7, 10);
	local F7 = O("Frame", { Size = UDim2.new(0, 5, 1, 0), BackgroundColor3 = h.yellow, BorderSizePixel = 0 }, d7);
	local o7 = O("TextLabel", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = "",
			TextColor3 = h.white,
			Font = Enum.Font.GothamMedium,
			TextSize = 12,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, d7);
	O("UIPadding", {
		PaddingTop = UDim.new(0, 9),
		PaddingBottom = UDim.new(0, 9),
		PaddingLeft = UDim.new(0, 16),
		PaddingRight = UDim.new(0, 10),
	}, o7);
	O("UISizeConstraint", { MaxSize = Vector2.new(360, math.huge) }, d7);
	local i7 = 0;
	local U7 = {
			ok = h.green,
			warn = h.yellow,
			err = h.red,
			info = h.yellowLight,
		};
	local b7 = O("ImageButton", {
			Name = "Bubble",
			Size = UDim2.fromOffset(60, 60),
			AnchorPoint = Vector2.new(.5, .5),
			BackgroundColor3 = h.yellow,
			AutoButtonColor = false,
			Image = "",
			ScaleType = Enum.ScaleType.Crop,
			Visible = false,
		}, r);
	E(b7, 30);
	local Bz = C(b7, h.yellowDark, 3);
	local mz = O("UIScale", { Scale = 0 }, b7);
	local ez = O("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = H,
			Font = Enum.Font.GothamBlack,
			TextSize = 20,
			TextColor3 = h.text,
		}, b7);
	local hz = O("Frame", {
			Size = UDim2.fromOffset(14, 14),
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 1, 0, -1),
			BackgroundColor3 = h.gray,
			BorderSizePixel = 0,
			ZIndex = 3,
		}, b7);
	E(hz, 7);
	C(hz, h.white, 2);
	(t:Create(Bz, TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Transparency = .7 })):Play();
	local function fz()
		b7.Position = UDim2.fromOffset(J.X, J.Y);
	end;
	fz();
	function ZK.toast(B, m, e)
		i7 = i7 + 1;
		local f = i7;
		o7.Text = tostring(B);
		F7.BackgroundColor3 = U7[m or "info"] or h.yellow;
		d7.Visible = true;
		d7.GroupTransparency = 1;
		d7.Position = UDim2.new(.5, 0, 0, 40);
		l(d7, .32, { GroupTransparency = .03, Position = UDim2.new(.5, 0, 0, 58) }, z[1], z[2]);
		if D.minimized then
			l(mz, .12, { Scale = 1.25 });
			task.delay(.14, function()
				l(mz, .2, { Scale = 1 }, z[1], z[2]);
			end);
		end;
		task.delay(e or 4, function()
			if i7 == f then
				l(d7, .25, { GroupTransparency = 1, Position = UDim2.new(.5, 0, 0, 44) });
				task.delay(.3, function()
					if i7 == f then
						d7.Visible = false;
					end;
				end);
			end;
		end);
	end;
	local zz = O("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			Visible = false,
			Active = true,
			ZIndex = 60,
		}, P);
	local Oz = O("CanvasGroup", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.new(1, -40, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = h.white,
			GroupTransparency = 1,
			ZIndex = 61,
		}, zz);
	E(Oz, 14);
	C(Oz, h.yellow, 2);
	O("UISizeConstraint", { MaxSize = Vector2.new(320, math.huge) }, Oz);
	local Ez = O("UIScale", { Scale = .8 }, Oz);
	O("UIPadding", {
		PaddingTop = UDim.new(0, 14),
		PaddingBottom = UDim.new(0, 14),
		PaddingLeft = UDim.new(0, 14),
		PaddingRight = UDim.new(0, 14),
	}, Oz);
	O("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, Oz);
	local Cz = DK(Oz, "", 15, h.text, Enum.Font.GothamBold);
	local lz = DK(Oz, "", 12, h.muted, Enum.Font.Gotham);
	local az = O("Frame", { Size = UDim2.new(1, 0, 0, 38), BackgroundTransparency = 1, LayoutOrder = A(Oz) }, Oz);
	O("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, az);
	local Az = O("TextButton", {
			Size = UDim2.new(.5, -4, 1, 0),
			BackgroundColor3 = h.yellow,
			Text = "Batal",
			TextColor3 = h.text,
			Font = Enum.Font.GothamBold,
			TextSize = 13,
			LayoutOrder = 1,
			AutoButtonColor = false,
		}, az);
	E(Az, 10);
	local xz = O("TextButton", {
			Size = UDim2.new(.5, -4, 1, 0),
			BackgroundColor3 = h.red,
			Text = "",
			TextColor3 = h.white,
			Font = Enum.Font.GothamBold,
			TextSize = 13,
			LayoutOrder = 2,
			AutoButtonColor = false,
		}, az);
	E(xz, 10);
	local Hz, pz, wz = 0, nil, nil;
	local function Tz()
		local B = Hz;
		l(zz, .18, { BackgroundTransparency = 1 });
		l(Oz, .18, { GroupTransparency = 1 });
		l(Ez, .18, { Scale = .85 });
		task.delay(.2, function()
			if Hz == B then
				zz.Visible = false;
			end;
		end);
	end;
	function ZK.ask(B, m, e, h, f)
		Hz = Hz + 1;
		Cz.Text, lz.Text, xz.Text = B, m, e;
		pz, wz = h, f;
		zz.Visible = true;
		zz.BackgroundTransparency, Oz.GroupTransparency, Ez.Scale = 1, 1, .8;
		l(zz, .2, { BackgroundTransparency = .5 });
		l(Oz, .2, { GroupTransparency = 0 });
		l(Ez, .32, { Scale = 1 }, z[1], z[2]);
	end;
	xz.Activated:Connect(function()
		local B = pz;
		pz = nil;
		Tz();
		if B then
			B();
		end;
	end);
	Az.Activated:Connect(function()
		local B = wz;
		pz, wz = nil, nil;
		Tz();
		if B then
			B();
		end;
	end);
	local Rz;
	local function qz(B, m)
		B.InputBegan:Connect(function(B)
			if Rz then
				return;
			end;
			local e = B.UserInputType;
			if e == Enum.UserInputType.MouseButton1 or e == Enum.UserInputType.Touch then
				Rz = {
						input = B,
						cfg = m,
						sx = B.Position.X,
						sy = B.Position.Y,
						moved = false,
						touch = (e == Enum.UserInputType.Touch),
					};
				if m.onStart then
					m.onStart();
				end;
			end;
		end);
	end;
	table.insert(TK, k.InputChanged:Connect(function(B)
		local m = Rz;
		if not m then
			return;
		end;
		if (m.touch and B == m.input) or ((not m.touch) and B.UserInputType == Enum.UserInputType.MouseMovement) then
			local e, h = B.Position.X - m.sx, B.Position.Y - m.sy;
			if not m.moved and (e * e + h * h) > 36 then
				m.moved = true;
			end;
			if m.moved then
				m.cfg.onMove(e, h);
			end;
		end;
	end));
	table.insert(TK, k.InputEnded:Connect(function(B)
		local m = Rz;
		if m and ((B == m.input or ((not m.touch) and B.UserInputType == Enum.UserInputType.MouseButton1))) then
			Rz = nil;
			if m.cfg.onEnd then
				m.cfg.onEnd(m.moved);
			end;
		end;
	end));
	local rz;
	qz(L, { onStart = function()
			rz = j;
		end, onMove = function(B, m)
			local e = q();
			j = Vector2.new(math.clamp(rz.X + B, 0, math.max(0, e.X - I.X)), math.clamp(rz.Y + m, 0, math.max(0, e.Y - I.Y)));
			K();
		end });
	local Dz = O("TextButton", {
			Size = UDim2.fromOffset(26, 26),
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -2, 1, -2),
			BackgroundTransparency = 1,
			Text = "",
			ZIndex = 50,
			AutoButtonColor = false,
		}, P);
	local uz = {};
	for B, m in ipairs({
		{ 18, 18 },
		{ 12, 18 },
		{ 18, 12 },
		{ 6, 18 },
		{ 12, 12 },
		{ 18, 6 },
	}) do
		local e = O("Frame", {
				Size = UDim2.fromOffset(3, 3),
				Position = UDim2.fromOffset(m[1], m[2]),
				BackgroundColor3 = h.yellowDark,
				BorderSizePixel = 0,
				ZIndex = 51,
			}, Dz);
		E(e, 2);
		table.insert(uz, e);
	end;
	Dz.MouseEnter:Connect(function()
		for B, m in ipairs(uz) do
			l(m, .12, { BackgroundColor3 = h.text });
		end;
	end);
	Dz.MouseLeave:Connect(function()
		for B, m in ipairs(uz) do
			l(m, .12, { BackgroundColor3 = h.yellowDark });
		end;
	end);
	local Iz;
	qz(Dz, { onStart = function()
			Iz = I;
		end, onMove = function(B, m)
			local e = q();
			local h = math.min(720, math.max(300, (e.X - j.X) - 4));
			local f = math.min(820, math.max(340, (e.Y - j.Y) - 4));
			I = Vector2.new(math.clamp(Iz.X + B, 300, h), math.clamp(Iz.Y + m, 340, f));
			K();
		end });
	local function jz(B)
		local m = q();
		return Vector2.new(math.clamp(B.X, 32, math.max(32, m.X - 32)), math.clamp(B.Y, 32, math.max(32, m.Y - 32)));
	end;
	local function Jz()
		if D.minimized or not D.ready or D.busy then
			return;
		end;
		D.minimized, D.busy = true, true;
		if not D.bubbleMoved then
			J = jz(Vector2.new(j.X + 30, j.Y + 30));
		end;
		fz();
		l(P, .28, { GroupTransparency = 1, Position = UDim2.fromOffset(J.X, J.Y) }, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
		l(c, .28, { Scale = .15 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
		task.delay(.3, function()
			P.Visible = false;
			b7.Visible = true;
			mz.Scale = 0;
			l(mz, .4, { Scale = 1 }, z[1], z[2]);
			D.busy = false;
		end);
	end;
	local function vz()
		if not D.minimized or D.busy then
			return;
		end;
		D.minimized, D.busy = false, true;
		local B = q();
		j = Vector2.new(math.clamp(J.X - 30, 8, math.max(8, (B.X - I.X) - 8)), math.clamp(J.Y - 30, 8, math.max(8, (B.Y - I.Y) - 8)));
		l(mz, .15, { Scale = 0 });
		P.Size = UDim2.fromOffset(I.X, I.Y);
		P.Position = UDim2.fromOffset(J.X, J.Y);
		c.Scale, P.GroupTransparency, P.Visible = .15, 1, true;
		l(P, .36, { GroupTransparency = 0, Position = UDim2.fromOffset(j.X + I.X / 2, j.Y + I.Y / 2) });
		l(c, .42, { Scale = 1 }, z[1], z[2]);
		task.delay(.18, function()
			b7.Visible = false;
		end);
		task.delay(.45, function()
			D.busy = false;
		end);
	end;
	local Pz;
	qz(b7, { onStart = function()
			Pz = J;
		end, onMove = function(B, m)
			D.bubbleMoved = true;
			J = jz(Vector2.new(Pz.X + B, Pz.Y + m));
			fz();
		end, onEnd = function(B)
			if not B then
				vz();
			end;
		end });
	S.Activated:Connect(Jz);
	function B.fadeOut(B)
		l(c, .25, { Scale = .85 });
		l(P, .25, { GroupTransparency = 1 });
		l(mz, .2, { Scale = 0 });
		task.delay(.3, B);
	end;
	W.Activated:Connect(function()
		ZK.ask("Tutup GUI?", "Semua fitur akan berhenti dan GUI dihapus. Lanjutkan?", "Lanjut", function()
			ZK.ask("Konfirmasi terakhir", "Ini MENUTUP TOTAL program. Untuk menampilkan lagi harus eksekusi script ulang. Yakin?", "Tutup Total", function()
				ZK.closeAll();
			end);
		end);
	end);
	table.insert(TK, k.InputBegan:Connect(function(B, m)
		if not m and (D.ready and B.KeyCode == R.ToggleKey) then
			if D.minimized then
				vz();
			else
				Jz();
			end;
		end;
	end));
	function B.refresh()
		for B, m in ipairs(m) do
			pcall(m);
		end;
	end;
	ZK.refreshUI = B.refresh;
	task.spawn(function()
		while RK do
			pK();
			eK.Text = wK.status or "";
			OK.Text = (("Inv %s/%d  |  Tangkap %d  |  Fav %d  |  Jual %d")):format(tostring(wK.inv or "?"), R.MaxInventory, wK.caught, wK.fav, wK.sold);
			local m = AK.farm and h.green or h.gray;
			BK.BackgroundColor3 = m;
			hz.BackgroundColor3 = AK.farm and h.green or h.gray;
			B.refresh();
			task.wait(.5);
		end;
	end);
	task.spawn(function()
		while RK do
			X.Position = UDim2.new(-0.3, 0, -0.4, 0);
			if P.Visible and not D.minimized then
				l(X, 1.1, { Position = UDim2.new(1.3, 0, -0.4, 0) }, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
			end;
			task.wait(6);
		end;
	end);
	local kz;
	V7(function(B)
		Y.Image = B;
		l(Y, .4, { ImageTransparency = 0 });
		b7.Image = B;
		ez.Visible = false;
		if kz then
			kz.Image = B;
			l(kz, .4, { ImageTransparency = 0 });
		end;
	end);
	local cz = O("CanvasGroup", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.fromOffset(280, 220),
			BackgroundColor3 = h.white,
			BorderSizePixel = 0,
			GroupTransparency = 1,
		}, r);
	E(cz, 20);
	C(cz, h.yellow, 2);
	local Kz = O("UIScale", { Scale = .8 }, cz);
	local Lz = O("Frame", {
			AnchorPoint = Vector2.new(.5, 0),
			Position = UDim2.new(.5, 0, 0, 20),
			Size = UDim2.fromOffset(88, 88),
			BackgroundColor3 = h.yellow,
			BorderSizePixel = 0,
		}, cz);
	E(Lz, 44);
	C(Lz, h.yellowDark, 3);
	local tz = O("UIScale", { Scale = 1 }, Lz);
	O("TextLabel", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = H,
		Font = Enum.Font.GothamBlack,
		TextSize = 30,
		TextColor3 = h.text,
	}, Lz);
	kz = O("ImageLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Crop,
		}, Lz);
	E(kz, 44);
	O("TextLabel", {
		Position = UDim2.fromOffset(0, 118),
		Size = UDim2.new(1, 0, 0, 22),
		BackgroundTransparency = 1,
		Text = w,
		Font = Enum.Font.GothamBlack,
		TextSize = 18,
		TextColor3 = h.text,
	}, cz);
	O("TextLabel", {
		Position = UDim2.fromOffset(0, 139),
		Size = UDim2.new(1, 0, 0, 14),
		BackgroundTransparency = 1,
		Text = T,
		Font = Enum.Font.GothamBold,
		TextSize = 11,
		TextColor3 = h.yellowDark,
	}, cz);
	local Xz = O("Frame", {
			AnchorPoint = Vector2.new(.5, 0),
			Position = UDim2.new(.5, 0, 0, 168),
			Size = UDim2.fromOffset(200, 6),
			BackgroundColor3 = h.line,
			BorderSizePixel = 0,
		}, cz);
	E(Xz, 3);
	local Zz = O("Frame", { Size = UDim2.fromScale(0, 1), BackgroundColor3 = h.yellow, BorderSizePixel = 0 }, Xz);
	E(Zz, 3);
	local Qz = O("TextLabel", {
			Position = UDim2.fromOffset(0, 180),
			Size = UDim2.new(1, 0, 0, 16),
			BackgroundTransparency = 1,
			Text = "",
			Font = Enum.Font.Gotham,
			TextSize = 10,
			TextColor3 = h.muted,
		}, cz);
	(t:Create(tz, TweenInfo.new(.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Scale = 1.08 })):Play();
	task.spawn(function()
		l(cz, .35, { GroupTransparency = 0 });
		l(Kz, .45, { Scale = 1 }, z[1], z[2]);
		local m = {
				{ (("Akun %s - mode %s")):format(M.Name, mK), .2 },
				{ ((hookmetamethod and getnamecallmethod)) and "Fitur executor lengkap" or "Fitur executor terbatas", .35 },
				{ rK and "Minigame & state game ditemukan" or "Minigame ditemukan (mode GUI)", .7 },
				{ "Menyiapkan tampilan...", 1 },
			};
		for B, m in ipairs(m) do
			Qz.Text = m[1];
			l(Zz, .4, { Size = UDim2.fromScale(m[2], 1) });
			task.wait(.5);
		end;
		task.wait(.15);
		l(cz, .3, { GroupTransparency = 1 });
		l(Kz, .3, { Scale = 1.12 });
		task.wait(.3);
		cz:Destroy();
		K();
		P.Visible = true;
		W7(1, true);
		B.refresh();
		l(P, .35, { GroupTransparency = 0 });
		l(c, .5, { Scale = 1 }, z[1], z[2]);
		D.ready = true;
		ZK.toast((("Masuk sebagai %s. Semua fitur MATI. Nyalakan sesuai kebutuhan.")):format(mK), hK and "ok" or "info", 5);
	end);
	function B.destroy()
		pcall(function()
			r:Destroy();
		end);
	end;
	return B;
end;
local mz = Bz();
local function ez()
	RK = false;
	AK.farm, AK.sellOn = false, false;
	pcall(S7.disable);
	pcall(iK);
	if qK then
		pcall(qK.SetHolding, qK, false);
	end;
	for B, m in ipairs(TK) do
		pcall(function()
			m:Disconnect();
		end);
	end;
	if J[h.g2o] then
		J[h.g2o].handler = nil;
	end;
	pcall(mz.destroy);
	J[h.g0a] = nil;
end;
function ZK.closeAll()
	mz.fadeOut(ez);
end;
J[h.g0a] = { Destroy = ez };
task.spawn(function()
	pcall(e7);
end);
N("loaded v" .. (R.Version .. ". Semua fitur mati. Minimize/restore:"), R.ToggleKey.Name);
