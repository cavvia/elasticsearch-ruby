module Elasticsearch
  module API
    module Indices
      module Actions

        # Delete an index, list of indices, or all indices in the cluster.
        #
        # @example Delete an index
        #
        #     client.indices.delete index: 'foo'
        #
        # @example Delete a list of indices
        #
        #     client.indices.delete index: ['foo', 'bar']
        #     client.indices.delete index: 'foo,bar'
        #
        #
        # @example Delete a list of indices matching wildcard expression
        #
        #     client.indices.delete index: 'foo*'
        #
        # @example Delete all indices
        #
        #     client.indices.delete
        #     client.indices.delete index: '_all'
        #
        # @option arguments [List] :index A comma-separated list of indices to delete;
        #                                 use `_all` or leave empty to delete all indices
        # @option arguments [Time] :timeout Explicit operation timeout
        #
        # @see http://www.elasticsearch.org/guide/reference/api/admin-indices-delete-index/
        #
        def delete(arguments={})
          method = 'DELETE'
          path   = Utils.__pathify( Utils.__listify(arguments[:index]) )
          params = arguments.select do |k,v|
            [ :timeout ].include?(k)
          end
          # Normalize Ruby 1.8 and Ruby 1.9 Hash#select behaviour
          params = Hash[params] unless params.is_a?(Hash)
          body   = nil

          perform_request(method, path, params, body).body
        end
      end
    end
  end
end
