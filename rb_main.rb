#
# rb_main.rb
# Harvester
#
# Created by Bodaniel Jeanes on 16/01/09.
# Copyright Mocra 2009. All rights reserved.
#

# Loading the Cocoa framework. If you need to load more frameworks, you can
# do that here too.
framework 'Cocoa'
framework 'Security'

# Loading all the Ruby project files.
dir_path = NSBundle.mainBundle.resourcePath.fileSystemRepresentation
Dir.entries(dir_path).each do |path|
  extension =  path.split('.')[-1] rescue ''
  file = File.join(dir_path,path)
  if path != File.basename(__FILE__) and extension == 'rb'
	NSLog("Requiring Ruby file %s" % path)
    require file
  elsif extension == 'bridgesupport'
	NSLog("Loading bridge support file %s" % path)
    load_bridge_support_file file
  end
end

# Starting the Cocoa main loop.
NSApplicationMain(0, nil)
