module PressHelper
  def document_link(filename)
    link_to filename, "/documents/#{filename}"
  end
end