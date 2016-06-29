module Prpr
  module Action
    module Trello
      class Labeled < Base
        def call
          case
          when wip?
            card.move_to_list wip_list

          when review_label?
            unless card_desc.include?(github_url)
              card.desc = github_url + "\n"+ card_desc
              card.update!
            end
            card.move_to_list review_list
          end
        end

        private

        def github_url
          event.pull_request.html_url
        end

        def label
          event.label.name
        end

        def review_label?
          label == review_label
        end

        def wip?
          label == wip_label
        end

        def review_label
          env[:trello_review_label] || 'REVIEW'
        end

        def wip_label
          env[:trello_wip_label] || 'WIP'
        end

        def review_list
          env[:trello_review_list]
        end

        def wip_list
          env[:trello_wip_list]
        end
      end
    end
  end
end
