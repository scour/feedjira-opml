module Feedjira
  module Parser
    class OPMLHead
      include SAXMachine
      include FeedUtilities

      element :title

      element :dateCreated, as: :date_created do |s|
        Time.parse(s)
      end

      element :dateModified, as: :date_modified do |s|
        Time.parse(s)
      end

      element :ownerName, as: :owner_name
      element :ownerEmail, as: :owner_email

      element :ownerId, as: :owner_id do |s|
        URI(s)
      end

      element :docs do |s|
        URI(s)
      end

      element :expansionState, as: :expansion_state do |s|
        s.split(",").map(&:to_f)
      end

      element :vertScrollState, as: :vert_scroll_state, &:to_f
      element :windowTop, as: :window_top, &:to_f
      element :windowLeft, as: :window_left, &:to_f
      element :windowBottom, as: :window_bottom, &:to_f
      element :windowRight, as: :window_right, &:to_f
    end
  end
end
