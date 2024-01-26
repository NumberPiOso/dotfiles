convertmovtomp4() {
  if [ $# -ne 1 ]; then
    echo "Usage: convertmovtomp4 input_file.mov"
    return 1
  fi

  input_file="$1"
  output_file="${input_file%.mov}.mp4"

  ffmpeg -i "$input_file" -c:v libx264 -c:a aac -strict experimental -b:a 192k "$output_file"

  if [ $? -eq 0 ]; then
    echo "Conversion successful. Output file: $output_file"
  else
    echo "Conversion failed."
  fi
}
