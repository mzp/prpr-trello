require 'trello'

module Prpr
  module Action
    module Trello
      class Base < Prpr::Action::Base
        private

        def client
          @client ||= ::Trello::Client.new(
            developer_public_key: env[:trello_developer_public_key],
            member_token: env[:trello_member_token])
        end

        def card
            @card ||=
              if card_id
                client.find(:cards, card_id)
              end
        end

        def card_desc
          @card_desc ||= card.desc.to_s
        end

        def card_id
          @card_id ||=
            if head.chomp =~ %r!trello.com/c/([^/]+)!
              $1
            end
        end

        def head
          event.pull_request.body.lines.first.chomp
        end

        def github_url
          event.pull_request.html_url
        end


      end
    end
  end
end
