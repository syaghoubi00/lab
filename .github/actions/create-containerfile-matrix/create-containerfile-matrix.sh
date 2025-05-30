# Find all container files and create matrix
matrix=$(
  find "${CONTAINER_DIR:-.}" -type f \( -name "Containerfile" -o -name "Dockerfile" \) |
    while IFS= read -r containerfile; do
      # Remove leading ./ if present
      clean_path=${containerfile#./}

      # Get directory path without the filename
      dir_path=$(dirname "$clean_path")
      context_dir=$(dirname "$containerfile")

      # Count path segments
      segment_count=$(echo "$dir_path" | tr -cd '/' | wc -c)
      segment_count=$((segment_count + 1))

      if [ "$dir_path" = "." ]; then
        # Root Dockerfile case
        # Set to the name of the repo
        app="${GITHUB_REPOSITORY#*/}"
        tag="latest"
      else
        # Check if we're in the containers directory structure
        if [[ -n "${CONTAINER_DIR}" ]] && [[ "$dir_path" =~ ${CONTAINER_DIR} ]]; then
          # Handle containers directory structure
          case $segment_count in
            2) # Two levels: containers/app1/Containerfile
              app=$(echo "$dir_path" | cut -d'/' -f2)
              tag="latest"
              ;;
            3) # Three levels: containers/utils/app1/Containerfile
              parent_dir=$(echo "$dir_path" | cut -d'/' -f2)
              app_name=$(echo "$dir_path" | cut -d'/' -f3)
              tag="latest"
              app="${parent_dir}-${app_name}"
              ;;
            4) # Four levels: containers/utils/app1/latest/Containerfile
              parent_dir=$(echo "$dir_path" | cut -d'/' -f2)
              app_name=$(echo "$dir_path" | cut -d'/' -f3)
              tag=$(echo "$dir_path" | cut -d'/' -f4)
              app="${parent_dir}-${app_name}"
              ;;
            *)
              echo "1: Warning: Unexpected directory depth for $containerfile" >&2
              continue
              ;;
          esac
        else
          # Handle non-containers directory structure
          case $segment_count in
            1) # Single level: app1/Containerfile
              app="$dir_path"
              tag="latest"
              ;;
            2) # Two levels: app2/v2/Containerfile
              app=$(echo "$dir_path" | cut -d'/' -f1)
              tag=$(echo "$dir_path" | cut -d'/' -f2)
              ;;
            *)
              echo "2: Warning: Unexpected directory depth for $containerfile" >&2
              continue
              ;;
          esac
        fi
      fi

      # Output JSON object for this container
      jq -n \
        --arg file "$containerfile" \
        --arg app "$app" \
        --arg tag "$tag" \
        --arg context "$context_dir" \
        '{file: $file, app: $app, tag: $tag, context: $context}'
    done | jq -s -c '.'
)

if [ "$matrix" = "[]" ] || [ -z "$matrix" ]; then
  echo "::error::No container files found in:"
  echo "::error::  - ${CONTAINER_DIR}/**/Dockerfile"
  echo "::error::  - ${CONTAINER_DIR}/**/Containerfile"
  echo "::error::Please ensure container files exist and are properly formatted"
  exit 1
fi

# Print matrix for debugging
echo "$matrix"

echo "matrix=${matrix}" >>"$GITHUB_OUTPUT"
