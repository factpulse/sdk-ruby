# FactPulse::HealthApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_user_info_api_v1_me_get**](HealthApi.md#get_user_info_api_v1_me_get) | **GET** /api/v1/me | Get current user information |
| [**healthcheck_healthcheck_get**](HealthApi.md#healthcheck_healthcheck_get) | **GET** /healthcheck | Docker healthcheck endpoint |
| [**root_get**](HealthApi.md#root_get) | **GET** / | Check API status |


## get_user_info_api_v1_me_get

> Object get_user_info_api_v1_me_get

Get current user information

Returns information about the authenticated user.  This endpoint allows you to: - Verify that authentication works - Get connected account details - Test JWT token validity - Check your consumption quota  **Requires valid authentication.**

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::HealthApi.new

begin
  # Get current user information
  result = api_instance.get_user_info_api_v1_me_get
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling HealthApi->get_user_info_api_v1_me_get: #{e}"
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
rescue FactPulse::ApiError => e
  puts "Error when calling HealthApi->get_user_info_api_v1_me_get_with_http_info: #{e}"
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


## healthcheck_healthcheck_get

> Object healthcheck_healthcheck_get

Docker healthcheck endpoint

Healthcheck endpoint for Docker and load balancers.  Useful for: - Docker healthcheck - Kubernetes liveness/readiness probes - Load balancers (Nginx, HAProxy) - Availability monitoring - Zero downtime deployment  Returns a 200 code if the API is operational.

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::HealthApi.new

begin
  # Docker healthcheck endpoint
  result = api_instance.healthcheck_healthcheck_get
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling HealthApi->healthcheck_healthcheck_get: #{e}"
end
```

#### Using the healthcheck_healthcheck_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> healthcheck_healthcheck_get_with_http_info

```ruby
begin
  # Docker healthcheck endpoint
  data, status_code, headers = api_instance.healthcheck_healthcheck_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling HealthApi->healthcheck_healthcheck_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## root_get

> Object root_get

Check API status

Health check endpoint to verify the API is responding.  Useful for: - Availability monitoring - Integration tests - Load balancers

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::HealthApi.new

begin
  # Check API status
  result = api_instance.root_get
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling HealthApi->root_get: #{e}"
end
```

#### Using the root_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> root_get_with_http_info

```ruby
begin
  # Check API status
  data, status_code, headers = api_instance.root_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling HealthApi->root_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

