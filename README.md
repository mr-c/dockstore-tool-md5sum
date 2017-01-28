[![Docker Repository on Quay.io](https://quay.io/repository/briandoconnor/dockstore-tool-md5sum/status "Docker Repository on Quay.io")](https://quay.io/repository/briandoconnor/dockstore-tool-md5sum)
[![Build Status](https://travis-ci.org/briandoconnor/dockstore-tool-md5sum.svg)](https://travis-ci.org/briandoconnor/dockstore-tool-md5sum)

# dockstore-tool-md5sum

This is an extremely simple tool, simply used to show how to call a tool via [Dockstore](http://dockstore.org).
A repo for the `Dockerfile` to create a Docker image for the md5sum command. Also contains the
`Dockstore.cwl` which is used by the [Dockstore](https://www.dockstore.org) to register
this container and describe how to call md5sum for the community.

## Validation

This tool has been validated as a CWL v1.0 launched using Dockstore 1.1.2.

Versions of dependencies that we tested include:
```
setuptools==28.8.0
cwltool==1.0.20161114152756
schema-salad==1.18.20161005190847
avro==1.8.1
```

## Building Locally

Normally you would let [Quay.io](http://quay.io) build this.  But, if you need to build
manually, locally you would execute:

    docker build -t quay.io/briandoconnor/dockstore-tool-md5sum:1.0.0 .

## Testing Locally with the Dockstore CLI

This tool can be found at the [Dockstore](https://dockstore.org), login with your GitHub account and follow the
directions to setup the CLI.  It lets you run a Docker container with a CWL descriptor locally, using Docker and the CWL command line utility.  This is great for testing.

### Make a Parameters JSON

This is the parameterization of the BAM stat tool, a copy is present in this repo called `sample_configs.json`:

```
{
  "input_file": {
        "class": "File",
        "path": "<URL or local path>"
    },
    "output_file": {
        "class": "File",
        "path": "/tmp/md5sum.txt"
    }
}
```

### Run with the CLI

Run it using the `dockstore` CLI locally with the Dockstore.cwl file (instead of Dockstore URL):

```
# run this locally
$> dockstore tool launch --entry Dockstore.cwl --local-entry --json test.json
```

## Test with travis-ci

See the `.travis.yml` file.

## Publishing

At this point you follow the SOP from the [Dockstore.org site]()
