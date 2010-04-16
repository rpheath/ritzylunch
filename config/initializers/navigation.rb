RPH::Navigation::Builder.config do |navigation|
  navigation.define :header do |menu|
    menu.item HomeController
    menu.item MenuController, :text => 'Our Menu'
    menu.item AboutController
    menu.item LocationController
  end
end