module Prpr
  module Handler
    class Trello < Base
      handle Event::PullRequest, action: 'labeled' do
        Prpr::Action::Trello::Labeled.new(event).call
      end

      handle Event::PullRequest, action: /closed/ do
        Prpr::Action::Trello::Close.new(event).call
      end
    end
  end
end
