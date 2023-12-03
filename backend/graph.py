import openai
import os
from dotenv import load_dotenv
from flask import Flask, request

load_dotenv()

openai.api_key = os.environ.get("OPENAI_API_KEY")
app = Flask(__name__)


def get_vocabulary_graph(level, keyword):
    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[
            {
                "role": "user",
                "content": f"""

                Generate me vocabulary for level {level} on the topic of keyword {keyword} with alternatives of words, synonyms, and cognates and return them in the structure of a graph in the text of JSON format. Here is the template for the response:
{{
  "nodes": [
    {{
      "id": "1",
      "value": "Initiate",
      "description": "The commencement point"
    }},
    {{
      "id": "2",
      "value": "Subsequent",
      "description": "Following in order or succession"
    }},
    {{
      "id": "3",
      "value": "Sequential",
      "description": "Arranged in a sequence"
    }},
    {{
      "id": "4",
      "value": "Cognizant",
      "description": "Aware and perceptive"
    }},
    {{
      "id": "5",
      "value": "Ubiquitous",
      "description": "Present everywhere at the same time"
    }},
    {{
      "id": "6",
      "value": "Hella smart",
      "description": "Present everywhere at the same time"
    }}
  ],
  "edges": [
    {{"source": "1", "target": "2"}},
    {{"source": "2", "target": "3"}},
    {{"source": "3", "target": "4"}},
    {{"source": "4", "target": "5"}},
    {{"source": "1", "target": "6"}},
    {{"source": "2", "target": "6"}}
  ]
}}
""",
            }
        ],
        temperature=0,
        max_tokens=1000,
    )

    return response.choices[0]["message"]["content"]


@app.route("/graph")
def generate_graph():
    data = request.get_json()
    level = data["level"]
    keyword = data["topic"]
    graph_data = get_vocabulary_graph(level, keyword)
    return graph_data


if __name__ == "__main__":
    app.run(debug=True)
