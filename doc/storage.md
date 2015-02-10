# Storage Format

 - Default location: ~/.geheim.db

## Container

The geheim storage is a GnuPG-encrypted tar(1) archive,
containing a specific directory structure.

### Directory structure

The data in the storage container is structured by directories,
and each information node is a plain text file.

Example:

    /
      /email
        john@doe.name
      /social
        /twitter
          john_doe
      nas

