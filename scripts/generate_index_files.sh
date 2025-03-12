#!/bin/bash

# Template for index.html
generate_index_html() {
  local directory="$1"
  local title="$2"
  
  cat > "${directory}/index.html" << EOL
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${title}</title>
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
      line-height: 1.6;
      color: #333;
      max-width: 1000px;
      margin: 0 auto;
      padding: 20px;
    }
    a {
      color: #5e2ad1;
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
    img {
      max-width: 100%;
    }
    code {
      background-color: #f6f8fa;
      padding: 0.2em 0.4em;
      border-radius: 3px;
    }
    pre {
      background-color: #f6f8fa;
      padding: 16px;
      border-radius: 6px;
      overflow: auto;
    }
    pre code {
      background-color: transparent;
      padding: 0;
    }
    .back-link {
      display: inline-block;
      margin-bottom: 20px;
      padding: 8px 16px;
      background-color: #5e2ad1;
      color: white;
      border-radius: 4px;
    }
    .back-link:hover {
      background-color: #4a20a8;
      text-decoration: none;
    }
  </style>
</head>
<body>
  <a href="../" class="back-link">← Back to Home</a>
  <div id="content">Loading...</div>

  <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', async () => {
      try {
        const response = await fetch('README.md');
        const markdown = await response.text();
        document.getElementById('content').innerHTML = marked.parse(markdown);
        
        // Make image URLs absolute if they are relative
        document.querySelectorAll('img').forEach(img => {
          if (img.src.startsWith(window.location.origin) && !img.src.includes('http')) {
            const imgPath = img.src.split('/').pop();
            img.src = \`images/\${imgPath}\`;
          }
        });
      } catch (error) {
        console.error('Error loading content:', error);
        document.getElementById('content').innerHTML = 'Error loading content. Please try again later.';
      }
    });
  </script>
</body>
</html>
EOL
  
  echo "Created index.html for ${directory}"
}

# Create index.html for each lesson directory
generate_index_html "00-course-setup" "Course Setup"
generate_index_html "02-exploring-and-comparing-different-llms" "Exploring Different LLMs"
generate_index_html "03-using-generative-ai-responsibly" "Using GenAI Responsibly"
generate_index_html "04-prompt-engineering-fundamentals" "Prompt Engineering Fundamentals"
generate_index_html "05-advanced-prompts" "Advanced Prompts"
generate_index_html "06-text-generation-apps" "Text Generation Apps"
generate_index_html "07-building-chat-applications" "Building Chat Applications"
generate_index_html "08-building-search-applications" "Building Search Applications"
generate_index_html "09-building-image-applications" "Building Image Applications"
generate_index_html "10-building-low-code-ai-applications" "Low Code AI Applications"
generate_index_html "11-integrating-with-function-calling" "Integrating With Function Calling"
generate_index_html "12-designing-ux-for-ai-applications" "Designing UX for AI Apps"
generate_index_html "13-securing-ai-applications" "Securing AI Applications"
generate_index_html "14-the-generative-ai-application-lifecycle" "GenAI Application Lifecycle"
generate_index_html "15-rag-and-vector-databases" "RAG and Vector Databases"
generate_index_html "16-open-source-models" "Open Source Models"
generate_index_html "17-ai-agents" "AI Agents"
generate_index_html "18-fine-tuning" "Fine Tuning"
generate_index_html "19-slm" "Small Language Models"
generate_index_html "20-mistral" "Mistral"
generate_index_html "21-meta" "Meta"

echo "All index.html files created successfully!" 