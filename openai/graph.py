import openai
import json
import os

openai.api_ley = os.environ.get('OPENAI_API_KEY')

def get_vocabulary_graph(level, keyword):
    responses = []
    restart_sequence = "\n"
    
    response = openai.ChatCompletion.create(
      model='gpt-3.5-turbo',
      messages=[{"role": "user", "content": '''
Generate me vocabulary for level {level} on topic of keyword {keyword} with alternatives of words, synonyms and cognates and return them in structure of graph in text of json format. Here is example of expected result format:

      'nodes': [
        {
          'id': '1',
          'value': 'Initiate',
          'description': 'The commencement point'
        },
        {
          'id': '2',
          'value': 'Subsequent',
          'description': 'Following in order or succession'
        },
        {
          'id': '3',
          'value': 'Sequential',
          'description': 'Arranged in a sequence'
        },
        {
          'id': '4',
          'value': 'Cognizant',
          'description': 'Aware and perceptive'
        },
        {
          'id': '5',
          'value': 'Ubiquitous',
          'description': 'Present everywhere at the same time'
        },
        {
          'id': '6',
          'value': 'Hella smart',
          'description': 'Present everywhere at the same time'
        },
      ],
      'edges': [
        {'source': '1', 'target': '2'},
        {'source': '2', 'target': '3'},
        {'source': '3', 'target': '4'},
        {'source': '4', 'target': '5'},
        {'source': '1', 'target': '6'},
        {'source': '2', 'target': '6'},
      ],

Return me ONLY json and NO other words. Do NOT comment before and after text of JSON.
'''
                 }],
      temperature=0.5,
      max_tokens=1000
    )

    # Parse the response to JSON
    print (response.choices[0]['message']['content'])
    # graph_json = json.loads(response.choices[0]['message']['content'])
    # print(type(graph_json))

    # return graph_json

# Test the function
# graph = 
get_vocabulary_graph('B2-C1', 'Cultural Identity')
# print(json.dumps(graph, indent=2))
