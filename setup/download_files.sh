############################################################################################

# Download neccesary files.

##########################################################3################################

echo "Downloading necessary files..."

# Define an array of file IDs
file_ids=("19aYmXiKkISpLEgcgDsB4Q_ADGDT15oCs" "1-u1uwi_EzSOfyyP7j7PX_IxZP2nGsKlZ" "1dhL6v-sUgSVqDGYKi1_9J4DfI0vfp-if")

# Define an array of destination directories
destination_dirs=("./core/data/" "./train/data/" "./train/data/")
file_names=("main_model.pth" "eth-xgaze-pretrained-model.pth" "MPIIFaceGaze.zip")

# Loop through the file IDs and destination directories
for ((i=0; i<${#file_ids[@]}; i++)); do
  file_id="${file_ids[i]}"
  destination_dir="${destination_dirs[i]}"
  
  # Create the destination directory if it doesn't exist
  mkdir -p "${destination_dir}"

  # Create a temporary file to store the downloaded data
  temp_file="/tmp/${file_names[i]}"

  # Get the direct download link
  download_link=$(curl -sc /tmp/gdrivecookie "https://drive.google.com/uc?export=download&id=${file_id}" | \
    sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p')

  # Download the file using the direct link
  curl -Lb /tmp/gdrivecookie "https://drive.google.com/uc?export=download&confirm=${download_link}&id=${file_id}" -o "${temp_file}"

  # Check if the file was downloaded successfully
  if [ -s "${temp_file}" ]; then
    # Move the downloaded file to the destination directory
    mv "${temp_file}" "${destination_dir}/"

    echo "File ${file_id} downloaded and moved to ${destination_dir}"
  else
    echo "Failed to download file ${file_id}. Please check the Google Drive sharing settings."
  fi
done

unzip -d "./train/data/" "./train/data/MPIIFaceGaze.zip" 

# Clean up temporary files
rm /tmp/gdrivecookie