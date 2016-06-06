class ClickatellsendGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)
  def create_initializer_file
    copy_file "clickatellsend.rb", "config/initializers/clickatellsend.rb"
  end
end