# RFManager - REST File Manager

## API

Core object for works with API is `FsObject`

```json
{
    "id": "",
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

* `id` - **REQUIRED** Unique id of file or directory. If you haven't id you can use hash of path, for example `md5(path)`, `base64(path)` or you can use direct path to file or directory.
* `name` - Name of file or directory. This value will be displayed on list of files. If this value missing name will be used from id *(If `id` will be full path will be used last segment as file name, in others cases will be used `id`)*.
* `type` - **REQUIRED** Type of `FsObject`. Enabled values are `file` or `directory`
* `mime-type` - **REQUIRED for files** Mime type of file (for directory is not required)
* `meta.created` - Time of created file or directory
* `meta.modified` - Last file or directory update time
* `meta.size` - Size of file (for directory has no efect)

All `meta` informations is optional
