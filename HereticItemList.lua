HereticItem = {}
HereticItemList = {}

HereticItemList.__index = HereticItemList
function HereticItemList:New(instanceID, master, entries)
	local obj = {
	instanceID = instanceID,
	master = master,
	entries = {},
	}
	setmetatable(obj, self)
	return obj
end

HereticItem.__index = HereticItem
function HereticItem:New(itemLink, donator, winner, rollActionID)
	local obj = {
	itemLink = itemLink or "",
	donator = donator or "",
	winner = winner or {},
	rollActionID = rollActionID or 0,
	}
	setmetatable(obj, self)
	return obj
end

function HereticItemList:GetEntry(pos)
	if (pos < 1 or pos > #self.entries) then return nil end
	return self.entries[pos].itemLink--, self.entries[pos].donator, self.entries[pos].winner, self.entries[pos].rollActionID
end

function HereticItemList:DeleteEntryAt(pos)
	table.remove(self.entries, pos)
end

function HereticItemList:DeleteAllEntries() 
	for i=0, #self.entries do  
		self.entries[i]=nil
	end
end

function HereticItemList:Validate()
	setmetatable(self, HereticItemList)
	if (self.instanceID == 0 or 
		self.master == "") then
		return false
	elseif not self.entries then
		self.entries = {}
	else 
		return true
	end
end

function HereticItemList:GetItemLinkByID(pos)
	return self.entries[pos].itemLink
end

function HereticItemList:Size()
	return #self.entries
end

function HereticItemList:GetEntryId(item, donator)
  for i=1, #self.entries do
    if (self.entries[i].itemLink == item and
        self.entries[i].donator == donator) then
      return i
    end
  end
  return nil
end