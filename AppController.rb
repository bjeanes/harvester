#
#  AppController.rb
#  Harvester
#
#  Created by Bodaniel Jeanes on 17/01/09.
#  Copyright (c) 2009 Mocra. All rights reserved.
#

class AppController < NSObject
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
    @status_item.action = :showHideOrWindow
    @status_item.title = "Harvester"
    @status_item.toolTip = "Click to log times"
    @status_item.highlightMode = true
  end
  
  def windowShouldClose(window)
    if window == @popupWindow
      # instead of closing window, let's just hide it
      NSLog("Window is trying to be closed, hiding instead")
      @popupWindow.orderOut(self)
      false
    else
      true
    end
  end
  
  def showHideOrWindow
    if @popupWindow.isVisible()
      @popupWindow.orderOut(self)
    else
      @popupWindow.makeKeyAndOrderFront(self)
    end
  end
end
