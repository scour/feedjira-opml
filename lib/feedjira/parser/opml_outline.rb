module Feedjira
  module Parser
    class OPMLOutline
      include SAXMachine
      include FeedUtilities

      attribute :type
      attribute :text
      attribute :xmlUrl, as: :xml_url
      attribute :isComment, as: :is_comment
      attribute :isBreakpoint, as: :is_breakpoint
      attribute :created
      attribute :category
      attribute :description
      attribute :htmlUrl, as: :html_url
      attribute :language
      attribute :title
      attribute :version
      attribute :url
    end
  end
end
