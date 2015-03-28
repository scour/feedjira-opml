module Feedjira
  module Parser
    class OPMLBody
      include SAXMachine
      include FeedUtilities

      elements :outline, as: :outlines, class: OPMLOutline
    end
  end
end
