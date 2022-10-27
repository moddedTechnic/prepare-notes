# Prepare Notes

Convert a collection of PDF files containing slides into a Markdown file with a series of images, one per slide.
This can be used as a starting point for taking or consolidating notes with the given slides.

## Installation

Clone the repository somewhere sensible.

```shell
git clone https://github.com/moddedTechnic/prepare-notes.git
```

Copy the sample `get-downloads.sh` file and replace `<path/to/downloads>` with the path to your downloads folder.

```shell
cp get-downloads.sample.sh get-downloads.sh
```

Copy the sample `get-editor.sh` file and replace `<path/to/editor>` with the path to your editor executable.

```shell
cp get-editor.sample.sh get-editor.sh
```

Ensure that shell files are executable.

```shell
sudo chmod +x ./*.sh
```

Optionally, add `prepare-notes.sh` to your path.


## Usage

Simply call `prepare-notes.sh` as follows.

```shell
prepare-notes.sh target src...
```

`target` is the output directory to create the `notes.md` file in.
**WARNING**: if `target` exists and does not contain a `notes.md` file, it and any contents will be deleted.

`src` is a collection of one or more items to search for in the directory specified by `get-downloads.sh` and can contain wildcards.
