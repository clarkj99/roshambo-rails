# Ruby on Rails Rock Paper Scissors Game

# http://clarkj99-roshambo.herokuapp.com/

## Title: Roshambo Evolution

---

## Rules

Progression: Egg, Chicken, Dragon, Human, Money

- Scissors cuts paper,
- paper covers rock,
- rock crushes lizard,
- lizard poisons Spock,
- Spock smashes scissors,
- scissors decapitates lizard,
- lizard eats paper,
- paper disproves Spock,
- Spock vaporizes rock,
- and as it always has, rock crushes scissors.

---

## Components:

- ActionCable + JQuery
- Bulma
- Ruby on Rails

---

## Models:

| Player                                | Battle                        | Move         | Battlefield                  |
| ------------------------------------- | ----------------------------- | ------------ | ---------------------------- |
| userid                                | evolutionLevel                | player_id    | name                         |
| display_name                          | battlefield_id                | battle_id    |
| current_level                         |                               | symbol       |                              |
| ---                                   | ---                           | ---          | ---                          |
| players#new                           | battles#new                   | moves#create | battlefields#new             |
| players#create                        | battles#create                | moves#show   | battlefields#create          |
| players#show                          | battles#show                  |              | battlefields#show            |
| players#index                         |                               |              |                              |
| ---                                   | ---                           | ---          | ---                          |
| Player has many moves                 | Battle has many moves         |              | Battlefield has many battles |
| Player has many battles through moves | Battle belongs_to Battlefield |              |                              |
|                                       |                               |              |                              |

---

## Story:

- User must create userid
- User either chooses a battlefield or creates one
- User waits on battlefield until there’s an opponent
- User challenges opponent
- Users battle (choose a symbol)
- If win, level up.
- User can add / delete favorites
- Repeat
