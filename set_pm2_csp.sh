#!/bin/bash

file_path="/usr/local/lib/node_modules/pm2/lib/API/Serve.js"
header_csp="response.setHeader('Content-Security-Policy', \"frame-ancestors 'self'\");"
header_x_frame_options="response.setHeader('X-Frame-Options', 'SAMEORIGIN');"
header_x_content_type_options="response.setHeader('X-Content-Type-Options', 'nosniff');"

# Check if line is already present
if ! grep -qF "$header_csp" "$file_path"; then
  # Insert line after the specified line
  sed -i "/http.createServer(function (request, response) {/a\
    $header_csp\n\
    $header_x_frame_options\n\
    $header_x_content_type_options\n\
" "$file_path"
else
  echo "Headers already added."
fi