# RFManager - REST File Manager

## fsObject

All files and directories in RFManager is represented by `fsObject`. Its structure is:

```json
{
    "id": "",
    "name": "",
    "type": "",
    "mimeType": "",
    "meta": {
        "created": "",
        "modified": "",
        "size": ""
    }
}
```

* `id` - **REQUIRED** Unique file or directory identifier. This value must be valid URL parameter because will be sended as `:id` argument in requests.
* `name` - **REQUIRED** Will be displayed in list of files and directories
* `type` - **REQUIRED** Can be only `file` or `directory`
* `mimeType` - **REQUIRED for files** MimeType of file. Is required only for files because for directories will be ignored
* `meta.created` File or directory creation date
* `meta.modified` Last file or directory update
* `meta.size` - Expected integer. Size in kB

*All meta values is optional*


### Tips

* If you works with real file system, you can encode `id` by `base64`. You get unique string which is valid url argument and can be decodedd. If you works with virtual file system (loaded files from databse for example) you can use its `ids` form database.

### Notes

* You can add custom fields into this scructure but you can must follow this structure!

## REST API

### Response body structure

RFManager expectds `application/json` with next structure.

#### Success response 

```json
{
    "data": {}
    "message": {
        "text": "",
        "type": ""
    }
}
```

#### Error response
```json
{
    "message": {
        "text": "",
        "type": ""
    }
}
```

* `message` is optional. If is missing will not be displayed.
* `body` is required only for any requests. Plese see API

### API

All request and responses are expected as `json`

#### List of URLs

* `DELETE /file/:id` - Delete file
* `DELETE /directory/:id` - Delete directory
* `GET /directory/:id` - Get content of directory
* `GET /file/:id` - Get file content
* `POST /directory` - Create directory
* `POST /file` - Upload file

#### Delete file or directory

##### Request

* Method: `DELETE`
* URL: `/:type/:id` when `:type` can be `file` or `directory` and `:id` will be `id` from fsObject

##### Response

* Status: 200/204
* Body: Can be empty or you can be `message`. Please see Response body structure

#### Get content of directory

##### Request

* Method: `GET`
* URL: `/directory/:id` when `:id` will be `id` from fsObject

##### Response

* Status 200
* Body: Expects `body` from Response body structure

#### Get file content

This api will be called only for image for display preview.

##### Request

* Method: `GET`
* URL: `/file/:id` when `:id` will be `id` from `fsObject`

##### Response

* Status 200
* Content-Type: image/*
* Body: displayed image

#### Create directory

##### Request

* Method: `POST`
* URL: `/directory`
* Body: `{currentDirectory: "", name: ""}` when `currentDirectory` is `id` of directory from fsObject and `name` is name of new directory.

##### Response

* Status: 200/204
* Body: Can be empty or you can be `message`. Please see Response body structure

#### Upload file

In RFManager you can upload multiple files but will be generated this request for each file. 

##### Request

* Method: `POST`
* URL: `/file`
* Body: `{currentDirectory: ""}` and **one** file. `currentDirectory` is `id` from fsObject

##### Response

* Status 200/204
* Body: Can be empty or you can be `message`. Please see Response body structure

