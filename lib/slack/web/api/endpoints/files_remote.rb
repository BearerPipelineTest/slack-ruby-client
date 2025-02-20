# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

module Slack
  module Web
    module Api
      module Endpoints
        module FilesRemote
          #
          # Adds a file from a remote service
          #
          # @option options [string] :external_id
          #   Creator defined GUID for the file.
          # @option options [string] :external_url
          #   URL of the remote file.
          # @option options [string] :title
          #   Title of the file being shared.
          # @option options [string] :filetype
          #   type of file.
          # @option options [string] :indexable_file_contents
          #   A text file (txt, pdf, doc, etc.) containing textual search terms that are used to improve discovery of the remote file.
          # @option options [string] :preview_image
          #   Preview of the document via multipart/form-data.
          # @see https://api.slack.com/methods/files.remote.add
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/files.remote/files.remote.add.json
          def files_remote_add(options = {})
            raise ArgumentError, 'Required arguments :external_id missing' if options[:external_id].nil?
            raise ArgumentError, 'Required arguments :external_url missing' if options[:external_url].nil?
            raise ArgumentError, 'Required arguments :title missing' if options[:title].nil?
            post('files.remote.add', options)
          end

          #
          # Retrieve information about a remote file added to Slack
          #
          # @option options [string] :external_id
          #   Creator defined GUID for the file.
          # @option options [file] :file
          #   Specify a file by providing its ID.
          # @see https://api.slack.com/methods/files.remote.info
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/files.remote/files.remote.info.json
          def files_remote_info(options = {})
            post('files.remote.info', options)
          end

          #
          # Retrieve information about a remote file added to Slack
          #
          # @option options [channel] :channel
          #   Filter files appearing in a specific channel, indicated by its ID.
          # @option options [string] :cursor
          #   Paginate through collections of data by setting the cursor parameter to a next_cursor attribute returned by a previous request's response_metadata. Default value fetches the first "page" of the collection. See pagination for more detail.
          # @option options [integer] :limit
          #   The maximum number of items to return.
          # @option options [string] :ts_from
          #   Filter files created after this timestamp (inclusive).
          # @option options [string] :ts_to
          #   Filter files created before this timestamp (inclusive).
          # @see https://api.slack.com/methods/files.remote.list
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/files.remote/files.remote.list.json
          def files_remote_list(options = {})
            options = options.merge(channel: conversations_id(options)['channel']['id']) if options[:channel]
            if block_given?
              Pagination::Cursor.new(self, :files_remote_list, options).each do |page|
                yield page
              end
            else
              post('files.remote.list', options)
            end
          end

          #
          # Remove a remote file.
          #
          # @option options [string] :external_id
          #   Creator defined GUID for the file.
          # @option options [file] :file
          #   Specify a file by providing its ID.
          # @see https://api.slack.com/methods/files.remote.remove
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/files.remote/files.remote.remove.json
          def files_remote_remove(options = {})
            post('files.remote.remove', options)
          end

          #
          # Share a remote file into a channel.
          #
          # @option options [string] :channels
          #   Comma-separated list of channel IDs where the file will be shared.
          # @option options [string] :external_id
          #   The globally unique identifier (GUID) for the file, as set by the app registering the file with Slack.  Either this field or file or both are required.
          # @option options [file] :file
          #   Specify a file registered with Slack by providing its ID. Either this field or external_id or both are required.
          # @see https://api.slack.com/methods/files.remote.share
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/files.remote/files.remote.share.json
          def files_remote_share(options = {})
            raise ArgumentError, 'Required arguments :channels missing' if options[:channels].nil?
            post('files.remote.share', options)
          end

          #
          # Updates an existing remote file.
          #
          # @option options [string] :external_id
          #   Creator defined GUID for the file.
          # @option options [string] :external_url
          #   URL of the remote file.
          # @option options [file] :file
          #   Specify a file by providing its ID.
          # @option options [string] :filetype
          #   type of file.
          # @option options [string] :indexable_file_contents
          #   File containing contents that can be used to improve searchability for the remote file.
          # @option options [string] :preview_image
          #   Preview of the document via multipart/form-data.
          # @option options [string] :title
          #   Title of the file being shared.
          # @see https://api.slack.com/methods/files.remote.update
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/files.remote/files.remote.update.json
          def files_remote_update(options = {})
            post('files.remote.update', options)
          end
        end
      end
    end
  end
end
