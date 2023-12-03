# uniscode

Project for uNIScode hackathon which should help to learn languages effectively using Generative AI.Unfortunately it wasn't implemented the way I wanted during hackathon therefore I am polishing it.

## Features 

- Creates graph based vocabulary
- Generates simulation to immerse and use new vocabulary (so it generates pictures and gives options to use vocabulary)

## Endpoints

- I remember only one yet
### `/graph/`

- **Method:** GET
- **Description:** Generate a graph

  ```json
  {
    "topic": "Overpopulation",
    "level": "A2-B1",
  }