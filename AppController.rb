#
#  AppController.rb
#  Harvester
#
#  Created by Bodaniel Jeanes on 17/01/09.
#  Copyright (c) 2009 Mocra. All rights reserved.
#

require 'osx/cocoa'

class AppController < OSX::NSObject
	attr_accessor :popupWindow
	
	def initialize
		@windowVisible = false
	end

	def awakeFromNib
		NSLog("Getting Status Bar")
		@bar = NSStatusBar.systemStatusBar
		@status_item = @bar.statusItemWithLength(NSVariableStatusItemLength)
		NSLog("Setting status item icon")

		@status_item.target = self
		@status_item.action = :action_test
		@status_item.title = "Harvester"
#		@status_item.menu = @statusMenu
		@status_item.toolTip = "Click to log times"
		@status_item.highlightMode = true
	end
	
	def action_test
		if @shown
			@shown = false
			@popupWindow.orderOut(self)
		else
			@shown = true
			@popupWindow.makeKeyAndOrderFront(self)
		end
	end
end
