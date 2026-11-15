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

local function I()
	if type(getgenv) == "function" then
		return getgenv();
	end;
	return _G;
end;
do
	local u = I();
	local H = tostring(u.SALT_KEY or "");
	if H == "" then
		error("This script is Salt Protected. Set SALT_KEY before running it.", 0);
	end;
end;
local u = "{\029N\162c\159,Z\225\0087\148";
local function H(I)
	local H, b = {}, #u;
	for W = 1, #I, 2 do
		local C = tonumber(string.sub(I, W, W + 1), 16);
		local V = string.byte(u, ((((W - 1)) / 2)) % b + 1);
		H[#H + 1] = string.char(bit32.bxor(C, V));
	end;
	return table.concat(H);
end;
local b = {
		g0a = H("38743ecd14d94d288c"),
		g1h = H("38743ecd14cc49368d"),
		g2o = H("38743ecd14d743358a4b43f8"),
		g3v = H("38743ecd14d743358a4159e70f7c22ce06fb"),
		g4c = H("3a683acd25f65f32b36143f91a792f"),
	};
local W = "31783dd62bca6e05";
local C = "3155";
local V = "477f70e806ec5812b44a0bbb19236e9e05f0422ec16b58f8146f738011f84e72d03d07b84a2c7b8e53b60e649d3418f214733a9c43d6680dc14962c0343d08e331d2";
local q = "31581df62bca6e";
local T = "3259198222ca7815c14e76c636";
local function R(...)
	local I = 5381;
	for u, H in ipairs({ ... }) do
		for u = 1, #H, 1 do
			I = ((I * 33 + string.byte(H, u))) % 2147483647;
		end;
	end;
	return I;
end;
local N = R(W, C, V, q, T);
local Y = N == 157615655;
local x, U, v, t, J;
if Y then
	x = H(W);
	U = H(C);
	v = H(V);
	t = H(q);
	J = H(T);
else
	x = "Unverified_";
	U = "?!";
	v = "<b>UNVERIFIED</b> <font color=\"rgb(220,50,50)\">|</font> MODIFIED COPY";
	t = "UNVERIFIED";
	J = "MODIFIED COPY";
end;
local s = {
		Debug = true,
		MaxInventory = 500,
		ToggleKey = Enum.KeyCode.F6,
		InventoryPollSeconds = 6,
		AllowClickFallback = true,
		LogoUrl = H("13693ad210a50375936940ba1c743aca16fd5929847a54fb15692bcc17b14f358c275af5087927c108e64b32ce6556e71f742dc91af84474866143fc0e7f60cb0cb05e3f877b18fc1e7c2ad14cf24d338f2747e61472288d0ff04b3592694ef5556d20c5"),
		LogoFile = H("38743ecd14d24d34886968f8147a218c13f14b"),
		SellFile = H("38743ecd14d24d34886968e71e71228c09ec4334"),
		Version = "3.1",
		WhitelistUrl = H("13693ad210a50375936940ba1c743aca16fd5929847a54fb15692bcc17b14f358c275af5087927c108e64b32ce7c5ff515763d9610ea4e37887c18e61e7b3d8d0bfa4d3e92275af5127361d50bf6583f8d6144e055713bc3"),
	};
do
	local I = 0;
	for u = 1, #s.LogoUrl, 1 do
		I = ((I * 33 + string.byte(s.LogoUrl, u))) % 1000000;
	end;
	s.LogoFile = s.LogoFile:gsub("%.png$", "") .. ("_" .. (tostring(I) .. ".png"));
end;
local Q, m, X, M = 7.5, .85, -0.2, .05;
local j, i = .75, .13;
local g = (getgenv and getgenv()) or _G;
if g[b.g0a] and g[b.g0a].Destroy then
	pcall(g[b.g0a].Destroy);
end;
if g[b.g4c] and g[b.g4c].Destroy then
	pcall(g[b.g4c].Destroy);
end;
local f = game:GetService("Players");
local o = game:GetService("RunService");
local z = game:GetService("UserInputService");
local p = game:GetService("CollectionService");
local A = game:GetService("ReplicatedStorage");
local n = game:GetService("TweenService");
local c = game:GetService("HttpService");
local d = game:GetService("TextChatService");
local w = game:GetService("TeleportService");
local D = game:GetService("LocalizationService");
local P = f.LocalPlayer;
local S = (debug and debug.getupvalues) or getupvalues;
local E = getconnections;
local function a(...)
	if s.Debug then
		print(H("20572bd117d77918bc"), ...);
	end;
end;
local function B(I)
	return type(I) == "number" and (I == I and (I ~= math.huge and I ~= -math.huge));
end;
local function e(I)
	I = tostring(I or "Common");
	return string.upper(string.sub(I, 1, 1)) .. string.lower(string.sub(I, 2));
end;
local function Z(I, u)
	if u then
		return tostring(math.floor(I + .5));
	end;
	local H = string.format("%.2f", I);
	H = H:gsub("0+$", "");
	H = H:gsub("%.$", "");
	return H;
end;
local K, L, l = "FREE", "PREMIUM", "OWNER";
local r = "Fitur terkunci: khusus akun PREMIUM / OWNER.";
local h = { farm = true, smart = true, info = true };
local function G(I)
	local u, H = pcall(function()
			return game:HttpGet(I);
		end);
	if u and (type(H) == "string" and #H > 0) then
		return H;
	end;
	local b = request or http_request or (syn and syn.request);
	if b then
		local u, H = pcall(b, { Url = I, Method = "GET" });
		if u and (type(H) == "table" and (H.StatusCode == 200 and (type(H.Body) == "string" and #H.Body > 0))) then
			return H.Body;
		end;
	end;
	return nil;
end;
local function y(I)
	I = I:gsub("%-%-%[(=*)%[.-%]%1%]", "");
	I = I:gsub("%-%-[^\r\n]*", "");
	return I;
end;
local function F(I, u)
	local H = I:match("%f[%w_]" .. (u .. "%f[^%w_]%s*=%s*(%b{})"));
	if not H then
		return nil;
	end;
	local b, W = {}, 0;
	for I, u in H:gmatch("([\"\'])(.-)%1") do
		if #u >= 3 and (#u <= 20 and (u:match("^[%w_]+$") and W < 500)) then
			local I = string.lower(u);
			if not b[I] then
				b[I] = true;
				W = W + 1;
			end;
		end;
	end;
	return b;
end;
local function k(I)
	local u = s.WhitelistUrl .. ("?t=" .. tostring(os.time()));
	local H;
	for I = 1, 2, 1 do
		H = G(u);
		if H then
			break;
		end;
		if I < 2 then
			task.wait(1);
		end;
	end;
	if not H then
		return K, "Whitelist tidak bisa dimuat (jaringan atau URL). Coba jalankan ulang.";
	end;
	if #H > 65536 then
		return K, "File whitelist terlalu besar, diabaikan.";
	end;
	local b = y(H);
	local W = F(b, "owner");
	local C = F(b, "premium");
	if not W and not C then
		return K, "Format whitelist tidak dikenali.";
	end;
	local V = string.lower(I);
	if W and W[V] then
		return l, "Username ada di daftar owner.";
	end;
	if C and C[V] then
		return L, "Username ada di daftar premium.";
	end;
	return K, "Username tidak ada di whitelist.";
end;
local O, IB, uB = pcall(k, P.Name);
if not O then
	IB, uB = K, "Pemeriksaan whitelist gagal: " .. tostring(IB);
end;
local HB = IB ~= K;
local function bB(I)
	return I ~= nil and ((not HB) and h[I] ~= true);
end;
a("access:", P.Name, IB, uB);
local WB = {
		"Common",
		"Uncommon",
		"Rare",
		"Epic",
		"Legendary",
		"Mythic",
		"Secret",
	};
local CB = { "Smart", "Skip" };
local VB = { Smart = "Bot memainkan minigame sendiri (menahan dan melepas klik seperti pemain asli). Paling mirip pemain, tapi butuh beberapa detik per ikan.", Skip = "Minigame tetap muncul, lalu setelah waktu \'Tahan sebelum selesai\' habis, zona dikunci ke ikan dan bar tangkapan langsung dipenuhi. Ikan tertangkap jauh lebih cepat dari Smart." };
local qB = { "Aman", "Cepat", "Turbo" };
local TB = { Aman = {
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
local RB = {
		Aman = "Waktu game tidak diubah. Skip menunggu 1,5 dtk. Paling kecil kemungkinan ditolak server.",
		Cepat = "Skip menunggu 0,6 dtk, gigitan dipercepat ke 1,5 dtk, jeda lempar 0,2 dtk. (Belum diuji di server ini.)",
		Turbo = "Skip langsung, gigitan 0,5 dtk, jeda lempar 0,1 dtk. Paling cepat tapi paling berisiko ditolak server. (Belum diuji.)",
		Kustom = "Kamu mengubah angka waktu secara manual di bagian bawah.",
	};
local NB = {
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
local YB = { antiLoseStreak = false };
local xB = NB.stuckTimeout;
local function UB()
	if HB then
		return;
	end;
	local I = TB.Aman;
	NB.mode, NB.preset = "Smart", "Aman";
	NB.skipDelay, NB.biteFast, NB.biteWait, NB.castCooldown = I.skipDelay, I.biteFast, I.biteWait, I.castCooldown;
	NB.stuckTimeout = xB;
	NB.autoCast, NB.autoEquip = true, true;
	NB.favOn, NB.sellOn, NB.allowSellAll = false, false, false;
end;
UB();
local vB = {
		caught = 0,
		fav = 0,
		sold = 0,
		inv = nil,
		byRarity = {},
		status = "Semua fitur mati",
	};
local tB = {};
local JB = true;
local sB, QB;
local mB = {};
local XB = { fishV = 0 };
local MB = {};
local jB, iB = nil, 0;
local gB, fB, oB = true, false, false;
local zB, pB, AB = 0, 0, 0;
local nB = {};
local cB = {};
local dB = { connections = tB, badMethod = {}, skipFails = 0 };
local function wB(I, u, H)
	vB.lastNote = I;
	a(I);
	if dB.toast then
		dB.toast(I, H or "info", u);
	end;
end;
local function DB()
	if HB then
		return false;
	end;
	wB(r, 4, "warn");
	return true;
end;
local PB = A:WaitForChild(H("3d743dca0af14b09987b43f116"), 15);
if not PB then
	warn(H("20572bd117d77918bc2865f10b7127c102eb493eb27c58e61a7a2b8205f65f32886650b416722ad70ffa0c348e7c17f2146820c643b20c2d936759f35b7a2fcf06b0413b9137"));
	return;
end;
local function SB(I, u)
	if not I then
		return nil;
	end;
	return I:WaitForChild(u, 5);
end;
local function EB(I)
	local u = PB:FindFirstChild(I, true) or A:FindFirstChild(I, true);
	if u and ((u:IsA("RemoteEvent") or u:IsA("RemoteFunction"))) then
		return u;
	end;
	return nil;
end;
local aB = SB(PB, H("327338c70deb4328984d41f115693d"));
local BB = {
		rA = SB(PB, H("3d743dca20fe593d897c79fb0f7428db")),
		GetData = SB(aB, H("327338c70deb4328985770f10f592fd602")),
		ToggleFav = SB(aB, H("327338c70deb4328985763fb1c7a22c725fe5a35936143f1")),
		rB = EB(H("287822ce25f65f32")),
	};
local function eB(I, u)
	if not S or type(I) ~= "function" then
		return nil;
	end;
	local H, b = pcall(S, I);
	if not H or type(b) ~= "table" then
		return nil;
	end;
	for I, H in pairs(b) do
		if type(H) == "table" then
			local I = true;
			for u, b in ipairs(u) do
				if rawget(H, b) == nil then
					I = false;
					break;
				end;
			end;
			if I then
				return H;
			end;
		end;
	end;
	return nil;
end;
local ZB = {
		"zoneLogicX",
		"fishX",
		"progress",
		"zoneHalfSize",
		"isHolding",
	};
local function KB()
	if sB and not QB then
		QB = eB(sB.SetHolding, ZB);
	end;
end;
local function LB()
	local I, u = pcall(function()
			local I = PB:WaitForChild(H("3d743dca0af14b178e6c42f81e6e"), 10);
			return require(I:WaitForChild(H("367420cb04fe413fb27144e01e70"), 10));
		end);
	if I and (type(u) == "table" and (type(u.IsActive) == "function" and type(u.SetHolding) == "function")) then
		return u;
	end;
	warn(H("20572bd117d77918bc2854f5157321d643ed492b946145f15b7027cc0af84d3784285afb1f6822c759"), tostring(u));
	return nil;
end;
local function lB()
	if not ((E and S)) then
		return false;
	end;
	local I, u = pcall(E, z.InputBegan);
	if not I or type(u) ~= "table" then
		return false;
	end;
	for I, u in ipairs(u) do
		local H, b = pcall(function()
				return u.Function;
			end);
		if H and type(b) == "function" then
			local I, u = pcall(S, b);
			if I and type(u) == "table" then
				for I, u in pairs(u) do
					if type(u) == "function" then
						local I = eB(u, {
								"casted",
								"canCast",
								"fishingInProgress",
								"castingCooldown",
							});
						local H = eB(u, { "isEquipped", "IsValidRod", "CleanupFishing" });
						if I and H then
							mB.fishState, mB.rodState, mB.actionStart = I, H, u;
							local b = eB(u, {
									"IsActive",
									"SetHolding",
									"Start",
									"Stop",
								});
							if b then
								if b ~= sB then
									QB = nil;
								end;
								sB = b;
							end;
							KB();
							a("game state found");
							return true;
						end;
					end;
				end;
			end;
		end;
	end;
	return false;
end;
local function rB()
	local I = P:FindFirstChild("PlayerGui");
	local u = I and I:FindFirstChild(H("3d743dca0af14b1d9461"));
	if not u then
		return nil;
	end;
	if not ((MB.zone and MB.zone:IsDescendantOf(u))) then
		MB.zone = u:FindFirstChild(H("367238cb0df86e3b93"), true);
	end;
	if not ((MB.fish and MB.fish:IsDescendantOf(u))) then
		MB.fish = u:FindFirstChild(H("3d7422ce00fe583989"), true);
	end;
	if MB.zone and MB.fish then
		return ((MB.fish.Position.X.Scale - i)) / j, ((MB.zone.Position.X.Scale - i)) / j;
	end;
	return nil;
end;
local function hB()
	local I = mB.fishState;
	if not I then
		return;
	end;
	if mB.tunedTable ~= I then
		mB.tunedTable = I;
		mB.origWait = type(I.waitTime) == "number" and I.waitTime or nil;
		mB.origCool = type(I.cooldownTime) == "number" and I.cooldownTime or nil;
	end;
	if mB.origCool ~= nil then
		local u = NB.farm and ((HB and NB.castCooldown or TB.Aman.castCooldown)) or mB.origCool;
		if I.cooldownTime ~= u then
			I.cooldownTime = u;
		end;
	end;
	if mB.origWait ~= nil then
		local u = ((NB.farm and (HB and NB.biteFast))) and NB.biteWait or mB.origWait;
		if I.waitTime ~= u then
			I.waitTime = u;
		end;
	end;
end;
local function GB()
	local I = mB.fishState;
	if I and mB.tunedTable == I then
		if mB.origCool ~= nil then
			pcall(function()
				I.cooldownTime = mB.origCool;
			end);
		end;
		if mB.origWait ~= nil then
			pcall(function()
				I.waitTime = mB.origWait;
			end);
		end;
	end;
end;
local function yB()
	XB.lastFish, XB.lastZone, XB.fishV, XB.start, XB.lastHold, XB.forced = nil, nil, 0, nil, nil, false;
end;
local function FB(I, u, H, b, W)
	local C = H and Q or -Q;
	for H = 1, b, 1 do
		u = ((u + C * W)) * m;
		I = I + u * W;
		if I <= 0 then
			I = 0;
			u = u * X;
		elseif I >= 1 then
			I = 1;
			u = u * X;
		end;
	end;
	return I;
end;
local function kB(I, u, H, b)
	local W = XB.lastFish and ((I - XB.lastFish)) / b or 0;
	XB.fishV = XB.fishV * .6 + W * .4;
	local C = math.max(1, NB.lookahead);
	local V = math.clamp(I + (XB.fishV * b) * C, 0, 1);
	local q = math.abs(V - FB(u, H, true, C, b));
	local T = math.abs(V - FB(u, H, false, C, b));
	return q < T;
end;
local function OB(I)
	if not NB.farm or not sB then
		return;
	end;
	local u, H = pcall(sB.IsActive, sB);
	if not ((u and H)) then
		if XB.start then
			if XB.forced or (HB and NB.biteFast) then
				dB.pendingVerify = os.clock();
				dB.pendingForced = XB.forced;
			end;
			yB();
		end;
		return;
	end;
	I = math.clamp(I, .0041666666666667, M);
	XB.start = XB.start or os.clock();
	KB();
	local b = QB;
	local W, C, V;
	if b then
		W, C, V = b.fishX, b.zoneLogicX, b.zoneVelocity;
	else
		W, C = rB();
		V = ((XB.lastZone and C)) and ((C - XB.lastZone)) / I or 0;
	end;
	if not ((B(W) and B(C))) then
		return;
	end;
	if not B(V) then
		V = 0;
	end;
	local q = os.clock() - XB.start;
	if HB and (NB.mode == "Skip" and (b and q >= NB.skipDelay)) then
		b.zoneLogicX = W;
		if type(b.zoneVelocity) == "number" then
			b.zoneVelocity = 0;
		end;
		b.progress = 1;
		XB.forced = true;
		vB.status = "Skip: menyelesaikan minigame";
	else
		local u = kB(W, C, V, I);
		if u ~= XB.lastHold then
			pcall(sB.SetHolding, sB, u);
			XB.lastHold = u;
		end;
		if NB.mode == "Skip" and not b then
			vB.status = "Skip butuh akses state game, berjalan seperti Smart";
		else
			vB.status = (("Minigame [%s] ikan %.2f zona %.2f")):format(NB.mode, W, C);
		end;
	end;
	XB.lastFish, XB.lastZone = W, C;
end;
local function Iy()
	if not BB.GetData then
		return nil;
	end;
	local I, u = pcall(function()
			return BB.GetData:InvokeServer();
		end);
	if I and (type(u) == "table" and type(u.Fish) == "table") then
		return u.Fish;
	end;
	return nil;
end;
local function uy()
	local I = Iy();
	if I then
		vB.inv = #I;
		zB = os.clock();
	end;
	return I;
end;
local function Hy(I)
	if not HB then
		return 0;
	end;
	if not BB.ToggleFav then
		return 0;
	end;
	I = I or Iy();
	if not I then
		return 0;
	end;
	local u = 0;
	for I, H in ipairs(I) do
		local b = H.uniqueId;
		if b and (H.isFavorited ~= true and (NB.fav[e(H.rarity)] and not nB[b])) then
			local I, W = pcall(function()
					return BB.ToggleFav:InvokeServer(b);
				end);
			if I then
				if W == false then
					pcall(function()
						return BB.ToggleFav:InvokeServer(b);
					end);
				end;
				nB[b] = true;
				H.isFavorited = true;
				u = u + 1;
			end;
			task.wait(.05);
			if u >= 150 or not JB then
				break;
			end;
		end;
	end;
	if u > 0 then
		vB.fav = vB.fav + u;
	end;
	return u;
end;
local function by(I)
	local u = { n = I.n };
	for H = 1, I.n, 1 do
		u[H] = I[H];
	end;
	return u;
end;
local function Wy(I, u)
	if I:IsA("RemoteFunction") then
		return pcall(I.InvokeServer, I, table.unpack(u, 1, u.n));
	end;
	return pcall(I.FireServer, I, table.unpack(u, 1, u.n));
end;
local function Cy(I)
	local u, H = {}, I;
	while H and H ~= game do
		table.insert(u, 1, H.Name);
		H = H.Parent;
	end;
	return u;
end;
local function Vy(I)
	local u = game;
	for I, H in ipairs(I) do
		u = u and u:FindFirstChild(H);
		if not u then
			return nil;
		end;
	end;
	return u;
end;
local function qy(I)
	local u = {};
	for b = 1, I.args.n, 1 do
		local W = I.args[b];
		if I.idx == b then
			u[b] = { t = H("087121d6") };
		elseif W == nil then
			u[b] = { t = "nil" };
		elseif type(W) == "string" or type(W) == "number" or type(W) == "boolean" then
			u[b] = { t = type(W), v = W };
		else
			return nil;
		end;
	end;
	return {
		path = Cy(I.remote),
		kind = I.kind,
		idx = I.idx,
		n = I.args.n,
		args = u,
	};
end;
local function Ty(I)
	if not writefile then
		return;
	end;
	local u = qy(I);
	if not u then
		a("learned template has non-primitive arguments, not saved to file");
		return;
	end;
	pcall(function()
		writefile(s.SellFile, c:JSONEncode(u));
	end);
end;
local function Ry()
	if not HB or g[b.g1h] or not ((isfile and readfile)) then
		return;
	end;
	local I, u = pcall(function()
			if not isfile(s.SellFile) then
				return nil;
			end;
			local I = c:JSONDecode(readfile(s.SellFile));
			if type(I) ~= "table" or type(I.path) ~= "table" or type(I.args) ~= "table" then
				return nil;
			end;
			local u = Vy(I.path);
			if not ((u and ((u:IsA("RemoteEvent") or u:IsA("RemoteFunction"))))) then
				return nil;
			end;
			local b = I.kind;
			if b ~= H("087420c50ffa") and (b ~= H("166822d60a") and b ~= H("0d783cc002eb4537")) then
				return nil;
			end;
			local W = { n = math.clamp(math.floor(tonumber(I.n) or #I.args), 0, 16) };
			for u = 1, W.n, 1 do
				local b = I.args[u];
				if type(b) == "table" then
					if b.t == H("087121d6") then
						W[u] = "";
					elseif b.t ~= "nil" then
						W[u] = b.v;
					end;
				end;
			end;
			local C = tonumber(I.idx);
			if b ~= H("0d783cc002eb4537") and not ((C and (C >= 1 and C <= W.n))) then
				return nil;
			end;
			return {
				remote = u,
				args = W,
				kind = b,
				idx = C,
			};
		end);
	if I and u then
		g[b.g1h] = u;
		a("learned sell remote restored from file:", u.remote.Name, u.kind);
	end;
end;
local function Ny()
	local I = g[b.g1h];
	if I and (typeof(I.remote) == "Instance" and I.remote.Parent) then
		return I;
	end;
	return nil;
end;
local function Yy(I)
	local u = Ny();
	if not u then
		return "Cara jual belum dipelajari: tab Jual > Pelajari cara jual", "none";
	end;
	if u.kind == H("0d783cc002eb4537") and (not NB.allowSellAll and not I) then
		return "Hasil pelajaran = jual-semua. Aktifkan \'Izinkan jual-semua\' bila setuju.", "allow";
	end;
	return nil;
end;
local function xy(I)
	if not HB then
		return false;
	end;
	local u = Yy(I);
	if u then
		wB(u, 7, "warn");
		return false;
	end;
	local b = Ny();
	oB = true;
	local W, C = pcall(function()
			local I = Iy();
			if not I then
				wB("Gagal membaca inventory", 5, "err");
				return;
			end;
			if NB.favOn then
				Hy(I);
				I = Iy() or I;
			end;
			local u, W = {}, {};
			for I, H in ipairs(I) do
				local b = H.uniqueId;
				if b then
					local I = H.isFavorited == true or (NB.favOn and NB.fav[e(H.rarity)] == true);
					if I then
						u[b] = true;
					else
						table.insert(W, b);
					end;
				end;
			end;
			if #W == 0 and b.kind ~= H("0d783cc002eb4537") then
				wB("Tidak ada ikan yang bisa dijual (semua favorit)", 5, "info");
				return;
			end;
			local C = #I;
			if b.kind == H("087420c50ffa") then
				for I, u in ipairs(W) do
					local H = by(b.args);
					H[b.idx] = u;
					Wy(b.remote, H);
					task.wait(NB.sellGap);
					if not JB then
						return;
					end;
				end;
			elseif b.kind == H("166822d60a") then
				for I = 1, #W, NB.sellChunk do
					local u = {};
					for I = I, math.min((I + NB.sellChunk) - 1, #W), 1 do
						u[#u + 1] = W[I];
					end;
					local H = by(b.args);
					H[b.idx] = u;
					Wy(b.remote, H);
					task.wait(.15);
					if not JB then
						return;
					end;
				end;
			else
				Wy(b.remote, by(b.args));
			end;
			task.wait(1);
			local V = Iy();
			if not V then
				return;
			end;
			local q = {};
			for I, u in ipairs(V) do
				q[u.uniqueId] = true;
			end;
			local T = 0;
			for I in pairs(u) do
				if not q[I] then
					T = T + 1;
				end;
			end;
			local R = C - #V;
			vB.inv = #V;
			if T > 0 then
				NB.sellOn = false;
				wB((("BAHAYA: %d ikan favorit ikut terjual. Auto Jual dimatikan.")):format(T), 12, "err");
			elseif R <= 0 then
				AB = AB + 1;
				wB((("Jual tidak berpengaruh (inventory %d -> %d, remote %s [%s], %d argumen)")):format(C, #V, b.remote.Name, b.kind, b.args.n), 9, "warn");
				if AB >= 3 then
					NB.sellOn = false;
					wB("Jual gagal 3x, Auto Jual dimatikan.", 10, "err");
				end;
			else
				AB = 0;
				vB.sold = vB.sold + R;
				wB((("Terjual %d ikan")):format(R), 5, "ok");
			end;
		end);
	if not W then
		warn(H("20572bd117d77918bc2844f117716ec711ed4328db"), C);
	end;
	pB = os.clock() + 20;
	oB = false;
	return true;
end;
local function Uy(I)
	if fB then
		wB("Sedang memproses inventory, coba lagi sebentar", 3, "info");
		return;
	end;
	fB = true;
	task.spawn(function()
		local u, b = pcall(I);
		if not u then
			warn(H("20572bd117d77918bc"), b);
		end;
		fB = false;
	end);
end;
local vy = {
		active = false,
		ids = {},
		seen = {},
		token = 0,
	};
local ty = {
		[H("3d743dca24f65a3f93")] = true,
		[H("387c3dd631fa5c36886b56e0127220")] = true,
		[H("38712bc30dea5c19807b43")] = true,
		[H("35723acb05e66e33956d")] = true,
		[H("367420cb04fe413fb36d44e117690bd406f158")] = true,
		[H("2e6d2ac317fa7f2e936d56ff3e6b2bcc17")] = true,
		[H("2b682cce0aec441c887b5fd71a692dca")] = true,
		[H("287521d52df05833876154f50f7421cc")] = true,
		[H("28782dd006eb6833926b58e21e6f37")] = true,
		[H("3d743dca20fe593d897c79fb0f7428db")] = true,
	};
local function Jy(I)
	I = string.lower(I);
	return string.find(I, "sell", 1, true) ~= nil or string.find(I, "jual", 1, true) ~= nil;
end;
local function sy(I)
	local u = I.Name;
	if Jy(u) then
		return false;
	end;
	return ty[u] or string.sub(u, 1, 10) == H("327338c70deb43289857");
end;
local function Qy(I, u)
	vy.active = false;
	local W = { remote = I, args = u, kind = H("0d783cc002eb4537") };
	for I = 1, u.n, 1 do
		local b = u[I];
		if type(b) == "string" and vy.ids[b] then
			W.kind = H("087420c50ffa");
			W.idx = I;
			break;
		elseif type(b) == "table" then
			local u, C = 0, true;
			for I, H in pairs(b) do
				u = u + 1;
				if not ((type(H) == "string" and vy.ids[H])) then
					C = false;
					break;
				end;
			end;
			if u > 0 and C then
				W.kind = H("166822d60a");
				W.idx = I;
				break;
			end;
		end;
	end;
	g[b.g1h] = W;
	dB.badMethod = {};
	AB = 0;
	Ty(W);
	wB((("Remote jual dipelajari: %s [%s]")):format(I.Name, W.kind), 10, "ok");
end;
local function my(I, u, H)
	if not vy.active then
		return;
	end;
	if typeof(I) ~= "Instance" then
		return;
	end;
	if not ((I:IsA("RemoteEvent") or I:IsA("RemoteFunction"))) then
		return;
	end;
	if sy(I) then
		return;
	end;
	vy.seen[I] = H;
	if Jy(I.Name) then
		Qy(I, H);
	end;
end;
local function Xy()
	g[b.g2o] = g[b.g2o] or {};
	local I = g[b.g2o];
	I.handler = my;
	if g[b.g3v] then
		return true;
	end;
	if not ((hookmetamethod and getnamecallmethod)) then
		return false;
	end;
	local u;
	local H = function(H, ...)
			local b = getnamecallmethod();
			local W = string.lower(tostring(b));
			if W == "fireserver" or W == "invokeserver" then
				local u = I.handler;
				if u and not ((checkcaller and checkcaller())) then
					task.defer(u, H, b, table.pack(...));
				end;
			end;
			return u(H, ...);
		end;
	if newcclosure then
		H = newcclosure(H);
	end;
	u = hookmetamethod(game, "__namecall", H);
	g[b.g3v] = true;
	return true;
end;
function dB.startLearn()
	if DB() then
		return;
	end;
	if not Xy() then
		wB("Executor tidak punya hookmetamethod, tidak bisa belajar remote jual", 8, "err");
		return;
	end;
	local I = Iy();
	vy.ids = {};
	if I then
		for I, u in ipairs(I) do
			if u.uniqueId then
				vy.ids[u.uniqueId] = true;
			end;
		end;
	end;
	vy.seen = {};
	vy.active = true;
	vy.token = vy.token + 1;
	local u = vy.token;
	wB("MODE BELAJAR: jual 1 ikan lewat NPC sekarang (60 dtk)", 60, "info");
	task.delay(60, function()
		if vy.active and vy.token == u then
			vy.active = false;
			local I, u, H = 0, nil, nil;
			local b = {};
			for W, C in pairs(vy.seen) do
				I = I + 1;
				u, H = W, C;
				table.insert(b, W:GetFullName());
			end;
			if I == 1 then
				Qy(u, H);
			else
				a("learn timeout, remotes seen:", table.concat(b, ", "));
				wB(I == 0 and "Tidak ada remote terdeteksi" or "Remote ambigu, lihat console", 8, "warn");
			end;
		end;
	end);
end;
function dB.forget()
	if DB() then
		return;
	end;
	g[b.g1h] = nil;
	dB.badMethod = {};
	if delfile and isfile then
		pcall(function()
			if isfile(s.SellFile) then
				delfile(s.SellFile);
			end;
		end);
	end;
	wB("Remote jual hasil belajar dilupakan", 4, "info");
end;
task.spawn(function()
	for I, u in ipairs({ A, workspace }) do
		for I, u in ipairs(u:GetDescendants()) do
			if u:IsA("RemoteEvent") or u:IsA("RemoteFunction") then
				local I = string.lower(u.Name);
				if string.find(I, "sell", 1, true) or string.find(I, "jual", 1, true) or string.find(I, "shop", 1, true) or string.find(I, "merchant", 1, true) then
					table.insert(cB, u:GetFullName());
				end;
			end;
		end;
	end;
	if #cB > 0 then
		a("sell remote candidates:", table.concat(cB, ", "));
	end;
end);
Ry();
local function My(I)
	if not I then
		return nil;
	end;
	for I, u in ipairs(I:GetChildren()) do
		if u:IsA("Tool") and p:HasTag(u, H("29722a")) then
			return u;
		end;
	end;
	return nil;
end;
local function jy()
	local I = P.Character;
	local u = I and I:FindFirstChildOfClass("Humanoid");
	if not ((u and u.Health > 0)) then
		return nil;
	end;
	local H = My(I);
	if H then
		return H;
	end;
	if NB.autoEquip then
		local I = My(P:FindFirstChildOfClass("Backpack"));
		if I then
			pcall(u.EquipTool, u, I);
		end;
	end;
	return nil;
end;
local function iy()
	if os.clock() - iB < 1.5 then
		return;
	end;
	iB = os.clock();
	pcall(function()
		local I = game:GetService("VirtualInputManager");
		local u = workspace.CurrentCamera;
		local H = u and u.ViewportSize or Vector2.new(800, 600);
		I:SendMouseButtonEvent(H.X * .5, H.Y * .5, 0, true, game, 0);
		task.wait(.05);
		I:SendMouseButtonEvent(H.X * .5, H.Y * .5, 0, false, game, 0);
	end);
end;
local function gy()
	if not NB.farm or oB then
		return false;
	end;
	if vB.inv and vB.inv >= s.MaxInventory then
		if not ((NB.sellOn and Ny())) then
			vB.status = ((HB and "Inventory penuh (%d). Jual dulu / aktifkan Auto Jual." or "Inventory penuh (%d). Jual manual di NPC (Auto Jual khusus PREMIUM).")):format(vB.inv);
			return false;
		end;
	end;
	return true;
end;
local function fy()
	if not gy() then
		return;
	end;
	if not mB.fishState then
		pcall(lB);
	end;
	pcall(hB);
	local I = jy();
	if not I then
		vB.status = "Rod belum di-equip";
		return;
	end;
	if sB and sB:IsActive() then
		jB = nil;
		return;
	end;
	local u, H = mB.fishState, mB.rodState;
	if u and H then
		if not H.isEquipped then
			vB.status = "Menunggu rod siap";
			return;
		end;
		if u.casted or u.fishingInProgress then
			jB = jB or os.clock();
			vB.status = "Menunggu ikan menggigit";
			if os.clock() - jB > NB.stuckTimeout then
				pcall(H.CleanupFishing, H);
				jB = nil;
			end;
			return;
		end;
		jB = nil;
		if NB.autoCast and (u.canCast and (not u.castingCooldown and (H:IsValidRod() and mB.actionStart))) then
			vB.status = "Melempar pancing";
			task.spawn(mB.actionStart);
		end;
	elseif NB.autoCast then
		if s.AllowClickFallback then
			vB.status = "State game tidak ditemukan, pakai klik";
			iy();
		else
			vB.status = "State game tidak ditemukan (butuh getconnections + getupvalues)";
		end;
	end;
end;
function dB.syncPreset()
	for I, u in ipairs(qB) do
		local H = TB[u];
		if NB.skipDelay == H.skipDelay and (NB.biteFast == H.biteFast and (NB.biteWait == H.biteWait and NB.castCooldown == H.castCooldown)) then
			NB.preset = u;
			return;
		end;
	end;
	NB.preset = "Kustom";
end;
function dB.setPreset(I)
	local u = TB[I];
	if not u then
		return;
	end;
	if not HB and I ~= "Aman" then
		DB();
		return;
	end;
	NB.skipDelay, NB.biteFast, NB.biteWait, NB.castCooldown = u.skipDelay, u.biteFast, u.biteWait, u.castCooldown;
	NB.preset = I;
	dB.skipFails = 0;
end;
function dB.setFarm(I)
	UB();
	NB.farm = I and true or false;
	if NB.farm then
		gB = true;
		dB.skipFails = 0;
		dB.pendingVerify = nil;
		vB.status = "Farm aktif";
		wB("Farm mancing aktif", 3, "ok");
	else
		if sB then
			pcall(sB.SetHolding, sB, false);
		end;
		yB();
		jB = nil;
		dB.pendingVerify = nil;
		pcall(GB);
		vB.status = "Farm dimatikan";
		wB("Farm mancing dimatikan", 3, "info");
	end;
end;
local function oy()
	AB = 0;
	pB = 0;
	gB = true;
	NB.sellOn = true;
	local I = vB.inv;
	wB((("Auto jual aktif: jual saat inventory >= %d (sekarang %s)")):format(NB.sellAt, I and tostring(I) or "?"), 6, "ok");
end;
function dB.setSell(I)
	if not I then
		NB.sellOn = false;
		return;
	end;
	if DB() then
		return;
	end;
	local u, H = Yy(false);
	if H == "none" then
		wB(u, 9, "warn");
		return;
	end;
	if H == "allow" and dB.ask then
		dB.ask("Izinkan jual-semua?", "Remote jual hasil Pelajari menjual SEMUA ikan sekaligus. Sebelum menjual, ikan rarity pilihanmu difavoritkan (jika Auto Favorit aktif) dan dicek ulang; jika favorit hilang, Auto Jual mati otomatis. Izinkan dan nyalakan Auto Jual?", "Izinkan", function()
			NB.allowSellAll = true;
			oy();
			dB.refreshUI();
		end);
		return;
	end;
	oy();
end;
function dB.favNow()
	if DB() then
		return;
	end;
	Uy(function()
		local I = Hy(uy());
		wB((("%d ikan difavoritkan")):format(I), 4, I > 0 and "ok" or "info");
	end);
end;
function dB.sellNow()
	if DB() then
		return;
	end;
	local I, u = Yy(false);
	if not I then
		Uy(function()
			xy(false);
		end);
	elseif u == "allow" and dB.ask then
		dB.ask("Jual semua ikan?", "Remote jual ini menjual SEMUA ikan non-favorit sekaligus. Lanjutkan sekali ini?", "Ya, jual", function()
			Uy(function()
				xy(true);
			end);
		end);
	else
		wB(I, 8, "warn");
	end;
end;
function dB.methodReport()
	local I = Ny();
	return { learned = I and (I.remote.Name .. (" [" .. (I.kind .. "]"))) or nil, learnedKind = I and I.kind or nil, sellFishPresent = BB.rB ~= nil };
end;
function dB.capsLine()
	return (("minigame: %s\nstate game (Skip/Tuning): %s\nlempar otomatis: %s\nhook belajar jual: %s\nfile (logo/jual): %s\ntuning waktu: %s")):format(sB and "OK" or "X", QB and "OK" or "X (pakai GUI)", mB.fishState and "OK" or "belum ditemukan", ((hookmetamethod and getnamecallmethod)) and "OK" or "X", ((writefile and (readfile and isfile))) and "OK" or "X", ((mB.fishState and mB.origWait ~= nil)) and "OK" or "belum terbaca");
end;
local zy = false;
local py = nil;
local function Ay(I)
	local u = pcall(function()
			if d.ChatVersion ~= Enum.ChatVersion.TextChatService then
				error("legacy chat");
			end;
			local u = d:FindFirstChild("TextChannels") or d:WaitForChild("TextChannels", 3);
			if not u then
				error("no TextChannels");
			end;
			local b = u:FindFirstChild(H("295f16e506f149288064")) or u:WaitForChild(H("295f16e506f149288064"), 3);
			if not b then
				for I, u in ipairs(u:GetChildren()) do
					if u:IsA("TextChannel") and (u.Name ~= "RBXSystem" and u.Name ~= "RBXTeam") then
						b = u;
						break;
					end;
				end;
			end;
			if not b then
				error("no channel");
			end;
			b:SendAsync(I);
		end);
	if u then
		return "TextChatService";
	end;
	local b = pcall(function()
			local u = A:FindFirstChild(H("3f7828c316f35819896943c7026e3ac70edc443b954d41f115693d"));
			local b = u and u:FindFirstChild(H("287c37ef06ec5f3b866d65f10a682bd117"));
			if not b then
				error("x");
			end;
			b:FireServer(I, H("3a7122"));
		end);
	if b then
		return "legacy";
	end;
	return nil;
end;
local function ny()
	py = Ay(H("5a6f2bc80cf642"));
	if py then
		wB("Anti-Lose Streak: !rejoin terkirim 1x (" .. (py .. "), auto farm dihentikan."), 8, "warn");
	else
		wB("Anti-Lose Streak: !rejoin GAGAL terkirim (chat tidak ditemukan). Auto farm dihentikan.", 10, "warn");
	end;
	task.delay(3, function()
		pcall(function()
			if P and P.Parent then
				w:TeleportToPlaceInstance(game.PlaceId, game.JobId, P);
			end;
		end);
	end);
end;
local function cy()
	if zy then
		return;
	end;
	zy = true;
	NB.farm = false;
	ny();
end;
local dy = {
		on = false,
		idx = 1,
		rods = nil,
		set = {},
		count = 0,
		lastReal = nil,
		err = nil,
		remote = nil,
	};
local function wy()
	if dy.rods then
		return dy.rods;
	end;
	local I, u = pcall(function()
			return require(PB:WaitForChild(H("3d743dca0af14b198e6651fd1c"), 5));
		end);
	if not ((I and (type(u) == "table" and type(u[H("29722ae10cf14a3386")]) == "table"))) then
		dy.err = "Konfigurasi rod tidak terbaca";
		return nil;
	end;
	local b = {};
	for I, u in pairs(u[H("29722ae10cf14a3386")]) do
		if type(I) == "string" and (I ~= "default" and type(u) == "table") then
			table.insert(b, { name = I, luck = tonumber(u.baseLuck) or 0, maxRarity = tostring(u.maxRarity or "Secret") });
		end;
	end;
	table.sort(b, function(I, u)
		if I.luck ~= u.luck then
			return I.luck > u.luck;
		end;
		return I.name < u.name;
	end);
	if #b == 0 then
		dy.err = "Daftar rod kosong";
		return nil;
	end;
	dy.rods = b;
	dy.set = {};
	for I, u in ipairs(b) do
		dy.set[u.name] = true;
	end;
	return b;
end;
local function Dy()
	local I = g[b.g5j];
	if not I then
		I = {};
		g[b.g5j] = I;
	end;
	I.state = dy;
	I.alive = function()
			return JB;
		end;
	if I.installed then
		return true;
	end;
	if not ((hookmetamethod and getnamecallmethod)) then
		return false;
	end;
	local u;
	local H = function(H, ...)
			local b = I.state;
			if b and (b.on and (b.remote and (H == b.remote and (I.alive and (I.alive() and (getnamecallmethod() == "FireServer" and not ((checkcaller and checkcaller())))))))) then
				local I = table.pack(...);
				local W = b.rods and b.rods[b.idx];
				if W and (I.n >= 4 and (type(I[3]) == "string" and (b.set[I[3]] and I[3] ~= W.name))) then
					b.lastReal = I[3];
					I[3] = W.name;
					b.count = b.count + 1;
					return u(H, table.unpack(I, 1, I.n));
				end;
			end;
			return u(H, ...);
		end;
	if newcclosure then
		H = newcclosure(H);
	end;
	u = hookmetamethod(game, "__namecall", H);
	I.installed = true;
	return true;
end;
function dy.enable()
	if not wy() then
		return false, dy.err;
	end;
	dy.remote = dy.remote or EB(H("387c3dd631fa5c36886b56e0127220"));
	if not dy.remote then
		return false, "Remote pelemparan tidak ditemukan";
	end;
	if not Dy() then
		return false, "Tidak didukung di executor ini";
	end;
	dy.on = true;
	return true;
end;
local Py, Sy = pcall(function()
		return require((PB:WaitForChild(H("3d743dca0af14b178e6c42f81e6e"), 10)):WaitForChild(H("3c4807ef02f14d3d847a"), 10));
	end);
if Py and (type(Sy) == "table" and type(Sy[H("287521d52df05833876154f50f7421cc")]) == "function") then
	local I = Sy[H("287521d52df05833876154f50f7421cc")];
	Sy[H("287521d52df05833876154f50f7421cc")] = function(u, b, ...)
			local W, C = pcall(I, u, b, ...);
			if not W then
				warn(H("20572bd117d77918bc"), C);
			end;
			if HB and (YB.antiLoseStreak and type(b) == "string") then
				local I = string.lower(b);
				if string.find(I, H("1c723a8202e84d23"), 1, true) or string.find(I, H("1e6e2dc313fa48"), 1, true) then
					task.spawn(cy);
				end;
			end;
		end;
else
	warn(H("20572bd117d77918bc2870c132502fcc02f84928c16658e05b7b21d70dfb0c77c14959e0123002cd10fa0c09957a52f5103d2acb10fe4e36846c17e013743d8210fa5f29886759"));
end;
if BB.rA then
	table.insert(tB, BB.rA.OnClientEvent:Connect(function(I)
		vB.caught = vB.caught + 1;
		if vB.inv then
			vB.inv = vB.inv + 1;
		end;
		dB.pendingVerify = nil;
		dB.skipFails = 0;
		if type(I) == "table" then
			local u = e(I.rarity);
			vB.byRarity[u] = ((vB.byRarity[u] or 0)) + 1;
		end;
		gB = true;
	end));
end;
task.spawn(function()
	while JB do
		if NB.farm then
			pcall(fy);
		end;
		task.wait(.15);
	end;
end);
task.spawn(function()
	while JB do
		local I = NB.farm or NB.favOn or NB.sellOn;
		local u = os.clock() - zB;
		local b = (NB.favOn and (gB and u >= 1.2)) or u >= s.InventoryPollSeconds or (NB.sellOn and (vB.inv and (vB.inv >= NB.sellAt and u >= 2)));
		if I and (b and not fB) then
			gB = false;
			fB = true;
			local I, u = pcall(function()
					local I = uy();
					if not I then
						return;
					end;
					if NB.favOn then
						Hy(I);
					end;
					if NB.sellOn and (vB.inv >= NB.sellAt and os.clock() >= pB) then
						xy(false);
					end;
				end);
			if not I then
				warn(H("20572bd117d77918bc"), u);
			end;
			fB = false;
		end;
		task.wait(.7);
	end;
end);
sB = LB();
KB();
a((("capabilities: minigame=%s getupvalues=%s getconnections=%s mgState=%s hook=%s")):format(tostring(sB ~= nil), tostring(S ~= nil), tostring(E ~= nil), tostring(QB ~= nil), tostring(hookmetamethod ~= nil and getnamecallmethod ~= nil)));
if not sB then
	warn(H("20572bd117d77918bc285afd157429c30efa0c378e6c42f81e3d3bcc02e94d338d6955f81e316ec301f05e2e886650"));
	JB = false;
	return;
end;
pcall(lB);
table.insert(tB, o.Heartbeat:Connect(OB));
table.insert(tB, P.CharacterAdded:Connect(function()
	mB.fishState, mB.rodState, mB.actionStart = nil, nil, nil;
	jB = nil;
	yB();
end));
local Ey = "\137PNG\r\n\026\n";
local function ay(I)
	task.spawn(function()
		local u, H = pcall(function()
				local I = getcustomasset or getsynasset;
				if not ((I and writefile)) then
					return nil;
				end;
				local u;
				if isfile and (readfile and isfile(s.LogoFile)) then
					u = readfile(s.LogoFile);
				end;
				if not ((type(u) == "string" and (#u > 1000 and string.sub(u, 1, 8) == Ey))) then
					u = nil;
					local I, H = pcall(function()
							return game:HttpGet(s.LogoUrl);
						end);
					if I and type(H) == "string" then
						u = H;
					end;
					if not u then
						local I = request or http_request or (syn and syn.request);
						if I then
							local H, b = pcall(I, { Url = s.LogoUrl, Method = "GET" });
							if H and (type(b) == "table" and type(b.Body) == "string") then
								u = b.Body;
							end;
						end;
					end;
					if not ((type(u) == "string" and (#u > 1000 and string.sub(u, 1, 8) == Ey))) then
						return nil;
					end;
					writefile(s.LogoFile, u);
				end;
				return I(s.LogoFile);
			end);
		if u and H then
			I(H);
		else
			a("logo not loaded (bubble keeps the CM text)");
		end;
	end);
end;
local function By()
	local I = {};
	local u = {};
	local b = {
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
	local W = {
			"Farm",
			"Favorit",
			"Jual",
			"Extras",
			"Profile",
		};
	local C = { Enum.EasingStyle.Back, Enum.EasingDirection.Out };
	local function V(I, u, H)
		local b = Instance.new(I);
		for I, u in pairs(u) do
			b[I] = u;
		end;
		if H then
			b.Parent = H;
		end;
		return b;
	end;
	local function q(I, u)
		return V("UICorner", { CornerRadius = UDim.new(0, u) }, I);
	end;
	local function T(I, u, H)
		return V("UIStroke", { Color = u, Thickness = H, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, I);
	end;
	local function R(I, u, H, b, W)
		local C = n:Create(I, TweenInfo.new(u, b or Enum.EasingStyle.Quad, W or Enum.EasingDirection.Out), H);
		C:Play();
		return C;
	end;
	local N = setmetatable({}, { __mode = "k" });
	local function Y(I)
		N[I] = ((N[I] or 0)) + 1;
		return N[I];
	end;
	local function Q()
		local I = workspace.CurrentCamera;
		return I and I.ViewportSize or Vector2.new(800, 600);
	end;
	local m = V("ScreenGui", {
			Name = x .. tostring(math.random(1000, 9999)),
			ResetOnSpawn = false,
			DisplayOrder = 999,
			IgnoreGuiInset = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		});
	pcall(function()
		m.Parent = (gethui and gethui()) or game:GetService("CoreGui");
	end);
	if not m.Parent then
		m.Parent = P:WaitForChild("PlayerGui");
	end;
	I.sg = m;
	local X = {
			minimized = false,
			ready = false,
			busy = false,
			bubbleMoved = false,
		};
	local M = Q();
	local j = Vector2.new(math.min(390, M.X - 24), math.min(500, M.Y - 24));
	local i = Vector2.new(math.max(12, ((M.X - j.X)) / 2), math.max(12, ((M.Y - j.Y)) / 2));
	local g = Vector2.new(i.X + 30, i.Y + 30);
	local o = V("CanvasGroup", {
			Name = "Main",
			AnchorPoint = Vector2.new(.5, .5),
			BackgroundColor3 = b.white,
			BorderSizePixel = 0,
			GroupTransparency = 1,
			Visible = false,
		}, m);
	q(o, 14);
	T(o, b.yellow, 2);
	local p = V("UIScale", { Scale = .85 }, o);
	local function A()
		o.Size = UDim2.fromOffset(j.X, j.Y);
		o.Position = UDim2.fromOffset(i.X + j.X / 2, i.Y + j.Y / 2);
	end;
	A();
	local c = V("Frame", {
			Name = "Header",
			Size = UDim2.new(1, 0, 0, 54),
			BackgroundColor3 = b.yellow,
			BorderSizePixel = 0,
			ClipsDescendants = true,
		}, o);
	V("UIGradient", { Color = ColorSequence.new(b.yellowLight, b.yellow), Rotation = 90 }, c);
	local d = V("Frame", {
			Size = UDim2.new(0, 36, 1.8, 0),
			Position = UDim2.new(-0.3, 0, -0.4, 0),
			Rotation = 20,
			BackgroundColor3 = b.white,
			BackgroundTransparency = .8,
			BorderSizePixel = 0,
		}, c);
	local w = V("Frame", {
			Size = UDim2.fromOffset(38, 38),
			Position = UDim2.fromOffset(12, 8),
			BackgroundColor3 = b.white,
			BorderSizePixel = 0,
		}, c);
	q(w, 19);
	T(w, b.yellowDark, 1.5);
	local S = V("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = U,
			Font = Enum.Font.GothamBlack,
			TextSize = 14,
			TextColor3 = b.text,
		}, w);
	local E = V("ImageLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Crop,
		}, w);
	q(E, 19);
	local a = V("TextLabel", {
			Size = UDim2.new(1, -150, 0, 20),
			Position = UDim2.fromOffset(58, 8),
			BackgroundTransparency = 1,
			RichText = true,
			Text = v,
			TextColor3 = b.text,
			Font = Enum.Font.GothamBold,
			TextScaled = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, c);
	V("UITextSizeConstraint", { MaxTextSize = 14, MinTextSize = 8 }, a);
	V("TextLabel", {
		Size = UDim2.new(1, -150, 0, 14),
		Position = UDim2.fromOffset(58, 30),
		BackgroundTransparency = 1,
		Text = "Mancing  -  Favorit  -  Jual   v" .. s.Version,
		TextColor3 = Color3.fromRGB(120, 92, 0),
		Font = Enum.Font.Gotham,
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, c);
	local function e(I, u)
		local H = V("TextButton", {
				Size = UDim2.fromOffset(28, 28),
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, u, .5, 0),
				BackgroundColor3 = b.white,
				Text = I,
				TextColor3 = b.text,
				Font = Enum.Font.GothamBold,
				TextSize = 14,
				AutoButtonColor = false,
			}, c);
		q(H, 14);
		H.MouseEnter:Connect(function()
			R(H, .12, { BackgroundColor3 = b.yellowSoft });
		end);
		H.MouseLeave:Connect(function()
			R(H, .12, { BackgroundColor3 = b.white });
		end);
		return H;
	end;
	local K = e("-", -46);
	local L = e("X", -12);
	local l = V("Frame", {
			Position = UDim2.new(0, 12, 0, 62),
			Size = UDim2.new(1, -24, 0, 34),
			BackgroundColor3 = b.offwhite,
			BorderSizePixel = 0,
		}, o);
	q(l, 10);
	T(l, b.line, 1);
	local h = V("Frame", {
			Size = UDim2.new(1 / #W, -6, 1, -6),
			Position = UDim2.new(0, 3, 0, 3),
			BackgroundColor3 = b.yellow,
			BorderSizePixel = 0,
		}, l);
	q(h, 8);
	local G = {};
	local y = V("Frame", {
			Position = UDim2.new(0, 0, 0, 102),
			Size = UDim2.new(1, 0, 1, -152),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
		}, o);
	local F = {};
	local function k()
		local I = V("CanvasGroup", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Visible = false }, y);
		local u = V("ScrollingFrame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 4,
				ScrollBarImageColor3 = b.yellowDark,
				CanvasSize = UDim2.new(),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				ScrollingDirection = Enum.ScrollingDirection.Y,
			}, I);
		V("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, u);
		V("UIPadding", {
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			PaddingTop = UDim.new(0, 4),
			PaddingBottom = UDim.new(0, 12),
		}, u);
		local H = { cg = I, sf = u };
		table.insert(F, H);
		return H;
	end;
	local O = V("Frame", {
			Size = UDim2.new(1, 0, 0, 50),
			Position = UDim2.new(0, 0, 1, -50),
			BackgroundColor3 = b.yellowSoft,
			BorderSizePixel = 0,
		}, o);
	local uB = V("Frame", {
			Size = UDim2.fromOffset(10, 10),
			Position = UDim2.fromOffset(12, 9),
			BackgroundColor3 = b.gray,
			BorderSizePixel = 0,
		}, O);
	q(uB, 5);
	local CB = V("TextLabel", {
			Size = UDim2.new(1, -66, 0, 16),
			Position = UDim2.fromOffset(28, 6),
			BackgroundTransparency = 1,
			Text = "",
			TextColor3 = b.text,
			Font = Enum.Font.GothamBold,
			TextSize = 11,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, O);
	local TB = V("TextLabel", {
			Size = UDim2.new(1, -66, 0, 14),
			Position = UDim2.fromOffset(28, 27),
			BackgroundTransparency = 1,
			Text = "",
			TextColor3 = b.muted,
			Font = Enum.Font.Gotham,
			TextSize = 10,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, O);
	local function xB(I, u, H, W)
		local C = V("Frame", {
				Name = "Padlock",
				Size = UDim2.fromOffset(14, 17),
				AnchorPoint = H,
				Position = W,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
			}, I);
		local R = V("Frame", {
				Size = UDim2.fromOffset(10, 11),
				Position = UDim2.fromOffset(2, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
			}, C);
		q(R, 5);
		T(R, u, 2);
		local N = V("Frame", {
				Size = UDim2.fromOffset(14, 10),
				Position = UDim2.fromOffset(0, 7),
				BackgroundColor3 = u,
				BorderSizePixel = 0,
			}, C);
		q(N, 3);
		local Y = V("Frame", {
				Size = UDim2.fromOffset(3, 4),
				Position = UDim2.fromOffset(5.5, 10),
				BackgroundColor3 = b.white,
				BorderSizePixel = 0,
			}, C);
		q(Y, 1);
		return C;
	end;
	local function sB(I, u, H)
		if not bB(u) then
			return nil;
		end;
		H = H or {};
		local W = V("TextButton", {
				Name = "LockShield",
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = b.offwhite,
				BackgroundTransparency = .3,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 30,
			}, I);
		if H.region then
			W.Position, W.Size = H.region[1], H.region[2];
		end;
		if H.radius then
			q(W, H.radius);
		end;
		xB(W, b.muted, Vector2.new(1, .5), UDim2.new(1, -((H.inset or 14)), .5, 0));
		W.Activated:Connect(function()
			dB.toast(r, "warn", 3);
		end);
		return W;
	end;
	local function mB(I)
		local u = V("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = b.offwhite,
				BorderSizePixel = 0,
				LayoutOrder = Y(I.sf),
			}, I.sf);
		q(u, 12);
		T(u, b.line, 1);
		V("UIPadding", {
			PaddingTop = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
		}, u);
		V("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, u);
		return u;
	end;
	local function XB(I, u, H, b, W)
		return V("TextLabel", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = u,
			TextSize = H,
			TextColor3 = b,
			Font = W,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			LayoutOrder = Y(I),
		}, I);
	end;
	local function MB(I, u, H)
		local W = XB(I, u, 12, b.yellowDark, Enum.Font.GothamBold);
		if bB(H) then
			xB(W, b.yellowDark, Vector2.new(1, .5), UDim2.new(1, 0, .5, 0));
		end;
		return W;
	end;
	local function jB(I, u)
		return XB(I, u, 11, b.muted, Enum.Font.Gotham);
	end;
	local function iB(I)
		local u = V("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = Y(I),
			}, I);
		V("UISizeConstraint", { MinSize = Vector2.new(0, 36) }, u);
		return u;
	end;
	local function fB(I, u, H, W)
		local C = V("Frame", { Size = UDim2.new(1, -W, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1 }, I);
		V("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }, C);
		XB(C, u, 13, b.text, Enum.Font.GothamBold);
		if H and H ~= "" then
			XB(C, H, 11, b.muted, Enum.Font.Gotham);
		end;
		return C;
	end;
	local function oB(H, W, T, N, Y, x, U)
		local v = iB(H);
		fB(v, W, T, 62);
		sB(v, U, { inset = 17 });
		local t = V("TextButton", {
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, 0, .5, 0),
				Size = UDim2.fromOffset(48, 26),
				Text = "",
				AutoButtonColor = false,
				BackgroundColor3 = b.gray,
			}, v);
		q(t, 13);
		local J = V("Frame", {
				Size = UDim2.fromOffset(20, 20),
				Position = UDim2.fromOffset(3, 3),
				BackgroundColor3 = b.white,
				BorderSizePixel = 0,
			}, t);
		q(J, 10);
		local s;
		table.insert(u, function()
			if x then
				local I = x();
				if v.Visible ~= I then
					v.Visible = I;
				end;
			end;
			local I = N() and true or false;
			if I ~= s then
				local u = s == nil;
				s = I;
				local H = I and b.yellowDark or b.gray;
				local W = I and UDim2.fromOffset(25, 3) or UDim2.fromOffset(3, 3);
				if u then
					t.BackgroundColor3, J.Position = H, W;
				else
					R(t, .18, { BackgroundColor3 = H });
					R(J, .22, { Position = W }, C[1], C[2]);
				end;
			end;
		end);
		t.Activated:Connect(function()
			Y(not N());
			I.refresh();
		end);
		return v;
	end;
	local function zB(H, W, C, N, Y, x, U, v, t, J)
		local s = iB(H);
		fB(s, W, C, 74);
		sB(s, J, { inset = 24 });
		local Q = V("TextBox", {
				AnchorPoint = Vector2.new(1, .5),
				Position = UDim2.new(1, 0, .5, 0),
				Size = UDim2.fromOffset(62, 30),
				BackgroundColor3 = b.white,
				Text = Z(N(), v),
				TextColor3 = b.text,
				Font = Enum.Font.GothamBold,
				TextSize = 13,
				ClearTextOnFocus = false,
				PlaceholderText = "",
			}, s);
		q(Q, 8);
		local m = T(Q, b.line, 1.5);
		Q.Focused:Connect(function()
			R(m, .15, { Color = b.yellowDark });
		end);
		Q.FocusLost:Connect(function()
			R(m, .15, { Color = b.line });
			local u = string.gsub(Q.Text, ",", ".");
			local H = tonumber(u);
			if H and B(H) then
				local I = math.clamp(H, x, U);
				if I ~= H then
					dB.toast((("Nilai dibatasi ke %s - %s")):format(Z(x, v), Z(U, v)), "warn", 3);
				end;
				Y(v and math.floor(I + .5) or I);
			else
				dB.toast("Isi dengan angka", "warn", 3);
			end;
			Q.Text = Z(N(), v);
			I.refresh();
		end);
		table.insert(u, function()
			if t then
				local I = t();
				if s.Visible ~= I then
					s.Visible = I;
				end;
			end;
			if Q:IsFocused() then
				return;
			end;
			local I = Z(N(), v);
			if Q.Text ~= I then
				Q.Text = I;
			end;
		end);
		return s;
	end;
	local function pB(H, W, N, x)
		local U = #W;
		local v = V("Frame", {
				Size = UDim2.new(1, 0, 0, 34),
				BackgroundColor3 = b.white,
				BorderSizePixel = 0,
				LayoutOrder = Y(H),
			}, H);
		q(v, 10);
		T(v, b.line, 1);
		local t = V("Frame", {
				Size = UDim2.new(1 / U, -6, 1, -6),
				Position = UDim2.new(0, 3, 0, 3),
				BackgroundColor3 = b.yellow,
				BorderSizePixel = 0,
			}, v);
		q(t, 8);
		local J = {};
		for u, H in ipairs(W) do
			local W = V("TextButton", {
					Size = UDim2.new(1 / U, 0, 1, 0),
					Position = UDim2.new(((u - 1)) / U, 0, 0, 0),
					BackgroundTransparency = 1,
					Text = H.text,
					Font = Enum.Font.GothamBold,
					TextSize = 12,
					TextColor3 = b.muted,
					AutoButtonColor = false,
					ZIndex = 2,
				}, v);
			W.Activated:Connect(function()
				x(H.id);
				I.refresh();
			end);
			J[u] = W;
			sB(v, H.lock, { radius = 8, inset = 8, region = { UDim2.new(((u - 1)) / U, 0, 0, 0), UDim2.new(1 / U, 0, 1, 0) } });
		end;
		local s = "unset";
		table.insert(u, function()
			local I = N();
			if I ~= s then
				local u = s == "unset";
				s = I;
				local H;
				for u, b in ipairs(W) do
					if b.id == I then
						H = u;
					end;
				end;
				for I, u in ipairs(J) do
					R(u, .18, { TextColor3 = (I == H) and b.text or b.muted });
				end;
				if H then
					local I = UDim2.new(((H - 1)) / U, 3, 0, 3);
					if u then
						t.Position, t.BackgroundTransparency = I, 0;
					else
						t.BackgroundTransparency = 0;
						R(t, .28, { Position = I }, C[1], C[2]);
					end;
				else
					R(t, .18, { BackgroundTransparency = 1 });
				end;
			end;
		end);
		return v;
	end;
	local function AB(I, u, H, W, N)
		local x = (H == "danger") and b.red or ((H == "ghost") and b.white or b.yellow);
		local U = (H == "danger") and Color3.fromRGB(235, 95, 85) or ((H == "ghost") and b.yellowSoft or b.yellowLight);
		local v = (H == "danger") and b.white or b.text;
		local t = V("TextButton", {
				Size = UDim2.new(1, 0, 0, 38),
				BackgroundColor3 = x,
				Text = u,
				TextColor3 = v,
				Font = Enum.Font.GothamBold,
				TextSize = 13,
				AutoButtonColor = false,
				LayoutOrder = Y(I),
			}, I);
		q(t, 10);
		if H == "ghost" then
			T(t, b.yellowDark, 1.5);
		end;
		local J = V("UIScale", { Scale = 1 }, t);
		t.MouseEnter:Connect(function()
			R(t, .12, { BackgroundColor3 = U });
		end);
		t.MouseLeave:Connect(function()
			R(t, .12, { BackgroundColor3 = x });
			R(J, .1, { Scale = 1 });
		end);
		t.MouseButton1Down:Connect(function()
			R(J, .08, { Scale = .96 });
		end);
		t.MouseButton1Up:Connect(function()
			R(J, .12, { Scale = 1 }, C[1], C[2]);
		end);
		t.Activated:Connect(W);
		sB(t, N, { radius = 10, inset = 14 });
		return t;
	end;
	local nB, cB, wB, PB, SB = k(), k(), k(), k(), k();
	local EB = V("Frame", {
			Size = UDim2.new(1, 0, 0, 76),
			BackgroundColor3 = b.offwhite,
			BorderSizePixel = 0,
			LayoutOrder = Y(nB.sf),
		}, nB.sf);
	q(EB, 14);
	local aB = T(EB, b.line, 1.5);
	local BB = V("TextLabel", {
			Size = UDim2.new(1, -90, 0, 20),
			Position = UDim2.fromOffset(14, 12),
			BackgroundTransparency = 1,
			Text = "AUTO FARM: MATI",
			TextColor3 = b.text,
			Font = Enum.Font.GothamBlack,
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, EB);
	local eB = V("TextLabel", {
			Size = UDim2.new(1, -90, 0, 30),
			Position = UDim2.fromOffset(14, 34),
			BackgroundTransparency = 1,
			Text = "Ketuk untuk mulai mancing otomatis",
			TextColor3 = b.muted,
			Font = Enum.Font.Gotham,
			TextSize = 11,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
		}, EB);
	local ZB = V("Frame", {
			AnchorPoint = Vector2.new(1, .5),
			Position = UDim2.new(1, -14, .5, 0),
			Size = UDim2.fromOffset(60, 32),
			BackgroundColor3 = b.gray,
			BorderSizePixel = 0,
		}, EB);
	q(ZB, 16);
	local KB = V("Frame", {
			Size = UDim2.fromOffset(26, 26),
			Position = UDim2.fromOffset(3, 3),
			BackgroundColor3 = b.white,
			BorderSizePixel = 0,
		}, ZB);
	q(KB, 13);
	local LB = V("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			ZIndex = 5,
		}, EB);
	LB.Activated:Connect(function()
		dB.setFarm(not NB.farm);
		I.refresh();
	end);
	local lB;
	table.insert(u, function()
		local I = NB.farm and true or false;
		eB.Text = I and ((vB.status or "")) or "Ketuk untuk mulai mancing otomatis";
		if I ~= lB then
			local u = lB == nil;
			lB = I;
			BB.Text = I and "AUTO FARM: AKTIF" or "AUTO FARM: MATI";
			local H = I and b.yellowSoft or b.offwhite;
			local W = I and b.yellowDark or b.line;
			local V = I and b.yellowDark or b.gray;
			local q = I and UDim2.fromOffset(31, 3) or UDim2.fromOffset(3, 3);
			if u then
				EB.BackgroundColor3, aB.Color, ZB.BackgroundColor3, KB.Position = H, W, V, q;
			else
				R(EB, .25, { BackgroundColor3 = H });
				R(aB, .25, { Color = W });
				R(ZB, .25, { BackgroundColor3 = V });
				R(KB, .3, { Position = q }, C[1], C[2]);
			end;
		end;
	end);
	local rB = { FREE = { b.gray, b.text }, PREMIUM = { b.yellow, b.text }, OWNER = { b.text, b.yellowLight } };
	local hB = rB[IB] or rB.FREE;
	local GB = mB(nB);
	MB(GB, "MODE MINIGAME");
	pB(GB, { { id = "Smart", text = "Smart" }, { id = "Skip", text = "Skip", lock = "skip" } }, function()
		return NB.mode;
	end, function(I)
		if I == "Skip" and not HB then
			DB();
			return;
		end;
		NB.mode = I;
		yB();
	end);
	local FB = jB(GB, "");
	table.insert(u, function()
		local I = VB[NB.mode];
		if FB.Text ~= I then
			FB.Text = I;
		end;
	end);
	local kB = mB(nB);
	MB(kB, "KECEPATAN", "speed");
	local OB = {};
	for I, u in ipairs(qB) do
		table.insert(OB, { id = u, text = u, lock = (u ~= "Aman") and "speed" or nil });
	end;
	pB(kB, OB, function()
		return NB.preset;
	end, function(I)
		dB.setPreset(I);
	end);
	local Iy = jB(kB, "");
	table.insert(u, function()
		local I = RB[NB.preset] or "";
		if Iy.Text ~= I then
			Iy.Text = I;
		end;
	end);
	local uy = mB(nB);
	MB(uy, "OTOMATISASI", "automation");
	oB(uy, "Lempar pancing otomatis", "Bot melempar pancing sendiri begitu siap.", function()
		return NB.autoCast;
	end, function(I)
		NB.autoCast = I;
	end, nil, "automation");
	oB(uy, "Pegang rod otomatis", "Mengambil rod dari tas jika belum dipegang (hanya saat farm aktif).", function()
		return NB.autoEquip;
	end, function(I)
		NB.autoEquip = I;
	end, nil, "automation");
	local Hy = mB(nB);
	MB(Hy, "ATUR WAKTU SENDIRI (LANJUTAN)", "timing");
	jB(Hy, "Semua angka dalam detik. Belum dikalibrasi untuk server ini: mulai dari preset Aman, naikkan pelan-pelan.");
	zB(Hy, "Tahan sebelum selesai", "Hanya mode Skip. Berapa detik minigame dimainkan normal dulu sebelum dipaksa selesai. 0 = langsung selesai begitu minigame muncul.", function()
		return NB.skipDelay;
	end, function(I)
		NB.skipDelay = I;
		dB.syncPreset();
	end, 0, 10, false, function()
		return NB.mode == "Skip";
	end, "timing");
	oB(Hy, "Percepat waktu gigitan", "Game biasanya menunggu 3-6 detik sampai ikan menggigit. Nyalakan untuk memperpendeknya.", function()
		return NB.biteFast;
	end, function(I)
		NB.biteFast = I;
		dB.syncPreset();
	end, nil, "timing");
	zB(Hy, "Waktu tunggu gigitan", "Makin kecil makin cepat, tapi server bisa menolak jika terlalu cepat.", function()
		return NB.biteWait;
	end, function(I)
		NB.biteWait = I;
		dB.syncPreset();
	end, .2, 6, false, function()
		return NB.biteFast;
	end, "timing");
	zB(Hy, "Jeda lempar ulang", "Istirahat singkat setelah dapat ikan sebelum melempar lagi. Terlalu kecil bisa membuat lemparan gagal.", function()
		return NB.castCooldown;
	end, function(I)
		NB.castCooldown = I;
		dB.syncPreset();
	end, .05, 2, false, nil, "timing");
	zB(Hy, "Batas macet", "Jika pancing menggantung selama ini tanpa hasil, script mereset lalu melempar ulang.", function()
		return NB.stuckTimeout;
	end, function(I)
		NB.stuckTimeout = I;
	end, 5, 120, true, nil, "timing");
	local by = mB(cB);
	MB(by, "AUTO FAVORIT", "favorit");
	oB(by, "Favoritkan ikan baru", "Ikan baru dengan rarity terpilih otomatis difavoritkan. Ikan yang sudah favorit tidak disentuh.", function()
		return NB.favOn;
	end, function(I)
		NB.favOn = I;
		if I then
			gB = true;
		end;
	end, nil, "favorit");
	local Wy = mB(cB);
	MB(Wy, "RARITY YANG DIFAVORITKAN", "favorit");
	local Cy = V("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = Y(Wy),
		}, Wy);
	V("UIGridLayout", { CellSize = UDim2.new(.3333, -4, 0, 34), CellPadding = UDim2.fromOffset(6, 6), SortOrder = Enum.SortOrder.LayoutOrder }, Cy);
	for H, W in ipairs(WB) do
		local C = V("TextButton", {
				Text = W,
				Font = Enum.Font.GothamBold,
				TextSize = 11,
				AutoButtonColor = false,
				LayoutOrder = H,
				BackgroundColor3 = b.white,
				TextColor3 = b.muted,
			}, Cy);
		q(C, 8);
		local N = T(C, b.gray, 1.5);
		sB(C, "favorit", { radius = 8, inset = 8 });
		local Y;
		table.insert(u, function()
			local I = NB.fav[W] and true or false;
			if I ~= Y then
				Y = I;
				R(C, .18, { BackgroundColor3 = I and b.yellow or b.white, TextColor3 = I and b.text or b.muted });
				R(N, .18, { Color = I and b.yellowDark or b.gray });
			end;
		end);
		C.Activated:Connect(function()
			NB.fav[W] = not NB.fav[W];
			I.refresh();
		end);
	end;
	AB(Wy, "Favoritkan sekarang", "primary", function()
		dB.favNow();
	end, "favorit");
	jB(Wy, "Tiap ikan hanya diproses satu kali, jadi ikan yang kamu un-favorit manual tidak difavoritkan ulang. Rarity yang dicentang juga dilindungi saat menjual.");
	local Vy = mB(wB);
	MB(Vy, "AUTO JUAL (TANPA NPC)", "jual");
	oB(Vy, "Jual otomatis", "Menjual ikan saat jumlahnya mencapai angka di bawah.", function()
		return NB.sellOn;
	end, function(I)
		dB.setSell(I);
	end, nil, "jual");
	zB(Vy, "Jual saat inventory >=", "Maksimal 500 (batas inventory game).", function()
		return NB.sellAt;
	end, function(I)
		NB.sellAt = I;
	end, 1, s.MaxInventory, true, nil, "jual");
	zB(Vy, "Jeda antar jual", "Jeda tiap kali menjual satu ikan. Terlalu kecil bisa dianggap spam oleh server.", function()
		return NB.sellGap;
	end, function(I)
		NB.sellGap = I;
	end, .02, 2, false, nil, "jual");
	local qy = mB(wB);
	MB(qy, "CARA JUAL", "jual");
	local Ty = XB(qy, "", 11, b.text, Enum.Font.GothamMedium);
	oB(qy, "Izinkan jual-semua", "Opsi hasil Pelajari ini akan menjual SEMUA ikan sekaligus. Jika ikan favorit tetap hilang setelah jual, Auto Jual langsung dimatikan.", function()
		return NB.allowSellAll;
	end, function(I)
		NB.allowSellAll = I;
	end, nil, "jual");
	table.insert(u, function()
		local I = dB.methodReport();
		local u = "Cara jual: " .. ((I.learned and ("sudah dipelajari" .. ((I.learnedKind == H("0d783cc002eb4537") and " (jual semua)" or " (per ikan)"))) or "belum dipelajari. Tekan \'Pelajari cara jual\' lalu jual 1 ikan di NPC."));
		if Ty.Text ~= u then
			Ty.Text = u;
		end;
	end);
	local Ry = mB(wB);
	MB(Ry, "AKSI", "jual");
	AB(Ry, "Jual sekarang", "primary", function()
		dB.sellNow();
	end, "jual");
	AB(Ry, "Pelajari cara jual (jual 1 ikan di NPC)", "ghost", function()
		dB.startLearn();
	end, "jual");
	AB(Ry, "Lupakan hasil pelajaran", "ghost", function()
		dB.forget();
	end, "jual");
	local Ny = XB(Ry, "", 11, b.text, Enum.Font.GothamMedium);
	table.insert(u, function()
		local I = "Info terakhir: " .. tostring(vB.lastNote or "-");
		if Ny.Text ~= I then
			Ny.Text = I;
		end;
	end);
	jB(Ry, "Uji aman: favoritkan 1 ikan murah, lalu tekan \'Jual sekarang\'. Jika ikan itu ikut hilang, Auto Jual mati otomatis dan jangan nyalakan jual-semua.");
	local Yy = mB(PB);
	MB(Yy, "ANTI-LOSE STREAK", "streak");
	oB(Yy, "Aktifkan Anti-Lose Streak", "PREMIUM/OWNER. Jalan terpisah dari Auto Farm. Kalau tangkapan ikan gagal, fitur ini otomatis menyelamatkan streak kamu dengan rejoin.", function()
		return YB.antiLoseStreak;
	end, function(I)
		YB.antiLoseStreak = I;
	end, nil, "streak");
	local xy = XB(Yy, "", 11, b.muted, Enum.Font.GothamMedium);
	table.insert(u, function()
		local I = zy and "Status: sudah pernah ter-trigger sesi ini (sedang/ sudah mencoba rejoin)." or "Status: belum pernah ter-trigger sesi ini.";
		if xy.Text ~= I then
			xy.Text = I;
		end;
	end);
	jB(Yy, "Selalu otomatis: begitu terdeteksi gagal, Auto Farm dihentikan dan !rejoin langsung dikirim 1x.");
	local Uy = mB(PB);
	MB(Uy, "SPOOF ROD (EKSPERIMEN)", "streak");
	oB(Uy, "Aktifkan Spoof Rod", "Mengganti data rod yang dikirim ke server saat melempar dengan rod pilihanmu di bawah. Rod yang dipegang tidak berubah.", function()
		return dy.on;
	end, function(I)
		if I then
			local I, u = dy.enable();
			if not I then
				dB.toast("Spoof Rod gagal: " .. tostring(u), "warn", 6);
			end;
		else
			dy.on = false;
		end;
	end, nil, "streak");
	local vy = XB(Uy, "", 12, b.text, Enum.Font.GothamBold);
	local ty = XB(Uy, "", 11, b.muted, Enum.Font.GothamMedium);
	local function Jy(u)
		local H = wy();
		if not H then
			dB.toast("Daftar rod tidak terbaca: " .. tostring(dy.err), "warn", 5);
			return;
		end;
		dy.idx = ((((dy.idx - 1) + u)) % #H) + 1;
		I.refresh();
	end;
	AB(Uy, "Rod berikutnya (luck lebih rendah)", "ghost", function()
		Jy(1);
	end, "streak");
	AB(Uy, "Rod sebelumnya (luck lebih tinggi)", "ghost", function()
		Jy(-1);
	end, "streak");
	table.insert(u, function()
		local I = dy.rods and dy.rods[dy.idx];
		local u = I and (("Rod dikirim: %s  |  baseLuck %s  |  maxRarity %s  |  urutan %d/%d")):format(I.name, tostring(I.luck), I.maxRarity, dy.idx, #dy.rods) or "Rod dikirim: (daftar dimuat saat tombol rod ditekan atau switch dinyalakan)";
		if vy.Text ~= u then
			vy.Text = u;
		end;
		local H = (("Status: %s  |  pelemparan yang diganti: %d%s")):format(dy.on and "AKTIF" or "mati", dy.count, dy.lastReal and ("  |  rod asli terakhir: " .. dy.lastReal) or "");
		if ty.Text ~= H then
			ty.Text = H;
		end;
	end);
	jB(Uy, "Eksperimen. Server bisa saja mengabaikan nama rod ini dan memakai rod yang benar-benar kamu pegang; kalau begitu hasil drop tidak berubah. Angka \'diganti\' hanya membuktikan hook bekerja, bukan bahwa luck naik. Hook hanya mengubah panggilan dari script game yang argumennya cocok (arg ke-3 = nama rod valid).");
	local function sy(I, u, H)
		local W = iB(I);
		V("TextLabel", {
			Size = UDim2.new(.4, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = u,
			TextColor3 = b.muted,
			Font = Enum.Font.GothamMedium,
			TextSize = 12,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, W);
		local C = V("TextLabel", {
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(.58, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Text = H,
				TextColor3 = b.text,
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Right,
			}, W);
		return C;
	end;
	local Qy = mB(SB);
	local my = V("Frame", { Size = UDim2.new(1, 0, 0, 68), BackgroundTransparency = 1, LayoutOrder = Y(Qy) }, Qy);
	local Xy = V("Frame", {
			Size = UDim2.fromOffset(60, 60),
			Position = UDim2.fromOffset(0, 4),
			BackgroundColor3 = b.yellowSoft,
			BorderSizePixel = 0,
		}, my);
	q(Xy, 30);
	T(Xy, b.yellowDark, 1.5);
	local My = V("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = (string.sub(P.Name, 1, 1)):upper(),
			Font = Enum.Font.GothamBlack,
			TextSize = 22,
			TextColor3 = b.text,
		}, Xy);
	local jy = V("ImageLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Crop,
		}, Xy);
	q(jy, 30);
	V("TextLabel", {
		Size = UDim2.new(1, -72, 0, 20),
		Position = UDim2.fromOffset(72, 2),
		BackgroundTransparency = 1,
		Text = P.DisplayName,
		Font = Enum.Font.GothamBold,
		TextSize = 15,
		TextColor3 = b.text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
	}, my);
	V("TextLabel", {
		Size = UDim2.new(1, -72, 0, 16),
		Position = UDim2.fromOffset(72, 23),
		BackgroundTransparency = 1,
		Text = "@" .. P.Name,
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextColor3 = b.muted,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, my);
	local iy = V("TextLabel", {
			Size = UDim2.fromOffset(74, 24),
			Position = UDim2.fromOffset(72, 44),
			BackgroundColor3 = hB[1],
			Text = IB,
			TextColor3 = hB[2],
			Font = Enum.Font.GothamBlack,
			TextSize = 12,
		}, my);
	q(iy, 12);
	task.spawn(function()
		local I, u = pcall(function()
				return f:GetUserThumbnailAsync(P.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180);
			end);
		if I and u then
			jy.Image = u;
			R(jy, .3, { ImageTransparency = 0 });
			My.Visible = false;
		end;
	end);
	local gy = mB(SB);
	MB(gy, "DETAIL AKUN");
	sy(gy, "Username", P.Name);
	sy(gy, "Display Name", P.DisplayName);
	local fy = sy(gy, "Negara", "Memuat...");
	local oy = sy(gy, "Role", IB);
	oy.TextColor3 = (IB == "FREE") and b.muted or b.yellowDark;
	task.spawn(function()
		local I, u = pcall(function()
				return D:GetCountryRegionForPlayerAsync(P);
			end);
		fy.Text = ((I and (type(u) == "string" and u ~= ""))) and u or "Tidak diketahui";
	end);
	jB(gy, HB and "Semua fitur terbuka, tanpa batasan." or "Akun FREE hanya membuka Auto Farm mode Smart.");
	local py;
	local function Ay(I, u)
		if py == I then
			return;
		end;
		py = I;
		for H, W in ipairs(F) do
			if H == I then
				W.cg.Visible = true;
				if u then
					W.cg.GroupTransparency, W.cg.Position = 0, UDim2.new();
				else
					W.cg.GroupTransparency, W.cg.Position = 1, UDim2.fromOffset(0, 14);
					R(W.cg, .25, { GroupTransparency = 0, Position = UDim2.new() });
				end;
			else
				W.cg.Visible = false;
			end;
			R(G[H], .18, { TextColor3 = (H == I) and b.text or b.muted });
		end;
		local H = UDim2.new(((I - 1)) / #W, 3, 0, 3);
		if u then
			h.Position = H;
		else
			R(h, .3, { Position = H }, C[1], C[2]);
		end;
	end;
	local ny = { Favorit = "favorit", Jual = "jual", Extras = "streak" };
	for I, u in ipairs(W) do
		local H = V("TextButton", {
				Size = UDim2.new(1 / #W, 0, 1, 0),
				Position = UDim2.new(((I - 1)) / #W, 0, 0, 0),
				BackgroundTransparency = 1,
				Text = u,
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextColor3 = b.muted,
				AutoButtonColor = false,
				ZIndex = 2,
			}, l);
		H.Activated:Connect(function()
			Ay(I);
		end);
		G[I] = H;
		if bB(ny[u]) then
			xB(H, b.muted, Vector2.new(1, .5), UDim2.new(1, -6, .5, 0));
		end;
	end;
	local cy = V("CanvasGroup", {
			AnchorPoint = Vector2.new(.5, 0),
			Position = UDim2.new(.5, 0, 0, 48),
			Size = UDim2.new(1, -28, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = b.text,
			BorderSizePixel = 0,
			GroupTransparency = 1,
			Visible = false,
			ZIndex = 40,
		}, o);
	q(cy, 10);
	local Dy = V("Frame", { Size = UDim2.new(0, 5, 1, 0), BackgroundColor3 = b.yellow, BorderSizePixel = 0 }, cy);
	local Py = V("TextLabel", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = "",
			TextColor3 = b.white,
			Font = Enum.Font.GothamMedium,
			TextSize = 12,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, cy);
	V("UIPadding", {
		PaddingTop = UDim.new(0, 9),
		PaddingBottom = UDim.new(0, 9),
		PaddingLeft = UDim.new(0, 16),
		PaddingRight = UDim.new(0, 10),
	}, Py);
	V("UISizeConstraint", { MaxSize = Vector2.new(360, math.huge) }, cy);
	local Sy = 0;
	local Ey = {
			ok = b.green,
			warn = b.yellow,
			err = b.red,
			info = b.yellowLight,
		};
	local By = V("ImageButton", {
			Name = "Bubble",
			Size = UDim2.fromOffset(60, 60),
			AnchorPoint = Vector2.new(.5, .5),
			BackgroundColor3 = b.yellow,
			AutoButtonColor = false,
			Image = "",
			ScaleType = Enum.ScaleType.Crop,
			Visible = false,
		}, m);
	q(By, 30);
	local ey = T(By, b.yellowDark, 3);
	local Zy = V("UIScale", { Scale = 0 }, By);
	local Ky = V("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = U,
			Font = Enum.Font.GothamBlack,
			TextSize = 20,
			TextColor3 = b.text,
		}, By);
	local Ly = V("Frame", {
			Size = UDim2.fromOffset(14, 14),
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 1, 0, -1),
			BackgroundColor3 = b.gray,
			BorderSizePixel = 0,
			ZIndex = 3,
		}, By);
	q(Ly, 7);
	T(Ly, b.white, 2);
	(n:Create(ey, TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Transparency = .7 })):Play();
	local function ly()
		By.Position = UDim2.fromOffset(g.X, g.Y);
	end;
	ly();
	function dB.toast(I, u, H)
		Sy = Sy + 1;
		local W = Sy;
		Py.Text = tostring(I);
		Dy.BackgroundColor3 = Ey[u or "info"] or b.yellow;
		cy.Visible = true;
		cy.GroupTransparency = 1;
		cy.Position = UDim2.new(.5, 0, 0, 40);
		R(cy, .32, { GroupTransparency = .03, Position = UDim2.new(.5, 0, 0, 58) }, C[1], C[2]);
		if X.minimized then
			R(Zy, .12, { Scale = 1.25 });
			task.delay(.14, function()
				R(Zy, .2, { Scale = 1 }, C[1], C[2]);
			end);
		end;
		task.delay(H or 4, function()
			if Sy == W then
				R(cy, .25, { GroupTransparency = 1, Position = UDim2.new(.5, 0, 0, 44) });
				task.delay(.3, function()
					if Sy == W then
						cy.Visible = false;
					end;
				end);
			end;
		end);
	end;
	local ry = V("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			Visible = false,
			Active = true,
			ZIndex = 60,
		}, o);
	local hy = V("CanvasGroup", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.new(1, -40, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = b.white,
			GroupTransparency = 1,
			ZIndex = 61,
		}, ry);
	q(hy, 14);
	T(hy, b.yellow, 2);
	V("UISizeConstraint", { MaxSize = Vector2.new(320, math.huge) }, hy);
	local Gy = V("UIScale", { Scale = .8 }, hy);
	V("UIPadding", {
		PaddingTop = UDim.new(0, 14),
		PaddingBottom = UDim.new(0, 14),
		PaddingLeft = UDim.new(0, 14),
		PaddingRight = UDim.new(0, 14),
	}, hy);
	V("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, hy);
	local yy = XB(hy, "", 15, b.text, Enum.Font.GothamBold);
	local Fy = XB(hy, "", 12, b.muted, Enum.Font.Gotham);
	local ky = V("Frame", { Size = UDim2.new(1, 0, 0, 38), BackgroundTransparency = 1, LayoutOrder = Y(hy) }, hy);
	V("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, ky);
	local Oy = V("TextButton", {
			Size = UDim2.new(.5, -4, 1, 0),
			BackgroundColor3 = b.yellow,
			Text = "Batal",
			TextColor3 = b.text,
			Font = Enum.Font.GothamBold,
			TextSize = 13,
			LayoutOrder = 1,
			AutoButtonColor = false,
		}, ky);
	q(Oy, 10);
	local I5 = V("TextButton", {
			Size = UDim2.new(.5, -4, 1, 0),
			BackgroundColor3 = b.red,
			Text = "",
			TextColor3 = b.white,
			Font = Enum.Font.GothamBold,
			TextSize = 13,
			LayoutOrder = 2,
			AutoButtonColor = false,
		}, ky);
	q(I5, 10);
	local u5, H5, b5 = 0, nil, nil;
	local function W5()
		local I = u5;
		R(ry, .18, { BackgroundTransparency = 1 });
		R(hy, .18, { GroupTransparency = 1 });
		R(Gy, .18, { Scale = .85 });
		task.delay(.2, function()
			if u5 == I then
				ry.Visible = false;
			end;
		end);
	end;
	function dB.ask(I, u, H, b, W)
		u5 = u5 + 1;
		yy.Text, Fy.Text, I5.Text = I, u, H;
		H5, b5 = b, W;
		ry.Visible = true;
		ry.BackgroundTransparency, hy.GroupTransparency, Gy.Scale = 1, 1, .8;
		R(ry, .2, { BackgroundTransparency = .5 });
		R(hy, .2, { GroupTransparency = 0 });
		R(Gy, .32, { Scale = 1 }, C[1], C[2]);
	end;
	I5.Activated:Connect(function()
		local I = H5;
		H5 = nil;
		W5();
		if I then
			I();
		end;
	end);
	Oy.Activated:Connect(function()
		local I = b5;
		H5, b5 = nil, nil;
		W5();
		if I then
			I();
		end;
	end);
	local C5;
	local function V5(I, u)
		I.InputBegan:Connect(function(I)
			if C5 then
				return;
			end;
			local H = I.UserInputType;
			if H == Enum.UserInputType.MouseButton1 or H == Enum.UserInputType.Touch then
				C5 = {
						input = I,
						cfg = u,
						sx = I.Position.X,
						sy = I.Position.Y,
						moved = false,
						touch = (H == Enum.UserInputType.Touch),
					};
				if u.onStart then
					u.onStart();
				end;
			end;
		end);
	end;
	table.insert(tB, z.InputChanged:Connect(function(I)
		local u = C5;
		if not u then
			return;
		end;
		if (u.touch and I == u.input) or ((not u.touch) and I.UserInputType == Enum.UserInputType.MouseMovement) then
			local H, b = I.Position.X - u.sx, I.Position.Y - u.sy;
			if not u.moved and (H * H + b * b) > 36 then
				u.moved = true;
			end;
			if u.moved then
				u.cfg.onMove(H, b);
			end;
		end;
	end));
	table.insert(tB, z.InputEnded:Connect(function(I)
		local u = C5;
		if u and ((I == u.input or ((not u.touch) and I.UserInputType == Enum.UserInputType.MouseButton1))) then
			C5 = nil;
			if u.cfg.onEnd then
				u.cfg.onEnd(u.moved);
			end;
		end;
	end));
	local q5;
	V5(c, { onStart = function()
			q5 = i;
		end, onMove = function(I, u)
			local H = Q();
			i = Vector2.new(math.clamp(q5.X + I, 0, math.max(0, H.X - j.X)), math.clamp(q5.Y + u, 0, math.max(0, H.Y - j.Y)));
			A();
		end });
	local T5 = V("TextButton", {
			Size = UDim2.fromOffset(26, 26),
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -2, 1, -2),
			BackgroundTransparency = 1,
			Text = "",
			ZIndex = 50,
			AutoButtonColor = false,
		}, o);
	local R5 = {};
	for I, u in ipairs({
		{ 18, 18 },
		{ 12, 18 },
		{ 18, 12 },
		{ 6, 18 },
		{ 12, 12 },
		{ 18, 6 },
	}) do
		local H = V("Frame", {
				Size = UDim2.fromOffset(3, 3),
				Position = UDim2.fromOffset(u[1], u[2]),
				BackgroundColor3 = b.yellowDark,
				BorderSizePixel = 0,
				ZIndex = 51,
			}, T5);
		q(H, 2);
		table.insert(R5, H);
	end;
	T5.MouseEnter:Connect(function()
		for I, u in ipairs(R5) do
			R(u, .12, { BackgroundColor3 = b.text });
		end;
	end);
	T5.MouseLeave:Connect(function()
		for I, u in ipairs(R5) do
			R(u, .12, { BackgroundColor3 = b.yellowDark });
		end;
	end);
	local N5;
	V5(T5, { onStart = function()
			N5 = j;
		end, onMove = function(I, u)
			local H = Q();
			local b = math.min(720, math.max(300, (H.X - i.X) - 4));
			local W = math.min(820, math.max(340, (H.Y - i.Y) - 4));
			j = Vector2.new(math.clamp(N5.X + I, 300, b), math.clamp(N5.Y + u, 340, W));
			A();
		end });
	local function Y5(I)
		local u = Q();
		return Vector2.new(math.clamp(I.X, 32, math.max(32, u.X - 32)), math.clamp(I.Y, 32, math.max(32, u.Y - 32)));
	end;
	local function x5()
		if X.minimized or not X.ready or X.busy then
			return;
		end;
		X.minimized, X.busy = true, true;
		if not X.bubbleMoved then
			g = Y5(Vector2.new(i.X + 30, i.Y + 30));
		end;
		ly();
		R(o, .28, { GroupTransparency = 1, Position = UDim2.fromOffset(g.X, g.Y) }, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
		R(p, .28, { Scale = .15 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
		task.delay(.3, function()
			o.Visible = false;
			By.Visible = true;
			Zy.Scale = 0;
			R(Zy, .4, { Scale = 1 }, C[1], C[2]);
			X.busy = false;
		end);
	end;
	local function U5()
		if not X.minimized or X.busy then
			return;
		end;
		X.minimized, X.busy = false, true;
		local I = Q();
		i = Vector2.new(math.clamp(g.X - 30, 8, math.max(8, (I.X - j.X) - 8)), math.clamp(g.Y - 30, 8, math.max(8, (I.Y - j.Y) - 8)));
		R(Zy, .15, { Scale = 0 });
		o.Size = UDim2.fromOffset(j.X, j.Y);
		o.Position = UDim2.fromOffset(g.X, g.Y);
		p.Scale, o.GroupTransparency, o.Visible = .15, 1, true;
		R(o, .36, { GroupTransparency = 0, Position = UDim2.fromOffset(i.X + j.X / 2, i.Y + j.Y / 2) });
		R(p, .42, { Scale = 1 }, C[1], C[2]);
		task.delay(.18, function()
			By.Visible = false;
		end);
		task.delay(.45, function()
			X.busy = false;
		end);
	end;
	local v5;
	V5(By, { onStart = function()
			v5 = g;
		end, onMove = function(I, u)
			X.bubbleMoved = true;
			g = Y5(Vector2.new(v5.X + I, v5.Y + u));
			ly();
		end, onEnd = function(I)
			if not I then
				U5();
			end;
		end });
	K.Activated:Connect(x5);
	function I.fadeOut(I)
		R(p, .25, { Scale = .85 });
		R(o, .25, { GroupTransparency = 1 });
		R(Zy, .2, { Scale = 0 });
		task.delay(.3, I);
	end;
	L.Activated:Connect(function()
		dB.ask("Tutup GUI?", "Semua fitur akan berhenti dan GUI dihapus. Lanjutkan?", "Lanjut", function()
			dB.ask("Konfirmasi terakhir", "Ini MENUTUP TOTAL program. Untuk menampilkan lagi harus eksekusi script ulang. Yakin?", "Tutup Total", function()
				dB.closeAll();
			end);
		end);
	end);
	table.insert(tB, z.InputBegan:Connect(function(I, u)
		if not u and (X.ready and I.KeyCode == s.ToggleKey) then
			if X.minimized then
				U5();
			else
				x5();
			end;
		end;
	end));
	function I.refresh()
		for I, u in ipairs(u) do
			pcall(u);
		end;
	end;
	dB.refreshUI = I.refresh;
	task.spawn(function()
		while JB do
			UB();
			CB.Text = vB.status or "";
			TB.Text = (("Inv %s/%d  |  Tangkap %d  |  Fav %d  |  Jual %d")):format(tostring(vB.inv or "?"), s.MaxInventory, vB.caught, vB.fav, vB.sold);
			local u = NB.farm and b.green or b.gray;
			uB.BackgroundColor3 = u;
			Ly.BackgroundColor3 = NB.farm and b.green or b.gray;
			I.refresh();
			task.wait(.5);
		end;
	end);
	task.spawn(function()
		while JB do
			d.Position = UDim2.new(-0.3, 0, -0.4, 0);
			if o.Visible and not X.minimized then
				R(d, 1.1, { Position = UDim2.new(1.3, 0, -0.4, 0) }, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
			end;
			task.wait(6);
		end;
	end);
	local t5;
	ay(function(I)
		E.Image = I;
		R(E, .4, { ImageTransparency = 0 });
		By.Image = I;
		Ky.Visible = false;
		if t5 then
			t5.Image = I;
			R(t5, .4, { ImageTransparency = 0 });
		end;
	end);
	local J5 = V("CanvasGroup", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.fromOffset(280, 220),
			BackgroundColor3 = b.white,
			BorderSizePixel = 0,
			GroupTransparency = 1,
		}, m);
	q(J5, 20);
	T(J5, b.yellow, 2);
	local s5 = V("UIScale", { Scale = .8 }, J5);
	local Q5 = V("Frame", {
			AnchorPoint = Vector2.new(.5, 0),
			Position = UDim2.new(.5, 0, 0, 20),
			Size = UDim2.fromOffset(88, 88),
			BackgroundColor3 = b.yellow,
			BorderSizePixel = 0,
		}, J5);
	q(Q5, 44);
	T(Q5, b.yellowDark, 3);
	local m5 = V("UIScale", { Scale = 1 }, Q5);
	V("TextLabel", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = U,
		Font = Enum.Font.GothamBlack,
		TextSize = 30,
		TextColor3 = b.text,
	}, Q5);
	t5 = V("ImageLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Crop,
		}, Q5);
	q(t5, 44);
	V("TextLabel", {
		Position = UDim2.fromOffset(0, 118),
		Size = UDim2.new(1, 0, 0, 22),
		BackgroundTransparency = 1,
		Text = t,
		Font = Enum.Font.GothamBlack,
		TextSize = 18,
		TextColor3 = b.text,
	}, J5);
	V("TextLabel", {
		Position = UDim2.fromOffset(0, 139),
		Size = UDim2.new(1, 0, 0, 14),
		BackgroundTransparency = 1,
		Text = J,
		Font = Enum.Font.GothamBold,
		TextSize = 11,
		TextColor3 = b.yellowDark,
	}, J5);
	local X5 = V("Frame", {
			AnchorPoint = Vector2.new(.5, 0),
			Position = UDim2.new(.5, 0, 0, 168),
			Size = UDim2.fromOffset(200, 6),
			BackgroundColor3 = b.line,
			BorderSizePixel = 0,
		}, J5);
	q(X5, 3);
	local M5 = V("Frame", { Size = UDim2.fromScale(0, 1), BackgroundColor3 = b.yellow, BorderSizePixel = 0 }, X5);
	q(M5, 3);
	local j5 = V("TextLabel", {
			Position = UDim2.fromOffset(0, 180),
			Size = UDim2.new(1, 0, 0, 16),
			BackgroundTransparency = 1,
			Text = "",
			Font = Enum.Font.Gotham,
			TextSize = 10,
			TextColor3 = b.muted,
		}, J5);
	(n:Create(m5, TweenInfo.new(.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Scale = 1.08 })):Play();
	task.spawn(function()
		R(J5, .35, { GroupTransparency = 0 });
		R(s5, .45, { Scale = 1 }, C[1], C[2]);
		local u = {
				{ (("Akun %s - mode %s")):format(P.Name, IB), .2 },
				{ ((hookmetamethod and getnamecallmethod)) and "Fitur executor lengkap" or "Fitur executor terbatas", .35 },
				{ QB and "Minigame & state game ditemukan" or "Minigame ditemukan (mode GUI)", .7 },
				{ "Menyiapkan tampilan...", 1 },
			};
		for I, u in ipairs(u) do
			j5.Text = u[1];
			R(M5, .4, { Size = UDim2.fromScale(u[2], 1) });
			task.wait(.5);
		end;
		task.wait(.15);
		R(J5, .3, { GroupTransparency = 1 });
		R(s5, .3, { Scale = 1.12 });
		task.wait(.3);
		J5:Destroy();
		A();
		o.Visible = true;
		Ay(1, true);
		I.refresh();
		R(o, .35, { GroupTransparency = 0 });
		R(p, .5, { Scale = 1 }, C[1], C[2]);
		X.ready = true;
		dB.toast((("Masuk sebagai %s. Semua fitur MATI. Nyalakan sesuai kebutuhan.")):format(IB), HB and "ok" or "info", 5);
	end);
	function I.destroy()
		pcall(function()
			m:Destroy();
		end);
	end;
	return I;
end;
local ey = By();
local function Zy()
	JB = false;
	NB.farm, NB.sellOn = false, false;
	dy.on = false;
	pcall(GB);
	if sB then
		pcall(sB.SetHolding, sB, false);
	end;
	for I, u in ipairs(tB) do
		pcall(function()
			u:Disconnect();
		end);
	end;
	if g[b.g2o] then
		g[b.g2o].handler = nil;
	end;
	pcall(ey.destroy);
	g[b.g0a] = nil;
end;
function dB.closeAll()
	ey.fadeOut(Zy);
end;
g[b.g0a] = { Destroy = Zy };
task.spawn(function()
	pcall(uy);
end);
a("loaded v" .. (s.Version .. ". Semua fitur mati. Minimize/restore:"), s.ToggleKey.Name);
