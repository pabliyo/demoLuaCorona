local max, acceleration, left, right, flip = 375, 5000, 0, 0, 0
	local lastEvent = {}
	local function key( event )
		local phase = event.phase
		local name = event.keyName
		if ( phase == lastEvent.phase ) and ( name == lastEvent.keyName ) then return false end  -- Filter repeating keys
		if phase == "down" then
			if "left" == name or "a" == name then
				left = -acceleration
				flip = -0.133
			end
			if "right" == name or "d" == name then
				right = acceleration
				flip = 0.133
			end
		end
		lastEvent = event
	end

	function instance:jump()
		if not self.jumping then
			self:applyLinearImpulse( 0, -550 )
			self:setSequence( "jump" )
			self.jumping = true
		end
	end