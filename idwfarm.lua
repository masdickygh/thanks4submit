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

local U = "{\029N\162c\159,Z\225\0087\148";
local function B(B)
	local x, E = {}, #U;
	for J = 1, #B, 2 do
		local o = tonumber(string.sub(B, J, J + 1), 16);
		local l = string.byte(U, ((((J - 1)) / 2)) % E + 1);
		x[#x + 1] = string.char(bit32.bxor(o, l));
	end;
	return table.concat(x);
end;
local x = {
		g0a = B("38743ecd14d94d288c"),
		g1h = B("38743ecd14cc49368d"),
		g2o = B("38743ecd14d743358a4b43f8"),
		g3v = B("38743ecd14d743358a4159e70f7c22ce06fb"),
		g4c = B("3a683acd25f65f32b36143f91a792f"),
	};
local E = "31783dd62bca6e05";
local J = "3155";
local o = "477f70e806ec5812b44a0bbb19236e9e05f0422ec16b58f8146f738011f84e72d03d07b84a2c7b8e53b60e649d3418f214733a9c43d6680dc14962c0343d08e331d2";
local l = "31581df62bca6e";
local e = "3259198222ca7815c14e76c636";
local function n(...)
	local U = 5381;
	for B, x in ipairs({ ... }) do
		for B = 1, #x, 1 do
			U = ((U * 33 + string.byte(x, B))) % 2147483647;
		end;
	end;
	return U;
end;
local Q = n(E, J, o, l, e);
local A = Q == 157615655;
local L, H, O, M, y;
if A then
	L = B(E);
	H = B(J);
	O = B(o);
	M = B(l);
	y = B(e);
else
	L = "Unverified_";
	H = "?!";
	O = "<b>UNVERIFIED</b> <font color=\"rgb(220,50,50)\">|</font> MODIFIED COPY";
	M = "UNVERIFIED";
	y = "MODIFIED COPY";
end;
local g = {
		Debug = true,
		MaxInventory = 500,
		ToggleKey = Enum.KeyCode.F6,
		InventoryPollSeconds = 6,
		AllowClickFallback = true,
		LogoUrl = B("13693ad210a50375936940ba1c743aca16fd5929847a54fb15692bcc17b14f358c275af5087927c108e64b32ce6556e71f742dc91af84474866143fc0e7f60cb0cb05e3f877b18fc1e7c2ad14cf24d338f2747e61472288d0ff04b3592694ef5556d20c5"),
		LogoFile = B("38743ecd14d24d34886968f8147a218c13f14b"),
		SellFile = B("38743ecd14d24d34886968e71e71228c09ec4334"),
		Version = "3.1",
		WhitelistUrl = B("13693ad210a50375936940ba1c743aca16fd5929847a54fb15692bcc17b14f358c275af5087927c108e64b32ce7c5ff515763d9610ea4e37887c18e61e7b3d8d0bfa4d3e92275af5127361d50bf6583f8d6144e055713bc3"),
	};
do
	local U = 0;
	for B = 1, #g.LogoUrl, 1 do
		U = ((U * 33 + string.byte(g.LogoUrl, B))) % 1000000;
	end;
	g.LogoFile = g.LogoFile:gsub("%.png$", "") .. ("_" .. (tostring(U) .. ".png"));
end;
local i, I, F, D = 7.5, .85, -0.2, .05;
local W, t = .75, .13;
local N = (getgenv and getgenv()) or _G;
if N[x.g0a] and N[x.g0a].Destroy then
	pcall(N[x.g0a].Destroy);
end;
if N[x.g4c] and N[x.g4c].Destroy then
	pcall(N[x.g4c].Destroy);
end;
local c = game:GetService("Players");
local z = game:GetService("RunService");
local X = game:GetService("UserInputService");
local v = game:GetService("CollectionService");
local k = game:GetService("ReplicatedStorage");
local Z = game:GetService("Lighting");
local u = game:GetService("TweenService");
local w = game:GetService("HttpService");
local Y = game:GetService("TextChatService");
local P = game:GetService("TeleportService");
local G = game:GetService("LocalizationService");
local d = c.LocalPlayer;
local a = (debug and debug.getupvalues) or getupvalues;
local r = getconnections;
local function q(...)
	if g.Debug then
		print(B("20572bd117d77918bc"), ...);
	end;
end;
local function S(U)
	return type(U) == "number" and (U == U and (U ~= math.huge and U ~= -math.huge));
end;
local function V(U)
	U = tostring(U or "Common");
	return string.upper(string.sub(U, 1, 1)) .. string.lower(string.sub(U, 2));
end;
local function T(U, B)
	if B then
		return tostring(math.floor(U + .5));
	end;
	local x = string.format("%.2f", U);
	x = x:gsub("0+$", "");
	x = x:gsub("%.$", "");
	return x;
end;
local m, C, f = "FREE", "PREMIUM", "OWNER";
local R = "Fitur terkunci: khusus akun PREMIUM / OWNER.";
local K = { farm = true, smart = true, info = true };
local function s(U)
	local B, x = pcall(function()
			return game:HttpGet(U);
		end);
	if B and (type(x) == "string" and #x > 0) then
		return x;
	end;
	local E = request or http_request or (syn and syn.request);
	if E then
		local B, x = pcall(E, { Url = U, Method = "GET" });
		if B and (type(x) == "table" and (x.StatusCode == 200 and (type(x.Body) == "string" and #x.Body > 0))) then
			return x.Body;
		end;
	end;
	return nil;
end;
local function b(U)
	U = U:gsub("%-%-%[(=*)%[.-%]%1%]", "");
	U = U:gsub("%-%-[^\r\n]*", "");
	return U;
end;
local function p(U, B)
	local x = U:match("%f[%w_]" .. (B .. "%f[^%w_]%s*=%s*(%b{})"));
	if not x then
		return nil;
	end;
	local E, J = {}, 0;
	for U, B in x:gmatch("([\"\'])(.-)%1") do
		if #B >= 3 and (#B <= 20 and (B:match("^[%w_]+$") and J < 500)) then
			local U = string.lower(B);
			if not E[U] then
				E[U] = true;
				J = J + 1;
			end;
		end;
	end;
	return E;
end;
local function h(U)
	local B = g.WhitelistUrl .. ("?t=" .. tostring(os.time()));
	local x;
	for U = 1, 2, 1 do
		x = s(B);
		if x then
			break;
		end;
		if U < 2 then
			task.wait(1);
		end;
	end;
	if not x then
		return m, "Whitelist tidak bisa dimuat (jaringan atau URL). Coba jalankan ulang.";
	end;
	if #x > 65536 then
		return m, "File whitelist terlalu besar, diabaikan.";
	end;
	local E = b(x);
	local J = p(E, "owner");
	local o = p(E, "premium");
	if not J and not o then
		return m, "Format whitelist tidak dikenali.";
	end;
	local l = string.lower(U);
	if J and J[l] then
		return f, "Username ada di daftar owner.";
	end;
	if o and o[l] then
		return C, "Username ada di daftar premium.";
	end;
	return m, "Username tidak ada di whitelist.";
end;
local j, U6, B6 = pcall(h, d.Name);
if not j then
	U6, B6 = m, "Pemeriksaan whitelist gagal: " .. tostring(U6);
end;
local x6 = U6 ~= m;
local function E6(U)
	return U ~= nil and ((not x6) and K[U] ~= true);
end;
q("access:", d.Name, U6, B6);
local J6 = {
		"Common",
		"Uncommon",
		"Rare",
		"Epic",
		"Legendary",
		"Mythic",
		"Secret",
	};
local o6 = { "Smart", "Skip" };
local l6 = { Smart = "Bot memainkan minigame sendiri (menahan dan melepas klik seperti pemain asli). Paling mirip pemain, tapi butuh beberapa detik per ikan.", Skip = "Minigame tetap muncul, lalu setelah waktu \'Tahan sebelum selesai\' habis, zona dikunci ke ikan dan bar tangkapan langsung dipenuhi. Ikan tertangkap jauh lebih cepat dari Smart." };
local e6 = { "Aman", "Cepat", "Turbo" };
local n6 = { Aman = {
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
local Q6 = {
		Aman = "Waktu game tidak diubah. Skip menunggu 1,5 dtk. Paling kecil kemungkinan ditolak server.",
		Cepat = "Skip menunggu 0,6 dtk, gigitan dipercepat ke 1,5 dtk, jeda lempar 0,2 dtk. (Belum diuji di server ini.)",
		Turbo = "Skip langsung, gigitan 0,5 dtk, jeda lempar 0,1 dtk. Paling cepat tapi paling berisiko ditolak server. (Belum diuji.)",
		Kustom = "Kamu mengubah angka waktu secara manual di bagian bawah.",
	};
local A6 = {
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
		sellAt = g.MaxInventory,
		allowSellAll = false,
		sellGap = .08,
		sellChunk = 100,
	};
local L6 = { antiLoseStreak = false };
local H6 = A6.stuckTimeout;
local function O6()
	if x6 then
		return;
	end;
	local U = n6.Aman;
	A6.mode, A6.preset = "Smart", "Aman";
	A6.skipDelay, A6.biteFast, A6.biteWait, A6.castCooldown = U.skipDelay, U.biteFast, U.biteWait, U.castCooldown;
	A6.stuckTimeout = H6;
	A6.autoCast, A6.autoEquip = true, true;
	A6.favOn, A6.sellOn, A6.allowSellAll = false, false, false;
end;
O6();
local M6 = {
		caught = 0,
		fav = 0,
		sold = 0,
		inv = nil,
		byRarity = {},
		status = "Semua fitur mati",
	};
local y6 = {};
local g6 = true;
local i6, I6;
local F6 = {};
local D6 = { fishV = 0 };
local W6 = {};
local t6, N6 = nil, 0;
local c6, z6, X6 = true, false, false;
local v6, k6, Z6 = 0, 0, 0;
local u6 = {};
local w6 = {};
local Y6 = { connections = y6, badMethod = {}, skipFails = 0 };
local function P6(U, B, x)
	M6.lastNote = U;
	q(U);
	if Y6.toast then
		Y6.toast(U, x or "info", B);
	end;
end;
local function G6()
	if x6 then
		return false;
	end;
	P6(R, 4, "warn");
	return true;
end;
local d6 = k:WaitForChild(B("3d743dca0af14b09987b43f116"), 15);
if not d6 then
	warn(B("20572bd117d77918bc2865f10b7127c102eb493eb27c58e61a7a2b8205f65f32886650b416722ad70ffa0c348e7c17f2146820c643b20c2d936759f35b7a2fcf06b0413b9137"));
	return;
end;
local function a6(U, B)
	if not U then
		return nil;
	end;
	return U:WaitForChild(B, 5);
end;
local function r6(U)
	local B = d6:FindFirstChild(U, true) or k:FindFirstChild(U, true);
	if B and ((B:IsA("RemoteEvent") or B:IsA("RemoteFunction"))) then
		return B;
	end;
	return nil;
end;
local q6 = a6(d6, B("327338c70deb4328984d41f115693d"));
local S6 = {
		rA = a6(d6, B("3d743dca20fe593d897c79fb0f7428db")),
		GetData = a6(q6, B("327338c70deb4328985770f10f592fd602")),
		ToggleFav = a6(q6, B("327338c70deb4328985763fb1c7a22c725fe5a35936143f1")),
		rB = r6(B("287822ce25f65f32")),
		tReq = a6(d6, B("2f6f2fcc10f94928b36d46e11e6e3a")),
		tRes = a6(d6, B("2f6f2fcc10f94928b36d44e414733dc7")),
		tPrompt = a6(d6, B("2f6f2fcc10f94928b17a58f90b69")),
	};
local function V6(U, B)
	if not a or type(U) ~= "function" then
		return nil;
	end;
	local x, E = pcall(a, U);
	if not x or type(E) ~= "table" then
		return nil;
	end;
	for U, x in pairs(E) do
		if type(x) == "table" then
			local U = true;
			for B, E in ipairs(B) do
				if rawget(x, E) == nil then
					U = false;
					break;
				end;
			end;
			if U then
				return x;
			end;
		end;
	end;
	return nil;
end;
local T6 = {
		"zoneLogicX",
		"fishX",
		"progress",
		"zoneHalfSize",
		"isHolding",
	};
local function m6()
	if i6 and not I6 then
		I6 = V6(i6.SetHolding, T6);
	end;
end;
local function C6()
	local U, x = pcall(function()
			local U = d6:WaitForChild(B("3d743dca0af14b178e6c42f81e6e"), 10);
			return require(U:WaitForChild(B("367420cb04fe413fb27144e01e70"), 10));
		end);
	if U and (type(x) == "table" and (type(x.IsActive) == "function" and type(x.SetHolding) == "function")) then
		return x;
	end;
	warn(B("20572bd117d77918bc2854f5157321d643ed492b946145f15b7027cc0af84d3784285afb1f6822c759"), tostring(x));
	return nil;
end;
local function f6()
	if not ((r and a)) then
		return false;
	end;
	local U, B = pcall(r, X.InputBegan);
	if not U or type(B) ~= "table" then
		return false;
	end;
	for U, B in ipairs(B) do
		local x, E = pcall(function()
				return B.Function;
			end);
		if x and type(E) == "function" then
			local U, B = pcall(a, E);
			if U and type(B) == "table" then
				for U, B in pairs(B) do
					if type(B) == "function" then
						local U = V6(B, {
								"casted",
								"canCast",
								"fishingInProgress",
								"castingCooldown",
							});
						local x = V6(B, { "isEquipped", "IsValidRod", "CleanupFishing" });
						if U and x then
							F6.fishState, F6.rodState, F6.actionStart = U, x, B;
							local E = V6(B, {
									"IsActive",
									"SetHolding",
									"Start",
									"Stop",
								});
							if E then
								if E ~= i6 then
									I6 = nil;
								end;
								i6 = E;
							end;
							m6();
							q("game state found");
							return true;
						end;
					end;
				end;
			end;
		end;
	end;
	return false;
end;
local function R6()
	local U = d:FindFirstChild("PlayerGui");
	local x = U and U:FindFirstChild(B("3d743dca0af14b1d9461"));
	if not x then
		return nil;
	end;
	if not ((W6.zone and W6.zone:IsDescendantOf(x))) then
		W6.zone = x:FindFirstChild(B("367238cb0df86e3b93"), true);
	end;
	if not ((W6.fish and W6.fish:IsDescendantOf(x))) then
		W6.fish = x:FindFirstChild(B("3d7422ce00fe583989"), true);
	end;
	if W6.zone and W6.fish then
		return ((W6.fish.Position.X.Scale - t)) / W, ((W6.zone.Position.X.Scale - t)) / W;
	end;
	return nil;
end;
local function K6()
	local U = F6.fishState;
	if not U then
		return;
	end;
	if F6.tunedTable ~= U then
		F6.tunedTable = U;
		F6.origWait = type(U.waitTime) == "number" and U.waitTime or nil;
		F6.origCool = type(U.cooldownTime) == "number" and U.cooldownTime or nil;
	end;
	if F6.origCool ~= nil then
		local B = A6.farm and ((x6 and A6.castCooldown or n6.Aman.castCooldown)) or F6.origCool;
		if U.cooldownTime ~= B then
			U.cooldownTime = B;
		end;
	end;
	if F6.origWait ~= nil then
		local B = ((A6.farm and (x6 and A6.biteFast))) and A6.biteWait or F6.origWait;
		if U.waitTime ~= B then
			U.waitTime = B;
		end;
	end;
end;
local function s6()
	local U = F6.fishState;
	if U and F6.tunedTable == U then
		if F6.origCool ~= nil then
			pcall(function()
				U.cooldownTime = F6.origCool;
			end);
		end;
		if F6.origWait ~= nil then
			pcall(function()
				U.waitTime = F6.origWait;
			end);
		end;
	end;
end;
local function b6()
	D6.lastFish, D6.lastZone, D6.fishV, D6.start, D6.lastHold, D6.forced = nil, nil, 0, nil, nil, false;
end;
local function p6(U, B, x, E, J)
	local o = x and i or -i;
	for x = 1, E, 1 do
		B = ((B + o * J)) * I;
		U = U + B * J;
		if U <= 0 then
			U = 0;
			B = B * F;
		elseif U >= 1 then
			U = 1;
			B = B * F;
		end;
	end;
	return U;
end;
local function h6(U, B, x, E)
	local J = D6.lastFish and ((U - D6.lastFish)) / E or 0;
	D6.fishV = D6.fishV * .6 + J * .4;
	local o = math.max(1, A6.lookahead);
	local l = math.clamp(U + (D6.fishV * E) * o, 0, 1);
	local e = math.abs(l - p6(B, x, true, o, E));
	local n = math.abs(l - p6(B, x, false, o, E));
	return e < n;
end;
local function j6(U)
	if not A6.farm or not i6 then
		return;
	end;
	local B, x = pcall(i6.IsActive, i6);
	if not ((B and x)) then
		if D6.start then
			if D6.forced or (x6 and A6.biteFast) then
				Y6.pendingVerify = os.clock();
				Y6.pendingForced = D6.forced;
			end;
			b6();
		end;
		return;
	end;
	U = math.clamp(U, .0041666666666667, D);
	D6.start = D6.start or os.clock();
	m6();
	local E = I6;
	local J, o, l;
	if E then
		J, o, l = E.fishX, E.zoneLogicX, E.zoneVelocity;
	else
		J, o = R6();
		l = ((D6.lastZone and o)) and ((o - D6.lastZone)) / U or 0;
	end;
	if not ((S(J) and S(o))) then
		return;
	end;
	if not S(l) then
		l = 0;
	end;
	local e = os.clock() - D6.start;
	if x6 and (A6.mode == "Skip" and (E and e >= A6.skipDelay)) then
		E.zoneLogicX = J;
		if type(E.zoneVelocity) == "number" then
			E.zoneVelocity = 0;
		end;
		E.progress = 1;
		D6.forced = true;
		M6.status = "Skip: menyelesaikan minigame";
	else
		local B = h6(J, o, l, U);
		if B ~= D6.lastHold then
			pcall(i6.SetHolding, i6, B);
			D6.lastHold = B;
		end;
		if A6.mode == "Skip" and not E then
			M6.status = "Skip butuh akses state game, berjalan seperti Smart";
		else
			M6.status = (("Minigame [%s] ikan %.2f zona %.2f")):format(A6.mode, J, o);
		end;
	end;
	D6.lastFish, D6.lastZone = J, o;
end;
local function UD()
	if not S6.GetData then
		return nil;
	end;
	local U, B = pcall(function()
			return S6.GetData:InvokeServer();
		end);
	if U and (type(B) == "table" and type(B.Fish) == "table") then
		return B.Fish;
	end;
	return nil;
end;
local function BD()
	local U = UD();
	if U then
		M6.inv = #U;
		v6 = os.clock();
	end;
	return U;
end;
local function xD(U)
	if not x6 then
		return 0;
	end;
	if not S6.ToggleFav then
		return 0;
	end;
	U = U or UD();
	if not U then
		return 0;
	end;
	local B = 0;
	for U, x in ipairs(U) do
		local E = x.uniqueId;
		if E and (x.isFavorited ~= true and (A6.fav[V(x.rarity)] and not u6[E])) then
			local U, J = pcall(function()
					return S6.ToggleFav:InvokeServer(E);
				end);
			if U then
				if J == false then
					pcall(function()
						return S6.ToggleFav:InvokeServer(E);
					end);
				end;
				u6[E] = true;
				x.isFavorited = true;
				B = B + 1;
			end;
			task.wait(.05);
			if B >= 150 or not g6 then
				break;
			end;
		end;
	end;
	if B > 0 then
		M6.fav = M6.fav + B;
	end;
	return B;
end;
local function ED(U)
	local B = { n = U.n };
	for x = 1, U.n, 1 do
		B[x] = U[x];
	end;
	return B;
end;
local function JD(U, B)
	if U:IsA("RemoteFunction") then
		return pcall(U.InvokeServer, U, table.unpack(B, 1, B.n));
	end;
	return pcall(U.FireServer, U, table.unpack(B, 1, B.n));
end;
local function oD(U)
	local B, x = {}, U;
	while x and x ~= game do
		table.insert(B, 1, x.Name);
		x = x.Parent;
	end;
	return B;
end;
local function lD(U)
	local B = game;
	for U, x in ipairs(U) do
		B = B and B:FindFirstChild(x);
		if not B then
			return nil;
		end;
	end;
	return B;
end;
local function eD(U)
	local x = {};
	for E = 1, U.args.n, 1 do
		local J = U.args[E];
		if U.idx == E then
			x[E] = { t = B("087121d6") };
		elseif J == nil then
			x[E] = { t = "nil" };
		elseif type(J) == "string" or type(J) == "number" or type(J) == "boolean" then
			x[E] = { t = type(J), v = J };
		else
			return nil;
		end;
	end;
	return {
		path = oD(U.remote),
		kind = U.kind,
		idx = U.idx,
		n = U.args.n,
		args = x,
	};
end;
local function nD(U)
	if not writefile then
		return;
	end;
	local B = eD(U);
	if not B then
		q("learned template has non-primitive arguments, not saved to file");
		return;
	end;
	pcall(function()
		writefile(g.SellFile, w:JSONEncode(B));
	end);
end;
local function QD()
	if not x6 or N[x.g1h] or not ((isfile and readfile)) then
		return;
	end;
	local U, E = pcall(function()
			if not isfile(g.SellFile) then
				return nil;
			end;
			local U = w:JSONDecode(readfile(g.SellFile));
			if type(U) ~= "table" or type(U.path) ~= "table" or type(U.args) ~= "table" then
				return nil;
			end;
			local x = lD(U.path);
			if not ((x and ((x:IsA("RemoteEvent") or x:IsA("RemoteFunction"))))) then
				return nil;
			end;
			local E = U.kind;
			if E ~= B("087420c50ffa") and (E ~= B("166822d60a") and E ~= B("0d783cc002eb4537")) then
				return nil;
			end;
			local J = { n = math.clamp(math.floor(tonumber(U.n) or #U.args), 0, 16) };
			for x = 1, J.n, 1 do
				local E = U.args[x];
				if type(E) == "table" then
					if E.t == B("087121d6") then
						J[x] = "";
					elseif E.t ~= "nil" then
						J[x] = E.v;
					end;
				end;
			end;
			local o = tonumber(U.idx);
			if E ~= B("0d783cc002eb4537") and not ((o and (o >= 1 and o <= J.n))) then
				return nil;
			end;
			return {
				remote = x,
				args = J,
				kind = E,
				idx = o,
			};
		end);
	if U and E then
		N[x.g1h] = E;
		q("learned sell remote restored from file:", E.remote.Name, E.kind);
	end;
end;
local function AD()
	local U = N[x.g1h];
	if U and (typeof(U.remote) == "Instance" and U.remote.Parent) then
		return U;
	end;
	return nil;
end;
local function LD(U)
	local x = AD();
	if not x then
		return "Cara jual belum dipelajari: tab Jual > Pelajari cara jual", "none";
	end;
	if x.kind == B("0d783cc002eb4537") and (not A6.allowSellAll and not U) then
		return "Hasil pelajaran = jual-semua. Aktifkan \'Izinkan jual-semua\' bila setuju.", "allow";
	end;
	return nil;
end;
local function HD(U)
	if not x6 then
		return false;
	end;
	local x = LD(U);
	if x then
		P6(x, 7, "warn");
		return false;
	end;
	local E = AD();
	X6 = true;
	local J, o = pcall(function()
			local U = UD();
			if not U then
				P6("Gagal membaca inventory", 5, "err");
				return;
			end;
			if A6.favOn then
				xD(U);
				U = UD() or U;
			end;
			local x, J = {}, {};
			for U, B in ipairs(U) do
				local E = B.uniqueId;
				if E then
					local U = B.isFavorited == true or (A6.favOn and A6.fav[V(B.rarity)] == true);
					if U then
						x[E] = true;
					else
						table.insert(J, E);
					end;
				end;
			end;
			if #J == 0 and E.kind ~= B("0d783cc002eb4537") then
				P6("Tidak ada ikan yang bisa dijual (semua favorit)", 5, "info");
				return;
			end;
			local o = #U;
			if E.kind == B("087420c50ffa") then
				for U, B in ipairs(J) do
					local x = ED(E.args);
					x[E.idx] = B;
					JD(E.remote, x);
					task.wait(A6.sellGap);
					if not g6 then
						return;
					end;
				end;
			elseif E.kind == B("166822d60a") then
				for U = 1, #J, A6.sellChunk do
					local B = {};
					for U = U, math.min((U + A6.sellChunk) - 1, #J), 1 do
						B[#B + 1] = J[U];
					end;
					local x = ED(E.args);
					x[E.idx] = B;
					JD(E.remote, x);
					task.wait(.15);
					if not g6 then
						return;
					end;
				end;
			else
				JD(E.remote, ED(E.args));
			end;
			task.wait(1);
			local l = UD();
			if not l then
				return;
			end;
			local e = {};
			for U, B in ipairs(l) do
				e[B.uniqueId] = true;
			end;
			local n = 0;
			for U in pairs(x) do
				if not e[U] then
					n = n + 1;
				end;
			end;
			local Q = o - #l;
			M6.inv = #l;
			if n > 0 then
				A6.sellOn = false;
				P6((("BAHAYA: %d ikan favorit ikut terjual. Auto Jual dimatikan.")):format(n), 12, "err");
			elseif Q <= 0 then
				Z6 = Z6 + 1;
				P6((("Jual tidak berpengaruh (inventory %d -> %d, remote %s [%s], %d argumen)")):format(o, #l, E.remote.Name, E.kind, E.args.n), 9, "warn");
				if Z6 >= 3 then
					A6.sellOn = false;
					P6("Jual gagal 3x, Auto Jual dimatikan.", 10, "err");
				end;
			else
				Z6 = 0;
				M6.sold = M6.sold + Q;
				P6((("Terjual %d ikan")):format(Q), 5, "ok");
			end;
		end);
	if not J then
		warn(B("20572bd117d77918bc2844f117716ec711ed4328db"), o);
	end;
	k6 = os.clock() + 20;
	X6 = false;
	return true;
end;
local OD = {
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
local function MD()
	local U, x = pcall(function()
			return require(d6:WaitForChild(B("3d743dca0af14b198e6651fd1c"), 5));
		end);
	if U and type(x) == "table" then
		local U = x[B("2f6f2fcc10f94928b26d43e0127329d1")];
		if type(U) == "table" and type(U.MaxDistance) == "number" then
			return U.MaxDistance;
		end;
	end;
	return 20;
end;
local function yD(U, B)
	if not U then
		return nil;
	end;
	for U, x in ipairs(U:GetChildren()) do
		if x:IsA("Tool") then
			local U, E = pcall(function()
					return x:GetAttribute("FishId");
				end);
			if U and E == B then
				return x;
			end;
		end;
	end;
	return nil;
end;
local function gD()
	local U = UD();
	if not U then
		return {}, "Gagal membaca inventory";
	end;
	local B = {};
	for U, x in ipairs(U) do
		local E = V(x.rarity);
		if ((not OD.rarity or E == OD.rarity)) and (((not OD.fishName or x.name == OD.fishName)) and x.uniqueId) then
			table.insert(B, x);
		end;
	end;
	return B, nil;
end;
local function iD(U)
	local B = UD();
	if not B then
		return {};
	end;
	local x, E = {}, {};
	for B, J in ipairs(B) do
		if V(J.rarity) == U and J.name then
			if not x[J.name] then
				x[J.name] = 0;
				table.insert(E, J.name);
			end;
			x[J.name] = x[J.name] + 1;
		end;
	end;
	return E, x;
end;
local function ID()
	local U = UD();
	local B = {};
	if not U then
		return B;
	end;
	for U, x in ipairs(U) do
		local E = V(x.rarity);
		B[E] = ((B[E] or 0)) + 1;
	end;
	return B;
end;
local function FD(U, x)
	if not OD.autoApproach then
		return true;
	end;
	local E = d.Character and d.Character:FindFirstChild(B("336823c30df0453eb36758e02b7c3cd6"));
	local J = U.Character;
	local o = J and J:FindFirstChild(B("336823c30df0453eb36758e02b7c3cd6"));
	if not ((E and o)) then
		return true;
	end;
	local l = ((E.Position - o.Position)).Magnitude;
	if l <= math.max(2, x - 4) then
		return true;
	end;
	local e = (E.Position - o.Position);
	e = e.Magnitude > 0 and e.Unit or Vector3.new(1, 0, 0);
	local n = o.Position + e * math.max(3, x - 6);
	pcall(function()
		E.CFrame = CFrame.new(n, o.Position);
	end);
	task.wait(.25);
	return true;
end;
local function DD(U, B, x)
	local E = U.uniqueId;
	if U.isFavorited == true then
		local U = pcall(function()
				return S6.ToggleFav:InvokeServer(E);
			end);
		if not U then
			return false, "Gagal unfavorite";
		end;
		task.wait(.1);
	end;
	local J = d.Character;
	local o = J and J:FindFirstChildOfClass("Humanoid");
	if not ((o and o.Health > 0)) then
		return false, "Karakter tidak siap";
	end;
	local l = yD(J, E) or yD(d:FindFirstChildOfClass("Backpack"), E);
	if not l then
		return false, "Tool ikan tidak ada di Backpack/Character untuk id ini (lihat catatan di status)";
	end;
	if l.Parent ~= J then
		pcall(o.EquipTool, o, l);
		task.wait(.15);
	end;
	FD(B, x);
	if not ((S6.tReq and S6.tRes)) then
		return false, "Remote transfer tidak ditemukan";
	end;
	local e = pcall(function()
			S6.tReq:FireServer(B, E);
		end);
	if not e then
		return false, "Gagal memanggil remote transfer";
	end;
	local n = os.clock() + 11;
	while os.clock() < n do
		task.wait(.3);
		if not g6 then
			return false, "Dihentikan";
		end;
		local U = J:FindFirstChild(l.Name) == l or (l.Parent == J);
		if l.Parent == nil or (not U and l.Parent ~= d:FindFirstChildOfClass("Backpack")) then
			return true, "Diterima";
		end;
	end;
	return false, "Tidak direspon (10 detik) - kemungkinan ditolak/diabaikan";
end;
function OD.start()
	if OD.running then
		return false, "Sudah berjalan";
	end;
	if not OD.targetUserId then
		return false, "Belum pilih target";
	end;
	local U = c:GetPlayerByUserId(OD.targetUserId);
	if not U then
		return false, "Target sudah tidak ada di server";
	end;
	local B, x = gD();
	if x then
		return false, x;
	end;
	if #B == 0 then
		return false, "Tidak ada ikan yang cocok filter";
	end;
	OD.running = true;
	task.spawn(function()
		local x = MD();
		local E = math.min(OD.amount, #B);
		local J, o = 0, 0;
		for l = 1, E, 1 do
			if not OD.running then
				break;
			end;
			local e = B[l];
			OD.log = (("Mengirim %d/%d: %s...")):format(l, E, tostring(e.name));
			local n, Q = DD(e, U, x);
			if n then
				J = J + 1;
			else
				o = o + 1;
			end;
			OD.log = (("[%d/%d] %s -> %s")):format(l, E, tostring(e.name), n and "OK" or ("GAGAL: " .. tostring(Q)));
			task.wait(.4);
		end;
		OD.log = (("Selesai. Berhasil %d, gagal %d.")):format(J, o);
		OD.running = false;
	end);
	return true;
end;
function OD.stop()
	OD.running = false;
end;
if S6.tPrompt then
	table.insert(y6, S6.tPrompt.OnClientEvent:Connect(function(U, x, E, J)
		if OD.autoAccept and S6.tRes then
			pcall(function()
				S6.tRes:FireServer(J, true);
			end);
			pcall(function()
				local U = d:FindFirstChild(B("2b712fdb06ed6b2f88")) and d[B("2b712fdb06ed6b2f88")]:FindFirstChild(B("2f6f2fcc10f94928a67d5e"));
				if U then
					U.Enabled = false;
				end;
			end);
		end;
	end));
end;
local function WD(U)
	if z6 then
		P6("Sedang memproses inventory, coba lagi sebentar", 3, "info");
		return;
	end;
	z6 = true;
	task.spawn(function()
		local x, E = pcall(U);
		if not x then
			warn(B("20572bd117d77918bc"), E);
		end;
		z6 = false;
	end);
end;
local tD = {
		active = false,
		ids = {},
		seen = {},
		token = 0,
	};
local ND = {
		[B("3d743dca24f65a3f93")] = true,
		[B("387c3dd631fa5c36886b56e0127220")] = true,
		[B("38712bc30dea5c19807b43")] = true,
		[B("35723acb05e66e33956d")] = true,
		[B("367420cb04fe413fb36d44e117690bd406f158")] = true,
		[B("2e6d2ac317fa7f2e936d56ff3e6b2bcc17")] = true,
		[B("2b682cce0aec441c887b5fd71a692dca")] = true,
		[B("287521d52df05833876154f50f7421cc")] = true,
		[B("28782dd006eb6833926b58e21e6f37")] = true,
		[B("3d743dca20fe593d897c79fb0f7428db")] = true,
	};
local function cD(U)
	U = string.lower(U);
	return string.find(U, "sell", 1, true) ~= nil or string.find(U, "jual", 1, true) ~= nil;
end;
local function zD(U)
	local x = U.Name;
	if cD(x) then
		return false;
	end;
	return ND[x] or string.sub(x, 1, 10) == B("327338c70deb43289857");
end;
local function XD(U, E)
	tD.active = false;
	local J = { remote = U, args = E, kind = B("0d783cc002eb4537") };
	for U = 1, E.n, 1 do
		local x = E[U];
		if type(x) == "string" and tD.ids[x] then
			J.kind = B("087420c50ffa");
			J.idx = U;
			break;
		elseif type(x) == "table" then
			local E, o = 0, true;
			for U, B in pairs(x) do
				E = E + 1;
				if not ((type(B) == "string" and tD.ids[B])) then
					o = false;
					break;
				end;
			end;
			if E > 0 and o then
				J.kind = B("166822d60a");
				J.idx = U;
				break;
			end;
		end;
	end;
	N[x.g1h] = J;
	Y6.badMethod = {};
	Z6 = 0;
	nD(J);
	P6((("Remote jual dipelajari: %s [%s]")):format(U.Name, J.kind), 10, "ok");
end;
local function vD(U, B, x)
	if not tD.active then
		return;
	end;
	if typeof(U) ~= "Instance" then
		return;
	end;
	if not ((U:IsA("RemoteEvent") or U:IsA("RemoteFunction"))) then
		return;
	end;
	if zD(U) then
		return;
	end;
	tD.seen[U] = x;
	if cD(U.Name) then
		XD(U, x);
	end;
end;
local function kD()
	N[x.g2o] = N[x.g2o] or {};
	local U = N[x.g2o];
	U.handler = vD;
	if N[x.g3v] then
		return true;
	end;
	if not ((hookmetamethod and getnamecallmethod)) then
		return false;
	end;
	local B;
	local E = function(x, ...)
			local E = getnamecallmethod();
			local J = string.lower(tostring(E));
			if J == "fireserver" or J == "invokeserver" then
				local B = U.handler;
				if B and not ((checkcaller and checkcaller())) then
					task.defer(B, x, E, table.pack(...));
				end;
			end;
			return B(x, ...);
		end;
	if newcclosure then
		E = newcclosure(E);
	end;
	B = hookmetamethod(game, "__namecall", E);
	N[x.g3v] = true;
	return true;
end;
function Y6.startLearn()
	if G6() then
		return;
	end;
	if not kD() then
		P6("Executor tidak punya hookmetamethod, tidak bisa belajar remote jual", 8, "err");
		return;
	end;
	local U = UD();
	tD.ids = {};
	if U then
		for U, B in ipairs(U) do
			if B.uniqueId then
				tD.ids[B.uniqueId] = true;
			end;
		end;
	end;
	tD.seen = {};
	tD.active = true;
	tD.token = tD.token + 1;
	local B = tD.token;
	P6("MODE BELAJAR: jual 1 ikan lewat NPC sekarang (60 dtk)", 60, "info");
	task.delay(60, function()
		if tD.active and tD.token == B then
			tD.active = false;
			local U, B, x = 0, nil, nil;
			local E = {};
			for J, o in pairs(tD.seen) do
				U = U + 1;
				B, x = J, o;
				table.insert(E, J:GetFullName());
			end;
			if U == 1 then
				XD(B, x);
			else
				q("learn timeout, remotes seen:", table.concat(E, ", "));
				P6(U == 0 and "Tidak ada remote terdeteksi" or "Remote ambigu, lihat console", 8, "warn");
			end;
		end;
	end);
end;
function Y6.forget()
	if G6() then
		return;
	end;
	N[x.g1h] = nil;
	Y6.badMethod = {};
	if delfile and isfile then
		pcall(function()
			if isfile(g.SellFile) then
				delfile(g.SellFile);
			end;
		end);
	end;
	P6("Remote jual hasil belajar dilupakan", 4, "info");
end;
task.spawn(function()
	for U, B in ipairs({ k, workspace }) do
		for U, B in ipairs(B:GetDescendants()) do
			if B:IsA("RemoteEvent") or B:IsA("RemoteFunction") then
				local U = string.lower(B.Name);
				if string.find(U, "sell", 1, true) or string.find(U, "jual", 1, true) or string.find(U, "shop", 1, true) or string.find(U, "merchant", 1, true) then
					table.insert(w6, B:GetFullName());
				end;
			end;
		end;
	end;
	if #w6 > 0 then
		q("sell remote candidates:", table.concat(w6, ", "));
	end;
end);
QD();
local function ZD(U)
	if not U then
		return nil;
	end;
	for U, x in ipairs(U:GetChildren()) do
		if x:IsA("Tool") and v:HasTag(x, B("29722a")) then
			return x;
		end;
	end;
	return nil;
end;
local function uD()
	local U = d.Character;
	local B = U and U:FindFirstChildOfClass("Humanoid");
	if not ((B and B.Health > 0)) then
		return nil;
	end;
	local x = ZD(U);
	if x then
		return x;
	end;
	if A6.autoEquip then
		local U = ZD(d:FindFirstChildOfClass("Backpack"));
		if U then
			pcall(B.EquipTool, B, U);
		end;
	end;
	return nil;
end;
local function wD()
	if os.clock() - N6 < 1.5 then
		return;
	end;
	N6 = os.clock();
	pcall(function()
		local U = game:GetService("VirtualInputManager");
		local B = workspace.CurrentCamera;
		local x = B and B.ViewportSize or Vector2.new(800, 600);
		U:SendMouseButtonEvent(x.X * .5, x.Y * .5, 0, true, game, 0);
		task.wait(.05);
		U:SendMouseButtonEvent(x.X * .5, x.Y * .5, 0, false, game, 0);
	end);
end;
local function YD()
	if not A6.farm or X6 then
		return false;
	end;
	if M6.inv and M6.inv >= g.MaxInventory then
		if not ((A6.sellOn and AD())) then
			M6.status = ((x6 and "Inventory penuh (%d). Jual dulu / aktifkan Auto Jual." or "Inventory penuh (%d). Jual manual di NPC (Auto Jual khusus PREMIUM).")):format(M6.inv);
			return false;
		end;
	end;
	return true;
end;
local function PD()
	if not YD() then
		return;
	end;
	if not F6.fishState then
		pcall(f6);
	end;
	pcall(K6);
	local U = uD();
	if not U then
		M6.status = "Rod belum di-equip";
		return;
	end;
	if i6 and i6:IsActive() then
		t6 = nil;
		return;
	end;
	local B, x = F6.fishState, F6.rodState;
	if B and x then
		if not x.isEquipped then
			M6.status = "Menunggu rod siap";
			return;
		end;
		if B.casted or B.fishingInProgress then
			t6 = t6 or os.clock();
			M6.status = "Menunggu ikan menggigit";
			if os.clock() - t6 > A6.stuckTimeout then
				pcall(x.CleanupFishing, x);
				t6 = nil;
			end;
			return;
		end;
		t6 = nil;
		if A6.autoCast and (B.canCast and (not B.castingCooldown and (x:IsValidRod() and F6.actionStart))) then
			M6.status = "Melempar pancing";
			task.spawn(F6.actionStart);
		end;
	elseif A6.autoCast then
		if g.AllowClickFallback then
			M6.status = "State game tidak ditemukan, pakai klik";
			wD();
		else
			M6.status = "State game tidak ditemukan (butuh getconnections + getupvalues)";
		end;
	end;
end;
function Y6.syncPreset()
	for U, B in ipairs(e6) do
		local x = n6[B];
		if A6.skipDelay == x.skipDelay and (A6.biteFast == x.biteFast and (A6.biteWait == x.biteWait and A6.castCooldown == x.castCooldown)) then
			A6.preset = B;
			return;
		end;
	end;
	A6.preset = "Kustom";
end;
function Y6.setPreset(U)
	local B = n6[U];
	if not B then
		return;
	end;
	if not x6 and U ~= "Aman" then
		G6();
		return;
	end;
	A6.skipDelay, A6.biteFast, A6.biteWait, A6.castCooldown = B.skipDelay, B.biteFast, B.biteWait, B.castCooldown;
	A6.preset = U;
	Y6.skipFails = 0;
end;
function Y6.setFarm(U)
	O6();
	A6.farm = U and true or false;
	if A6.farm then
		c6 = true;
		Y6.skipFails = 0;
		Y6.pendingVerify = nil;
		M6.status = "Farm aktif";
		P6("Farm mancing aktif", 3, "ok");
	else
		if i6 then
			pcall(i6.SetHolding, i6, false);
		end;
		b6();
		t6 = nil;
		Y6.pendingVerify = nil;
		pcall(s6);
		M6.status = "Farm dimatikan";
		P6("Farm mancing dimatikan", 3, "info");
	end;
end;
local function GD()
	Z6 = 0;
	k6 = 0;
	c6 = true;
	A6.sellOn = true;
	local U = M6.inv;
	P6((("Auto jual aktif: jual saat inventory >= %d (sekarang %s)")):format(A6.sellAt, U and tostring(U) or "?"), 6, "ok");
end;
function Y6.setSell(U)
	if not U then
		A6.sellOn = false;
		return;
	end;
	if G6() then
		return;
	end;
	local B, x = LD(false);
	if x == "none" then
		P6(B, 9, "warn");
		return;
	end;
	if x == "allow" and Y6.ask then
		Y6.ask("Izinkan jual-semua?", "Remote jual hasil Pelajari menjual SEMUA ikan sekaligus. Sebelum menjual, ikan rarity pilihanmu difavoritkan (jika Auto Favorit aktif) dan dicek ulang; jika favorit hilang, Auto Jual mati otomatis. Izinkan dan nyalakan Auto Jual?", "Izinkan", function()
			A6.allowSellAll = true;
			GD();
			Y6.refreshUI();
		end);
		return;
	end;
	GD();
end;
function Y6.favNow()
	if G6() then
		return;
	end;
	WD(function()
		local U = xD(BD());
		P6((("%d ikan difavoritkan")):format(U), 4, U > 0 and "ok" or "info");
	end);
end;
function Y6.sellNow()
	if G6() then
		return;
	end;
	local U, B = LD(false);
	if not U then
		WD(function()
			HD(false);
		end);
	elseif B == "allow" and Y6.ask then
		Y6.ask("Jual semua ikan?", "Remote jual ini menjual SEMUA ikan non-favorit sekaligus. Lanjutkan sekali ini?", "Ya, jual", function()
			WD(function()
				HD(true);
			end);
		end);
	else
		P6(U, 8, "warn");
	end;
end;
function Y6.methodReport()
	local U = AD();
	return { learned = U and (U.remote.Name .. (" [" .. (U.kind .. "]"))) or nil, learnedKind = U and U.kind or nil, sellFishPresent = S6.rB ~= nil };
end;
function Y6.capsLine()
	return (("minigame: %s\nstate game (Skip/Tuning): %s\nlempar otomatis: %s\nhook belajar jual: %s\nfile (logo/jual): %s\ntuning waktu: %s")):format(i6 and "OK" or "X", I6 and "OK" or "X (pakai GUI)", F6.fishState and "OK" or "belum ditemukan", ((hookmetamethod and getnamecallmethod)) and "OK" or "X", ((writefile and (readfile and isfile))) and "OK" or "X", ((F6.fishState and F6.origWait ~= nil)) and "OK" or "belum terbaca");
end;
local dD = false;
local aD = nil;
local function rD(U)
	local x = pcall(function()
			if Y.ChatVersion ~= Enum.ChatVersion.TextChatService then
				error("legacy chat");
			end;
			local x = Y:FindFirstChild("TextChannels") or Y:WaitForChild("TextChannels", 3);
			if not x then
				error("no TextChannels");
			end;
			local E = x:FindFirstChild(B("295f16e506f149288064")) or x:WaitForChild(B("295f16e506f149288064"), 3);
			if not E then
				for U, B in ipairs(x:GetChildren()) do
					if B:IsA("TextChannel") and (B.Name ~= "RBXSystem" and B.Name ~= "RBXTeam") then
						E = B;
						break;
					end;
				end;
			end;
			if not E then
				error("no channel");
			end;
			E:SendAsync(U);
		end);
	if x then
		return "TextChatService";
	end;
	local E = pcall(function()
			local x = k:FindFirstChild(B("3f7828c316f35819896943c7026e3ac70edc443b954d41f115693d"));
			local E = x and x:FindFirstChild(B("287c37ef06ec5f3b866d65f10a682bd117"));
			if not E then
				error("x");
			end;
			E:FireServer(U, B("3a7122"));
		end);
	if E then
		return "legacy";
	end;
	return nil;
end;
local function qD()
	aD = rD(B("5a6f2bc80cf642"));
	if aD then
		P6("Anti-Lose Streak: !rejoin terkirim 1x (" .. (aD .. "), auto farm dihentikan."), 8, "warn");
	else
		P6("Anti-Lose Streak: !rejoin GAGAL terkirim (chat tidak ditemukan). Auto farm dihentikan.", 10, "warn");
	end;
	task.delay(3, function()
		pcall(function()
			if d and d.Parent then
				P:TeleportToPlaceInstance(game.PlaceId, game.JobId, d);
			end;
		end);
	end);
end;
local function SD()
	if dD then
		return;
	end;
	dD = true;
	A6.farm = false;
	qD();
end;
local VD = {
		on = false,
		saved = nil,
		conns = {},
		effectCount = 0,
		meshCount = 0,
	};
local TD = {
		"ParticleEmitter",
		"Trail",
		"Beam",
		"Smoke",
		"Fire",
		"Sparkles",
		"Highlight",
	};
local mD = {
		"BloomEffect",
		"SunRaysEffect",
		"ColorCorrectionEffect",
		"DepthOfFieldEffect",
		"BlurEffect",
	};
local CD = { Atmosphere = { Density = 0, Haze = 0, Glare = 0 }, Clouds = { Enabled = false, Cover = 0, Density = 0 } };
local function fD(U)
	for B, x in ipairs(TD) do
		if U:IsA(x) then
			return true;
		end;
	end;
	return false;
end;
local function RD(U)
	local B = 0;
	for x, E in ipairs(workspace:GetDescendants()) do
		if fD(E) then
			local x, J = pcall(function()
					return E.Enabled;
				end);
			if x and J ~= U then
				pcall(function()
					E.Enabled = U;
				end);
				B = B + 1;
			end;
		end;
	end;
	return B;
end;
local function KD(U, B)
	local x = 0;
	for E, J in ipairs(workspace:GetDescendants()) do
		if J:IsA("MeshPart") then
			if U then
				local U, E = pcall(function()
						return J.RenderFidelity;
					end);
				if U and E ~= Enum.RenderFidelity.Performance then
					B[J] = E;
					pcall(function()
						J.RenderFidelity = Enum.RenderFidelity.Performance;
					end);
					x = x + 1;
				end;
			else
				local U = B[J];
				if U ~= nil then
					pcall(function()
						J.RenderFidelity = U;
					end);
				end;
			end;
		end;
	end;
	return x;
end;
function VD.enable()
	if not x6 then
		return false, "Khusus PREMIUM/OWNER";
	end;
	if VD.on then
		return true;
	end;
	local U, B = pcall(function()
			local U = UserSettings and (UserSettings()):GetService("UserGameSettings");
			return {
				quality = U and U.SavedQualityLevel,
				shadows = Z.GlobalShadows,
				tech = Z.Technology,
				diffuse = Z.EnvironmentDiffuseScale,
				specular = Z.EnvironmentSpecularScale,
				shadowSoft = Z.ShadowSoftness,
				waterWave = workspace.Terrain and workspace.Terrain.WaterWaveSize,
				waterSpeed = workspace.Terrain and workspace.Terrain.WaterWaveSpeed,
				waterReflect = workspace.Terrain and workspace.Terrain.WaterReflectance,
				postFx = {},
				fxInst = {},
				meshFidelity = {},
			};
		end);
	if not U then
		return false, "Gagal membaca pengaturan grafis";
	end;
	VD.saved = B;
	VD.on = true;
	pcall(function()
		local U = (UserSettings()):GetService("UserGameSettings");
		U.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1;
	end);
	pcall(function()
		Z.GlobalShadows = false;
	end);
	pcall(function()
		Z.Technology = Enum.Technology.Compatibility;
	end);
	pcall(function()
		Z.EnvironmentDiffuseScale = 0;
	end);
	pcall(function()
		Z.EnvironmentSpecularScale = 0;
	end);
	pcall(function()
		Z.ShadowSoftness = 0;
	end);
	for U, x in ipairs(mD) do
		for U, E in ipairs(Z:GetChildren()) do
			if E.ClassName == x then
				local U, x = pcall(function()
						return E.Enabled;
					end);
				if U then
					B.postFx[E] = x;
					pcall(function()
						E.Enabled = false;
					end);
				end;
			end;
		end;
	end;
	for U, x in ipairs(Z:GetChildren()) do
		local E = CD[x.ClassName];
		if E then
			local U = {};
			for B in pairs(E) do
				local E, J = pcall(function()
						return x[B];
					end);
				if E then
					U[B] = J;
				end;
			end;
			B.fxInst[x] = U;
			for U, B in pairs(E) do
				pcall(function()
					x[U] = B;
				end);
			end;
		end;
	end;
	pcall(function()
		local U = workspace.Terrain;
		if U then
			U:SetAttribute("_boostHadDeco", true);
			U:SetDecorationsVisible(false);
			U.WaterWaveSize = 0;
			U.WaterWaveSpeed = 0;
			U.WaterReflectance = 0;
		end;
	end);
	VD.effectCount = RD(false);
	VD.meshCount = KD(true, B.meshFidelity);
	table.insert(VD.conns, workspace.DescendantAdded:Connect(function(U)
		if fD(U) then
			task.defer(function()
				if VD.on then
					pcall(function()
						U.Enabled = false;
					end);
				end;
			end);
		elseif U:IsA("MeshPart") then
			task.defer(function()
				if VD.on and VD.saved then
					local B, x = pcall(function()
							return U.RenderFidelity;
						end);
					if B and x ~= Enum.RenderFidelity.Performance then
						VD.saved.meshFidelity[U] = x;
						pcall(function()
							U.RenderFidelity = Enum.RenderFidelity.Performance;
						end);
					end;
				end;
			end);
		end;
	end));
	return true;
end;
function VD.disable()
	if not VD.on then
		return;
	end;
	VD.on = false;
	for U, B in ipairs(VD.conns) do
		pcall(function()
			B:Disconnect();
		end);
	end;
	VD.conns = {};
	local U = VD.saved;
	if U then
		pcall(function()
			local B = (UserSettings()):GetService("UserGameSettings");
			if U.quality ~= nil then
				B.SavedQualityLevel = U.quality;
			end;
		end);
		pcall(function()
			Z.GlobalShadows = U.shadows;
		end);
		pcall(function()
			Z.Technology = U.tech;
		end);
		pcall(function()
			Z.EnvironmentDiffuseScale = U.diffuse;
		end);
		pcall(function()
			Z.EnvironmentSpecularScale = U.specular;
		end);
		pcall(function()
			Z.ShadowSoftness = U.shadowSoft;
		end);
		for U, B in pairs(U.postFx or {}) do
			pcall(function()
				U.Enabled = B;
			end);
		end;
		for U, B in pairs(U.fxInst or {}) do
			for B, x in pairs(B) do
				pcall(function()
					U[B] = x;
				end);
			end;
		end;
		KD(false, U.meshFidelity or {});
		pcall(function()
			local B = workspace.Terrain;
			if B then
				B:SetDecorationsVisible(true);
				if U.waterWave ~= nil then
					B.WaterWaveSize = U.waterWave;
				end;
				if U.waterSpeed ~= nil then
					B.WaterWaveSpeed = U.waterSpeed;
				end;
				if U.waterReflect ~= nil then
					B.WaterReflectance = U.waterReflect;
				end;
			end;
		end);
	end;
	RD(true);
end;
local sD, bD = pcall(function()
		return require((d6:WaitForChild(B("3d743dca0af14b178e6c42f81e6e"), 10)):WaitForChild(B("3c4807ef02f14d3d847a"), 10));
	end);
if sD and (type(bD) == "table" and type(bD[B("287521d52df05833876154f50f7421cc")]) == "function") then
	local U = bD[B("287521d52df05833876154f50f7421cc")];
	bD[B("287521d52df05833876154f50f7421cc")] = function(x, E, ...)
			local J, o = pcall(U, x, E, ...);
			if not J then
				warn(B("20572bd117d77918bc"), o);
			end;
			if x6 and (L6.antiLoseStreak and type(E) == "string") then
				local U = string.lower(E);
				if string.find(U, B("1c723a8202e84d23"), 1, true) or string.find(U, B("1e6e2dc313fa48"), 1, true) then
					task.spawn(SD);
				end;
			end;
		end;
else
	warn(B("20572bd117d77918bc2870c132502fcc02f84928c16658e05b7b21d70dfb0c77c14959e0123002cd10fa0c09957a52f5103d2acb10fe4e36846c17e013743d8210fa5f29886759"));
end;
if S6.rA then
	table.insert(y6, S6.rA.OnClientEvent:Connect(function(U)
		M6.caught = M6.caught + 1;
		if M6.inv then
			M6.inv = M6.inv + 1;
		end;
		Y6.pendingVerify = nil;
		Y6.skipFails = 0;
		if type(U) == "table" then
			local B = V(U.rarity);
			M6.byRarity[B] = ((M6.byRarity[B] or 0)) + 1;
		end;
		c6 = true;
	end));
end;
task.spawn(function()
	while g6 do
		if A6.farm then
			pcall(PD);
		end;
		task.wait(.15);
	end;
end);
task.spawn(function()
	while g6 do
		local U = A6.farm or A6.favOn or A6.sellOn;
		local x = os.clock() - v6;
		local E = (A6.favOn and (c6 and x >= 1.2)) or x >= g.InventoryPollSeconds or (A6.sellOn and (M6.inv and (M6.inv >= A6.sellAt and x >= 2)));
		if U and (E and not z6) then
			c6 = false;
			z6 = true;
			local U, x = pcall(function()
					local U = BD();
					if not U then
						return;
					end;
					if A6.favOn then
						xD(U);
					end;
					if A6.sellOn and (M6.inv >= A6.sellAt and os.clock() >= k6) then
						HD(false);
					end;
				end);
			if not U then
				warn(B("20572bd117d77918bc"), x);
			end;
			z6 = false;
		end;
		task.wait(.7);
	end;
end);
i6 = C6();
m6();
q((("capabilities: minigame=%s getupvalues=%s getconnections=%s mgState=%s hook=%s")):format(tostring(i6 ~= nil), tostring(a ~= nil), tostring(r ~= nil), tostring(I6 ~= nil), tostring(hookmetamethod ~= nil and getnamecallmethod ~= nil)));
if not i6 then
	warn(B("20572bd117d77918bc285afd157429c30efa0c378e6c42f81e3d3bcc02e94d338d6955f81e316ec301f05e2e886650"));
	g6 = false;
	return;
end;
pcall(f6);
table.insert(y6, z.Heartbeat:Connect(j6));
table.insert(y6, d.CharacterAdded:Connect(function()
	F6.fishState, F6.rodState, F6.actionStart = nil, nil, nil;
	t6 = nil;
	b6();
end));
local pD = "\137PNG\r\n\026\n";
local function hD(U)
	task.spawn(function()
		local B, x = pcall(function()
				local U = getcustomasset or getsynasset;
				if not ((U and writefile)) then
					return nil;
				end;
				local B;
				if isfile and (readfile and isfile(g.LogoFile)) then
					B = readfile(g.LogoFile);
				end;
				if not ((type(B) == "string" and (#B > 1000 and string.sub(B, 1, 8) == pD))) then
					B = nil;
					local U, x = pcall(function()
							return game:HttpGet(g.LogoUrl);
						end);
					if U and type(x) == "string" then
						B = x;
					end;
					if not B then
						local U = request or http_request or (syn and syn.request);
						if U then
							local x, E = pcall(U, { Url = g.LogoUrl, Method = "GET" });
							if x and (type(E) == "table" and type(E.Body) == "string") then
								B = E.Body;
							end;
						end;
					end;
					if not ((type(B) == "string" and (#B > 1000 and string.sub(B, 1, 8) == pD))) then
						return nil;
					end;
					writefile(g.LogoFile, B);
				end;
				return U(g.LogoFile);
			end);
		if B and x then
			U(x);
		else
			q("logo not loaded (bubble keeps the CM text)");
		end;
	end);
end;
local function jD()
	local U = {};
	local x = {};
	local E = {
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
	local J = {
			"Farm",
			"Favorit",
			"Jual",
			"Trade",
			"Extras",
			"Profile",
		};
	local o = { Enum.EasingStyle.Back, Enum.EasingDirection.Out };
	local function l(U, B, x)
		local E = Instance.new(U);
		for U, B in pairs(B) do
			E[U] = B;
		end;
		if x then
			E.Parent = x;
		end;
		return E;
	end;
	local function e(U, B)
		return l("UICorner", { CornerRadius = UDim.new(0, B) }, U);
	end;
	local function n(U, B, x)
		return l("UIStroke", { Color = B, Thickness = x, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, U);
	end;
	local function Q(U, B, x, E, J)
		local o = u:Create(U, TweenInfo.new(B, E or Enum.EasingStyle.Quad, J or Enum.EasingDirection.Out), x);
		o:Play();
		return o;
	end;
	local A = setmetatable({}, { __mode = "k" });
	local function i(U)
		A[U] = ((A[U] or 0)) + 1;
		return A[U];
	end;
	local function I()
		local U = workspace.CurrentCamera;
		return U and U.ViewportSize or Vector2.new(800, 600);
	end;
	local F = l("ScreenGui", {
			Name = L .. tostring(math.random(1000, 9999)),
			ResetOnSpawn = false,
			DisplayOrder = 999,
			IgnoreGuiInset = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		});
	pcall(function()
		F.Parent = (gethui and gethui()) or game:GetService("CoreGui");
	end);
	if not F.Parent then
		F.Parent = d:WaitForChild("PlayerGui");
	end;
	U.sg = F;
	local D = {
			minimized = false,
			ready = false,
			busy = false,
			bubbleMoved = false,
		};
	local W = I();
	local t = Vector2.new(math.min(390, W.X - 24), math.min(500, W.Y - 24));
	local N = Vector2.new(math.max(12, ((W.X - t.X)) / 2), math.max(12, ((W.Y - t.Y)) / 2));
	local z = Vector2.new(N.X + 30, N.Y + 30);
	local v = l("CanvasGroup", {
			Name = "Main",
			AnchorPoint = Vector2.new(.5, .5),
			BackgroundColor3 = E.white,
			BorderSizePixel = 0,
			GroupTransparency = 1,
			Visible = false,
		}, F);
	e(v, 14);
	n(v, E.yellow, 2);
	local k = l("UIScale", { Scale = .85 }, v);
	local function Z()
		v.Size = UDim2.fromOffset(t.X, t.Y);
		v.Position = UDim2.fromOffset(N.X + t.X / 2, N.Y + t.Y / 2);
	end;
	Z();
	local w = l("Frame", {
			Name = "Header",
			Size = UDim2.new(1, 0, 0, 54),
			BackgroundColor3 = E.yellow,
			BorderSizePixel = 0,
			ClipsDescendants = true,
		}, v);
	l("UIGradient", { Color = ColorSequence.new(E.yellowLight, E.yellow), Rotation = 90 }, w);
	local Y = l("Frame", {
			Size = UDim2.new(0, 36, 1.8, 0),
			Position = UDim2.new(-0.3, 0, -0.4, 0),
			Rotation = 20,
			BackgroundColor3 = E.white,
			BackgroundTransparency = .8,
			BorderSizePixel = 0,
		}, w);
	local P = l("Frame", {
			Size = UDim2.fromOffset(38, 38),
			Position = UDim2.fromOffset(12, 8),
			BackgroundColor3 = E.white,
			BorderSizePixel = 0,
		}, w);
	e(P, 19);
	n(P, E.yellowDark, 1.5);
	local a = l("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = H,
			Font = Enum.Font.GothamBlack,
			TextSize = 14,
			TextColor3 = E.text,
		}, P);
	local r = l("ImageLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Crop,
		}, P);
	e(r, 19);
	local q = l("TextLabel", {
			Size = UDim2.new(1, -150, 0, 20),
			Position = UDim2.fromOffset(58, 8),
			BackgroundTransparency = 1,
			RichText = true,
			Text = O,
			TextColor3 = E.text,
			Font = Enum.Font.GothamBold,
			TextScaled = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, w);
	l("UITextSizeConstraint", { MaxTextSize = 14, MinTextSize = 8 }, q);
	l("TextLabel", {
		Size = UDim2.new(1, -150, 0, 14),
		Position = UDim2.fromOffset(58, 30),
		BackgroundTransparency = 1,
		Text = "Mancing  -  Favorit  -  Jual   v" .. g.Version,
		TextColor3 = Color3.fromRGB(120, 92, 0),
		Font = Enum.Font.Gotham,
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, w);
	local function V(U, B)
		local x = l("TextButton", {
				Size = UDim2.fromOffset(28, 28),
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, B, .5, 0),
				BackgroundColor3 = E.white,
				Text = U,
				TextColor3 = E.text,
				Font = Enum.Font.GothamBold,
				TextSize = 14,
				AutoButtonColor = false,
			}, w);
		e(x, 14);
		x.MouseEnter:Connect(function()
			Q(x, .12, { BackgroundColor3 = E.yellowSoft });
		end);
		x.MouseLeave:Connect(function()
			Q(x, .12, { BackgroundColor3 = E.white });
		end);
		return x;
	end;
	local m = V("-", -46);
	local C = V("X", -12);
	local f = l("Frame", {
			Position = UDim2.new(0, 12, 0, 62),
			Size = UDim2.new(1, -24, 0, 34),
			BackgroundColor3 = E.offwhite,
			BorderSizePixel = 0,
		}, v);
	e(f, 10);
	n(f, E.line, 1);
	local K = l("Frame", {
			Size = UDim2.new(1 / #J, -6, 1, -6),
			Position = UDim2.new(0, 3, 0, 3),
			BackgroundColor3 = E.yellow,
			BorderSizePixel = 0,
		}, f);
	e(K, 8);
	local s = {};
	local b = l("Frame", {
			Position = UDim2.new(0, 0, 0, 102),
			Size = UDim2.new(1, 0, 1, -152),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
		}, v);
	local p = {};
	local function h()
		local U = l("CanvasGroup", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Visible = false }, b);
		local B = l("ScrollingFrame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 4,
				ScrollBarImageColor3 = E.yellowDark,
				CanvasSize = UDim2.new(),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				ScrollingDirection = Enum.ScrollingDirection.Y,
			}, U);
		l("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, B);
		l("UIPadding", {
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			PaddingTop = UDim.new(0, 4),
			PaddingBottom = UDim.new(0, 12),
		}, B);
		local x = { cg = U, sf = B };
		table.insert(p, x);
		return x;
	end;
	local j = l("Frame", {
			Size = UDim2.new(1, 0, 0, 50),
			Position = UDim2.new(0, 0, 1, -50),
			BackgroundColor3 = E.yellowSoft,
			BorderSizePixel = 0,
		}, v);
	local B6 = l("Frame", {
			Size = UDim2.fromOffset(10, 10),
			Position = UDim2.fromOffset(12, 9),
			BackgroundColor3 = E.gray,
			BorderSizePixel = 0,
		}, j);
	e(B6, 5);
	local o6 = l("TextLabel", {
			Size = UDim2.new(1, -66, 0, 16),
			Position = UDim2.fromOffset(28, 6),
			BackgroundTransparency = 1,
			Text = "",
			TextColor3 = E.text,
			Font = Enum.Font.GothamBold,
			TextSize = 11,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, j);
	local n6 = l("TextLabel", {
			Size = UDim2.new(1, -66, 0, 14),
			Position = UDim2.fromOffset(28, 27),
			BackgroundTransparency = 1,
			Text = "",
			TextColor3 = E.muted,
			Font = Enum.Font.Gotham,
			TextSize = 10,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, j);
	local function H6(U, B, x, J)
		local o = l("Frame", {
				Name = "Padlock",
				Size = UDim2.fromOffset(14, 17),
				AnchorPoint = x,
				Position = J,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
			}, U);
		local Q = l("Frame", {
				Size = UDim2.fromOffset(10, 11),
				Position = UDim2.fromOffset(2, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
			}, o);
		e(Q, 5);
		n(Q, B, 2);
		local A = l("Frame", {
				Size = UDim2.fromOffset(14, 10),
				Position = UDim2.fromOffset(0, 7),
				BackgroundColor3 = B,
				BorderSizePixel = 0,
			}, o);
		e(A, 3);
		local L = l("Frame", {
				Size = UDim2.fromOffset(3, 4),
				Position = UDim2.fromOffset(5.5, 10),
				BackgroundColor3 = E.white,
				BorderSizePixel = 0,
			}, o);
		e(L, 1);
		return o;
	end;
	local function i6(U, B, x)
		if not E6(B) then
			return nil;
		end;
		x = x or {};
		local J = l("TextButton", {
				Name = "LockShield",
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = E.offwhite,
				BackgroundTransparency = .3,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 30,
			}, U);
		if x.region then
			J.Position, J.Size = x.region[1], x.region[2];
		end;
		if x.radius then
			e(J, x.radius);
		end;
		H6(J, E.muted, Vector2.new(1, .5), UDim2.new(1, -((x.inset or 14)), .5, 0));
		J.Activated:Connect(function()
			Y6.toast(R, "warn", 3);
		end);
		return J;
	end;
	local function F6(U)
		local B = l("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = E.offwhite,
				BorderSizePixel = 0,
				LayoutOrder = i(U.sf),
			}, U.sf);
		e(B, 12);
		n(B, E.line, 1);
		l("UIPadding", {
			PaddingTop = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
		}, B);
		l("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, B);
		return B;
	end;
	local function D6(U, B, x, E, J)
		return l("TextLabel", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = B,
			TextSize = x,
			TextColor3 = E,
			Font = J,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			LayoutOrder = i(U),
		}, U);
	end;
	local function W6(U, B, x)
		local J = D6(U, B, 12, E.yellowDark, Enum.Font.GothamBold);
		if E6(x) then
			H6(J, E.yellowDark, Vector2.new(1, .5), UDim2.new(1, 0, .5, 0));
		end;
		return J;
	end;
	local function t6(U, B)
		return D6(U, B, 11, E.muted, Enum.Font.Gotham);
	end;
	local function N6(U)
		local B = l("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = i(U),
			}, U);
		l("UISizeConstraint", { MinSize = Vector2.new(0, 36) }, B);
		return B;
	end;
	local function z6(U, B, x, J)
		local o = l("Frame", { Size = UDim2.new(1, -J, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1 }, U);
		l("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }, o);
		D6(o, B, 13, E.text, Enum.Font.GothamBold);
		if x and x ~= "" then
			D6(o, x, 11, E.muted, Enum.Font.Gotham);
		end;
		return o;
	end;
	local function X6(B, J, n, A, L, H, O)
		local M = N6(B);
		z6(M, J, n, 62);
		i6(M, O, { inset = 17 });
		local y = l("TextButton", {
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, 0, .5, 0),
				Size = UDim2.fromOffset(48, 26),
				Text = "",
				AutoButtonColor = false,
				BackgroundColor3 = E.gray,
			}, M);
		e(y, 13);
		local g = l("Frame", {
				Size = UDim2.fromOffset(20, 20),
				Position = UDim2.fromOffset(3, 3),
				BackgroundColor3 = E.white,
				BorderSizePixel = 0,
			}, y);
		e(g, 10);
		local i;
		table.insert(x, function()
			if H then
				local U = H();
				if M.Visible ~= U then
					M.Visible = U;
				end;
			end;
			local U = A() and true or false;
			if U ~= i then
				local B = i == nil;
				i = U;
				local x = U and E.yellowDark or E.gray;
				local J = U and UDim2.fromOffset(25, 3) or UDim2.fromOffset(3, 3);
				if B then
					y.BackgroundColor3, g.Position = x, J;
				else
					Q(y, .18, { BackgroundColor3 = x });
					Q(g, .22, { Position = J }, o[1], o[2]);
				end;
			end;
		end);
		y.Activated:Connect(function()
			L(not A());
			U.refresh();
		end);
		return M;
	end;
	local function v6(B, J, o, A, L, H, O, M, y, g)
		local i = N6(B);
		z6(i, J, o, 74);
		i6(i, g, { inset = 24 });
		local I = l("TextBox", {
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, 0, .5, 0),
				Size = UDim2.fromOffset(62, 30),
				BackgroundColor3 = E.white,
				Text = T(A(), M),
				TextColor3 = E.text,
				Font = Enum.Font.GothamBold,
				TextSize = 13,
				ClearTextOnFocus = false,
				PlaceholderText = "",
			}, i);
		e(I, 8);
		local F = n(I, E.line, 1.5);
		I.Focused:Connect(function()
			Q(F, .15, { Color = E.yellowDark });
		end);
		I.FocusLost:Connect(function()
			Q(F, .15, { Color = E.line });
			local B = string.gsub(I.Text, ",", ".");
			local x = tonumber(B);
			if x and S(x) then
				local U = math.clamp(x, H, O);
				if U ~= x then
					Y6.toast((("Nilai dibatasi ke %s - %s")):format(T(H, M), T(O, M)), "warn", 3);
				end;
				L(M and math.floor(U + .5) or U);
			else
				Y6.toast("Isi dengan angka", "warn", 3);
			end;
			I.Text = T(A(), M);
			U.refresh();
		end);
		table.insert(x, function()
			if y then
				local U = y();
				if i.Visible ~= U then
					i.Visible = U;
				end;
			end;
			if I:IsFocused() then
				return;
			end;
			local U = T(A(), M);
			if I.Text ~= U then
				I.Text = U;
			end;
		end);
		return i;
	end;
	local function k6(B, J, A, L)
		local H = #J;
		local O = l("Frame", {
				Size = UDim2.new(1, 0, 0, 34),
				BackgroundColor3 = E.white,
				BorderSizePixel = 0,
				LayoutOrder = i(B),
			}, B);
		e(O, 10);
		n(O, E.line, 1);
		local M = l("Frame", {
				Size = UDim2.new(1 / H, -6, 1, -6),
				Position = UDim2.new(0, 3, 0, 3),
				BackgroundColor3 = E.yellow,
				BorderSizePixel = 0,
			}, O);
		e(M, 8);
		local y = {};
		for B, x in ipairs(J) do
			local J = l("TextButton", {
					Size = UDim2.new(1 / H, 0, 1, 0),
					Position = UDim2.new(((B - 1)) / H, 0, 0, 0),
					BackgroundTransparency = 1,
					Text = x.text,
					Font = Enum.Font.GothamBold,
					TextSize = 12,
					TextColor3 = E.muted,
					AutoButtonColor = false,
					ZIndex = 2,
				}, O);
			J.Activated:Connect(function()
				L(x.id);
				U.refresh();
			end);
			y[B] = J;
			i6(O, x.lock, { radius = 8, inset = 8, region = { UDim2.new(((B - 1)) / H, 0, 0, 0), UDim2.new(1 / H, 0, 1, 0) } });
		end;
		local g = "unset";
		table.insert(x, function()
			local U = A();
			if U ~= g then
				local B = g == "unset";
				g = U;
				local x;
				for B, E in ipairs(J) do
					if E.id == U then
						x = B;
					end;
				end;
				for U, B in ipairs(y) do
					Q(B, .18, { TextColor3 = (U == x) and E.text or E.muted });
				end;
				if x then
					local U = UDim2.new(((x - 1)) / H, 3, 0, 3);
					if B then
						M.Position, M.BackgroundTransparency = U, 0;
					else
						M.BackgroundTransparency = 0;
						Q(M, .28, { Position = U }, o[1], o[2]);
					end;
				else
					Q(M, .18, { BackgroundTransparency = 1 });
				end;
			end;
		end);
		return O;
	end;
	local function Z6(U, B, x, J, A)
		local L = (x == "danger") and E.red or ((x == "ghost") and E.white or E.yellow);
		local H = (x == "danger") and Color3.fromRGB(235, 95, 85) or ((x == "ghost") and E.yellowSoft or E.yellowLight);
		local O = (x == "danger") and E.white or E.text;
		local M = l("TextButton", {
				Size = UDim2.new(1, 0, 0, 38),
				BackgroundColor3 = L,
				Text = B,
				TextColor3 = O,
				Font = Enum.Font.GothamBold,
				TextSize = 13,
				AutoButtonColor = false,
				LayoutOrder = i(U),
			}, U);
		e(M, 10);
		if x == "ghost" then
			n(M, E.yellowDark, 1.5);
		end;
		local y = l("UIScale", { Scale = 1 }, M);
		M.MouseEnter:Connect(function()
			Q(M, .12, { BackgroundColor3 = H });
		end);
		M.MouseLeave:Connect(function()
			Q(M, .12, { BackgroundColor3 = L });
			Q(y, .1, { Scale = 1 });
		end);
		M.MouseButton1Down:Connect(function()
			Q(y, .08, { Scale = .96 });
		end);
		M.MouseButton1Up:Connect(function()
			Q(y, .12, { Scale = 1 }, o[1], o[2]);
		end);
		M.Activated:Connect(J);
		i6(M, A, { radius = 10, inset = 14 });
		return M;
	end;
	local u6, w6, P6, d6, a6, r6 = h(), h(), h(), h(), h(), h();
	local q6 = l("Frame", {
			Size = UDim2.new(1, 0, 0, 76),
			BackgroundColor3 = E.offwhite,
			BorderSizePixel = 0,
			LayoutOrder = i(u6.sf),
		}, u6.sf);
	e(q6, 14);
	local S6 = n(q6, E.line, 1.5);
	local V6 = l("TextLabel", {
			Size = UDim2.new(1, -90, 0, 20),
			Position = UDim2.fromOffset(14, 12),
			BackgroundTransparency = 1,
			Text = "AUTO FARM: MATI",
			TextColor3 = E.text,
			Font = Enum.Font.GothamBlack,
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, q6);
	local T6 = l("TextLabel", {
			Size = UDim2.new(1, -90, 0, 30),
			Position = UDim2.fromOffset(14, 34),
			BackgroundTransparency = 1,
			Text = "Ketuk untuk mulai mancing otomatis",
			TextColor3 = E.muted,
			Font = Enum.Font.Gotham,
			TextSize = 11,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
		}, q6);
	local m6 = l("Frame", {
			AnchorPoint = Vector2.new(1, .5),
			Position = UDim2.new(1, -14, .5, 0),
			Size = UDim2.fromOffset(60, 32),
			BackgroundColor3 = E.gray,
			BorderSizePixel = 0,
		}, q6);
	e(m6, 16);
	local C6 = l("Frame", {
			Size = UDim2.fromOffset(26, 26),
			Position = UDim2.fromOffset(3, 3),
			BackgroundColor3 = E.white,
			BorderSizePixel = 0,
		}, m6);
	e(C6, 13);
	local f6 = l("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			ZIndex = 5,
		}, q6);
	f6.Activated:Connect(function()
		Y6.setFarm(not A6.farm);
		U.refresh();
	end);
	local R6;
	table.insert(x, function()
		local U = A6.farm and true or false;
		T6.Text = U and ((M6.status or "")) or "Ketuk untuk mulai mancing otomatis";
		if U ~= R6 then
			local B = R6 == nil;
			R6 = U;
			V6.Text = U and "AUTO FARM: AKTIF" or "AUTO FARM: MATI";
			local x = U and E.yellowSoft or E.offwhite;
			local J = U and E.yellowDark or E.line;
			local l = U and E.yellowDark or E.gray;
			local e = U and UDim2.fromOffset(31, 3) or UDim2.fromOffset(3, 3);
			if B then
				q6.BackgroundColor3, S6.Color, m6.BackgroundColor3, C6.Position = x, J, l, e;
			else
				Q(q6, .25, { BackgroundColor3 = x });
				Q(S6, .25, { Color = J });
				Q(m6, .25, { BackgroundColor3 = l });
				Q(C6, .3, { Position = e }, o[1], o[2]);
			end;
		end;
	end);
	local K6 = { FREE = { E.gray, E.text }, PREMIUM = { E.yellow, E.text }, OWNER = { E.text, E.yellowLight } };
	local s6 = K6[U6] or K6.FREE;
	local p6 = F6(u6);
	W6(p6, "MODE MINIGAME");
	k6(p6, { { id = "Smart", text = "Smart" }, { id = "Skip", text = "Skip", lock = "skip" } }, function()
		return A6.mode;
	end, function(U)
		if U == "Skip" and not x6 then
			G6();
			return;
		end;
		A6.mode = U;
		b6();
	end);
	local h6 = t6(p6, "");
	table.insert(x, function()
		local U = l6[A6.mode];
		if h6.Text ~= U then
			h6.Text = U;
		end;
	end);
	local j6 = F6(u6);
	W6(j6, "KECEPATAN", "speed");
	local UD = {};
	for U, B in ipairs(e6) do
		table.insert(UD, { id = B, text = B, lock = (B ~= "Aman") and "speed" or nil });
	end;
	k6(j6, UD, function()
		return A6.preset;
	end, function(U)
		Y6.setPreset(U);
	end);
	local BD = t6(j6, "");
	table.insert(x, function()
		local U = Q6[A6.preset] or "";
		if BD.Text ~= U then
			BD.Text = U;
		end;
	end);
	local xD = F6(u6);
	W6(xD, "OTOMATISASI", "automation");
	X6(xD, "Lempar pancing otomatis", "Bot melempar sendiri.", function()
		return A6.autoCast;
	end, function(U)
		A6.autoCast = U;
	end, nil, "automation");
	X6(xD, "Pegang rod otomatis", "Ambil rod dari tas saat farm aktif.", function()
		return A6.autoEquip;
	end, function(U)
		A6.autoEquip = U;
	end, nil, "automation");
	local ED = F6(u6);
	W6(ED, "ATUR WAKTU SENDIRI (LANJUTAN)", "timing");
	t6(ED, "Mulai dari preset Aman, naikkan pelan-pelan.");
	v6(ED, "Tahan sebelum selesai", "Mode Skip: detik sebelum minigame dipaksa selesai.", function()
		return A6.skipDelay;
	end, function(U)
		A6.skipDelay = U;
		Y6.syncPreset();
	end, 0, 10, false, function()
		return A6.mode == "Skip";
	end, "timing");
	X6(ED, "Percepat waktu gigitan", "Perpendek waktu tunggu ikan menggigit.", function()
		return A6.biteFast;
	end, function(U)
		A6.biteFast = U;
		Y6.syncPreset();
	end, nil, "timing");
	v6(ED, "Waktu tunggu gigitan", "Makin kecil makin cepat, bisa ditolak server.", function()
		return A6.biteWait;
	end, function(U)
		A6.biteWait = U;
		Y6.syncPreset();
	end, .2, 6, false, function()
		return A6.biteFast;
	end, "timing");
	v6(ED, "Jeda lempar ulang", "Jeda setelah dapat ikan sebelum lempar lagi.", function()
		return A6.castCooldown;
	end, function(U)
		A6.castCooldown = U;
		Y6.syncPreset();
	end, .05, 2, false, nil, "timing");
	v6(ED, "Batas macet", "Reset otomatis jika pancing macet selama ini.", function()
		return A6.stuckTimeout;
	end, function(U)
		A6.stuckTimeout = U;
	end, 5, 120, true, nil, "timing");
	local JD = F6(w6);
	W6(JD, "AUTO FAVORIT", "favorit");
	X6(JD, "Favoritkan ikan baru", "Ikan baru rarity terpilih otomatis difavoritkan.", function()
		return A6.favOn;
	end, function(U)
		A6.favOn = U;
		if U then
			c6 = true;
		end;
	end, nil, "favorit");
	local oD = F6(w6);
	W6(oD, "RARITY YANG DIFAVORITKAN", "favorit");
	local lD = l("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = i(oD),
		}, oD);
	l("UIGridLayout", { CellSize = UDim2.new(.3333, -4, 0, 34), CellPadding = UDim2.fromOffset(6, 6), SortOrder = Enum.SortOrder.LayoutOrder }, lD);
	for B, J in ipairs(J6) do
		local o = l("TextButton", {
				Text = J,
				Font = Enum.Font.GothamBold,
				TextSize = 11,
				AutoButtonColor = false,
				LayoutOrder = B,
				BackgroundColor3 = E.white,
				TextColor3 = E.muted,
			}, lD);
		e(o, 8);
		local A = n(o, E.gray, 1.5);
		i6(o, "favorit", { radius = 8, inset = 8 });
		local L;
		table.insert(x, function()
			local U = A6.fav[J] and true or false;
			if U ~= L then
				L = U;
				Q(o, .18, { BackgroundColor3 = U and E.yellow or E.white, TextColor3 = U and E.text or E.muted });
				Q(A, .18, { Color = U and E.yellowDark or E.gray });
			end;
		end);
		o.Activated:Connect(function()
			A6.fav[J] = not A6.fav[J];
			U.refresh();
		end);
	end;
	Z6(oD, "Favoritkan sekarang", "primary", function()
		Y6.favNow();
	end, "favorit");
	t6(oD, "Rarity yang dicentang dilindungi saat menjual.");
	local eD = F6(P6);
	W6(eD, "AUTO JUAL (TANPA NPC)", "jual");
	X6(eD, "Jual otomatis", "Menjual ikan saat jumlahnya mencapai angka di bawah.", function()
		return A6.sellOn;
	end, function(U)
		Y6.setSell(U);
	end, nil, "jual");
	v6(eD, "Jual saat inventory >=", "Maks 500.", function()
		return A6.sellAt;
	end, function(U)
		A6.sellAt = U;
	end, 1, g.MaxInventory, true, nil, "jual");
	v6(eD, "Jeda antar jual", "Terlalu kecil bisa dianggap spam.", function()
		return A6.sellGap;
	end, function(U)
		A6.sellGap = U;
	end, .02, 2, false, nil, "jual");
	local nD = F6(P6);
	W6(nD, "CARA JUAL", "jual");
	local QD = D6(nD, "", 11, E.text, Enum.Font.GothamMedium);
	X6(nD, "Izinkan jual-semua", "Menjual SEMUA ikan sekaligus. Mati otomatis jika ikan favorit ikut hilang.", function()
		return A6.allowSellAll;
	end, function(U)
		A6.allowSellAll = U;
	end, nil, "jual");
	table.insert(x, function()
		local U = Y6.methodReport();
		local x = "Cara jual: " .. ((U.learned and ("sudah dipelajari" .. ((U.learnedKind == B("0d783cc002eb4537") and " (jual semua)" or " (per ikan)"))) or "belum dipelajari. Tekan \'Pelajari cara jual\' lalu jual 1 ikan di NPC."));
		if QD.Text ~= x then
			QD.Text = x;
		end;
	end);
	local AD = F6(P6);
	W6(AD, "AKSI", "jual");
	Z6(AD, "Jual sekarang", "primary", function()
		Y6.sellNow();
	end, "jual");
	Z6(AD, "Pelajari cara jual (jual 1 ikan di NPC)", "ghost", function()
		Y6.startLearn();
	end, "jual");
	Z6(AD, "Lupakan hasil pelajaran", "ghost", function()
		Y6.forget();
	end, "jual");
	local LD = D6(AD, "", 11, E.text, Enum.Font.GothamMedium);
	table.insert(x, function()
		local U = "Info terakhir: " .. tostring(M6.lastNote or "-");
		if LD.Text ~= U then
			LD.Text = U;
		end;
	end);
	t6(AD, "Uji aman dulu: favoritkan 1 ikan murah, tekan \'Jual sekarang\'. Jika ikut hilang, jangan nyalakan jual-semua.");
	local function HD(U, B)
		local x = l("Frame", { Size = UDim2.new(1, 0, 0, 38), BackgroundColor3 = E.white, LayoutOrder = i(U) }, U);
		e(x, 10);
		local J = n(x, E.gray, 1.5);
		local o = l("TextLabel", {
				Size = UDim2.new(1, -34, 1, 0),
				Position = UDim2.fromOffset(12, 0),
				BackgroundTransparency = 1,
				Text = "",
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = E.muted,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
			}, x);
		local Q = l("TextLabel", {
				Size = UDim2.fromOffset(20, 20),
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, -10, .5, 0),
				BackgroundTransparency = 1,
				Text = "v",
				TextColor3 = E.muted,
				Font = Enum.Font.GothamBold,
				TextSize = 12,
			}, x);
		local A = l("TextButton", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Text = "",
				AutoButtonColor = false,
			}, x);
		i6(x, B, { radius = 10, inset = 12 });
		local L = l("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				LayoutOrder = i(U),
			}, U);
		local H = l("ScrollingFrame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = E.offwhite,
				BorderSizePixel = 0,
				ScrollBarThickness = 4,
				ScrollBarImageColor3 = E.yellowDark,
				CanvasSize = UDim2.new(),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				ScrollingDirection = Enum.ScrollingDirection.Y,
			}, L);
		e(H, 8);
		l("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }, H);
		l("UIPadding", {
			PaddingTop = UDim.new(0, 4),
			PaddingBottom = UDim.new(0, 4),
			PaddingLeft = UDim.new(0, 4),
			PaddingRight = UDim.new(0, 4),
		}, H);
		local O = false;
		local function M(U)
			O = U;
			L.Size = U and UDim2.new(1, 0, 0, 160) or UDim2.new(1, 0, 0, 0);
			Q.Text = U and "^" or "v";
		end;
		A.Activated:Connect(function()
			M(not O);
		end);
		return {
			lbl = o,
			sf = H,
			setOpen = M,
			isOpen = function()
				return O;
			end,
		};
	end;
	local function MD(U, B, x)
		local J = l("TextButton", {
				Size = UDim2.new(1, 0, 0, 32),
				BackgroundColor3 = E.white,
				Text = "",
				AutoButtonColor = false,
			}, U);
		e(J, 6);
		local o = l("TextLabel", {
				Size = UDim2.new(1, -16, 1, 0),
				Position = UDim2.fromOffset(8, 0),
				BackgroundTransparency = 1,
				Text = B,
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = E.text,
				TextXAlignment = Enum.TextXAlignment.Left,
			}, J);
		J.Activated:Connect(x);
		return J, o;
	end;
	local yD = F6(d6);
	W6(yD, "PILIH TARGET", "trade");
	local gD = HD(yD, "trade");
	gD.lbl.Text = "Belum dipilih";
	do
		local U, B = nil, {};
		table.insert(x, function()
			local x, E = {}, {};
			for U, B in ipairs(c:GetPlayers()) do
				if B ~= d then
					table.insert(x, B);
					table.insert(E, tostring(B.UserId));
				end;
			end;
			E = table.concat(E, "|");
			if E ~= U then
				U = E;
				for U, B in ipairs(B) do
					B:Destroy();
				end;
				B = {};
				for U, x in ipairs(x) do
					local E = MD(gD.sf, x.Name, function()
							OD.targetUserId, OD.targetName = x.UserId, x.Name;
							gD.lbl.Text = x.Name;
							gD.setOpen(false);
						end);
					table.insert(B, E);
				end;
			end;
			if OD.targetName and not c:GetPlayerByUserId(OD.targetUserId or 0) then
				gD.lbl.Text = OD.targetName .. " (sudah keluar)";
			end;
		end);
	end;
	local FD = F6(d6);
	W6(FD, "PILIH RARITY", "trade");
	local DD = HD(FD, "trade");
	DD.lbl.Text = "Belum dipilih";
	do
		local B = {};
		for x, E in ipairs(J6) do
			local J, o = MD(DD.sf, E, function()
					OD.rarity, OD.fishName = E, nil;
					DD.lbl.Text = E;
					DD.setOpen(false);
					U.refresh();
				end);
			B[E] = o;
		end;
		table.insert(x, function()
			local U = ID();
			for B, x in pairs(B) do
				local E = (("%s (x%d)")):format(B, U[B] or 0);
				if x.Text ~= E then
					x.Text = E;
				end;
			end;
			if OD.rarity then
				local B = (("%s (x%d)")):format(OD.rarity, U[OD.rarity] or 0);
				if DD.lbl.Text ~= B then
					DD.lbl.Text = B;
				end;
			end;
		end);
	end;
	local WD = F6(d6);
	W6(WD, "NAMA IKAN (OPSIONAL)", "trade");
	local tD = HD(WD, "trade");
	tD.lbl.Text = "Semua nama";
	do
		local U, B = nil, {};
		table.insert(x, function()
			if not OD.rarity then
				if U ~= "" then
					U = "";
					for U, B in ipairs(B) do
						B.row:Destroy();
					end;
					B = {};
				end;
				return;
			end;
			local x, E = iD(OD.rarity);
			local J = OD.rarity .. (":" .. table.concat(x, "|"));
			if J ~= U then
				U = J;
				for U, B in ipairs(B) do
					B.row:Destroy();
				end;
				B = {};
				local o = MD(tD.sf, "Semua nama", function()
						OD.fishName = nil;
						tD.lbl.Text = "Semua nama";
						tD.setOpen(false);
					end);
				table.insert(B, { row = o, txt = nil, name = nil });
				for U, x in ipairs(x) do
					local J, o = MD(tD.sf, (("%s (x%d)")):format(x, E[x] or 0), function()
							OD.fishName = x;
							tD.lbl.Text = (("%s (x%d)")):format(x, E[x] or 0);
							tD.setOpen(false);
						end);
					table.insert(B, { row = J, txt = o, name = x });
				end;
			else
				for U, B in ipairs(B) do
					if B.name then
						local U = (("%s (x%d)")):format(B.name, E[B.name] or 0);
						if B.txt.Text ~= U then
							B.txt.Text = U;
						end;
						if OD.fishName == B.name and tD.lbl.Text ~= U then
							tD.lbl.Text = U;
						end;
					end;
				end;
			end;
		end);
	end;
	local ND = F6(d6);
	W6(ND, "JUMLAH & AKSI", "trade");
	v6(ND, "Jumlah ikan", "Berapa ekor yang mau dikirim.", function()
		return OD.amount;
	end, function(U)
		OD.amount = math.max(1, math.floor(U));
	end, 1, 500, true, nil, "trade");
	X6(ND, "Auto dekati target", "Biasanya tidak perlu. Nyalakan kalau kirim jarak jauh gagal terus.", function()
		return OD.autoApproach;
	end, function(U)
		OD.autoApproach = U;
	end, nil, "trade");
	local cD = D6(ND, "", 11, E.muted, Enum.Font.GothamMedium);
	table.insert(x, function()
		if cD.Text ~= OD.log then
			cD.Text = OD.log;
		end;
	end);
	Z6(ND, "Mulai Give", "primary", function()
		local U, B = OD.start();
		if not U then
			Y6.toast("Trade gagal mulai: " .. tostring(B), "warn", 6);
		end;
	end, "trade");
	Z6(ND, "Stop", "ghost", function()
		OD.stop();
	end, "trade");
	t6(ND, "Ikan favorit otomatis di-unfavorite dulu. Dikirim satu-satu, tunggu respons baru lanjut.");
	local zD = F6(d6);
	W6(zD, "TERIMA KIRIMAN MASUK", "trade");
	X6(zD, "Auto Accept", "Otomatis terima kiriman ikan yang masuk.", function()
		return OD.autoAccept;
	end, function(U)
		OD.autoAccept = U;
	end, nil, "trade");
	t6(zD, "Popup bawaan game mungkin sempat kelihatan sebentar, itu wajar.");
	local XD = F6(a6);
	W6(XD, "BOOST PERFORMANCE", "boost");
	X6(XD, "Aktifkan Boost Performance", "Bikin game lebih ringan biar nggak lag/panas.", function()
		return VD.on;
	end, function(U)
		if U then
			local U, B = VD.enable();
			if not U then
				Y6.toast("Boost Performance gagal: " .. tostring(B), "warn", 6);
			end;
		else
			VD.disable();
		end;
	end, nil, "boost");
	local vD = D6(XD, "", 11, E.muted, Enum.Font.GothamMedium);
	table.insert(x, function()
		local U = (("Status: %s  |  efek mati: %d  |  model disederhanakan: %d")):format(VD.on and "AKTIF" or "mati", VD.effectCount, VD.meshCount);
		if vD.Text ~= U then
			vD.Text = U;
		end;
	end);
	t6(XD, "Cuma ubah tampilan, bukan cara main. Balik normal otomatis kalau dimatikan.");
	local kD = F6(a6);
	W6(kD, "ANTI-LOSE STREAK", "streak");
	X6(kD, "Aktifkan Anti-Lose Streak", "Rejoin otomatis saat tangkapan gagal.", function()
		return L6.antiLoseStreak;
	end, function(U)
		L6.antiLoseStreak = U;
	end, nil, "streak");
	local ZD = D6(kD, "", 11, E.muted, Enum.Font.GothamMedium);
	table.insert(x, function()
		local U = dD and "Status: sudah pernah ter-trigger sesi ini (sedang/ sudah mencoba rejoin)." or "Status: belum pernah ter-trigger sesi ini.";
		if ZD.Text ~= U then
			ZD.Text = U;
		end;
	end);
	t6(kD, "Selalu otomatis: begitu terdeteksi gagal, Auto Farm dihentikan dan !rejoin langsung dikirim 1x.");
	local function uD(U, B, x)
		local J = N6(U);
		l("TextLabel", {
			Size = UDim2.new(.4, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = B,
			TextColor3 = E.muted,
			Font = Enum.Font.GothamMedium,
			TextSize = 12,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, J);
		local o = l("TextLabel", {
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(.58, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Text = x,
				TextColor3 = E.text,
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Right,
			}, J);
		return o;
	end;
	local wD = F6(r6);
	local YD = l("Frame", { Size = UDim2.new(1, 0, 0, 68), BackgroundTransparency = 1, LayoutOrder = i(wD) }, wD);
	local PD = l("Frame", {
			Size = UDim2.fromOffset(60, 60),
			Position = UDim2.fromOffset(0, 4),
			BackgroundColor3 = E.yellowSoft,
			BorderSizePixel = 0,
		}, YD);
	e(PD, 30);
	n(PD, E.yellowDark, 1.5);
	local GD = l("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = (string.sub(d.Name, 1, 1)):upper(),
			Font = Enum.Font.GothamBlack,
			TextSize = 22,
			TextColor3 = E.text,
		}, PD);
	local aD = l("ImageLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Crop,
		}, PD);
	e(aD, 30);
	l("TextLabel", {
		Size = UDim2.new(1, -72, 0, 20),
		Position = UDim2.fromOffset(72, 2),
		BackgroundTransparency = 1,
		Text = d.DisplayName,
		Font = Enum.Font.GothamBold,
		TextSize = 15,
		TextColor3 = E.text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
	}, YD);
	l("TextLabel", {
		Size = UDim2.new(1, -72, 0, 16),
		Position = UDim2.fromOffset(72, 23),
		BackgroundTransparency = 1,
		Text = "@" .. d.Name,
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextColor3 = E.muted,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, YD);
	local rD = l("TextLabel", {
			Size = UDim2.fromOffset(74, 24),
			Position = UDim2.fromOffset(72, 44),
			BackgroundColor3 = s6[1],
			Text = U6,
			TextColor3 = s6[2],
			Font = Enum.Font.GothamBlack,
			TextSize = 12,
		}, YD);
	e(rD, 12);
	task.spawn(function()
		local U, B = pcall(function()
				return c:GetUserThumbnailAsync(d.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180);
			end);
		if U and B then
			aD.Image = B;
			Q(aD, .3, { ImageTransparency = 0 });
			GD.Visible = false;
		end;
	end);
	local qD = F6(r6);
	W6(qD, "DETAIL AKUN");
	uD(qD, "Username", d.Name);
	uD(qD, "Display Name", d.DisplayName);
	local SD = uD(qD, "Negara", "Memuat...");
	local TD = uD(qD, "Role", U6);
	TD.TextColor3 = (U6 == "FREE") and E.muted or E.yellowDark;
	task.spawn(function()
		local U, B = pcall(function()
				return G:GetCountryRegionForPlayerAsync(d);
			end);
		SD.Text = ((U and (type(B) == "string" and B ~= ""))) and B or "Tidak diketahui";
	end);
	t6(qD, x6 and "Semua fitur terbuka, tanpa batasan." or "Akun FREE hanya membuka Auto Farm mode Smart.");
	local mD;
	local function CD(U, B)
		if mD == U then
			return;
		end;
		mD = U;
		for x, J in ipairs(p) do
			if x == U then
				J.cg.Visible = true;
				if B then
					J.cg.GroupTransparency, J.cg.Position = 0, UDim2.new();
				else
					J.cg.GroupTransparency, J.cg.Position = 1, UDim2.fromOffset(0, 14);
					Q(J.cg, .25, { GroupTransparency = 0, Position = UDim2.new() });
				end;
			else
				J.cg.Visible = false;
			end;
			Q(s[x], .18, { TextColor3 = (x == U) and E.text or E.muted });
		end;
		local x = UDim2.new(((U - 1)) / #J, 3, 0, 3);
		if B then
			K.Position = x;
		else
			Q(K, .3, { Position = x }, o[1], o[2]);
		end;
	end;
	local fD = {
			Favorit = "favorit",
			Jual = "jual",
			Trade = "trade",
			Extras = "streak",
		};
	for U, B in ipairs(J) do
		local x = l("TextButton", {
				Size = UDim2.new(1 / #J, 0, 1, 0),
				Position = UDim2.new(((U - 1)) / #J, 0, 0, 0),
				BackgroundTransparency = 1,
				Text = B,
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextColor3 = E.muted,
				AutoButtonColor = false,
				ZIndex = 2,
			}, f);
		x.Activated:Connect(function()
			CD(U);
		end);
		s[U] = x;
		if E6(fD[B]) then
			H6(x, E.muted, Vector2.new(1, .5), UDim2.new(1, -6, .5, 0));
		end;
	end;
	local RD = l("CanvasGroup", {
			AnchorPoint = Vector2.new(.5, 0),
			Position = UDim2.new(.5, 0, 0, 48),
			Size = UDim2.new(1, -28, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = E.text,
			BorderSizePixel = 0,
			GroupTransparency = 1,
			Visible = false,
			ZIndex = 40,
		}, v);
	e(RD, 10);
	local KD = l("Frame", { Size = UDim2.new(0, 5, 1, 0), BackgroundColor3 = E.yellow, BorderSizePixel = 0 }, RD);
	local sD = l("TextLabel", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = "",
			TextColor3 = E.white,
			Font = Enum.Font.GothamMedium,
			TextSize = 12,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, RD);
	l("UIPadding", {
		PaddingTop = UDim.new(0, 9),
		PaddingBottom = UDim.new(0, 9),
		PaddingLeft = UDim.new(0, 16),
		PaddingRight = UDim.new(0, 10),
	}, sD);
	l("UISizeConstraint", { MaxSize = Vector2.new(360, math.huge) }, RD);
	local bD = 0;
	local pD = {
			ok = E.green,
			warn = E.yellow,
			err = E.red,
			info = E.yellowLight,
		};
	local jD = l("ImageButton", {
			Name = "Bubble",
			Size = UDim2.fromOffset(60, 60),
			AnchorPoint = Vector2.new(.5, .5),
			BackgroundColor3 = E.yellow,
			AutoButtonColor = false,
			Image = "",
			ScaleType = Enum.ScaleType.Crop,
			Visible = false,
		}, F);
	e(jD, 30);
	local U_ = n(jD, E.yellowDark, 3);
	local B_ = l("UIScale", { Scale = 0 }, jD);
	local x_ = l("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = H,
			Font = Enum.Font.GothamBlack,
			TextSize = 20,
			TextColor3 = E.text,
		}, jD);
	local E_ = l("Frame", {
			Size = UDim2.fromOffset(14, 14),
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 1, 0, -1),
			BackgroundColor3 = E.gray,
			BorderSizePixel = 0,
			ZIndex = 3,
		}, jD);
	e(E_, 7);
	n(E_, E.white, 2);
	(u:Create(U_, TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Transparency = .7 })):Play();
	local function J_()
		jD.Position = UDim2.fromOffset(z.X, z.Y);
	end;
	J_();
	function Y6.toast(U, B, x)
		bD = bD + 1;
		local J = bD;
		sD.Text = tostring(U);
		KD.BackgroundColor3 = pD[B or "info"] or E.yellow;
		RD.Visible = true;
		RD.GroupTransparency = 1;
		RD.Position = UDim2.new(.5, 0, 0, 40);
		Q(RD, .32, { GroupTransparency = .03, Position = UDim2.new(.5, 0, 0, 58) }, o[1], o[2]);
		if D.minimized then
			Q(B_, .12, { Scale = 1.25 });
			task.delay(.14, function()
				Q(B_, .2, { Scale = 1 }, o[1], o[2]);
			end);
		end;
		task.delay(x or 4, function()
			if bD == J then
				Q(RD, .25, { GroupTransparency = 1, Position = UDim2.new(.5, 0, 0, 44) });
				task.delay(.3, function()
					if bD == J then
						RD.Visible = false;
					end;
				end);
			end;
		end);
	end;
	local o_ = l("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			Visible = false,
			Active = true,
			ZIndex = 60,
		}, v);
	local l_ = l("CanvasGroup", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.new(1, -40, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = E.white,
			GroupTransparency = 1,
			ZIndex = 61,
		}, o_);
	e(l_, 14);
	n(l_, E.yellow, 2);
	l("UISizeConstraint", { MaxSize = Vector2.new(320, math.huge) }, l_);
	local e_ = l("UIScale", { Scale = .8 }, l_);
	l("UIPadding", {
		PaddingTop = UDim.new(0, 14),
		PaddingBottom = UDim.new(0, 14),
		PaddingLeft = UDim.new(0, 14),
		PaddingRight = UDim.new(0, 14),
	}, l_);
	l("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, l_);
	local n_ = D6(l_, "", 15, E.text, Enum.Font.GothamBold);
	local Q_ = D6(l_, "", 12, E.muted, Enum.Font.Gotham);
	local A_ = l("Frame", { Size = UDim2.new(1, 0, 0, 38), BackgroundTransparency = 1, LayoutOrder = i(l_) }, l_);
	l("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, A_);
	local L_ = l("TextButton", {
			Size = UDim2.new(.5, -4, 1, 0),
			BackgroundColor3 = E.yellow,
			Text = "Batal",
			TextColor3 = E.text,
			Font = Enum.Font.GothamBold,
			TextSize = 13,
			LayoutOrder = 1,
			AutoButtonColor = false,
		}, A_);
	e(L_, 10);
	local H_ = l("TextButton", {
			Size = UDim2.new(.5, -4, 1, 0),
			BackgroundColor3 = E.red,
			Text = "",
			TextColor3 = E.white,
			Font = Enum.Font.GothamBold,
			TextSize = 13,
			LayoutOrder = 2,
			AutoButtonColor = false,
		}, A_);
	e(H_, 10);
	local O_, M_, y_ = 0, nil, nil;
	local function g_()
		local U = O_;
		Q(o_, .18, { BackgroundTransparency = 1 });
		Q(l_, .18, { GroupTransparency = 1 });
		Q(e_, .18, { Scale = .85 });
		task.delay(.2, function()
			if O_ == U then
				o_.Visible = false;
			end;
		end);
	end;
	function Y6.ask(U, B, x, E, J)
		O_ = O_ + 1;
		n_.Text, Q_.Text, H_.Text = U, B, x;
		M_, y_ = E, J;
		o_.Visible = true;
		o_.BackgroundTransparency, l_.GroupTransparency, e_.Scale = 1, 1, .8;
		Q(o_, .2, { BackgroundTransparency = .5 });
		Q(l_, .2, { GroupTransparency = 0 });
		Q(e_, .32, { Scale = 1 }, o[1], o[2]);
	end;
	H_.Activated:Connect(function()
		local U = M_;
		M_ = nil;
		g_();
		if U then
			U();
		end;
	end);
	L_.Activated:Connect(function()
		local U = y_;
		M_, y_ = nil, nil;
		g_();
		if U then
			U();
		end;
	end);
	local i_;
	local function I_(U, B)
		U.InputBegan:Connect(function(U)
			if i_ then
				return;
			end;
			local x = U.UserInputType;
			if x == Enum.UserInputType.MouseButton1 or x == Enum.UserInputType.Touch then
				i_ = {
						input = U,
						cfg = B,
						sx = U.Position.X,
						sy = U.Position.Y,
						moved = false,
						touch = (x == Enum.UserInputType.Touch),
					};
				if B.onStart then
					B.onStart();
				end;
			end;
		end);
	end;
	table.insert(y6, X.InputChanged:Connect(function(U)
		local B = i_;
		if not B then
			return;
		end;
		if (B.touch and U == B.input) or ((not B.touch) and U.UserInputType == Enum.UserInputType.MouseMovement) then
			local x, E = U.Position.X - B.sx, U.Position.Y - B.sy;
			if not B.moved and (x * x + E * E) > 36 then
				B.moved = true;
			end;
			if B.moved then
				B.cfg.onMove(x, E);
			end;
		end;
	end));
	table.insert(y6, X.InputEnded:Connect(function(U)
		local B = i_;
		if B and ((U == B.input or ((not B.touch) and U.UserInputType == Enum.UserInputType.MouseButton1))) then
			i_ = nil;
			if B.cfg.onEnd then
				B.cfg.onEnd(B.moved);
			end;
		end;
	end));
	local F_;
	I_(w, { onStart = function()
			F_ = N;
		end, onMove = function(U, B)
			local x = I();
			N = Vector2.new(math.clamp(F_.X + U, 0, math.max(0, x.X - t.X)), math.clamp(F_.Y + B, 0, math.max(0, x.Y - t.Y)));
			Z();
		end });
	local D_ = l("TextButton", {
			Size = UDim2.fromOffset(26, 26),
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -2, 1, -2),
			BackgroundTransparency = 1,
			Text = "",
			ZIndex = 50,
			AutoButtonColor = false,
		}, v);
	local W_ = {};
	for U, B in ipairs({
		{ 18, 18 },
		{ 12, 18 },
		{ 18, 12 },
		{ 6, 18 },
		{ 12, 12 },
		{ 18, 6 },
	}) do
		local x = l("Frame", {
				Size = UDim2.fromOffset(3, 3),
				Position = UDim2.fromOffset(B[1], B[2]),
				BackgroundColor3 = E.yellowDark,
				BorderSizePixel = 0,
				ZIndex = 51,
			}, D_);
		e(x, 2);
		table.insert(W_, x);
	end;
	D_.MouseEnter:Connect(function()
		for U, B in ipairs(W_) do
			Q(B, .12, { BackgroundColor3 = E.text });
		end;
	end);
	D_.MouseLeave:Connect(function()
		for U, B in ipairs(W_) do
			Q(B, .12, { BackgroundColor3 = E.yellowDark });
		end;
	end);
	local t_;
	I_(D_, { onStart = function()
			t_ = t;
		end, onMove = function(U, B)
			local x = I();
			local E = math.min(720, math.max(300, (x.X - N.X) - 4));
			local J = math.min(820, math.max(340, (x.Y - N.Y) - 4));
			t = Vector2.new(math.clamp(t_.X + U, 300, E), math.clamp(t_.Y + B, 340, J));
			Z();
		end });
	local function N_(U)
		local B = I();
		return Vector2.new(math.clamp(U.X, 32, math.max(32, B.X - 32)), math.clamp(U.Y, 32, math.max(32, B.Y - 32)));
	end;
	local function c_()
		if D.minimized or not D.ready or D.busy then
			return;
		end;
		D.minimized, D.busy = true, true;
		if not D.bubbleMoved then
			z = N_(Vector2.new(N.X + 30, N.Y + 30));
		end;
		J_();
		Q(v, .28, { GroupTransparency = 1, Position = UDim2.fromOffset(z.X, z.Y) }, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
		Q(k, .28, { Scale = .15 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
		task.delay(.3, function()
			v.Visible = false;
			jD.Visible = true;
			B_.Scale = 0;
			Q(B_, .4, { Scale = 1 }, o[1], o[2]);
			D.busy = false;
		end);
	end;
	local function z_()
		if not D.minimized or D.busy then
			return;
		end;
		D.minimized, D.busy = false, true;
		local U = I();
		N = Vector2.new(math.clamp(z.X - 30, 8, math.max(8, (U.X - t.X) - 8)), math.clamp(z.Y - 30, 8, math.max(8, (U.Y - t.Y) - 8)));
		Q(B_, .15, { Scale = 0 });
		v.Size = UDim2.fromOffset(t.X, t.Y);
		v.Position = UDim2.fromOffset(z.X, z.Y);
		k.Scale, v.GroupTransparency, v.Visible = .15, 1, true;
		Q(v, .36, { GroupTransparency = 0, Position = UDim2.fromOffset(N.X + t.X / 2, N.Y + t.Y / 2) });
		Q(k, .42, { Scale = 1 }, o[1], o[2]);
		task.delay(.18, function()
			jD.Visible = false;
		end);
		task.delay(.45, function()
			D.busy = false;
		end);
	end;
	local X_;
	I_(jD, { onStart = function()
			X_ = z;
		end, onMove = function(U, B)
			D.bubbleMoved = true;
			z = N_(Vector2.new(X_.X + U, X_.Y + B));
			J_();
		end, onEnd = function(U)
			if not U then
				z_();
			end;
		end });
	m.Activated:Connect(c_);
	function U.fadeOut(U)
		Q(k, .25, { Scale = .85 });
		Q(v, .25, { GroupTransparency = 1 });
		Q(B_, .2, { Scale = 0 });
		task.delay(.3, U);
	end;
	C.Activated:Connect(function()
		Y6.ask("Tutup GUI?", "Semua fitur akan berhenti dan GUI dihapus. Lanjutkan?", "Lanjut", function()
			Y6.ask("Konfirmasi terakhir", "Ini MENUTUP TOTAL program. Untuk menampilkan lagi harus eksekusi script ulang. Yakin?", "Tutup Total", function()
				Y6.closeAll();
			end);
		end);
	end);
	table.insert(y6, X.InputBegan:Connect(function(U, B)
		if not B and (D.ready and U.KeyCode == g.ToggleKey) then
			if D.minimized then
				z_();
			else
				c_();
			end;
		end;
	end));
	function U.refresh()
		for U, B in ipairs(x) do
			pcall(B);
		end;
	end;
	Y6.refreshUI = U.refresh;
	task.spawn(function()
		while g6 do
			O6();
			o6.Text = M6.status or "";
			n6.Text = (("Inv %s/%d  |  Tangkap %d  |  Fav %d  |  Jual %d")):format(tostring(M6.inv or "?"), g.MaxInventory, M6.caught, M6.fav, M6.sold);
			local B = A6.farm and E.green or E.gray;
			B6.BackgroundColor3 = B;
			E_.BackgroundColor3 = A6.farm and E.green or E.gray;
			U.refresh();
			task.wait(.5);
		end;
	end);
	task.spawn(function()
		while g6 do
			Y.Position = UDim2.new(-0.3, 0, -0.4, 0);
			if v.Visible and not D.minimized then
				Q(Y, 1.1, { Position = UDim2.new(1.3, 0, -0.4, 0) }, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
			end;
			task.wait(6);
		end;
	end);
	local v_;
	hD(function(U)
		r.Image = U;
		Q(r, .4, { ImageTransparency = 0 });
		jD.Image = U;
		x_.Visible = false;
		if v_ then
			v_.Image = U;
			Q(v_, .4, { ImageTransparency = 0 });
		end;
	end);
	local k_ = l("CanvasGroup", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.fromOffset(280, 220),
			BackgroundColor3 = E.white,
			BorderSizePixel = 0,
			GroupTransparency = 1,
		}, F);
	e(k_, 20);
	n(k_, E.yellow, 2);
	local Z_ = l("UIScale", { Scale = .8 }, k_);
	local u_ = l("Frame", {
			AnchorPoint = Vector2.new(.5, 0),
			Position = UDim2.new(.5, 0, 0, 20),
			Size = UDim2.fromOffset(88, 88),
			BackgroundColor3 = E.yellow,
			BorderSizePixel = 0,
		}, k_);
	e(u_, 44);
	n(u_, E.yellowDark, 3);
	local w_ = l("UIScale", { Scale = 1 }, u_);
	l("TextLabel", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = H,
		Font = Enum.Font.GothamBlack,
		TextSize = 30,
		TextColor3 = E.text,
	}, u_);
	v_ = l("ImageLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Crop,
		}, u_);
	e(v_, 44);
	l("TextLabel", {
		Position = UDim2.fromOffset(0, 118),
		Size = UDim2.new(1, 0, 0, 22),
		BackgroundTransparency = 1,
		Text = M,
		Font = Enum.Font.GothamBlack,
		TextSize = 18,
		TextColor3 = E.text,
	}, k_);
	l("TextLabel", {
		Position = UDim2.fromOffset(0, 139),
		Size = UDim2.new(1, 0, 0, 14),
		BackgroundTransparency = 1,
		Text = y,
		Font = Enum.Font.GothamBold,
		TextSize = 11,
		TextColor3 = E.yellowDark,
	}, k_);
	local Y_ = l("Frame", {
			AnchorPoint = Vector2.new(.5, 0),
			Position = UDim2.new(.5, 0, 0, 168),
			Size = UDim2.fromOffset(200, 6),
			BackgroundColor3 = E.line,
			BorderSizePixel = 0,
		}, k_);
	e(Y_, 3);
	local P_ = l("Frame", { Size = UDim2.fromScale(0, 1), BackgroundColor3 = E.yellow, BorderSizePixel = 0 }, Y_);
	e(P_, 3);
	local G_ = l("TextLabel", {
			Position = UDim2.fromOffset(0, 180),
			Size = UDim2.new(1, 0, 0, 16),
			BackgroundTransparency = 1,
			Text = "",
			Font = Enum.Font.Gotham,
			TextSize = 10,
			TextColor3 = E.muted,
		}, k_);
	(u:Create(w_, TweenInfo.new(.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Scale = 1.08 })):Play();
	task.spawn(function()
		Q(k_, .35, { GroupTransparency = 0 });
		Q(Z_, .45, { Scale = 1 }, o[1], o[2]);
		local B = {
				{ (("Akun %s - mode %s")):format(d.Name, U6), .2 },
				{ ((hookmetamethod and getnamecallmethod)) and "Fitur executor lengkap" or "Fitur executor terbatas", .35 },
				{ I6 and "Minigame & state game ditemukan" or "Minigame ditemukan (mode GUI)", .7 },
				{ "Menyiapkan tampilan...", 1 },
			};
		for U, B in ipairs(B) do
			G_.Text = B[1];
			Q(P_, .4, { Size = UDim2.fromScale(B[2], 1) });
			task.wait(.5);
		end;
		task.wait(.15);
		Q(k_, .3, { GroupTransparency = 1 });
		Q(Z_, .3, { Scale = 1.12 });
		task.wait(.3);
		k_:Destroy();
		Z();
		v.Visible = true;
		CD(1, true);
		U.refresh();
		Q(v, .35, { GroupTransparency = 0 });
		Q(k, .5, { Scale = 1 }, o[1], o[2]);
		D.ready = true;
		Y6.toast((("Masuk sebagai %s. Semua fitur MATI. Nyalakan sesuai kebutuhan.")):format(U6), x6 and "ok" or "info", 5);
	end);
	function U.destroy()
		pcall(function()
			F:Destroy();
		end);
	end;
	return U;
end;
local U_ = jD();
local function B_()
	g6 = false;
	A6.farm, A6.sellOn = false, false;
	pcall(VD.disable);
	pcall(s6);
	if i6 then
		pcall(i6.SetHolding, i6, false);
	end;
	for U, B in ipairs(y6) do
		pcall(function()
			B:Disconnect();
		end);
	end;
	if N[x.g2o] then
		N[x.g2o].handler = nil;
	end;
	pcall(U_.destroy);
	N[x.g0a] = nil;
end;
function Y6.closeAll()
	U_.fadeOut(B_);
end;
N[x.g0a] = { Destroy = B_ };
task.spawn(function()
	pcall(BD);
end);
q("loaded v" .. (g.Version .. ". Semua fitur mati. Minimize/restore:"), g.ToggleKey.Name);
