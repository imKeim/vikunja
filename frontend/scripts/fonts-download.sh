#!/bin/sh
set -e

#
# This script downloads our original font files from their source repos
# and puts them in our originalMedia folder.
#

err_report() {
  echo "Error on line $(caller)" >&2
}

trap err_report ERR

ORIGINAL_FONTS_DIR="./originalMedia/fonts"

# Ubuntu fonts from Google Fonts repository
FONT_URLS=(
"https://raw.githubusercontent.com/google/fonts/main/ufl/ubuntu/Ubuntu-Regular.ttf"
"https://raw.githubusercontent.com/google/fonts/main/ufl/ubuntu/Ubuntu-Italic.ttf"
"https://raw.githubusercontent.com/google/fonts/main/ufl/ubuntu/Ubuntu-Bold.ttf"
"https://raw.githubusercontent.com/google/fonts/main/ufl/ubuntu/Ubuntu-BoldItalic.ttf"
)


echo ""
echo "###################################################"
echo "# Download font files"
echo "###################################################"
echo ""

# Clean the directory before downloading new fonts
rm -f $ORIGINAL_FONTS_DIR/*
mkdir -p $ORIGINAL_FONTS_DIR

for URL in "${FONT_URLS[@]}"; do
	wget -L "$URL" \
		--directory-prefix=$ORIGINAL_FONTS_DIR \
		--quiet \
		--timestamping \
		--show-progress
done

echo ""
echo "Font download complete."
