# RFManager - REST File Manager

## API

Core object for works with API is `fsObject`

```json
{
    "path": "",
    "name": "",
    "type": "",
    "mime-type": "",
    "meta": {
        "created": "",
        "modified": "",
        "size": "",
    }
}
```

* `path` - **REQUIRED** URL encoded path of file or directory.
* `name` - Name of file or directory. This value will be displayed on list of files. If this value missing name will be used from id *(If `id` will be full path will be used last segment as file name, in others cases will be used `id`)*.
* `type` - **REQUIRED** Type of `fsObject`. Enabled values are `file` or `directory`
* `mime-type` - **REQUIRED for files** Mime type of file (for directory is not required)
* `meta.created` - Time of created file or directory
* `meta.modified` - Last file or directory update time
* `meta.size` - Size of file in KB(for directory has no efect)

All `meta` informations is optional

### URLs

Base URL format is `/<type>/<id>` for `GET`, `POST`, `UPDATE`, `DELETE` methods when `<type>` is type of `fsObject` file or directory and `<id>` is `id` from `fsObject`

### API docs

Please see [full documentation on apiary.io](http://docs.rfmanager.apiary.io/#)

## Configuration

* `baseUrl` - Base URL for you API. For example `baseUrl: http://example.com` will be generate `http://example.com/<type>/<id>`
* `startDirectory`: - Starting directory will be displayed on start RFManager