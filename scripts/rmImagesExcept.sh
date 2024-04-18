#!/bin/bash

# Array of images to keep (add all the tags of images you want to keep)
declare -a keep_images=(
  "gcr.io/k8s-minikube/kicbase:v0.0.39"
  # "repository:tag" for other images to keep
)

# Get a list of all images in "repository:tag" format excluding "<none>" tags
all_images=$(docker images --format "{{.Repository}}:{{.Tag}}" | grep -v '<none>')

# Loop through all images
for image in ${all_images}
do
  image_to_remove=true

  # Check if the current image is in the keep_images array
  for keep_image in "${keep_images[@]}"
  do
    if [[ "$image" == "$keep_image" ]]; then
      image_to_remove=false
      break
    fi
  done

  # If the image is not in the keep list, remove it
  if [ "$image_to_remove" = true ]; then
    echo "Removing image: $image"
    docker rmi "$image" -f
  else
    echo "Keeping image: $image"
  fi
done

echo "Image cleanup complete."
