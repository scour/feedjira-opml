module Feedjira
  module Parser
    class OPML
      include SAXMachine
      include FeedUtilities

      element :head, class: OPMLHead
      element :body, class: OPMLBody

      def self.able_to_parse?(xml) #:nodoc:
        (/\<opml/ =~ xml)
      end
    end
  end
end
