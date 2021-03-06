--[[
LuCI - Lua Configuration Interface

Copyright 2008 Steven Barth <steven@midlink.org>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id$
]]--

luci.i18n.loadc("freifunk")
local uci = require "luci.model.uci".cursor()

m = Map("freifunk", translate("contact"), translate("contact1"))

c = m:section(NamedSection, "contact", "public", "")

c:option(Value, "nickname", translate("ff_nickname"))
c:option(Value, "name", translate("ff_name"))
c:option(Value, "mail", translate("ff_mail"), translate("ff_mail1"))
c:option(Value, "phone", translate("ff_phone"))
c:option(Value, "location", translate("ff_location"))
r=c:option(ListValue, "region", translate("pp_regional_assoc"))
uci:foreach("regions", "region", function(s)
	r:value( "%s" % s.name, "%s" % s.name)
end)

c:option(Value, "crew", "Crew")
c:option(Value, "note", translate("ff_note"))

m2 = Map("system", translate("geo"))

s = m2:section(TypedSection, "system", "")
s:option(Value, "latitude", translate("latitude", "Breite"))
s:option(Value, "longitude", translate("longitude", "Länge"))


return m, m2
