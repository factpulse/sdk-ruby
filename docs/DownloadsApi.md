# FactPulse::DownloadsApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**check_file_api_v1_download_download_id_head**](DownloadsApi.md#check_file_api_v1_download_download_id_head) | **HEAD** /api/v1/download/{download_id} | Check if a file exists |
| [**download_file_api_v1_download_download_id_get**](DownloadsApi.md#download_file_api_v1_download_download_id_get) | **GET** /api/v1/download/{download_id} | Download a temporary file |


## check_file_api_v1_download_download_id_head

> Object check_file_api_v1_download_download_id_head(download_id)

Check if a file exists

Check if a temporary file exists and get its metadata without downloading.  Useful for: - Verifying a download URL is still valid - Getting file size before downloading - Checking expiration time  **Security**: Requires authentication, only file owner can check.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::DownloadsApi.new
download_id = 'download_id_example' # String | Unique identifier of the temporary file to check

begin
  # Check if a file exists
  result = api_instance.check_file_api_v1_download_download_id_head(download_id)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling DownloadsApi->check_file_api_v1_download_download_id_head: #{e}"
end
```

#### Using the check_file_api_v1_download_download_id_head_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> check_file_api_v1_download_download_id_head_with_http_info(download_id)

```ruby
begin
  # Check if a file exists
  data, status_code, headers = api_instance.check_file_api_v1_download_download_id_head_with_http_info(download_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling DownloadsApi->check_file_api_v1_download_download_id_head_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **download_id** | **String** | Unique identifier of the temporary file to check |  |

### Return type

**Object**

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## download_file_api_v1_download_download_id_get

> Object download_file_api_v1_download_download_id_get(download_id, opts)

Download a temporary file

Download a file stored temporarily after asynchronous processing.  **Usage**: - This URL is provided in webhook notifications when using `webhook_mode: \"download_url\"` - Files are automatically deleted after 1 hour - Each file can only be downloaded until it expires  **Security**: - Requires a valid JWT token - Only the user who initiated the task can download the file

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::DownloadsApi.new
download_id = 'download_id_example' # String | Unique identifier of the temporary file to download
opts = {
  delete_after: true # Boolean | If true, delete the file after download (one-time download)
}

begin
  # Download a temporary file
  result = api_instance.download_file_api_v1_download_download_id_get(download_id, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling DownloadsApi->download_file_api_v1_download_download_id_get: #{e}"
end
```

#### Using the download_file_api_v1_download_download_id_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> download_file_api_v1_download_download_id_get_with_http_info(download_id, opts)

```ruby
begin
  # Download a temporary file
  data, status_code, headers = api_instance.download_file_api_v1_download_download_id_get_with_http_info(download_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling DownloadsApi->download_file_api_v1_download_download_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **download_id** | **String** | Unique identifier of the temporary file to download |  |
| **delete_after** | **Boolean** | If true, delete the file after download (one-time download) | [optional][default to false] |

### Return type

**Object**

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, application/pdf, application/xml, application/octet-stream

