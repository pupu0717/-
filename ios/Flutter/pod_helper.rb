# Ensure the Flutter framework is available
require File.expand_path(File.join(__dir__, '..', '..', 'Flutter', 'flutter_export_environment.rb'))

# This method should be used to integrate Flutter plugins into the project.
def flutter_install_plugins(flutter_application_path)
  require File.expand_path(File.join(flutter_application_path, '.ios', 'Flutter', 'flutter_export_environment.rb'))
end

# Load the Flutter plugin dependencies
flutter_application_path = File.expand_path(File.join(__dir__, '..', '..'))
flutter_install_plugins(flutter_application_path)