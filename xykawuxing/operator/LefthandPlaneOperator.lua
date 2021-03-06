local Card = require("xykawuxing.card.card")

local LefthandPlaneOperator = class("LefthandPlaneOperator")

local LEFTHAND_SPLIT = 10

function LefthandPlaneOperator:init(playerType, plane)
	plane:removeAllChildren()
	
	if playerType == CARD_PLAYERTYPE_MY then
		--todo
		plane:setSize(cc.size(0, plane:getSize().height))
	elseif playerType == CARD_PLAYERTYPE_LEFT then
		plane:setSize(cc.size(plane:getSize().width, 0))
	elseif playerType == CARD_PLAYERTYPE_RIGHT then
		plane:setSize(cc.size(plane:getSize().width, 0))
	elseif playerType == CARD_PLAYERTYPE_TOP then
		plane:setSize(cc.size(0, plane:getSize().height))
	end
end

function LefthandPlaneOperator:addProg(playerType, plane, progCards, controlType)
	if table.getn(progCards) == 4 then
		--todo
		table.remove(progCards, 4)
	end

	if bit.band(controlType, GANG_TYPE_BU) > 0 then
		--todo
		self:addGangCard(playerType, plane, progCards[1], false)
	else
		self:addCards(playerType, plane, progCards)

		if bit.band(controlType, CONTROL_TYPE_GANG) > 0 then
			--todo
			local isAg
			if bit.band(controlType, GANG_TYPE_AN) > 0 then
				--todo
				isAg = true
			else
				isAg = false
			end

			self:addGangCard(playerType, plane, progCards[1], isAg)
		end
	end
	
end

function LefthandPlaneOperator:addGangCard(playerType, plane, card, isAg)
	local floorCard = plane:getChildByName(card .. "")

	if not floorCard then
		--todo
		return
	end

	local showType
	if isAg then
		--todo
		showType = CARD_DISPLAY_TYPE_HIDE
	else
		showType = CARD_DISPLAY_TYPE_SHOW
	end

	local cardNode = Card:new(playerType, CARD_TYPE_LEFTHAND, showType, card)
	local p = floorCard:getPosition()

	if playerType == CARD_PLAYERTYPE_MY then
		--todo
		cardNode:setPosition(cc.p(p.x, p.y + 12))
	elseif playerType == CARD_PLAYERTYPE_LEFT then
		cardNode:setPosition(cc.p(p.x, p.y + 12))
	elseif playerType == CARD_PLAYERTYPE_RIGHT then
		cardNode:setPosition(cc.p(p.x, p.y + 12))
	elseif playerType == CARD_PLAYERTYPE_TOP then
		cardNode:setPosition(cc.p(p.x, p.y + 12))
	end

	cardNode:setLocalZOrder(200)
	plane:addChild(cardNode)
end

function LefthandPlaneOperator:addCards(playerType, plane, cardDatas)
	if table.getn(cardDatas) < 3 then
		--todo
		return
	end
	local isSame
	if cardDatas[1] == cardDatas[2] then
		--todo
		isSame = true
	else
		isSame = false
	end
	if playerType == CARD_PLAYERTYPE_MY then
		--todo
		local size = plane:getSize()
		local oriX = size.width

		for i=1,table.getn(cardDatas) do
			local cardData = cardDatas[i]

			local card = Card:new(playerType, CARD_TYPE_LEFTHAND, CARD_DISPLAY_TYPE_SHOW, cardData)

			card:setPosition(cc.p(oriX + card:getSize().width * card:getScale() / 2, card:getSize().height * card:getScale() / 2))

			plane:addChild(card)

			oriX = oriX + (card:getSize().width - 2) * card:getScale()

			if i == 2 and isSame then
				--todo
				card:setName(cardData .. "")
			end
		end



		plane:setSize(cc.size(oriX + LEFTHAND_SPLIT, plane:getSize().height))
	elseif playerType == CARD_PLAYERTYPE_LEFT then
		print("gang lefthand test")
		local size = plane:getSize()

		local count = table.getn(cardDatas)
		local addHeight = count * 23 + LEFTHAND_SPLIT

		local children = plane:getChildren()
		for i=1,table.getn(children) do
			local child = children[i]
			child:setPosition(child:getPosition().x, child:getPosition().y + addHeight)
		end

		for i=1,count do
			local cardData = cardDatas[i]

			local card = Card:new(playerType, CARD_TYPE_LEFTHAND, CARD_DISPLAY_TYPE_SHOW, cardData)

			card:setPosition(cc.p(card:getSize().width / 2, (count - i + 0.5) * 23))

			plane:addChild(card)

			if i == 2 and isSame then
				--todo
				card:setName(cardData .. "")
			end
		end

		plane:setSize(cc.size(plane:getSize().width, plane:getSize().height + addHeight))
	elseif playerType == CARD_PLAYERTYPE_RIGHT then
		--todo
		local size = plane:getSize()
		local oriY = size.height

		for i=1,table.getn(cardDatas) do
			local cardData = cardDatas[i]

			local card = Card:new(playerType, CARD_TYPE_LEFTHAND, CARD_DISPLAY_TYPE_SHOW, cardData)

			card:setPosition(cc.p(card:getSize().width / 2, oriY + 23 / 2))

			card:setLocalZOrder(100 - plane:getChildrenCount())

			plane:addChild(card)

			oriY = oriY + 23

			if i == 2 and isSame then
				--todo
				card:setName(cardData .. "")
			end
		end



		plane:setSize(cc.size(plane:getSize().width, oriY + LEFTHAND_SPLIT))
	elseif playerType == CARD_PLAYERTYPE_TOP then
		local size = plane:getSize()

		local count = table.getn(cardDatas)
		local addWidth = count * 27 + LEFTHAND_SPLIT

		local children = plane:getChildren()
		for i=1,table.getn(children) do
			local child = children[i]
			child:setPosition(child:getPosition().x + addWidth, child:getPosition().y)
		end

		for i=1,count do
			local cardData = cardDatas[i]

			local card = Card:new(playerType, CARD_TYPE_LEFTHAND, CARD_DISPLAY_TYPE_SHOW, cardData)

			card:setPosition(cc.p((count - i + 0.5) * 27, card:getSize().height / 2))

			plane:addChild(card)

			if i == 2 and isSame then
				--todo
				card:setName(cardData .. "")
			end
		end

		plane:setSize(cc.size(plane:getSize().width + addWidth, plane:getSize().height))
	end
end

function LefthandPlaneOperator:redraw(playerType, plane, progCards)
	local count = table.getn(progCards)

	for i=1,count do
		self:addProg(playerType, plane, progCards[i].cards, progCards[i].type)
	end
end

return LefthandPlaneOperator