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

    docker build -t quay.io/briandoconnor/dockstore-tool-md5sum:1.0.1 .

## WDL Testing

How to execute this tool with Cromwell using the WDL descriptor.

### Testing Locally with Cromwell

This tool can be found at the [Cromwell](https://github.com/broadinstitute/cromwell) project GitHub page.

#### Make a Parameters JSON

This is the parameterization of the md5sum tool, a copy is present in this repo called `test.wdl.json`:

```
{
 "ga4ghMd5.inputFile": "md5sum.input"
}
```

#### Run with the CLI

Run it using the `cromwell` command:

```
# run this with cromwell (or java -jar cromwell.jar depending on how you installed cromwell)
$> cromwell run Dockstore.wdl test.wdl.json
```

It will tell you the location of the output file which, in the CWL example below, is specified in the param json file.

## CWL Testing

How to execute this tool using the CWL descriptor via the Dockstore command line (which calls the `cwltool` command behind the scenes).

### Testing Locally with the Dockstore CLI

This tool can be found at the [Dockstore](https://dockstore.org), login with your GitHub account and follow the
directions to setup the CLI.  It lets you run a Docker container with a CWL descriptor locally, using Docker and the CWL command line utility.  This is great for testing.

#### Make a Parameters JSON

This is the parameterization of the md5sum tool, a copy is present in this repo called `test.json`:

```
{
  "input_file": {
        "class": "File",
        "path": "md5sum.input"
    },
    "output_file": {
        "class": "File",
        "path": "/tmp/md5sum.txt"
    }
}
```

#### Run with the CLI

Run it using the `dockstore` CLI locally with the Dockstore.cwl file (great for testing if you make changes locally):

```
# run this locally
$> dockstore tool launch --entry Dockstore.cwl --local-entry --json test.json
```

Or you can run it from the latest release on Dockstore:

```
# run this from the Dockstore
$> dockstore tool launch --entry quay.io/briandoconnor/dockstore-tool-bamstats:1.0.1 --json test.json
```

## Test with travis-ci

See the `.travis.yml` file.

## Publishing

At this point you follow the SOP from the [Dockstore.org site](https://dockstore.org/docs).
