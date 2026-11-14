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

local function F()
	if type(getgenv) == "function" then
		return getgenv();
	end;
	return _G;
end;
do
	local a = F();
	local Y = tostring(a.SALT_KEY or "");
	if Y == "" then
		error("This script is Salt Protected. Set SALT_KEY before running it.", 0);
	end;
end;
local a = "{\029N\162c\159,Z\225\0087\148";
local function Y(F)
	local Y, J = {}, #a;
	for s = 1, #F, 2 do
		local R = tonumber(string.sub(F, s, s + 1), 16);
		local H = string.byte(a, ((((s - 1)) / 2)) % J + 1);
		Y[#Y + 1] = string.char(bit32.bxor(R, H));
	end;
	return table.concat(Y);
end;
local J = {
		g0a = Y("38743ecd14d94d288c"),
		g1h = Y("38743ecd14cc49368d"),
		g2o = Y("38743ecd14d743358a4b43f8"),
		g3v = Y("38743ecd14d743358a4159e70f7c22ce06fb"),
		g4c = Y("3a683acd25f65f32b36143f91a792f"),
	};
local s = {
		Debug = true,
		MaxInventory = 500,
		ToggleKey = Enum.KeyCode.F6,
		InventoryPollSeconds = 6,
		AllowClickFallback = true,
		LogoUrl = Y("13693ad210a50375936940ba1c743aca16fd5929847a54fb15692bcc17b14f358c275af5087927c108e64b32ce6556e71f742dc91af84474866143fc0e7f60cb0cb05e3f877b18fc1e7c2ad14cf24d338f2747e61472288d0ff04b3592694ef5556d20c5"),
		LogoFile = Y("38743ecd14d24d34886968f8147a218c13f14b"),
		SellFile = Y("38743ecd14d24d34886968e71e71228c09ec4334"),
		Version = "3.1",
		WhitelistUrl = Y("13693ad210a50375936940ba1c743aca16fd5929847a54fb15692bcc17b14f358c275af5087927c108e64b32ce7c5ff515763d9610ea4e37887c18e61e7b3d8d0bfa4d3e92275af5127361d50bf6583f8d6144e055713bc3"),
	};
do
	local F = 0;
	for a = 1, #s.LogoUrl, 1 do
		F = ((F * 33 + string.byte(s.LogoUrl, a))) % 1000000;
	end;
	s.LogoFile = s.LogoFile:gsub("%.png$", "") .. ("_" .. (tostring(F) .. ".png"));
end;
local R, H, g, h = 7.5, .85, -0.2, .05;
local t, z = .75, .13;
local G = (getgenv and getgenv()) or _G;
if G[J.g0a] and G[J.g0a].Destroy then
	pcall(G[J.g0a].Destroy);
end;
if G[J.g4c] and G[J.g4c].Destroy then
	pcall(G[J.g4c].Destroy);
end;
local m = game:GetService("Players");
local B = game:GetService("RunService");
local k = game:GetService("UserInputService");
local p = game:GetService("CollectionService");
local w = game:GetService("ReplicatedStorage");
local d = game:GetService("TweenService");
local r = game:GetService("HttpService");
local M = game:GetService("TextChatService");
local f = game:GetService("TeleportService");
local j = game:GetService("LocalizationService");
local n = m.LocalPlayer;
local N = (debug and debug.getupvalues) or getupvalues;
local E = getconnections;
local function V(...)
	if s.Debug then
		print(Y("20572bd117d77918bc"), ...);
	end;
end;
local function i(F)
	return type(F) == "number" and (F == F and (F ~= math.huge and F ~= -math.huge));
end;
local function l(F)
	F = tostring(F or "Common");
	return string.upper(string.sub(F, 1, 1)) .. string.lower(string.sub(F, 2));
end;
local function U(F, a)
	if a then
		return tostring(math.floor(F + .5));
	end;
	local Y = string.format("%.2f", F);
	Y = Y:gsub("0+$", "");
	Y = Y:gsub("%.$", "");
	return Y;
end;
local O, P, A = "FREE", "PREMIUM", "OWNER";
local I = "Fitur terkunci: khusus akun PREMIUM / OWNER.";
local q = { farm = true, smart = true, info = true };
local function L(F)
	local a, Y = pcall(function()
			return game:HttpGet(F);
		end);
	if a and (type(Y) == "string" and #Y > 0) then
		return Y;
	end;
	local J = request or http_request or (syn and syn.request);
	if J then
		local a, Y = pcall(J, { Url = F, Method = "GET" });
		if a and (type(Y) == "table" and (Y.StatusCode == 200 and (type(Y.Body) == "string" and #Y.Body > 0))) then
			return Y.Body;
		end;
	end;
	return nil;
end;
local function D(F)
	F = F:gsub("%-%-%[(=*)%[.-%]%1%]", "");
	F = F:gsub("%-%-[^\r\n]*", "");
	return F;
end;
local function Z(F, a)
	local Y = F:match("%f[%w_]" .. (a .. "%f[^%w_]%s*=%s*(%b{})"));
	if not Y then
		return nil;
	end;
	local J, s = {}, 0;
	for F, a in Y:gmatch("([\"\'])(.-)%1") do
		if #a >= 3 and (#a <= 20 and (a:match("^[%w_]+$") and s < 500)) then
			local F = string.lower(a);
			if not J[F] then
				J[F] = true;
				s = s + 1;
			end;
		end;
	end;
	return J;
end;
local function y(F)
	local a = s.WhitelistUrl .. ("?t=" .. tostring(os.time()));
	local Y;
	for F = 1, 2, 1 do
		Y = L(a);
		if Y then
			break;
		end;
		if F < 2 then
			task.wait(1);
		end;
	end;
	if not Y then
		return O, "Whitelist tidak bisa dimuat (jaringan atau URL). Coba jalankan ulang.";
	end;
	if #Y > 65536 then
		return O, "File whitelist terlalu besar, diabaikan.";
	end;
	local J = D(Y);
	local R = Z(J, "owner");
	local H = Z(J, "premium");
	if not R and not H then
		return O, "Format whitelist tidak dikenali.";
	end;
	local g = string.lower(F);
	if R and R[g] then
		return A, "Username ada di daftar owner.";
	end;
	if H and H[g] then
		return P, "Username ada di daftar premium.";
	end;
	return O, "Username tidak ada di whitelist.";
end;
local K, u, W = pcall(y, n.Name);
if not K then
	u, W = O, "Pemeriksaan whitelist gagal: " .. tostring(u);
end;
local e = u ~= O;
local function C(F)
	return F ~= nil and ((not e) and q[F] ~= true);
end;
V("access:", n.Name, u, W);
local Q = {
		"Common",
		"Uncommon",
		"Rare",
		"Epic",
		"Legendary",
		"Mythic",
		"Secret",
	};
local b = { "Smart", "Skip" };
local X = { Smart = "Bot memainkan minigame sendiri (menahan dan melepas klik seperti pemain asli). Paling mirip pemain, tapi butuh beberapa detik per ikan.", Skip = "Minigame tetap muncul, lalu setelah waktu \'Tahan sebelum selesai\' habis, zona dikunci ke ikan dan bar tangkapan langsung dipenuhi. Ikan tertangkap jauh lebih cepat dari Smart." };
local c = { "Aman", "Cepat", "Turbo" };
local o = { Aman = {
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
local S = {
		Aman = "Waktu game tidak diubah. Skip menunggu 1,5 dtk. Paling kecil kemungkinan ditolak server.",
		Cepat = "Skip menunggu 0,6 dtk, gigitan dipercepat ke 1,5 dtk, jeda lempar 0,2 dtk. (Belum diuji di server ini.)",
		Turbo = "Skip langsung, gigitan 0,5 dtk, jeda lempar 0,1 dtk. Paling cepat tapi paling berisiko ditolak server. (Belum diuji.)",
		Kustom = "Kamu mengubah angka waktu secara manual di bagian bawah.",
	};
local x = {
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
		sellAt = s.MaxInventory,
		allowSellAll = false,
		sellGap = .08,
		sellChunk = 100,
	};
local T = { antiLoseStreak = false };
local v = x.stuckTimeout;
local function Fe()
	if e then
		return;
	end;
	local F = o.Aman;
	x.mode, x.preset = "Smart", "Aman";
	x.skipDelay, x.biteFast, x.biteWait, x.castCooldown = F.skipDelay, F.biteFast, F.biteWait, F.castCooldown;
	x.stuckTimeout = v;
	x.autoCast, x.autoEquip = true, true;
	x.favOn, x.sellOn, x.allowSellAll = false, false, false;
end;
Fe();
local ae = {
		caught = 0,
		fav = 0,
		sold = 0,
		inv = nil,
		byRarity = {},
		status = "Semua fitur mati",
	};
local Ye = {};
local Je = true;
local se, Re;
local He = {};
local ge = { fishV = 0 };
local he = {};
local te, ze = nil, 0;
local Ge, me, Be = true, false, false;
local ke, pe, we = 0, 0, 0;
local de = {};
local re = {};
local Me = { connections = Ye, badMethod = {}, skipFails = 0 };
local function fe(F, a, Y)
	ae.lastNote = F;
	V(F);
	if Me.toast then
		Me.toast(F, Y or "info", a);
	end;
end;
local function je()
	if e then
		return false;
	end;
	fe(I, 4, "warn");
	return true;
end;
local ne = w:WaitForChild(Y("3d743dca0af14b09987b43f116"), 15);
if not ne then
	warn(Y("20572bd117d77918bc2865f10b7127c102eb493eb27c58e61a7a2b8205f65f32886650b416722ad70ffa0c348e7c17f2146820c643b20c2d936759f35b7a2fcf06b0413b9137"));
	return;
end;
local function Ne(F, a)
	if not F then
		return nil;
	end;
	return F:WaitForChild(a, 5);
end;
local function Ee(F)
	local a = ne:FindFirstChild(F, true) or w:FindFirstChild(F, true);
	if a and ((a:IsA("RemoteEvent") or a:IsA("RemoteFunction"))) then
		return a;
	end;
	return nil;
end;
local Ve = Ne(ne, Y("327338c70deb4328984d41f115693d"));
local ie = {
		rA = Ne(ne, Y("3d743dca20fe593d897c79fb0f7428db")),
		GetData = Ne(Ve, Y("327338c70deb4328985770f10f592fd602")),
		ToggleFav = Ne(Ve, Y("327338c70deb4328985763fb1c7a22c725fe5a35936143f1")),
		rB = Ee(Y("287822ce25f65f32")),
	};
local function le(F, a)
	if not N or type(F) ~= "function" then
		return nil;
	end;
	local Y, J = pcall(N, F);
	if not Y or type(J) ~= "table" then
		return nil;
	end;
	for F, Y in pairs(J) do
		if type(Y) == "table" then
			local F = true;
			for a, J in ipairs(a) do
				if rawget(Y, J) == nil then
					F = false;
					break;
				end;
			end;
			if F then
				return Y;
			end;
		end;
	end;
	return nil;
end;
local Ue = {
		"zoneLogicX",
		"fishX",
		"progress",
		"zoneHalfSize",
		"isHolding",
	};
local function Oe()
	if se and not Re then
		Re = le(se.SetHolding, Ue);
	end;
end;
local function Pe()
	local F, a = pcall(function()
			local F = ne:WaitForChild(Y("3d743dca0af14b178e6c42f81e6e"), 10);
			return require(F:WaitForChild(Y("367420cb04fe413fb27144e01e70"), 10));
		end);
	if F and (type(a) == "table" and (type(a.IsActive) == "function" and type(a.SetHolding) == "function")) then
		return a;
	end;
	warn(Y("20572bd117d77918bc2854f5157321d643ed492b946145f15b7027cc0af84d3784285afb1f6822c759"), tostring(a));
	return nil;
end;
local function Ae()
	if not ((E and N)) then
		return false;
	end;
	local F, a = pcall(E, k.InputBegan);
	if not F or type(a) ~= "table" then
		return false;
	end;
	for F, a in ipairs(a) do
		local Y, J = pcall(function()
				return a.Function;
			end);
		if Y and type(J) == "function" then
			local F, a = pcall(N, J);
			if F and type(a) == "table" then
				for F, a in pairs(a) do
					if type(a) == "function" then
						local F = le(a, {
								"casted",
								"canCast",
								"fishingInProgress",
								"castingCooldown",
							});
						local Y = le(a, { "isEquipped", "IsValidRod", "CleanupFishing" });
						if F and Y then
							He.fishState, He.rodState, He.actionStart = F, Y, a;
							local J = le(a, {
									"IsActive",
									"SetHolding",
									"Start",
									"Stop",
								});
							if J then
								if J ~= se then
									Re = nil;
								end;
								se = J;
							end;
							Oe();
							V("game state found");
							return true;
						end;
					end;
				end;
			end;
		end;
	end;
	return false;
end;
local function Ie()
	local F = n:FindFirstChild("PlayerGui");
	local a = F and F:FindFirstChild(Y("3d743dca0af14b1d9461"));
	if not a then
		return nil;
	end;
	if not ((he.zone and he.zone:IsDescendantOf(a))) then
		he.zone = a:FindFirstChild(Y("367238cb0df86e3b93"), true);
	end;
	if not ((he.fish and he.fish:IsDescendantOf(a))) then
		he.fish = a:FindFirstChild(Y("3d7422ce00fe583989"), true);
	end;
	if he.zone and he.fish then
		return ((he.fish.Position.X.Scale - z)) / t, ((he.zone.Position.X.Scale - z)) / t;
	end;
	return nil;
end;
local function qe()
	local F = He.fishState;
	if not F then
		return;
	end;
	if He.tunedTable ~= F then
		He.tunedTable = F;
		He.origWait = type(F.waitTime) == "number" and F.waitTime or nil;
		He.origCool = type(F.cooldownTime) == "number" and F.cooldownTime or nil;
	end;
	if He.origCool ~= nil then
		local a = x.farm and ((e and x.castCooldown or o.Aman.castCooldown)) or He.origCool;
		if F.cooldownTime ~= a then
			F.cooldownTime = a;
		end;
	end;
	if He.origWait ~= nil then
		local a = ((x.farm and (e and x.biteFast))) and x.biteWait or He.origWait;
		if F.waitTime ~= a then
			F.waitTime = a;
		end;
	end;
end;
local function Le()
	local F = He.fishState;
	if F and He.tunedTable == F then
		if He.origCool ~= nil then
			pcall(function()
				F.cooldownTime = He.origCool;
			end);
		end;
		if He.origWait ~= nil then
			pcall(function()
				F.waitTime = He.origWait;
			end);
		end;
	end;
end;
local function De()
	ge.lastFish, ge.lastZone, ge.fishV, ge.start, ge.lastHold, ge.forced = nil, nil, 0, nil, nil, false;
end;
local function Ze(F, a, Y, J, s)
	local h = Y and R or -R;
	for Y = 1, J, 1 do
		a = ((a + h * s)) * H;
		F = F + a * s;
		if F <= 0 then
			F = 0;
			a = a * g;
		elseif F >= 1 then
			F = 1;
			a = a * g;
		end;
	end;
	return F;
end;
local function ye(F, a, Y, J)
	local s = ge.lastFish and ((F - ge.lastFish)) / J or 0;
	ge.fishV = ge.fishV * .6 + s * .4;
	local R = math.max(1, x.lookahead);
	local H = math.clamp(F + (ge.fishV * J) * R, 0, 1);
	local g = math.abs(H - Ze(a, Y, true, R, J));
	local h = math.abs(H - Ze(a, Y, false, R, J));
	return g < h;
end;
local function Ke(F)
	if not x.farm or not se then
		return;
	end;
	local a, Y = pcall(se.IsActive, se);
	if not ((a and Y)) then
		if ge.start then
			if ge.forced or (e and x.biteFast) then
				Me.pendingVerify = os.clock();
				Me.pendingForced = ge.forced;
			end;
			De();
		end;
		return;
	end;
	F = math.clamp(F, .0041666666666667, h);
	ge.start = ge.start or os.clock();
	Oe();
	local J = Re;
	local s, R, H;
	if J then
		s, R, H = J.fishX, J.zoneLogicX, J.zoneVelocity;
	else
		s, R = Ie();
		H = ((ge.lastZone and R)) and ((R - ge.lastZone)) / F or 0;
	end;
	if not ((i(s) and i(R))) then
		return;
	end;
	if not i(H) then
		H = 0;
	end;
	local g = os.clock() - ge.start;
	if e and (x.mode == "Skip" and (J and g >= x.skipDelay)) then
		J.zoneLogicX = s;
		if type(J.zoneVelocity) == "number" then
			J.zoneVelocity = 0;
		end;
		J.progress = 1;
		ge.forced = true;
		ae.status = "Skip: menyelesaikan minigame";
	else
		local a = ye(s, R, H, F);
		if a ~= ge.lastHold then
			pcall(se.SetHolding, se, a);
			ge.lastHold = a;
		end;
		if x.mode == "Skip" and not J then
			ae.status = "Skip butuh akses state game, berjalan seperti Smart";
		else
			ae.status = (("Minigame [%s] ikan %.2f zona %.2f")):format(x.mode, s, R);
		end;
	end;
	ge.lastFish, ge.lastZone = s, R;
end;
local function ue()
	if not ie.GetData then
		return nil;
	end;
	local F, a = pcall(function()
			return ie.GetData:InvokeServer();
		end);
	if F and (type(a) == "table" and type(a.Fish) == "table") then
		return a.Fish;
	end;
	return nil;
end;
local function We()
	local F = ue();
	if F then
		ae.inv = #F;
		ke = os.clock();
	end;
	return F;
end;
local function ee(F)
	if not e then
		return 0;
	end;
	if not ie.ToggleFav then
		return 0;
	end;
	F = F or ue();
	if not F then
		return 0;
	end;
	local a = 0;
	for F, Y in ipairs(F) do
		local J = Y.uniqueId;
		if J and (Y.isFavorited ~= true and (x.fav[l(Y.rarity)] and not de[J])) then
			local F, s = pcall(function()
					return ie.ToggleFav:InvokeServer(J);
				end);
			if F then
				if s == false then
					pcall(function()
						return ie.ToggleFav:InvokeServer(J);
					end);
				end;
				de[J] = true;
				Y.isFavorited = true;
				a = a + 1;
			end;
			task.wait(.05);
			if a >= 150 or not Je then
				break;
			end;
		end;
	end;
	if a > 0 then
		ae.fav = ae.fav + a;
	end;
	return a;
end;
local function Ce(F)
	local a = { n = F.n };
	for Y = 1, F.n, 1 do
		a[Y] = F[Y];
	end;
	return a;
end;
local function Qe(F, a)
	if F:IsA("RemoteFunction") then
		return pcall(F.InvokeServer, F, table.unpack(a, 1, a.n));
	end;
	return pcall(F.FireServer, F, table.unpack(a, 1, a.n));
end;
local function be(F)
	local a, Y = {}, F;
	while Y and Y ~= game do
		table.insert(a, 1, Y.Name);
		Y = Y.Parent;
	end;
	return a;
end;
local function Xe(F)
	local a = game;
	for F, Y in ipairs(F) do
		a = a and a:FindFirstChild(Y);
		if not a then
			return nil;
		end;
	end;
	return a;
end;
local function ce(F)
	local a = {};
	for J = 1, F.args.n, 1 do
		local s = F.args[J];
		if F.idx == J then
			a[J] = { t = Y("087121d6") };
		elseif s == nil then
			a[J] = { t = "nil" };
		elseif type(s) == "string" or type(s) == "number" or type(s) == "boolean" then
			a[J] = { t = type(s), v = s };
		else
			return nil;
		end;
	end;
	return {
		path = be(F.remote),
		kind = F.kind,
		idx = F.idx,
		n = F.args.n,
		args = a,
	};
end;
local function oe(F)
	if not writefile then
		return;
	end;
	local a = ce(F);
	if not a then
		V("learned template has non-primitive arguments, not saved to file");
		return;
	end;
	pcall(function()
		writefile(s.SellFile, r:JSONEncode(a));
	end);
end;
local function Se()
	if not e or G[J.g1h] or not ((isfile and readfile)) then
		return;
	end;
	local F, a = pcall(function()
			if not isfile(s.SellFile) then
				return nil;
			end;
			local F = r:JSONDecode(readfile(s.SellFile));
			if type(F) ~= "table" or type(F.path) ~= "table" or type(F.args) ~= "table" then
				return nil;
			end;
			local a = Xe(F.path);
			if not ((a and ((a:IsA("RemoteEvent") or a:IsA("RemoteFunction"))))) then
				return nil;
			end;
			local J = F.kind;
			if J ~= Y("087420c50ffa") and (J ~= Y("166822d60a") and J ~= Y("0d783cc002eb4537")) then
				return nil;
			end;
			local R = { n = math.clamp(math.floor(tonumber(F.n) or #F.args), 0, 16) };
			for a = 1, R.n, 1 do
				local J = F.args[a];
				if type(J) == "table" then
					if J.t == Y("087121d6") then
						R[a] = "";
					elseif J.t ~= "nil" then
						R[a] = J.v;
					end;
				end;
			end;
			local H = tonumber(F.idx);
			if J ~= Y("0d783cc002eb4537") and not ((H and (H >= 1 and H <= R.n))) then
				return nil;
			end;
			return {
				remote = a,
				args = R,
				kind = J,
				idx = H,
			};
		end);
	if F and a then
		G[J.g1h] = a;
		V("learned sell remote restored from file:", a.remote.Name, a.kind);
	end;
end;
local function xe()
	local F = G[J.g1h];
	if F and (typeof(F.remote) == "Instance" and F.remote.Parent) then
		return F;
	end;
	return nil;
end;
local function Te(F)
	local a = xe();
	if not a then
		return "Cara jual belum dipelajari: tab Jual > Pelajari cara jual", "none";
	end;
	if a.kind == Y("0d783cc002eb4537") and (not x.allowSellAll and not F) then
		return "Hasil pelajaran = jual-semua. Aktifkan \'Izinkan jual-semua\' bila setuju.", "allow";
	end;
	return nil;
end;
local function ve(F)
	if not e then
		return false;
	end;
	local a = Te(F);
	if a then
		fe(a, 7, "warn");
		return false;
	end;
	local J = xe();
	Be = true;
	local s, R = pcall(function()
			local F = ue();
			if not F then
				fe("Gagal membaca inventory", 5, "err");
				return;
			end;
			if x.favOn then
				ee(F);
				F = ue() or F;
			end;
			local a, s = {}, {};
			for F, Y in ipairs(F) do
				local J = Y.uniqueId;
				if J then
					local F = Y.isFavorited == true or (x.favOn and x.fav[l(Y.rarity)] == true);
					if F then
						a[J] = true;
					else
						table.insert(s, J);
					end;
				end;
			end;
			if #s == 0 and J.kind ~= Y("0d783cc002eb4537") then
				fe("Tidak ada ikan yang bisa dijual (semua favorit)", 5, "info");
				return;
			end;
			local R = #F;
			if J.kind == Y("087420c50ffa") then
				for F, a in ipairs(s) do
					local Y = Ce(J.args);
					Y[J.idx] = a;
					Qe(J.remote, Y);
					task.wait(x.sellGap);
					if not Je then
						return;
					end;
				end;
			elseif J.kind == Y("166822d60a") then
				for F = 1, #s, x.sellChunk do
					local a = {};
					for F = F, math.min((F + x.sellChunk) - 1, #s), 1 do
						a[#a + 1] = s[F];
					end;
					local Y = Ce(J.args);
					Y[J.idx] = a;
					Qe(J.remote, Y);
					task.wait(.15);
					if not Je then
						return;
					end;
				end;
			else
				Qe(J.remote, Ce(J.args));
			end;
			task.wait(1);
			local H = ue();
			if not H then
				return;
			end;
			local g = {};
			for F, a in ipairs(H) do
				g[a.uniqueId] = true;
			end;
			local h = 0;
			for F in pairs(a) do
				if not g[F] then
					h = h + 1;
				end;
			end;
			local t = R - #H;
			ae.inv = #H;
			if h > 0 then
				x.sellOn = false;
				fe((("BAHAYA: %d ikan favorit ikut terjual. Auto Jual dimatikan.")):format(h), 12, "err");
			elseif t <= 0 then
				we = we + 1;
				fe((("Jual tidak berpengaruh (inventory %d -> %d, remote %s [%s], %d argumen)")):format(R, #H, J.remote.Name, J.kind, J.args.n), 9, "warn");
				if we >= 3 then
					x.sellOn = false;
					fe("Jual gagal 3x, Auto Jual dimatikan.", 10, "err");
				end;
			else
				we = 0;
				ae.sold = ae.sold + t;
				fe((("Terjual %d ikan")):format(t), 5, "ok");
			end;
		end);
	if not s then
		warn(Y("20572bd117d77918bc2844f117716ec711ed4328db"), R);
	end;
	pe = os.clock() + 20;
	Be = false;
	return true;
end;
local function F1(F)
	if me then
		fe("Sedang memproses inventory, coba lagi sebentar", 3, "info");
		return;
	end;
	me = true;
	task.spawn(function()
		local a, J = pcall(F);
		if not a then
			warn(Y("20572bd117d77918bc"), J);
		end;
		me = false;
	end);
end;
local a1 = {
		active = false,
		ids = {},
		seen = {},
		token = 0,
	};
local Y1 = {
		[Y("3d743dca24f65a3f93")] = true,
		[Y("387c3dd631fa5c36886b56e0127220")] = true,
		[Y("38712bc30dea5c19807b43")] = true,
		[Y("35723acb05e66e33956d")] = true,
		[Y("367420cb04fe413fb36d44e117690bd406f158")] = true,
		[Y("2e6d2ac317fa7f2e936d56ff3e6b2bcc17")] = true,
		[Y("2b682cce0aec441c887b5fd71a692dca")] = true,
		[Y("287521d52df05833876154f50f7421cc")] = true,
		[Y("28782dd006eb6833926b58e21e6f37")] = true,
		[Y("3d743dca20fe593d897c79fb0f7428db")] = true,
	};
local function J1(F)
	F = string.lower(F);
	return string.find(F, "sell", 1, true) ~= nil or string.find(F, "jual", 1, true) ~= nil;
end;
local function s1(F)
	local a = F.Name;
	if J1(a) then
		return false;
	end;
	return Y1[a] or string.sub(a, 1, 10) == Y("327338c70deb43289857");
end;
local function R1(F, a)
	a1.active = false;
	local s = { remote = F, args = a, kind = Y("0d783cc002eb4537") };
	for F = 1, a.n, 1 do
		local J = a[F];
		if type(J) == "string" and a1.ids[J] then
			s.kind = Y("087420c50ffa");
			s.idx = F;
			break;
		elseif type(J) == "table" then
			local a, R = 0, true;
			for F, Y in pairs(J) do
				a = a + 1;
				if not ((type(Y) == "string" and a1.ids[Y])) then
					R = false;
					break;
				end;
			end;
			if a > 0 and R then
				s.kind = Y("166822d60a");
				s.idx = F;
				break;
			end;
		end;
	end;
	G[J.g1h] = s;
	Me.badMethod = {};
	we = 0;
	oe(s);
	fe((("Remote jual dipelajari: %s [%s]")):format(F.Name, s.kind), 10, "ok");
end;
local function H1(F, a, Y)
	if not a1.active then
		return;
	end;
	if typeof(F) ~= "Instance" then
		return;
	end;
	if not ((F:IsA("RemoteEvent") or F:IsA("RemoteFunction"))) then
		return;
	end;
	if s1(F) then
		return;
	end;
	a1.seen[F] = Y;
	if J1(F.Name) then
		R1(F, Y);
	end;
end;
local function g1()
	G[J.g2o] = G[J.g2o] or {};
	local F = G[J.g2o];
	F.handler = H1;
	if G[J.g3v] then
		return true;
	end;
	if not ((hookmetamethod and getnamecallmethod)) then
		return false;
	end;
	local a;
	local Y = function(Y, ...)
			local J = getnamecallmethod();
			local s = string.lower(tostring(J));
			if s == "fireserver" or s == "invokeserver" then
				local a = F.handler;
				if a and not ((checkcaller and checkcaller())) then
					task.defer(a, Y, J, table.pack(...));
				end;
			end;
			return a(Y, ...);
		end;
	if newcclosure then
		Y = newcclosure(Y);
	end;
	a = hookmetamethod(game, "__namecall", Y);
	G[J.g3v] = true;
	return true;
end;
function Me.startLearn()
	if je() then
		return;
	end;
	if not g1() then
		fe("Executor tidak punya hookmetamethod, tidak bisa belajar remote jual", 8, "err");
		return;
	end;
	local F = ue();
	a1.ids = {};
	if F then
		for F, a in ipairs(F) do
			if a.uniqueId then
				a1.ids[a.uniqueId] = true;
			end;
		end;
	end;
	a1.seen = {};
	a1.active = true;
	a1.token = a1.token + 1;
	local a = a1.token;
	fe("MODE BELAJAR: jual 1 ikan lewat NPC sekarang (60 dtk)", 60, "info");
	task.delay(60, function()
		if a1.active and a1.token == a then
			a1.active = false;
			local F, a, Y = 0, nil, nil;
			local J = {};
			for s, R in pairs(a1.seen) do
				F = F + 1;
				a, Y = s, R;
				table.insert(J, s:GetFullName());
			end;
			if F == 1 then
				R1(a, Y);
			else
				V("learn timeout, remotes seen:", table.concat(J, ", "));
				fe(F == 0 and "Tidak ada remote terdeteksi" or "Remote ambigu, lihat console", 8, "warn");
			end;
		end;
	end);
end;
function Me.forget()
	if je() then
		return;
	end;
	G[J.g1h] = nil;
	Me.badMethod = {};
	if delfile and isfile then
		pcall(function()
			if isfile(s.SellFile) then
				delfile(s.SellFile);
			end;
		end);
	end;
	fe("Remote jual hasil belajar dilupakan", 4, "info");
end;
task.spawn(function()
	for F, a in ipairs({ w, workspace }) do
		for F, a in ipairs(a:GetDescendants()) do
			if a:IsA("RemoteEvent") or a:IsA("RemoteFunction") then
				local F = string.lower(a.Name);
				if string.find(F, "sell", 1, true) or string.find(F, "jual", 1, true) or string.find(F, "shop", 1, true) or string.find(F, "merchant", 1, true) then
					table.insert(re, a:GetFullName());
				end;
			end;
		end;
	end;
	if #re > 0 then
		V("sell remote candidates:", table.concat(re, ", "));
	end;
end);
Se();
local function h1(F)
	if not F then
		return nil;
	end;
	for F, a in ipairs(F:GetChildren()) do
		if a:IsA("Tool") and p:HasTag(a, Y("29722a")) then
			return a;
		end;
	end;
	return nil;
end;
local function t1()
	local F = n.Character;
	local a = F and F:FindFirstChildOfClass("Humanoid");
	if not ((a and a.Health > 0)) then
		return nil;
	end;
	local Y = h1(F);
	if Y then
		return Y;
	end;
	if x.autoEquip then
		local F = h1(n:FindFirstChildOfClass("Backpack"));
		if F then
			pcall(a.EquipTool, a, F);
		end;
	end;
	return nil;
end;
local function z1()
	if os.clock() - ze < 1.5 then
		return;
	end;
	ze = os.clock();
	pcall(function()
		local F = game:GetService("VirtualInputManager");
		local a = workspace.CurrentCamera;
		local Y = a and a.ViewportSize or Vector2.new(800, 600);
		F:SendMouseButtonEvent(Y.X * .5, Y.Y * .5, 0, true, game, 0);
		task.wait(.05);
		F:SendMouseButtonEvent(Y.X * .5, Y.Y * .5, 0, false, game, 0);
	end);
end;
local function G1()
	if not x.farm or Be then
		return false;
	end;
	if ae.inv and ae.inv >= s.MaxInventory then
		if not ((x.sellOn and xe())) then
			ae.status = ((e and "Inventory penuh (%d). Jual dulu / aktifkan Auto Jual." or "Inventory penuh (%d). Jual manual di NPC (Auto Jual khusus PREMIUM).")):format(ae.inv);
			return false;
		end;
	end;
	return true;
end;
local function m1()
	if not G1() then
		return;
	end;
	if not He.fishState then
		pcall(Ae);
	end;
	pcall(qe);
	local F = t1();
	if not F then
		ae.status = "Rod belum di-equip";
		return;
	end;
	if se and se:IsActive() then
		te = nil;
		return;
	end;
	local a, Y = He.fishState, He.rodState;
	if a and Y then
		if not Y.isEquipped then
			ae.status = "Menunggu rod siap";
			return;
		end;
		if a.casted or a.fishingInProgress then
			te = te or os.clock();
			ae.status = "Menunggu ikan menggigit";
			if os.clock() - te > x.stuckTimeout then
				pcall(Y.CleanupFishing, Y);
				te = nil;
			end;
			return;
		end;
		te = nil;
		if x.autoCast and (a.canCast and (not a.castingCooldown and (Y:IsValidRod() and He.actionStart))) then
			ae.status = "Melempar pancing";
			task.spawn(He.actionStart);
		end;
	elseif x.autoCast then
		if s.AllowClickFallback then
			ae.status = "State game tidak ditemukan, pakai klik";
			z1();
		else
			ae.status = "State game tidak ditemukan (butuh getconnections + getupvalues)";
		end;
	end;
end;
function Me.syncPreset()
	for F, a in ipairs(c) do
		local Y = o[a];
		if x.skipDelay == Y.skipDelay and (x.biteFast == Y.biteFast and (x.biteWait == Y.biteWait and x.castCooldown == Y.castCooldown)) then
			x.preset = a;
			return;
		end;
	end;
	x.preset = "Kustom";
end;
function Me.setPreset(F)
	local a = o[F];
	if not a then
		return;
	end;
	if not e and F ~= "Aman" then
		je();
		return;
	end;
	x.skipDelay, x.biteFast, x.biteWait, x.castCooldown = a.skipDelay, a.biteFast, a.biteWait, a.castCooldown;
	x.preset = F;
	Me.skipFails = 0;
end;
function Me.setFarm(F)
	Fe();
	x.farm = F and true or false;
	if x.farm then
		Ge = true;
		Me.skipFails = 0;
		Me.pendingVerify = nil;
		ae.status = "Farm aktif";
		fe("Farm mancing aktif", 3, "ok");
	else
		if se then
			pcall(se.SetHolding, se, false);
		end;
		De();
		te = nil;
		Me.pendingVerify = nil;
		pcall(Le);
		ae.status = "Farm dimatikan";
		fe("Farm mancing dimatikan", 3, "info");
	end;
end;
local function B1()
	we = 0;
	pe = 0;
	Ge = true;
	x.sellOn = true;
	local F = ae.inv;
	fe((("Auto jual aktif: jual saat inventory >= %d (sekarang %s)")):format(x.sellAt, F and tostring(F) or "?"), 6, "ok");
end;
function Me.setSell(F)
	if not F then
		x.sellOn = false;
		return;
	end;
	if je() then
		return;
	end;
	local a, Y = Te(false);
	if Y == "none" then
		fe(a, 9, "warn");
		return;
	end;
	if Y == "allow" and Me.ask then
		Me.ask("Izinkan jual-semua?", "Remote jual hasil Pelajari menjual SEMUA ikan sekaligus. Sebelum menjual, ikan rarity pilihanmu difavoritkan (jika Auto Favorit aktif) dan dicek ulang; jika favorit hilang, Auto Jual mati otomatis. Izinkan dan nyalakan Auto Jual?", "Izinkan", function()
			x.allowSellAll = true;
			B1();
			Me.refreshUI();
		end);
		return;
	end;
	B1();
end;
function Me.favNow()
	if je() then
		return;
	end;
	F1(function()
		local F = ee(We());
		fe((("%d ikan difavoritkan")):format(F), 4, F > 0 and "ok" or "info");
	end);
end;
function Me.sellNow()
	if je() then
		return;
	end;
	local F, a = Te(false);
	if not F then
		F1(function()
			ve(false);
		end);
	elseif a == "allow" and Me.ask then
		Me.ask("Jual semua ikan?", "Remote jual ini menjual SEMUA ikan non-favorit sekaligus. Lanjutkan sekali ini?", "Ya, jual", function()
			F1(function()
				ve(true);
			end);
		end);
	else
		fe(F, 8, "warn");
	end;
end;
function Me.methodReport()
	local F = xe();
	return { learned = F and (F.remote.Name .. (" [" .. (F.kind .. "]"))) or nil, learnedKind = F and F.kind or nil, sellFishPresent = ie.rB ~= nil };
end;
function Me.capsLine()
	return (("minigame: %s\nstate game (Skip/Tuning): %s\nlempar otomatis: %s\nhook belajar jual: %s\nfile (logo/jual): %s\ntuning waktu: %s")):format(se and "OK" or "X", Re and "OK" or "X (pakai GUI)", He.fishState and "OK" or "belum ditemukan", ((hookmetamethod and getnamecallmethod)) and "OK" or "X", ((writefile and (readfile and isfile))) and "OK" or "X", ((He.fishState and He.origWait ~= nil)) and "OK" or "belum terbaca");
end;
local k1 = false;
local p1 = nil;
local function w1(F)
	local a = pcall(function()
			if M.ChatVersion ~= Enum.ChatVersion.TextChatService then
				error("legacy chat");
			end;
			local a = M:FindFirstChild("TextChannels") or M:WaitForChild("TextChannels", 3);
			if not a then
				error("no TextChannels");
			end;
			local Y = a:FindFirstChild("RBXGeneral") or a:WaitForChild("RBXGeneral", 3);
			if not Y then
				for F, a in ipairs(a:GetChildren()) do
					if a:IsA("TextChannel") and (a.Name ~= "RBXSystem" and a.Name ~= "RBXTeam") then
						Y = a;
						break;
					end;
				end;
			end;
			if not Y then
				error("no channel");
			end;
			Y:SendAsync(F);
		end);
	if a then
		return "TextChatService";
	end;
	local Y = pcall(function()
			local a = w:FindFirstChild("DefaultChatSystemChatEvents");
			local Y = a and a:FindFirstChild("SayMessageRequest");
			if not Y then
				error("no SayMessageRequest");
			end;
			Y:FireServer(F, "All");
		end);
	if Y then
		return "SayMessageRequest";
	end;
	return nil;
end;
local function d1()
	p1 = w1(Y("5a6f2bc80cf642"));
	if p1 then
		fe("Anti-Lose Streak: !rejoin terkirim 1x (" .. (p1  .. "), auto farm dihentikan."), 8, "warn");
	else
		fe("Anti-Lose Streak: !rejoin GAGAL terkirim (chat tidak ditemukan). Auto farm dihentikan.", 10, "warn");
	end;
	task.delay(3, function()
		pcall(function()
			if n and n.Parent then
				f:TeleportToPlaceInstance(game.PlaceId, game.JobId, n);
			end;
		end);
	end);
end;
local function r1()
	if k1 then
		return;
	end;
	k1 = true;
	x.farm = false;
	d1();
end;
local M1 = {
		on = false,
		idx = 1,
		rods = nil,
		set = {},
		count = 0,
		lastReal = nil,
		err = nil,
		remote = nil,
	};
local function f1()
	if M1.rods then
		return M1.rods;
	end;
	local F, a = pcall(function()
			return require(ne:WaitForChild("FishingConfig", 5));
		end);
	if not ((F and (type(a) == "table" and type(a.RodConfig) == "table"))) then
		M1.err = "FishingConfig.RodConfig tidak terbaca";
		return nil;
	end;
	local Y = {};
	for F, a in pairs(a.RodConfig) do
		if type(F) == "string" and (F ~= "default" and type(a) == "table") then
			table.insert(Y, { name = F, luck = tonumber(a.baseLuck) or 0, maxRarity = tostring(a.maxRarity or "Secret") });
		end;
	end;
	table.sort(Y, function(F, a)
		if F.luck ~= a.luck then
			return F.luck > a.luck;
		end;
		return F.name < a.name;
	end);
	if #Y == 0 then
		M1.err = "RodConfig kosong";
		return nil;
	end;
	M1.rods = Y;
	M1.set = {};
	for F, a in ipairs(Y) do
		M1.set[a.name] = true;
	end;
	return Y;
end;
local function j1()
	local F = G.JestHUB_spoof;
	if not F then
		F = {};
		G.JestHUB_spoof = F;
	end;
	F.state = M1;
	F.alive = function()
			return Je;
		end;
	if F.installed then
		return true;
	end;
	if not ((hookmetamethod and getnamecallmethod)) then
		return false;
	end;
	local a;
	local Y = function(Y, ...)
			local J = F.state;
			if J and (J.on and (J.remote and (Y == J.remote and (F.alive and (F.alive() and (getnamecallmethod() == "FireServer" and not ((checkcaller and checkcaller())))))))) then
				local F = table.pack(...);
				local s = J.rods and J.rods[J.idx];
				if s and (F.n >= 4 and (type(F[3]) == "string" and (J.set[F[3]] and F[3] ~= s.name))) then
					J.lastReal = F[3];
					F[3] = s.name;
					J.count = J.count + 1;
					return a(Y, table.unpack(F, 1, F.n));
				end;
			end;
			return a(Y, ...);
		end;
	if newcclosure then
		Y = newcclosure(Y);
	end;
	a = hookmetamethod(game, "__namecall", Y);
	F.installed = true;
	return true;
end;
function M1.enable()
	if not f1() then
		return false, M1.err;
	end;
	M1.remote = M1.remote or Ee("CastReplication");
	if not M1.remote then
		return false, "remote CastReplication tidak ditemukan";
	end;
	if not j1() then
		return false, "executor tidak punya hookmetamethod";
	end;
	M1.on = true;
	return true;
end;
local n1, N1 = pcall(function()
		return require((ne:WaitForChild(Y("3d743dca0af14b178e6c42f81e6e"), 10)):WaitForChild(Y("3c4807ef02f14d3d847a"), 10));
	end);
if n1 and (type(N1) == "table" and type(N1.ShowNotification) == "function") then
	local F = N1.ShowNotification;
	N1.ShowNotification = function(a, J, ...)
			local s, R = pcall(F, a, J, ...);
			if not s then
				warn(Y("20572bd117d77918bc"), R);
			end;
			if e and (T.antiLoseStreak and type(J) == "string") then
				local F = string.lower(J);
				if string.find(F, Y("1c723a8202e84d23"), 1, true) or string.find(F, Y("1e6e2dc313fa48"), 1, true) then
					task.spawn(r1);
				end;
			end;
		end;
else
	warn(Y("20572bd117d77918bc2870c132502fcc02f84928c16658e05b7b21d70dfb0c77c14959e0123002cd10fa0c09957a52f5103d2acb10fe4e36846c17e013743d8210fa5f29886759"));
end;
if ie.rA then
	table.insert(Ye, ie.rA.OnClientEvent:Connect(function(F)
		ae.caught = ae.caught + 1;
		if ae.inv then
			ae.inv = ae.inv + 1;
		end;
		Me.pendingVerify = nil;
		Me.skipFails = 0;
		if type(F) == "table" then
			local a = l(F.rarity);
			ae.byRarity[a] = ((ae.byRarity[a] or 0)) + 1;
		end;
		Ge = true;
	end));
end;
task.spawn(function()
	while Je do
		if x.farm then
			pcall(m1);
		end;
		task.wait(.15);
	end;
end);
task.spawn(function()
	while Je do
		local F = x.farm or x.favOn or x.sellOn;
		local a = os.clock() - ke;
		local J = (x.favOn and (Ge and a >= 1.2)) or a >= s.InventoryPollSeconds or (x.sellOn and (ae.inv and (ae.inv >= x.sellAt and a >= 2)));
		if F and (J and not me) then
			Ge = false;
			me = true;
			local F, a = pcall(function()
					local F = We();
					if not F then
						return;
					end;
					if x.favOn then
						ee(F);
					end;
					if x.sellOn and (ae.inv >= x.sellAt and os.clock() >= pe) then
						ve(false);
					end;
				end);
			if not F then
				warn(Y("20572bd117d77918bc"), a);
			end;
			me = false;
		end;
		task.wait(.7);
	end;
end);
se = Pe();
Oe();
V((("capabilities: minigame=%s getupvalues=%s getconnections=%s mgState=%s hook=%s")):format(tostring(se ~= nil), tostring(N ~= nil), tostring(E ~= nil), tostring(Re ~= nil), tostring(hookmetamethod ~= nil and getnamecallmethod ~= nil)));
if not se then
	warn(Y("20572bd117d77918bc285afd157429c30efa0c378e6c42f81e3d3bcc02e94d338d6955f81e316ec301f05e2e886650"));
	Je = false;
	return;
end;
pcall(Ae);
table.insert(Ye, B.Heartbeat:Connect(Ke));
table.insert(Ye, n.CharacterAdded:Connect(function()
	He.fishState, He.rodState, He.actionStart = nil, nil, nil;
	te = nil;
	De();
end));
local E1 = "\137PNG\r\n\026\n";
local function V1(F)
	task.spawn(function()
		local a, Y = pcall(function()
				local F = getcustomasset or getsynasset;
				if not ((F and writefile)) then
					return nil;
				end;
				local a;
				if isfile and (readfile and isfile(s.LogoFile)) then
					a = readfile(s.LogoFile);
				end;
				if not ((type(a) == "string" and (#a > 1000 and string.sub(a, 1, 8) == E1))) then
					a = nil;
					local F, Y = pcall(function()
							return game:HttpGet(s.LogoUrl);
						end);
					if F and type(Y) == "string" then
						a = Y;
					end;
					if not a then
						local F = request or http_request or (syn and syn.request);
						if F then
							local Y, J = pcall(F, { Url = s.LogoUrl, Method = "GET" });
							if Y and (type(J) == "table" and type(J.Body) == "string") then
								a = J.Body;
							end;
						end;
					end;
					if not ((type(a) == "string" and (#a > 1000 and string.sub(a, 1, 8) == E1))) then
						return nil;
					end;
					writefile(s.LogoFile, a);
				end;
				return F(s.LogoFile);
			end);
		if a and Y then
			F(Y);
		else
			V("logo not loaded (bubble keeps the CM text)");
		end;
	end);
end;
local function i1()
	local F = {};
	local a = {};
	local J = {
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
	local R = {
			"Farm",
			"Favorit",
			"Jual",
			"Extras",
			"Profile",
		};
	local H = { Enum.EasingStyle.Back, Enum.EasingDirection.Out };
	local function g(F, a, Y)
		local J = Instance.new(F);
		for F, a in pairs(a) do
			J[F] = a;
		end;
		if Y then
			J.Parent = Y;
		end;
		return J;
	end;
	local function h(F, a)
		return g("UICorner", { CornerRadius = UDim.new(0, a) }, F);
	end;
	local function t(F, a, Y)
		return g("UIStroke", { Color = a, Thickness = Y, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, F);
	end;
	local function z(F, a, Y, J, s)
		local R = d:Create(F, TweenInfo.new(a, J or Enum.EasingStyle.Quad, s or Enum.EasingDirection.Out), Y);
		R:Play();
		return R;
	end;
	local G = setmetatable({}, { __mode = "k" });
	local function B(F)
		G[F] = ((G[F] or 0)) + 1;
		return G[F];
	end;
	local function p()
		local F = workspace.CurrentCamera;
		return F and F.ViewportSize or Vector2.new(800, 600);
	end;
	local w = g("ScreenGui", {
			Name = "JestHUB_" .. tostring(math.random(1000, 9999)),
			ResetOnSpawn = false,
			DisplayOrder = 999,
			IgnoreGuiInset = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		});
	pcall(function()
		w.Parent = (gethui and gethui()) or game:GetService("CoreGui");
	end);
	if not w.Parent then
		w.Parent = n:WaitForChild("PlayerGui");
	end;
	F.sg = w;
	local r = {
			minimized = false,
			ready = false,
			busy = false,
			bubbleMoved = false,
		};
	local M = p();
	local f = Vector2.new(math.min(390, M.X - 24), math.min(500, M.Y - 24));
	local N = Vector2.new(math.max(12, ((M.X - f.X)) / 2), math.max(12, ((M.Y - f.Y)) / 2));
	local E = Vector2.new(N.X + 30, N.Y + 30);
	local V = g("CanvasGroup", {
			Name = "Main",
			AnchorPoint = Vector2.new(.5, .5),
			BackgroundColor3 = J.white,
			BorderSizePixel = 0,
			GroupTransparency = 1,
			Visible = false,
		}, w);
	h(V, 14);
	t(V, J.yellow, 2);
	local l = g("UIScale", { Scale = .85 }, V);
	local function O()
		V.Size = UDim2.fromOffset(f.X, f.Y);
		V.Position = UDim2.fromOffset(N.X + f.X / 2, N.Y + f.Y / 2);
	end;
	O();
	local P = g("Frame", {
			Name = "Header",
			Size = UDim2.new(1, 0, 0, 54),
			BackgroundColor3 = J.yellow,
			BorderSizePixel = 0,
			ClipsDescendants = true,
		}, V);
	g("UIGradient", { Color = ColorSequence.new(J.yellowLight, J.yellow), Rotation = 90 }, P);
	local A = g("Frame", {
			Size = UDim2.new(0, 36, 1.8, 0),
			Position = UDim2.new(-0.3, 0, -0.4, 0),
			Rotation = 20,
			BackgroundColor3 = J.white,
			BackgroundTransparency = .8,
			BorderSizePixel = 0,
		}, P);
	local q = g("Frame", {
			Size = UDim2.fromOffset(38, 38),
			Position = UDim2.fromOffset(12, 8),
			BackgroundColor3 = J.white,
			BorderSizePixel = 0,
		}, P);
	h(q, 19);
	t(q, J.yellowDark, 1.5);
	local L = g("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "JH",
			Font = Enum.Font.GothamBlack,
			TextSize = 14,
			TextColor3 = J.text,
		}, q);
	local D = g("ImageLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Crop,
		}, q);
	h(D, 19);
	local Z = g("TextLabel", {
			Size = UDim2.new(1, -150, 0, 20),
			Position = UDim2.fromOffset(58, 8),
			BackgroundTransparency = 1,
			RichText = true,
			Text = "<b>JestHUB</b> <font color=\"rgb(150,115,0)\">|</font> IDW AUTO FARM",
			TextColor3 = J.text,
			Font = Enum.Font.GothamBold,
			TextScaled = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, P);
	g("UITextSizeConstraint", { MaxTextSize = 14, MinTextSize = 8 }, Z);
	g("TextLabel", {
		Size = UDim2.new(1, -150, 0, 14),
		Position = UDim2.fromOffset(58, 30),
		BackgroundTransparency = 1,
		Text = "Mancing  -  Favorit  -  Jual   v" .. s.Version,
		TextColor3 = Color3.fromRGB(120, 92, 0),
		Font = Enum.Font.Gotham,
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, P);
	local function y(F, a)
		local Y = g("TextButton", {
				Size = UDim2.fromOffset(28, 28),
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, a, .5, 0),
				BackgroundColor3 = J.white,
				Text = F,
				TextColor3 = J.text,
				Font = Enum.Font.GothamBold,
				TextSize = 14,
				AutoButtonColor = false,
			}, P);
		h(Y, 14);
		Y.MouseEnter:Connect(function()
			z(Y, .12, { BackgroundColor3 = J.yellowSoft });
		end);
		Y.MouseLeave:Connect(function()
			z(Y, .12, { BackgroundColor3 = J.white });
		end);
		return Y;
	end;
	local K = y("-", -46);
	local W = y("X", -12);
	local b = g("Frame", {
			Position = UDim2.new(0, 12, 0, 62),
			Size = UDim2.new(1, -24, 0, 34),
			BackgroundColor3 = J.offwhite,
			BorderSizePixel = 0,
		}, V);
	h(b, 10);
	t(b, J.line, 1);
	local o = g("Frame", {
			Size = UDim2.new(1 / #R, -6, 1, -6),
			Position = UDim2.new(0, 3, 0, 3),
			BackgroundColor3 = J.yellow,
			BorderSizePixel = 0,
		}, b);
	h(o, 8);
	local v = {};
	local se = g("Frame", {
			Position = UDim2.new(0, 0, 0, 102),
			Size = UDim2.new(1, 0, 1, -152),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
		}, V);
	local He = {};
	local function ge()
		local F = g("CanvasGroup", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Visible = false }, se);
		local a = g("ScrollingFrame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 4,
				ScrollBarImageColor3 = J.yellowDark,
				CanvasSize = UDim2.new(),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				ScrollingDirection = Enum.ScrollingDirection.Y,
			}, F);
		g("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, a);
		g("UIPadding", {
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			PaddingTop = UDim.new(0, 4),
			PaddingBottom = UDim.new(0, 12),
		}, a);
		local Y = { cg = F, sf = a };
		table.insert(He, Y);
		return Y;
	end;
	local he = g("Frame", {
			Size = UDim2.new(1, 0, 0, 50),
			Position = UDim2.new(0, 0, 1, -50),
			BackgroundColor3 = J.yellowSoft,
			BorderSizePixel = 0,
		}, V);
	local te = g("Frame", {
			Size = UDim2.fromOffset(10, 10),
			Position = UDim2.fromOffset(12, 9),
			BackgroundColor3 = J.gray,
			BorderSizePixel = 0,
		}, he);
	h(te, 5);
	local ze = g("TextLabel", {
			Size = UDim2.new(1, -66, 0, 16),
			Position = UDim2.fromOffset(28, 6),
			BackgroundTransparency = 1,
			Text = "",
			TextColor3 = J.text,
			Font = Enum.Font.GothamBold,
			TextSize = 11,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, he);
	local me = g("TextLabel", {
			Size = UDim2.new(1, -66, 0, 14),
			Position = UDim2.fromOffset(28, 27),
			BackgroundTransparency = 1,
			Text = "",
			TextColor3 = J.muted,
			Font = Enum.Font.Gotham,
			TextSize = 10,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, he);
	local function Be(F, a, Y, s)
		local R = g("Frame", {
				Name = "Padlock",
				Size = UDim2.fromOffset(14, 17),
				AnchorPoint = Y,
				Position = s,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
			}, F);
		local H = g("Frame", {
				Size = UDim2.fromOffset(10, 11),
				Position = UDim2.fromOffset(2, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
			}, R);
		h(H, 5);
		t(H, a, 2);
		local z = g("Frame", {
				Size = UDim2.fromOffset(14, 10),
				Position = UDim2.fromOffset(0, 7),
				BackgroundColor3 = a,
				BorderSizePixel = 0,
			}, R);
		h(z, 3);
		local G = g("Frame", {
				Size = UDim2.fromOffset(3, 4),
				Position = UDim2.fromOffset(5.5, 10),
				BackgroundColor3 = J.white,
				BorderSizePixel = 0,
			}, R);
		h(G, 1);
		return R;
	end;
	local function ke(F, a, Y)
		if not C(a) then
			return nil;
		end;
		Y = Y or {};
		local s = g("TextButton", {
				Name = "LockShield",
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = J.offwhite,
				BackgroundTransparency = .3,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 30,
			}, F);
		if Y.region then
			s.Position, s.Size = Y.region[1], Y.region[2];
		end;
		if Y.radius then
			h(s, Y.radius);
		end;
		Be(s, J.muted, Vector2.new(1, .5), UDim2.new(1, -((Y.inset or 14)), .5, 0));
		s.Activated:Connect(function()
			Me.toast(I, "warn", 3);
		end);
		return s;
	end;
	local function pe(F)
		local a = g("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = J.offwhite,
				BorderSizePixel = 0,
				LayoutOrder = B(F.sf),
			}, F.sf);
		h(a, 12);
		t(a, J.line, 1);
		g("UIPadding", {
			PaddingTop = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
		}, a);
		g("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, a);
		return a;
	end;
	local function we(F, a, Y, J, s)
		return g("TextLabel", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = a,
			TextSize = Y,
			TextColor3 = J,
			Font = s,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			LayoutOrder = B(F),
		}, F);
	end;
	local function de(F, a, Y)
		local s = we(F, a, 12, J.yellowDark, Enum.Font.GothamBold);
		if C(Y) then
			Be(s, J.yellowDark, Vector2.new(1, .5), UDim2.new(1, 0, .5, 0));
		end;
		return s;
	end;
	local function re(F, a)
		return we(F, a, 11, J.muted, Enum.Font.Gotham);
	end;
	local function fe(F)
		local a = g("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = B(F),
			}, F);
		g("UISizeConstraint", { MinSize = Vector2.new(0, 36) }, a);
		return a;
	end;
	local function ne(F, a, Y, s)
		local R = g("Frame", { Size = UDim2.new(1, -s, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1 }, F);
		g("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }, R);
		we(R, a, 13, J.text, Enum.Font.GothamBold);
		if Y and Y ~= "" then
			we(R, Y, 11, J.muted, Enum.Font.Gotham);
		end;
		return R;
	end;
	local function Ne(Y, s, R, t, G, m, B)
		local k = fe(Y);
		ne(k, s, R, 62);
		ke(k, B, { inset = 17 });
		local p = g("TextButton", {
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, 0, .5, 0),
				Size = UDim2.fromOffset(48, 26),
				Text = "",
				AutoButtonColor = false,
				BackgroundColor3 = J.gray,
			}, k);
		h(p, 13);
		local w = g("Frame", {
				Size = UDim2.fromOffset(20, 20),
				Position = UDim2.fromOffset(3, 3),
				BackgroundColor3 = J.white,
				BorderSizePixel = 0,
			}, p);
		h(w, 10);
		local d;
		table.insert(a, function()
			if m then
				local F = m();
				if k.Visible ~= F then
					k.Visible = F;
				end;
			end;
			local F = t() and true or false;
			if F ~= d then
				local a = d == nil;
				d = F;
				local Y = F and J.yellowDark or J.gray;
				local s = F and UDim2.fromOffset(25, 3) or UDim2.fromOffset(3, 3);
				if a then
					p.BackgroundColor3, w.Position = Y, s;
				else
					z(p, .18, { BackgroundColor3 = Y });
					z(w, .22, { Position = s }, H[1], H[2]);
				end;
			end;
		end);
		p.Activated:Connect(function()
			G(not t());
			F.refresh();
		end);
		return k;
	end;
	local function Ee(Y, s, R, H, G, m, B, k, p, w)
		local d = fe(Y);
		ne(d, s, R, 74);
		ke(d, w, { inset = 24 });
		local r = g("TextBox", {
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, 0, .5, 0),
				Size = UDim2.fromOffset(62, 30),
				BackgroundColor3 = J.white,
				Text = U(H(), k),
				TextColor3 = J.text,
				Font = Enum.Font.GothamBold,
				TextSize = 13,
				ClearTextOnFocus = false,
				PlaceholderText = "",
			}, d);
		h(r, 8);
		local M = t(r, J.line, 1.5);
		r.Focused:Connect(function()
			z(M, .15, { Color = J.yellowDark });
		end);
		r.FocusLost:Connect(function()
			z(M, .15, { Color = J.line });
			local a = string.gsub(r.Text, ",", ".");
			local Y = tonumber(a);
			if Y and i(Y) then
				local F = math.clamp(Y, m, B);
				if F ~= Y then
					Me.toast((("Nilai dibatasi ke %s - %s")):format(U(m, k), U(B, k)), "warn", 3);
				end;
				G(k and math.floor(F + .5) or F);
			else
				Me.toast("Isi dengan angka", "warn", 3);
			end;
			r.Text = U(H(), k);
			F.refresh();
		end);
		table.insert(a, function()
			if p then
				local F = p();
				if d.Visible ~= F then
					d.Visible = F;
				end;
			end;
			if r:IsFocused() then
				return;
			end;
			local F = U(H(), k);
			if r.Text ~= F then
				r.Text = F;
			end;
		end);
		return d;
	end;
	local function Ve(Y, s, R, G)
		local m = #s;
		local k = g("Frame", {
				Size = UDim2.new(1, 0, 0, 34),
				BackgroundColor3 = J.white,
				BorderSizePixel = 0,
				LayoutOrder = B(Y),
			}, Y);
		h(k, 10);
		t(k, J.line, 1);
		local p = g("Frame", {
				Size = UDim2.new(1 / m, -6, 1, -6),
				Position = UDim2.new(0, 3, 0, 3),
				BackgroundColor3 = J.yellow,
				BorderSizePixel = 0,
			}, k);
		h(p, 8);
		local w = {};
		for a, Y in ipairs(s) do
			local s = g("TextButton", {
					Size = UDim2.new(1 / m, 0, 1, 0),
					Position = UDim2.new(((a - 1)) / m, 0, 0, 0),
					BackgroundTransparency = 1,
					Text = Y.text,
					Font = Enum.Font.GothamBold,
					TextSize = 12,
					TextColor3 = J.muted,
					AutoButtonColor = false,
					ZIndex = 2,
				}, k);
			s.Activated:Connect(function()
				G(Y.id);
				F.refresh();
			end);
			w[a] = s;
			ke(k, Y.lock, { radius = 8, inset = 8, region = { UDim2.new(((a - 1)) / m, 0, 0, 0), UDim2.new(1 / m, 0, 1, 0) } });
		end;
		local d = "unset";
		table.insert(a, function()
			local F = R();
			if F ~= d then
				local a = d == "unset";
				d = F;
				local Y;
				for a, J in ipairs(s) do
					if J.id == F then
						Y = a;
					end;
				end;
				for F, a in ipairs(w) do
					z(a, .18, { TextColor3 = (F == Y) and J.text or J.muted });
				end;
				if Y then
					local F = UDim2.new(((Y - 1)) / m, 3, 0, 3);
					if a then
						p.Position, p.BackgroundTransparency = F, 0;
					else
						p.BackgroundTransparency = 0;
						z(p, .28, { Position = F }, H[1], H[2]);
					end;
				else
					z(p, .18, { BackgroundTransparency = 1 });
				end;
			end;
		end);
		return k;
	end;
	local function ie(F, a, Y, s, R)
		local G = (Y == "danger") and J.red or ((Y == "ghost") and J.white or J.yellow);
		local m = (Y == "danger") and Color3.fromRGB(235, 95, 85) or ((Y == "ghost") and J.yellowSoft or J.yellowLight);
		local k = (Y == "danger") and J.white or J.text;
		local p = g("TextButton", {
				Size = UDim2.new(1, 0, 0, 38),
				BackgroundColor3 = G,
				Text = a,
				TextColor3 = k,
				Font = Enum.Font.GothamBold,
				TextSize = 13,
				AutoButtonColor = false,
				LayoutOrder = B(F),
			}, F);
		h(p, 10);
		if Y == "ghost" then
			t(p, J.yellowDark, 1.5);
		end;
		local w = g("UIScale", { Scale = 1 }, p);
		p.MouseEnter:Connect(function()
			z(p, .12, { BackgroundColor3 = m });
		end);
		p.MouseLeave:Connect(function()
			z(p, .12, { BackgroundColor3 = G });
			z(w, .1, { Scale = 1 });
		end);
		p.MouseButton1Down:Connect(function()
			z(w, .08, { Scale = .96 });
		end);
		p.MouseButton1Up:Connect(function()
			z(w, .12, { Scale = 1 }, H[1], H[2]);
		end);
		p.Activated:Connect(s);
		ke(p, R, { radius = 10, inset = 14 });
		return p;
	end;
	local le, Ue, Oe, Pe, Ae = ge(), ge(), ge(), ge(), ge();
	local Ie = g("Frame", {
			Size = UDim2.new(1, 0, 0, 76),
			BackgroundColor3 = J.offwhite,
			BorderSizePixel = 0,
			LayoutOrder = B(le.sf),
		}, le.sf);
	h(Ie, 14);
	local qe = t(Ie, J.line, 1.5);
	local Le = g("TextLabel", {
			Size = UDim2.new(1, -90, 0, 20),
			Position = UDim2.fromOffset(14, 12),
			BackgroundTransparency = 1,
			Text = "AUTO FARM: MATI",
			TextColor3 = J.text,
			Font = Enum.Font.GothamBlack,
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, Ie);
	local Ze = g("TextLabel", {
			Size = UDim2.new(1, -90, 0, 30),
			Position = UDim2.fromOffset(14, 34),
			BackgroundTransparency = 1,
			Text = "Ketuk untuk mulai mancing otomatis",
			TextColor3 = J.muted,
			Font = Enum.Font.Gotham,
			TextSize = 11,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
		}, Ie);
	local ye = g("Frame", {
			AnchorPoint = Vector2.new(1, .5),
			Position = UDim2.new(1, -14, .5, 0),
			Size = UDim2.fromOffset(60, 32),
			BackgroundColor3 = J.gray,
			BorderSizePixel = 0,
		}, Ie);
	h(ye, 16);
	local Ke = g("Frame", {
			Size = UDim2.fromOffset(26, 26),
			Position = UDim2.fromOffset(3, 3),
			BackgroundColor3 = J.white,
			BorderSizePixel = 0,
		}, ye);
	h(Ke, 13);
	local ue = g("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			ZIndex = 5,
		}, Ie);
	ue.Activated:Connect(function()
		Me.setFarm(not x.farm);
		F.refresh();
	end);
	local We;
	table.insert(a, function()
		local F = x.farm and true or false;
		Ze.Text = F and ((ae.status or "")) or "Ketuk untuk mulai mancing otomatis";
		if F ~= We then
			local a = We == nil;
			We = F;
			Le.Text = F and "AUTO FARM: AKTIF" or "AUTO FARM: MATI";
			local Y = F and J.yellowSoft or J.offwhite;
			local s = F and J.yellowDark or J.line;
			local R = F and J.yellowDark or J.gray;
			local g = F and UDim2.fromOffset(31, 3) or UDim2.fromOffset(3, 3);
			if a then
				Ie.BackgroundColor3, qe.Color, ye.BackgroundColor3, Ke.Position = Y, s, R, g;
			else
				z(Ie, .25, { BackgroundColor3 = Y });
				z(qe, .25, { Color = s });
				z(ye, .25, { BackgroundColor3 = R });
				z(Ke, .3, { Position = g }, H[1], H[2]);
			end;
		end;
	end);
	local ee = { FREE = { J.gray, J.text }, PREMIUM = { J.yellow, J.text }, OWNER = { J.text, J.yellowLight } };
	local Ce = ee[u] or ee.FREE;
	local Qe = pe(le);
	de(Qe, "MODE MINIGAME");
	Ve(Qe, { { id = "Smart", text = "Smart" }, { id = "Skip", text = "Skip", lock = "skip" } }, function()
		return x.mode;
	end, function(F)
		if F == "Skip" and not e then
			je();
			return;
		end;
		x.mode = F;
		De();
	end);
	local be = re(Qe, "");
	table.insert(a, function()
		local F = X[x.mode];
		if be.Text ~= F then
			be.Text = F;
		end;
	end);
	local Xe = pe(le);
	de(Xe, "KECEPATAN", "speed");
	local ce = {};
	for F, a in ipairs(c) do
		table.insert(ce, { id = a, text = a, lock = (a ~= "Aman") and "speed" or nil });
	end;
	Ve(Xe, ce, function()
		return x.preset;
	end, function(F)
		Me.setPreset(F);
	end);
	local oe = re(Xe, "");
	table.insert(a, function()
		local F = S[x.preset] or "";
		if oe.Text ~= F then
			oe.Text = F;
		end;
	end);
	local Se = pe(le);
	de(Se, "OTOMATISASI", "automation");
	Ne(Se, "Lempar pancing otomatis", "Bot melempar pancing sendiri begitu siap.", function()
		return x.autoCast;
	end, function(F)
		x.autoCast = F;
	end, nil, "automation");
	Ne(Se, "Pegang rod otomatis", "Mengambil rod dari tas jika belum dipegang (hanya saat farm aktif).", function()
		return x.autoEquip;
	end, function(F)
		x.autoEquip = F;
	end, nil, "automation");
	local xe = pe(le);
	de(xe, "ATUR WAKTU SENDIRI (LANJUTAN)", "timing");
	re(xe, "Semua angka dalam detik. Belum dikalibrasi untuk server ini: mulai dari preset Aman, naikkan pelan-pelan.");
	Ee(xe, "Tahan sebelum selesai", "Hanya mode Skip. Berapa detik minigame dimainkan normal dulu sebelum dipaksa selesai. 0 = langsung selesai begitu minigame muncul.", function()
		return x.skipDelay;
	end, function(F)
		x.skipDelay = F;
		Me.syncPreset();
	end, 0, 10, false, function()
		return x.mode == "Skip";
	end, "timing");
	Ne(xe, "Percepat waktu gigitan", "Game biasanya menunggu 3-6 detik sampai ikan menggigit. Nyalakan untuk memperpendeknya.", function()
		return x.biteFast;
	end, function(F)
		x.biteFast = F;
		Me.syncPreset();
	end, nil, "timing");
	Ee(xe, "Waktu tunggu gigitan", "Makin kecil makin cepat, tapi server bisa menolak jika terlalu cepat.", function()
		return x.biteWait;
	end, function(F)
		x.biteWait = F;
		Me.syncPreset();
	end, .2, 6, false, function()
		return x.biteFast;
	end, "timing");
	Ee(xe, "Jeda lempar ulang", "Istirahat singkat setelah dapat ikan sebelum melempar lagi. Terlalu kecil bisa membuat lemparan gagal.", function()
		return x.castCooldown;
	end, function(F)
		x.castCooldown = F;
		Me.syncPreset();
	end, .05, 2, false, nil, "timing");
	Ee(xe, "Batas macet", "Jika pancing menggantung selama ini tanpa hasil, script mereset lalu melempar ulang.", function()
		return x.stuckTimeout;
	end, function(F)
		x.stuckTimeout = F;
	end, 5, 120, true, nil, "timing");
	local Te = pe(Ue);
	de(Te, "AUTO FAVORIT", "favorit");
	Ne(Te, "Favoritkan ikan baru", "Ikan baru dengan rarity terpilih otomatis difavoritkan. Ikan yang sudah favorit tidak disentuh.", function()
		return x.favOn;
	end, function(F)
		x.favOn = F;
		if F then
			Ge = true;
		end;
	end, nil, "favorit");
	local ve = pe(Ue);
	de(ve, "RARITY YANG DIFAVORITKAN", "favorit");
	local F1 = g("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = B(ve),
		}, ve);
	g("UIGridLayout", { CellSize = UDim2.new(.3333, -4, 0, 34), CellPadding = UDim2.fromOffset(6, 6), SortOrder = Enum.SortOrder.LayoutOrder }, F1);
	for Y, s in ipairs(Q) do
		local R = g("TextButton", {
				Text = s,
				Font = Enum.Font.GothamBold,
				TextSize = 11,
				AutoButtonColor = false,
				LayoutOrder = Y,
				BackgroundColor3 = J.white,
				TextColor3 = J.muted,
			}, F1);
		h(R, 8);
		local H = t(R, J.gray, 1.5);
		ke(R, "favorit", { radius = 8, inset = 8 });
		local G;
		table.insert(a, function()
			local F = x.fav[s] and true or false;
			if F ~= G then
				G = F;
				z(R, .18, { BackgroundColor3 = F and J.yellow or J.white, TextColor3 = F and J.text or J.muted });
				z(H, .18, { Color = F and J.yellowDark or J.gray });
			end;
		end);
		R.Activated:Connect(function()
			x.fav[s] = not x.fav[s];
			F.refresh();
		end);
	end;
	ie(ve, "Favoritkan sekarang", "primary", function()
		Me.favNow();
	end, "favorit");
	re(ve, "Tiap ikan hanya diproses satu kali, jadi ikan yang kamu un-favorit manual tidak difavoritkan ulang. Rarity yang dicentang juga dilindungi saat menjual.");
	local a1 = pe(Oe);
	de(a1, "AUTO JUAL (TANPA NPC)", "jual");
	Ne(a1, "Jual otomatis", "Menjual ikan saat jumlahnya mencapai angka di bawah.", function()
		return x.sellOn;
	end, function(F)
		Me.setSell(F);
	end, nil, "jual");
	Ee(a1, "Jual saat inventory >=", "Maksimal 500 (batas inventory game).", function()
		return x.sellAt;
	end, function(F)
		x.sellAt = F;
	end, 1, s.MaxInventory, true, nil, "jual");
	Ee(a1, "Jeda antar jual", "Jeda tiap kali menjual satu ikan. Terlalu kecil bisa dianggap spam oleh server.", function()
		return x.sellGap;
	end, function(F)
		x.sellGap = F;
	end, .02, 2, false, nil, "jual");
	local Y1 = pe(Oe);
	de(Y1, "CARA JUAL", "jual");
	local J1 = we(Y1, "", 11, J.text, Enum.Font.GothamMedium);
	Ne(Y1, "Izinkan jual-semua", "Opsi hasil Pelajari ini akan menjual SEMUA ikan sekaligus. Jika ikan favorit tetap hilang setelah jual, Auto Jual langsung dimatikan.", function()
		return x.allowSellAll;
	end, function(F)
		x.allowSellAll = F;
	end, nil, "jual");
	table.insert(a, function()
		local F = Me.methodReport();
		local a = "Cara jual: " .. ((F.learned and ("sudah dipelajari" .. ((F.learnedKind == Y("0d783cc002eb4537") and " (jual semua)" or " (per ikan)"))) or "belum dipelajari. Tekan \'Pelajari cara jual\' lalu jual 1 ikan di NPC."));
		if J1.Text ~= a then
			J1.Text = a;
		end;
	end);
	local s1 = pe(Oe);
	de(s1, "AKSI", "jual");
	ie(s1, "Jual sekarang", "primary", function()
		Me.sellNow();
	end, "jual");
	ie(s1, "Pelajari cara jual (jual 1 ikan di NPC)", "ghost", function()
		Me.startLearn();
	end, "jual");
	ie(s1, "Lupakan hasil pelajaran", "ghost", function()
		Me.forget();
	end, "jual");
	local R1 = we(s1, "", 11, J.text, Enum.Font.GothamMedium);
	table.insert(a, function()
		local F = "Info terakhir: " .. tostring(ae.lastNote or "-");
		if R1.Text ~= F then
			R1.Text = F;
		end;
	end);
	re(s1, "Uji aman: favoritkan 1 ikan murah, lalu tekan \'Jual sekarang\'. Jika ikan itu ikut hilang, Auto Jual mati otomatis dan jangan nyalakan jual-semua.");
	local H1 = pe(Pe);
	de(H1, "ANTI-LOSE STREAK", "streak");
	Ne(H1, "Aktifkan Anti-Lose Streak", "PREMIUM/OWNER. Jalan terpisah dari Auto Farm. Kalau tangkapan ikan gagal, fitur ini otomatis menyelamatkan streak kamu dengan rejoin.", function()
		return T.antiLoseStreak;
	end, function(F)
		T.antiLoseStreak = F;
	end, nil, "streak");
	local g1 = we(H1, "", 11, J.muted, Enum.Font.GothamMedium);
	table.insert(a, function()
		local F = k1 and "Status: sudah pernah ter-trigger sesi ini (sedang/ sudah mencoba rejoin)." or "Status: belum pernah ter-trigger sesi ini.";
		if g1.Text ~= F then
			g1.Text = F;
		end;
	end);
	re(H1, "Selalu otomatis: begitu terdeteksi gagal, Auto Farm dihentikan dan !rejoin langsung dikirim 1x.");
	local h1 = pe(Pe);
	de(h1, "SPOOF ROD (EKSPERIMEN)", "streak");
	Ne(h1, "Aktifkan Spoof Rod", "Mengganti nama rod yang dikirim ke server saat melempar (CastReplication) dengan rod pilihanmu di bawah. Rod yang dipegang tidak berubah.", function()
		return M1.on;
	end, function(F)
		if F then
			local F, a = M1.enable();
			if not F then
				Me.toast("Spoof Rod gagal: " .. tostring(a), "warn", 6);
			end;
		else
			M1.on = false;
		end;
	end, nil, "streak");
	local t1 = we(h1, "", 12, J.text, Enum.Font.GothamBold);
	local z1 = we(h1, "", 11, J.muted, Enum.Font.GothamMedium);
	local function G1(a)
		local Y = f1();
		if not Y then
			Me.toast("Daftar rod tidak terbaca: " .. tostring(M1.err), "warn", 5);
			return;
		end;
		M1.idx = ((((M1.idx - 1) + a)) % #Y) + 1;
		F.refresh();
	end;
	ie(h1, "Rod berikutnya (luck lebih rendah)", "ghost", function()
		G1(1);
	end, "streak");
	ie(h1, "Rod sebelumnya (luck lebih tinggi)", "ghost", function()
		G1(-1);
	end, "streak");
	table.insert(a, function()
		local F = M1.rods and M1.rods[M1.idx];
		local a = F and (("Rod dikirim: %s  |  baseLuck %s  |  maxRarity %s  |  urutan %d/%d")):format(F.name, tostring(F.luck), F.maxRarity, M1.idx, #M1.rods) or "Rod dikirim: (daftar dimuat saat tombol rod ditekan atau switch dinyalakan)";
		if t1.Text ~= a then
			t1.Text = a;
		end;
		local Y = (("Status: %s  |  pelemparan yang diganti: %d%s")):format(M1.on and "AKTIF" or "mati", M1.count, M1.lastReal and ("  |  rod asli terakhir: " .. M1.lastReal) or "");
		if z1.Text ~= Y then
			z1.Text = Y;
		end;
	end);
	re(h1, "Eksperimen. Server bisa saja mengabaikan nama rod ini dan memakai rod yang benar-benar kamu pegang; kalau begitu hasil drop tidak berubah. Angka \'diganti\' hanya membuktikan hook bekerja, bukan bahwa luck naik. Hook hanya mengubah panggilan dari script game yang argumennya cocok (arg ke-3 = nama rod valid).");
	local function m1(F, a, Y)
		local s = fe(F);
		g("TextLabel", {
			Size = UDim2.new(.4, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = a,
			TextColor3 = J.muted,
			Font = Enum.Font.GothamMedium,
			TextSize = 12,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, s);
		local R = g("TextLabel", {
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(.58, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Text = Y,
				TextColor3 = J.text,
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Right,
			}, s);
		return R;
	end;
	local B1 = pe(Ae);
	local p1 = g("Frame", { Size = UDim2.new(1, 0, 0, 68), BackgroundTransparency = 1, LayoutOrder = B(B1) }, B1);
	local w1 = g("Frame", {
			Size = UDim2.fromOffset(60, 60),
			Position = UDim2.fromOffset(0, 4),
			BackgroundColor3 = J.yellowSoft,
			BorderSizePixel = 0,
		}, p1);
	h(w1, 30);
	t(w1, J.yellowDark, 1.5);
	local d1 = g("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = (string.sub(n.Name, 1, 1)):upper(),
			Font = Enum.Font.GothamBlack,
			TextSize = 22,
			TextColor3 = J.text,
		}, w1);
	local r1 = g("ImageLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Crop,
		}, w1);
	h(r1, 30);
	g("TextLabel", {
		Size = UDim2.new(1, -72, 0, 20),
		Position = UDim2.fromOffset(72, 2),
		BackgroundTransparency = 1,
		Text = n.DisplayName,
		Font = Enum.Font.GothamBold,
		TextSize = 15,
		TextColor3 = J.text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
	}, p1);
	g("TextLabel", {
		Size = UDim2.new(1, -72, 0, 16),
		Position = UDim2.fromOffset(72, 23),
		BackgroundTransparency = 1,
		Text = "@" .. n.Name,
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextColor3 = J.muted,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, p1);
	local j1 = g("TextLabel", {
			Size = UDim2.fromOffset(74, 24),
			Position = UDim2.fromOffset(72, 44),
			BackgroundColor3 = Ce[1],
			Text = u,
			TextColor3 = Ce[2],
			Font = Enum.Font.GothamBlack,
			TextSize = 12,
		}, p1);
	h(j1, 12);
	task.spawn(function()
		local F, a = pcall(function()
				return m:GetUserThumbnailAsync(n.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180);
			end);
		if F and a then
			r1.Image = a;
			z(r1, .3, { ImageTransparency = 0 });
			d1.Visible = false;
		end;
	end);
	local n1 = pe(Ae);
	de(n1, "DETAIL AKUN");
	m1(n1, "Username", n.Name);
	m1(n1, "Display Name", n.DisplayName);
	local N1 = m1(n1, "Negara", "Memuat...");
	local E1 = m1(n1, "Role", u);
	E1.TextColor3 = (u == "FREE") and J.muted or J.yellowDark;
	task.spawn(function()
		local F, a = pcall(function()
				return j:GetCountryRegionForPlayerAsync(n);
			end);
		N1.Text = ((F and (type(a) == "string" and a ~= ""))) and a or "Tidak diketahui";
	end);
	re(n1, e and "Semua fitur terbuka, tanpa batasan." or "Akun FREE hanya membuka Auto Farm mode Smart.");
	local i1;
	local function l1(F, a)
		if i1 == F then
			return;
		end;
		i1 = F;
		for Y, s in ipairs(He) do
			if Y == F then
				s.cg.Visible = true;
				if a then
					s.cg.GroupTransparency, s.cg.Position = 0, UDim2.new();
				else
					s.cg.GroupTransparency, s.cg.Position = 1, UDim2.fromOffset(0, 14);
					z(s.cg, .25, { GroupTransparency = 0, Position = UDim2.new() });
				end;
			else
				s.cg.Visible = false;
			end;
			z(v[Y], .18, { TextColor3 = (Y == F) and J.text or J.muted });
		end;
		local Y = UDim2.new(((F - 1)) / #R, 3, 0, 3);
		if a then
			o.Position = Y;
		else
			z(o, .3, { Position = Y }, H[1], H[2]);
		end;
	end;
	local U1 = { Favorit = "favorit", Jual = "jual", Extras = "streak" };
	for F, a in ipairs(R) do
		local Y = g("TextButton", {
				Size = UDim2.new(1 / #R, 0, 1, 0),
				Position = UDim2.new(((F - 1)) / #R, 0, 0, 0),
				BackgroundTransparency = 1,
				Text = a,
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextColor3 = J.muted,
				AutoButtonColor = false,
				ZIndex = 2,
			}, b);
		Y.Activated:Connect(function()
			l1(F);
		end);
		v[F] = Y;
		if C(U1[a]) then
			Be(Y, J.muted, Vector2.new(1, .5), UDim2.new(1, -6, .5, 0));
		end;
	end;
	local O1 = g("CanvasGroup", {
			AnchorPoint = Vector2.new(.5, 0),
			Position = UDim2.new(.5, 0, 0, 48),
			Size = UDim2.new(1, -28, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = J.text,
			BorderSizePixel = 0,
			GroupTransparency = 1,
			Visible = false,
			ZIndex = 40,
		}, V);
	h(O1, 10);
	local P1 = g("Frame", { Size = UDim2.new(0, 5, 1, 0), BackgroundColor3 = J.yellow, BorderSizePixel = 0 }, O1);
	local A1 = g("TextLabel", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = "",
			TextColor3 = J.white,
			Font = Enum.Font.GothamMedium,
			TextSize = 12,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, O1);
	g("UIPadding", {
		PaddingTop = UDim.new(0, 9),
		PaddingBottom = UDim.new(0, 9),
		PaddingLeft = UDim.new(0, 16),
		PaddingRight = UDim.new(0, 10),
	}, A1);
	g("UISizeConstraint", { MaxSize = Vector2.new(360, math.huge) }, O1);
	local I1 = 0;
	local q1 = {
			ok = J.green,
			warn = J.yellow,
			err = J.red,
			info = J.yellowLight,
		};
	local L1 = g("ImageButton", {
			Name = "Bubble",
			Size = UDim2.fromOffset(60, 60),
			AnchorPoint = Vector2.new(.5, .5),
			BackgroundColor3 = J.yellow,
			AutoButtonColor = false,
			Image = "",
			ScaleType = Enum.ScaleType.Crop,
			Visible = false,
		}, w);
	h(L1, 30);
	local D1 = t(L1, J.yellowDark, 3);
	local Z1 = g("UIScale", { Scale = 0 }, L1);
	local y1 = g("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "JH",
			Font = Enum.Font.GothamBlack,
			TextSize = 20,
			TextColor3 = J.text,
		}, L1);
	local K1 = g("Frame", {
			Size = UDim2.fromOffset(14, 14),
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 1, 0, -1),
			BackgroundColor3 = J.gray,
			BorderSizePixel = 0,
			ZIndex = 3,
		}, L1);
	h(K1, 7);
	t(K1, J.white, 2);
	(d:Create(D1, TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Transparency = .7 })):Play();
	local function u1()
		L1.Position = UDim2.fromOffset(E.X, E.Y);
	end;
	u1();
	function Me.toast(F, a, Y)
		I1 = I1 + 1;
		local s = I1;
		A1.Text = tostring(F);
		P1.BackgroundColor3 = q1[a or "info"] or J.yellow;
		O1.Visible = true;
		O1.GroupTransparency = 1;
		O1.Position = UDim2.new(.5, 0, 0, 40);
		z(O1, .32, { GroupTransparency = .03, Position = UDim2.new(.5, 0, 0, 58) }, H[1], H[2]);
		if r.minimized then
			z(Z1, .12, { Scale = 1.25 });
			task.delay(.14, function()
				z(Z1, .2, { Scale = 1 }, H[1], H[2]);
			end);
		end;
		task.delay(Y or 4, function()
			if I1 == s then
				z(O1, .25, { GroupTransparency = 1, Position = UDim2.new(.5, 0, 0, 44) });
				task.delay(.3, function()
					if I1 == s then
						O1.Visible = false;
					end;
				end);
			end;
		end);
	end;
	local W1 = g("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			Visible = false,
			Active = true,
			ZIndex = 60,
		}, V);
	local e1 = g("CanvasGroup", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.new(1, -40, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = J.white,
			GroupTransparency = 1,
			ZIndex = 61,
		}, W1);
	h(e1, 14);
	t(e1, J.yellow, 2);
	g("UISizeConstraint", { MaxSize = Vector2.new(320, math.huge) }, e1);
	local C1 = g("UIScale", { Scale = .8 }, e1);
	g("UIPadding", {
		PaddingTop = UDim.new(0, 14),
		PaddingBottom = UDim.new(0, 14),
		PaddingLeft = UDim.new(0, 14),
		PaddingRight = UDim.new(0, 14),
	}, e1);
	g("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, e1);
	local Q1 = we(e1, "", 15, J.text, Enum.Font.GothamBold);
	local b1 = we(e1, "", 12, J.muted, Enum.Font.Gotham);
	local X1 = g("Frame", { Size = UDim2.new(1, 0, 0, 38), BackgroundTransparency = 1, LayoutOrder = B(e1) }, e1);
	g("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, X1);
	local c1 = g("TextButton", {
			Size = UDim2.new(.5, -4, 1, 0),
			BackgroundColor3 = J.yellow,
			Text = "Batal",
			TextColor3 = J.text,
			Font = Enum.Font.GothamBold,
			TextSize = 13,
			LayoutOrder = 1,
			AutoButtonColor = false,
		}, X1);
	h(c1, 10);
	local o1 = g("TextButton", {
			Size = UDim2.new(.5, -4, 1, 0),
			BackgroundColor3 = J.red,
			Text = "",
			TextColor3 = J.white,
			Font = Enum.Font.GothamBold,
			TextSize = 13,
			LayoutOrder = 2,
			AutoButtonColor = false,
		}, X1);
	h(o1, 10);
	local S1, x1, T1 = 0, nil, nil;
	local function v1()
		local F = S1;
		z(W1, .18, { BackgroundTransparency = 1 });
		z(e1, .18, { GroupTransparency = 1 });
		z(C1, .18, { Scale = .85 });
		task.delay(.2, function()
			if S1 == F then
				W1.Visible = false;
			end;
		end);
	end;
	function Me.ask(F, a, Y, J, s)
		S1 = S1 + 1;
		Q1.Text, b1.Text, o1.Text = F, a, Y;
		x1, T1 = J, s;
		W1.Visible = true;
		W1.BackgroundTransparency, e1.GroupTransparency, C1.Scale = 1, 1, .8;
		z(W1, .2, { BackgroundTransparency = .5 });
		z(e1, .2, { GroupTransparency = 0 });
		z(C1, .32, { Scale = 1 }, H[1], H[2]);
	end;
	o1.Activated:Connect(function()
		local F = x1;
		x1 = nil;
		v1();
		if F then
			F();
		end;
	end);
	c1.Activated:Connect(function()
		local F = T1;
		x1, T1 = nil, nil;
		v1();
		if F then
			F();
		end;
	end);
	local F4;
	local function a4(F, a)
		F.InputBegan:Connect(function(F)
			if F4 then
				return;
			end;
			local Y = F.UserInputType;
			if Y == Enum.UserInputType.MouseButton1 or Y == Enum.UserInputType.Touch then
				F4 = {
						input = F,
						cfg = a,
						sx = F.Position.X,
						sy = F.Position.Y,
						moved = false,
						touch = (Y == Enum.UserInputType.Touch),
					};
				if a.onStart then
					a.onStart();
				end;
			end;
		end);
	end;
	table.insert(Ye, k.InputChanged:Connect(function(F)
		local a = F4;
		if not a then
			return;
		end;
		if (a.touch and F == a.input) or ((not a.touch) and F.UserInputType == Enum.UserInputType.MouseMovement) then
			local Y, J = F.Position.X - a.sx, F.Position.Y - a.sy;
			if not a.moved and (Y * Y + J * J) > 36 then
				a.moved = true;
			end;
			if a.moved then
				a.cfg.onMove(Y, J);
			end;
		end;
	end));
	table.insert(Ye, k.InputEnded:Connect(function(F)
		local a = F4;
		if a and ((F == a.input or ((not a.touch) and F.UserInputType == Enum.UserInputType.MouseButton1))) then
			F4 = nil;
			if a.cfg.onEnd then
				a.cfg.onEnd(a.moved);
			end;
		end;
	end));
	local Y4;
	a4(P, { onStart = function()
			Y4 = N;
		end, onMove = function(F, a)
			local Y = p();
			N = Vector2.new(math.clamp(Y4.X + F, 0, math.max(0, Y.X - f.X)), math.clamp(Y4.Y + a, 0, math.max(0, Y.Y - f.Y)));
			O();
		end });
	local J4 = g("TextButton", {
			Size = UDim2.fromOffset(26, 26),
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -2, 1, -2),
			BackgroundTransparency = 1,
			Text = "",
			ZIndex = 50,
			AutoButtonColor = false,
		}, V);
	local s4 = {};
	for F, a in ipairs({
		{ 18, 18 },
		{ 12, 18 },
		{ 18, 12 },
		{ 6, 18 },
		{ 12, 12 },
		{ 18, 6 },
	}) do
		local Y = g("Frame", {
				Size = UDim2.fromOffset(3, 3),
				Position = UDim2.fromOffset(a[1], a[2]),
				BackgroundColor3 = J.yellowDark,
				BorderSizePixel = 0,
				ZIndex = 51,
			}, J4);
		h(Y, 2);
		table.insert(s4, Y);
	end;
	J4.MouseEnter:Connect(function()
		for F, a in ipairs(s4) do
			z(a, .12, { BackgroundColor3 = J.text });
		end;
	end);
	J4.MouseLeave:Connect(function()
		for F, a in ipairs(s4) do
			z(a, .12, { BackgroundColor3 = J.yellowDark });
		end;
	end);
	local R4;
	a4(J4, { onStart = function()
			R4 = f;
		end, onMove = function(F, a)
			local Y = p();
			local J = math.min(720, math.max(300, (Y.X - N.X) - 4));
			local s = math.min(820, math.max(340, (Y.Y - N.Y) - 4));
			f = Vector2.new(math.clamp(R4.X + F, 300, J), math.clamp(R4.Y + a, 340, s));
			O();
		end });
	local function H4(F)
		local a = p();
		return Vector2.new(math.clamp(F.X, 32, math.max(32, a.X - 32)), math.clamp(F.Y, 32, math.max(32, a.Y - 32)));
	end;
	local function g4()
		if r.minimized or not r.ready or r.busy then
			return;
		end;
		r.minimized, r.busy = true, true;
		if not r.bubbleMoved then
			E = H4(Vector2.new(N.X + 30, N.Y + 30));
		end;
		u1();
		z(V, .28, { GroupTransparency = 1, Position = UDim2.fromOffset(E.X, E.Y) }, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
		z(l, .28, { Scale = .15 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
		task.delay(.3, function()
			V.Visible = false;
			L1.Visible = true;
			Z1.Scale = 0;
			z(Z1, .4, { Scale = 1 }, H[1], H[2]);
			r.busy = false;
		end);
	end;
	local function h4()
		if not r.minimized or r.busy then
			return;
		end;
		r.minimized, r.busy = false, true;
		local F = p();
		N = Vector2.new(math.clamp(E.X - 30, 8, math.max(8, (F.X - f.X) - 8)), math.clamp(E.Y - 30, 8, math.max(8, (F.Y - f.Y) - 8)));
		z(Z1, .15, { Scale = 0 });
		V.Size = UDim2.fromOffset(f.X, f.Y);
		V.Position = UDim2.fromOffset(E.X, E.Y);
		l.Scale, V.GroupTransparency, V.Visible = .15, 1, true;
		z(V, .36, { GroupTransparency = 0, Position = UDim2.fromOffset(N.X + f.X / 2, N.Y + f.Y / 2) });
		z(l, .42, { Scale = 1 }, H[1], H[2]);
		task.delay(.18, function()
			L1.Visible = false;
		end);
		task.delay(.45, function()
			r.busy = false;
		end);
	end;
	local t4;
	a4(L1, { onStart = function()
			t4 = E;
		end, onMove = function(F, a)
			r.bubbleMoved = true;
			E = H4(Vector2.new(t4.X + F, t4.Y + a));
			u1();
		end, onEnd = function(F)
			if not F then
				h4();
			end;
		end });
	K.Activated:Connect(g4);
	function F.fadeOut(F)
		z(l, .25, { Scale = .85 });
		z(V, .25, { GroupTransparency = 1 });
		z(Z1, .2, { Scale = 0 });
		task.delay(.3, F);
	end;
	W.Activated:Connect(function()
		Me.ask("Tutup GUI?", "Semua fitur akan berhenti dan GUI dihapus. Lanjutkan?", "Lanjut", function()
			Me.ask("Konfirmasi terakhir", "Ini MENUTUP TOTAL program. Untuk menampilkan lagi harus eksekusi script ulang. Yakin?", "Tutup Total", function()
				Me.closeAll();
			end);
		end);
	end);
	table.insert(Ye, k.InputBegan:Connect(function(F, a)
		if not a and (r.ready and F.KeyCode == s.ToggleKey) then
			if r.minimized then
				h4();
			else
				g4();
			end;
		end;
	end));
	function F.refresh()
		for F, a in ipairs(a) do
			pcall(a);
		end;
	end;
	Me.refreshUI = F.refresh;
	task.spawn(function()
		while Je do
			Fe();
			ze.Text = ae.status or "";
			me.Text = (("Inv %s/%d  |  Tangkap %d  |  Fav %d  |  Jual %d")):format(tostring(ae.inv or "?"), s.MaxInventory, ae.caught, ae.fav, ae.sold);
			local a = x.farm and J.green or J.gray;
			te.BackgroundColor3 = a;
			K1.BackgroundColor3 = x.farm and J.green or J.gray;
			F.refresh();
			task.wait(.5);
		end;
	end);
	task.spawn(function()
		while Je do
			A.Position = UDim2.new(-0.3, 0, -0.4, 0);
			if V.Visible and not r.minimized then
				z(A, 1.1, { Position = UDim2.new(1.3, 0, -0.4, 0) }, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
			end;
			task.wait(6);
		end;
	end);
	local z4;
	V1(function(F)
		D.Image = F;
		z(D, .4, { ImageTransparency = 0 });
		L1.Image = F;
		y1.Visible = false;
		if z4 then
			z4.Image = F;
			z(z4, .4, { ImageTransparency = 0 });
		end;
	end);
	local G4 = g("CanvasGroup", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.fromOffset(280, 220),
			BackgroundColor3 = J.white,
			BorderSizePixel = 0,
			GroupTransparency = 1,
		}, w);
	h(G4, 20);
	t(G4, J.yellow, 2);
	local m4 = g("UIScale", { Scale = .8 }, G4);
	local B4 = g("Frame", {
			AnchorPoint = Vector2.new(.5, 0),
			Position = UDim2.new(.5, 0, 0, 20),
			Size = UDim2.fromOffset(88, 88),
			BackgroundColor3 = J.yellow,
			BorderSizePixel = 0,
		}, G4);
	h(B4, 44);
	t(B4, J.yellowDark, 3);
	local k4 = g("UIScale", { Scale = 1 }, B4);
	g("TextLabel", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = "JH",
		Font = Enum.Font.GothamBlack,
		TextSize = 30,
		TextColor3 = J.text,
	}, B4);
	z4 = g("ImageLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Crop,
		}, B4);
	h(z4, 44);
	g("TextLabel", {
		Position = UDim2.fromOffset(0, 118),
		Size = UDim2.new(1, 0, 0, 22),
		BackgroundTransparency = 1,
		Text = "JESTHUB",
		Font = Enum.Font.GothamBlack,
		TextSize = 18,
		TextColor3 = J.text,
	}, G4);
	g("TextLabel", {
		Position = UDim2.fromOffset(0, 139),
		Size = UDim2.new(1, 0, 0, 14),
		BackgroundTransparency = 1,
		Text = "IDW AUTO FARM",
		Font = Enum.Font.GothamBold,
		TextSize = 11,
		TextColor3 = J.yellowDark,
	}, G4);
	local p4 = g("Frame", {
			AnchorPoint = Vector2.new(.5, 0),
			Position = UDim2.new(.5, 0, 0, 168),
			Size = UDim2.fromOffset(200, 6),
			BackgroundColor3 = J.line,
			BorderSizePixel = 0,
		}, G4);
	h(p4, 3);
	local w4 = g("Frame", { Size = UDim2.fromScale(0, 1), BackgroundColor3 = J.yellow, BorderSizePixel = 0 }, p4);
	h(w4, 3);
	local d4 = g("TextLabel", {
			Position = UDim2.fromOffset(0, 180),
			Size = UDim2.new(1, 0, 0, 16),
			BackgroundTransparency = 1,
			Text = "",
			Font = Enum.Font.Gotham,
			TextSize = 10,
			TextColor3 = J.muted,
		}, G4);
	(d:Create(k4, TweenInfo.new(.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Scale = 1.08 })):Play();
	task.spawn(function()
		z(G4, .35, { GroupTransparency = 0 });
		z(m4, .45, { Scale = 1 }, H[1], H[2]);
		local a = {
				{ (("Akun %s - mode %s")):format(n.Name, u), .2 },
				{ ((hookmetamethod and getnamecallmethod)) and "Fitur executor lengkap" or "Fitur executor terbatas", .35 },
				{ Re and "Minigame & state game ditemukan" or "Minigame ditemukan (mode GUI)", .7 },
				{ "Menyiapkan tampilan...", 1 },
			};
		for F, a in ipairs(a) do
			d4.Text = a[1];
			z(w4, .4, { Size = UDim2.fromScale(a[2], 1) });
			task.wait(.5);
		end;
		task.wait(.15);
		z(G4, .3, { GroupTransparency = 1 });
		z(m4, .3, { Scale = 1.12 });
		task.wait(.3);
		G4:Destroy();
		O();
		V.Visible = true;
		l1(1, true);
		F.refresh();
		z(V, .35, { GroupTransparency = 0 });
		z(l, .5, { Scale = 1 }, H[1], H[2]);
		r.ready = true;
		Me.toast((("Masuk sebagai %s. Semua fitur MATI. Nyalakan sesuai kebutuhan.")):format(u), e and "ok" or "info", 5);
	end);
	function F.destroy()
		pcall(function()
			w:Destroy();
		end);
	end;
	return F;
end;
local l1 = i1();
local function U1()
	Je = false;
	x.farm, x.sellOn = false, false;
	M1.on = false;
	pcall(Le);
	if se then
		pcall(se.SetHolding, se, false);
	end;
	for F, a in ipairs(Ye) do
		pcall(function()
			a:Disconnect();
		end);
	end;
	if G[J.g2o] then
		G[J.g2o].handler = nil;
	end;
	pcall(l1.destroy);
	G[J.g0a] = nil;
end;
function Me.closeAll()
	l1.fadeOut(U1);
end;
G[J.g0a] = { Destroy = U1 };
task.spawn(function()
	pcall(We);
end);
V("loaded v" .. (s.Version .. ". Semua fitur mati. Minimize/restore:"), s.ToggleKey.Name);
