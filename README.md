# Archives

Contains resource for handling archives. Right now only has support for tar archives compressed with gz, xz, and bzip2.

## untar_archive

Extracts a given tarball into a directory. If extraction of the archive files,
it appends .failed to the archive's filename and raises an exception.
Determines whether an archive has been extracted yet based on whether the
file/dir given as the value to the creates parameter is missing, or if present,
on the modified timestamp of creates value vs the modified timestamp of the
archive.

### Parameters

Same parameters and actions as the ``file`` resource. Includes the following parameters:


Name | Required | Default | Description
---- | -------- | ------- | -----------
name | yes | `nil` | unique name of resource.
path | yes | `name` | path to archive to extract
container_path | yes | `nil` | directory to extract archive into.
creates | yes | `nil` | relative path to file or directory found within archive. Used to determine whether archive has been extracted yet based on lack of presence, or modified timestamp
delete_dir_in_container | no | `nil` | relative path to directory within containing_path to delete before extracting the new archive. if unset or nil, does nothing.
nice | no | `nil` |  process priority given to extraction subprocess. used to ensure that decompressing large archives doesn't slow down servicing customers.

### Actions

* `:create` - Extract archive

* `:delete` - Delete archive


## Examples

Extract tarball /data/something.tgz containing dir "mydir" to /data/something_dir::

    untar_archive "/data/something.tgz" do
      container_path "/data/something_dir"
      creates "mydir"
      delete_dir_in_container "mydir"
      nice 19
    end
