# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Graph
  #
  # Composite Swagger for GraphRbac Management Client
  #
  class ServicePrincipals
    include Azure::ARM::Graph::Models
    include MsRestAzure

    #
    # Creates and initializes a new instance of the ServicePrincipals class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return [GraphRbacManagementClient] reference to the GraphRbacManagementClient
    attr_reader :client

    #
    # Creates a service principal in the  directory.
    #
    # @param parameters [ServicePrincipalCreateParameters] Parameters to create a
    # service principal.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ServicePrincipal] operation results.
    #
    def create(parameters, custom_headers = nil)
      response = create_async(parameters, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Creates a service principal in the  directory.
    #
    # @param parameters [ServicePrincipalCreateParameters] Parameters to create a
    # service principal.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def create_with_http_info(parameters, custom_headers = nil)
      create_async(parameters, custom_headers).value!
    end

    #
    # Creates a service principal in the  directory.
    #
    # @param parameters [ServicePrincipalCreateParameters] Parameters to create a
    # service principal.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def create_async(parameters, custom_headers = nil)
      fail ArgumentError, 'parameters is nil' if parameters.nil?
      api_version = '1.6'
      fail ArgumentError, '@client.tenant_id is nil' if @client.tenant_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Serialize Request
      request_mapper = ServicePrincipalCreateParameters.mapper()
      request_content = @client.serialize(request_mapper,  parameters, 'parameters')
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = '/{tenantID}/servicePrincipals'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'tenantID' => @client.tenant_id},
          query_params: {'api-version' => api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:post, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 201
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 201
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = ServicePrincipal.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Gets list of service principals from the current tenant.
    #
    # @param filter [String] The filter to apply on the operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Array<ServicePrincipal>] operation results.
    #
    def list(filter = nil, custom_headers = nil)
      first_page = list_as_lazy(filter, custom_headers)
      first_page.get_all_items
    end

    #
    # Gets list of service principals from the current tenant.
    #
    # @param filter [String] The filter to apply on the operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_with_http_info(filter = nil, custom_headers = nil)
      list_async(filter, custom_headers).value!
    end

    #
    # Gets list of service principals from the current tenant.
    #
    # @param filter [String] The filter to apply on the operation.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_async(filter = nil, custom_headers = nil)
      api_version = '1.6'
      fail ArgumentError, '@client.tenant_id is nil' if @client.tenant_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/{tenantID}/servicePrincipals'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'tenantID' => @client.tenant_id},
          query_params: {'$filter' => filter,'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = ServicePrincipalListResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Deletes service principal from the directory.
    #
    # @param object_id [String] Object id to delete service principal information.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def delete(object_id, custom_headers = nil)
      response = delete_async(object_id, custom_headers).value!
      nil
    end

    #
    # Deletes service principal from the directory.
    #
    # @param object_id [String] Object id to delete service principal information.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def delete_with_http_info(object_id, custom_headers = nil)
      delete_async(object_id, custom_headers).value!
    end

    #
    # Deletes service principal from the directory.
    #
    # @param object_id [String] Object id to delete service principal information.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def delete_async(object_id, custom_headers = nil)
      fail ArgumentError, 'object_id is nil' if object_id.nil?
      api_version = '1.6'
      fail ArgumentError, '@client.tenant_id is nil' if @client.tenant_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/{tenantID}/servicePrincipals/{objectId}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'tenantID' => @client.tenant_id},
          skip_encoding_path_params: {'objectId' => object_id},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:delete, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 204
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Gets service principal information from the directory.
    #
    # @param object_id [String] Object id to get service principal information.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ServicePrincipal] operation results.
    #
    def get(object_id, custom_headers = nil)
      response = get_async(object_id, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Gets service principal information from the directory.
    #
    # @param object_id [String] Object id to get service principal information.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def get_with_http_info(object_id, custom_headers = nil)
      get_async(object_id, custom_headers).value!
    end

    #
    # Gets service principal information from the directory.
    #
    # @param object_id [String] Object id to get service principal information.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_async(object_id, custom_headers = nil)
      fail ArgumentError, 'object_id is nil' if object_id.nil?
      api_version = '1.6'
      fail ArgumentError, '@client.tenant_id is nil' if @client.tenant_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/{tenantID}/servicePrincipals/{objectId}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'tenantID' => @client.tenant_id},
          skip_encoding_path_params: {'objectId' => object_id},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = ServicePrincipal.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Get keyCredentials associated with the service principal by object Id.
    # Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/entity-and-complex-type-reference#keycredential-type
    #
    # @param object_id [String] Object id to get service principal information.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [KeyCredentialListResult] operation results.
    #
    def list_key_credentials(object_id, custom_headers = nil)
      response = list_key_credentials_async(object_id, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Get keyCredentials associated with the service principal by object Id.
    # Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/entity-and-complex-type-reference#keycredential-type
    #
    # @param object_id [String] Object id to get service principal information.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_key_credentials_with_http_info(object_id, custom_headers = nil)
      list_key_credentials_async(object_id, custom_headers).value!
    end

    #
    # Get keyCredentials associated with the service principal by object Id.
    # Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/entity-and-complex-type-reference#keycredential-type
    #
    # @param object_id [String] Object id to get service principal information.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_key_credentials_async(object_id, custom_headers = nil)
      fail ArgumentError, 'object_id is nil' if object_id.nil?
      api_version = '1.6'
      fail ArgumentError, '@client.tenant_id is nil' if @client.tenant_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/{tenantID}/servicePrincipals/{objectId}/keyCredentials'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'tenantID' => @client.tenant_id},
          skip_encoding_path_params: {'objectId' => object_id},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = KeyCredentialListResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Update keyCredentials associated with an existing service principal.
    # Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/entity-and-complex-type-reference#keycredential-type
    #
    # @param object_id [String] Object id to get service principal information.
    # @param parameters [KeyCredentialsUpdateParameters] Parameters to update
    # keyCredentials of an existing service principal.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def update_key_credentials(object_id, parameters, custom_headers = nil)
      response = update_key_credentials_async(object_id, parameters, custom_headers).value!
      nil
    end

    #
    # Update keyCredentials associated with an existing service principal.
    # Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/entity-and-complex-type-reference#keycredential-type
    #
    # @param object_id [String] Object id to get service principal information.
    # @param parameters [KeyCredentialsUpdateParameters] Parameters to update
    # keyCredentials of an existing service principal.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def update_key_credentials_with_http_info(object_id, parameters, custom_headers = nil)
      update_key_credentials_async(object_id, parameters, custom_headers).value!
    end

    #
    # Update keyCredentials associated with an existing service principal.
    # Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/entity-and-complex-type-reference#keycredential-type
    #
    # @param object_id [String] Object id to get service principal information.
    # @param parameters [KeyCredentialsUpdateParameters] Parameters to update
    # keyCredentials of an existing service principal.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def update_key_credentials_async(object_id, parameters, custom_headers = nil)
      fail ArgumentError, 'object_id is nil' if object_id.nil?
      fail ArgumentError, 'parameters is nil' if parameters.nil?
      api_version = '1.6'
      fail ArgumentError, '@client.tenant_id is nil' if @client.tenant_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Serialize Request
      request_mapper = KeyCredentialsUpdateParameters.mapper()
      request_content = @client.serialize(request_mapper,  parameters, 'parameters')
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = '/{tenantID}/servicePrincipals/{objectId}/keyCredentials'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'tenantID' => @client.tenant_id},
          skip_encoding_path_params: {'objectId' => object_id},
          query_params: {'api-version' => api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:patch, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 204
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Gets passwordCredentials associated with an existing service principal.
    # Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/entity-and-complex-type-reference#passwordcredential-type
    #
    # @param object_id [String] Object id to get service principal information.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [PasswordCredentialListResult] operation results.
    #
    def list_password_credentials(object_id, custom_headers = nil)
      response = list_password_credentials_async(object_id, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Gets passwordCredentials associated with an existing service principal.
    # Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/entity-and-complex-type-reference#passwordcredential-type
    #
    # @param object_id [String] Object id to get service principal information.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_password_credentials_with_http_info(object_id, custom_headers = nil)
      list_password_credentials_async(object_id, custom_headers).value!
    end

    #
    # Gets passwordCredentials associated with an existing service principal.
    # Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/entity-and-complex-type-reference#passwordcredential-type
    #
    # @param object_id [String] Object id to get service principal information.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_password_credentials_async(object_id, custom_headers = nil)
      fail ArgumentError, 'object_id is nil' if object_id.nil?
      api_version = '1.6'
      fail ArgumentError, '@client.tenant_id is nil' if @client.tenant_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/{tenantID}/servicePrincipals/{objectId}/passwordCredentials'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'tenantID' => @client.tenant_id},
          skip_encoding_path_params: {'objectId' => object_id},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = PasswordCredentialListResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Updates passwordCredentials associated with an existing service principal.
    # Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/entity-and-complex-type-reference#passwordcredential-type
    #
    # @param object_id [String] Object id to get service principal information.
    # @param parameters [PasswordCredentialsUpdateParameters] Parameters to update
    # passwordCredentials of an existing service principal.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def update_password_credentials(object_id, parameters, custom_headers = nil)
      response = update_password_credentials_async(object_id, parameters, custom_headers).value!
      nil
    end

    #
    # Updates passwordCredentials associated with an existing service principal.
    # Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/entity-and-complex-type-reference#passwordcredential-type
    #
    # @param object_id [String] Object id to get service principal information.
    # @param parameters [PasswordCredentialsUpdateParameters] Parameters to update
    # passwordCredentials of an existing service principal.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def update_password_credentials_with_http_info(object_id, parameters, custom_headers = nil)
      update_password_credentials_async(object_id, parameters, custom_headers).value!
    end

    #
    # Updates passwordCredentials associated with an existing service principal.
    # Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/entity-and-complex-type-reference#passwordcredential-type
    #
    # @param object_id [String] Object id to get service principal information.
    # @param parameters [PasswordCredentialsUpdateParameters] Parameters to update
    # passwordCredentials of an existing service principal.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def update_password_credentials_async(object_id, parameters, custom_headers = nil)
      fail ArgumentError, 'object_id is nil' if object_id.nil?
      fail ArgumentError, 'parameters is nil' if parameters.nil?
      api_version = '1.6'
      fail ArgumentError, '@client.tenant_id is nil' if @client.tenant_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Serialize Request
      request_mapper = PasswordCredentialsUpdateParameters.mapper()
      request_content = @client.serialize(request_mapper,  parameters, 'parameters')
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = '/{tenantID}/servicePrincipals/{objectId}/passwordCredentials'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'tenantID' => @client.tenant_id},
          skip_encoding_path_params: {'objectId' => object_id},
          query_params: {'api-version' => api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:patch, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 204
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Gets list of service principals from the current tenant.
    #
    # @param next_link [String] Next link for list operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Array<ServicePrincipal>] operation results.
    #
    def list_next(next_link, custom_headers = nil)
      response = list_next_async(next_link, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Gets list of service principals from the current tenant.
    #
    # @param next_link [String] Next link for list operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_next_with_http_info(next_link, custom_headers = nil)
      list_next_async(next_link, custom_headers).value!
    end

    #
    # Gets list of service principals from the current tenant.
    #
    # @param next_link [String] Next link for list operation.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_next_async(next_link, custom_headers = nil)
      fail ArgumentError, 'next_link is nil' if next_link.nil?
      api_version = '1.6'
      fail ArgumentError, '@client.tenant_id is nil' if @client.tenant_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/{tenantID}/{nextLink}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'tenantID' => @client.tenant_id},
          skip_encoding_path_params: {'nextLink' => next_link},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = ServicePrincipalListResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Gets list of service principals from the current tenant.
    #
    # @param filter [String] The filter to apply on the operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ServicePrincipalListResult] which provide lazy access to pages of
    # the response.
    #
    def list_as_lazy(filter = nil, custom_headers = nil)
      response = list_async(filter, custom_headers).value!
      unless response.nil?
        page = response.body
        page.next_method = Proc.new do |next_link|
          list_next_async(next_link, custom_headers)
        end
        page
      end
    end

  end
end