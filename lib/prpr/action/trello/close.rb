module Prpr
  module Action
    module Trello
      class Close < Base
        def call
          card.move_to_list done_list
          card.pos = 0
          card.save
        end

        private

        def done_list
          env[:trello_done_list]
        end
      end
    end
  end
end
