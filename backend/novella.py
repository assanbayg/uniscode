import os
import openai
import requests
import asyncio

from dotenv import load_dotenv

load_dotenv()

openai.api_key = os.environ.get('OPENAI_API_KEY')

def generate_scenario(vocabulary):
    try:
        # Send the request to OpenAI API
        response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo",
            messages=[
                {"role": "user", "content": f"Create a short real-life simulation scenario using the following vocabulary: {', '.join(vocabulary)}. Provide 3 options for the user to choose from, each containing a new word. Return everything in JSON format, with 'Options' (it has 'Option1', 'Option2', 'Option3') ans 'Scenario', 'Question' keys"}
            ],
            temperature=0.5,
            max_tokens=200,
        )

        scenario = response.choices[0]['message']['content']
        print(scenario)
        return scenario
    except Exception as e:
        print(f"Error: {e}")
        return None

def generate_dalle_prompt(scenario, vocabulary):
    try:
        prompt = f"Simulate a vivid and realistic scene depicting a [specific topic], incorporating the following elements: {', '.join(vocabulary)}in this scenario: {scenario}. Length of prompt should not be longer than 1000"
        response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo",
            messages=[{"role": "user", "content": prompt}],
            max_tokens=200
        )

        # Extract the DALL-E prompt
        dalle_prompt = response.choices[0]['message']['content']

        return dalle_prompt
    except Exception as e:
        print(f'Error: {e}')
        return None

async def get_image(input_str):
    try:
        response = openai.Image.create(
            prompt=input_str,
            n=1,
            # size="256x256",
        )

        return response["data"][0]["url"]
    except Exception as e:
        print(f'Error: {e}')
        return None

# Example usage
vocabulary = ["apple", "banana", "cherry"]
scenario = generate_scenario(vocabulary)

if scenario:
    dalle_prompt = generate_dalle_prompt(scenario, vocabulary)

    if dalle_prompt:
        print('Created prompt')
        print(dalle_prompt)
        print(asyncio.run(get_image(dalle_prompt)))
