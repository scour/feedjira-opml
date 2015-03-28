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
      element :ownerId, as: :owner_id

      element :docs do |s|
        URI(s)
      end

      element :expansionState, as: :expansion_state do |s|
        s.split(',').map{ |x| x.to_f }
      end

      element :vertScrollState, as: :vert_scroll_state do |s|
        s.to_f
      end

      element :windowTop, as: :window_top do |s|
        s.to_f
      end

      element :windowLeft, as: :window_left do |s|
        s.to_f
      end

      element :windowBottom, as: :window_bottom do |s|
        s.to_f
      end

      element :windowRight, as: :window_right do |s|
        s.to_f
      end
    end
  end
end
