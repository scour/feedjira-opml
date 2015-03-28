module Feedjira
  module Parser
    class OPMLHead
      include SAXMachine
      include FeedUtilities

      element :title
      element :dateCreated, as: :date_created
      element :dateModified, as: :date_modified
      element :ownerName, as: :owner_name
      element :ownerEmail, as: :owner_email
      element :ownerId, as: :owner_id
      element :docs
      element :expansionState, as: :expansion_state
      element :vertScrollState, as: :vert_scroll_state
      element :windowTop, as: :window_top
      element :windowLeft, as: :window_left
      element :windowBottom, as: :window_bottom
      element :windowRight, as: :window_right
    end
  end
end
