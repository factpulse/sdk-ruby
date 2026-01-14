# OpenapiClient::UserApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_user_info_api_v1_me_get**](UserApi.md#get_user_info_api_v1_me_get) | **GET** /api/v1/me | Get current user information |


## get_user_info_api_v1_me_get

> Object get_user_info_api_v1_me_get

Get current user information

Returns information about the authenticated user.  This endpoint allows you to: - Verify that authentication works - Get connected account details - Test JWT token validity - Check your consumption quota  **Requires valid authentication.**

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::UserApi.new

begin
  # Get current user information
  result = api_instance.get_user_info_api_v1_me_get
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UserApi->get_user_info_api_v1_me_get: #{e}"
end
```

#### Using the get_user_info_api_v1_me_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> get_user_info_api_v1_me_get_with_http_info

```ruby
begin
  # Get current user information
  data, status_code, headers = api_instance.get_user_info_api_v1_me_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue OpenapiClient::ApiError => e
  puts "Error when calling UserApi->get_user_info_api_v1_me_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

