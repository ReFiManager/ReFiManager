# RFManager - REST File Manager

## API

### Response format

#### Filesystem object (file or directory)

```json
{
    "type": "",
    "path": "",
    "mime-type": "",
    "meta": {
        "created": "",
        "modified": "",
        "size": ""
    }
}
```

* `type` - **Required value!** Values can be `file` or `directory`
* `path` - **Required value!** Path to file or directory. All request will be works with this path
* `mime-type` - **Required only for files!** Mime-type of file, 
* `meta.created` - valid date time of created file or directory
* `meta.modified` - valid date time of last edit file or directory
* `meta.size` - size of file, for directory is this value ignored

All `meta` values is optional.
