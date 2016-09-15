local E, L, V, P, G = unpack(select(2, ...));
local S = E:GetModule('Skins');

local function LoadSkin()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.movepad ~= true then return end

	MovePadFrame:StripTextures()
	MovePadFrame:SetTemplate("Transparent")

	S:HandleButton(MovePadStrafeLeft)
	S:HandleButton(MovePadStrafeRight)
	S:HandleButton(MovePadForward)
	S:HandleButton(MovePadBackward)
	S:HandleButton(MovePadJump)

	S:HandleCloseButton(MovePadLock, nil, " ");
	MovePadLock:Point("BOTTOMRIGHT", MovePadFrame, "BOTTOMRIGHT", 5, -5);

end

S:AddCallbackForAddon("Blizzard_MovePad", "MovePad", LoadSkin);