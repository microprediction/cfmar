#!/bin/bash

# Check if Marp is installed
if ! command -v marp &> /dev/null; then
    echo "Marp is not installed. Installing..."
    npm install -g @marp-team/marp-cli
fi

# Create output directories if they don't exist
mkdir -p output/html
mkdir -p output/pdf

# Generate HTML slides
echo "Generating HTML slides..."
marp slides/content/*.md --html -o output/html/

# Generate PDF slides
echo "Generating PDF slides..."
marp slides/content/*.md --pdf -o output/pdf/

# Generate a combined PDF of all slides
echo "Generating combined PDF..."
marp slides/content/*.md --pdf --allow-local-files -o output/microprediction-update.pdf

echo "Slide generation complete!"
echo "HTML slides are in output/html/"
echo "PDF slides are in output/pdf/"
echo "Combined PDF is at output/microprediction-update.pdf" 