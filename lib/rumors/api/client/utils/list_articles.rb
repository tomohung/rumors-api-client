module Rumors
  module Api
    module Client
      module Utils
        class ListArticles
          def initialize(text)
            @text = text
          end

          def purify_gql_query
            gql_query.strip
          end

          private

          def gql_query
            <<-GQL
            {
                ListArticles(
                    filter: { moreLikeThis: { like: "#{@text}"  } }
                    orderBy: [{ _score: DESC  }]
                    first: 4
                ) {
                    edges {
                        node {
                            id
                            text
                        }
                    }
                 }
            }
            GQL
          end
        end
      end
    end
  end
end
