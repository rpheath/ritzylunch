RPH::Navigation::Builder.config do |navigation|
  navigation.define :header do |menu|
    menu.item HomeController, :path => :root_path
  end
end