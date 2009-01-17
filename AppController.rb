#
#  AppController.rb
#  Harvester
#
#  Created by Bodaniel Jeanes on 17/01/09.
#  Copyright (c) 2009 Mocra. All rights reserved.
#

require 'osx/cocoa'

class AppController < OSX::NSObject
	attr_accessor :statusMenu

	def awakeFromNib
		NSLog("Getting Status Bar")
		@bar = NSStatusBar.systemStatusBar
		@status_item = @bar.statusItemWithLength(NSVariableStatusItemLength)
		NSLog("Setting status item icon")

		@status_item.setTitle("Harvester")
		@status_item.setMenu(@statusMenu)
		@status_item.setToolTip("Click for more information")
		@status_item.setHighlightMode(true)
	end
end
