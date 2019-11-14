# Ruby on Rails Game

## Title: Roshambo Evolution

## Components: 
- ActionCable + JQuery
- Bulma
- Ruby on Rails


## Models:
### Player	
- Userid
- Display Name
- Current Level
- Methods
    - players#new 
    - players#create
    - players#show
    - players#index


### Battle	
- EvolutionLevel
- battlefield_id
- updated_at
- Methods
    - battles#new
    - battles#create
    - battles#show	

### Move	
- player_id
- battle_id
- Symbol	
- Methods
    - moves#create
    - moves#show

### Battlefield	
- Name	
- Methods
	- battlefields#new
    - battlefields#create
    - battlefields#show	

### Favorite
- player_id
- favorite_player_id
- Methods

### Associations
- Battlefield has many battles
- Player has many moves
- Player has many favorites
- Favorite_Player has many favorites
- Battle has many moves
- Battle has many players through moves
- Battle belongs_to Battlefield
- Player has many battles through moves
- Player has many favorite_players through favorites
- Favorite Player has many players through favorites

## Story:
- User  must create userid
- User either chooses a battlefield or creates one
- User waits on battlefield until there’s an opponent
- User challenges opponent
- Users battle (choose a symbol)
- If win, level up.
- User can add / delete favorites
- Repeat


## Rules
Progression:  Egg, Chicken, Dragon, Human, Money

* Scissors cuts paper, 
* paper covers rock, 
* rock crushes lizard, 
* lizard poisons Spock, 
* Spock smashes scissors, 
* scissors decapitates lizard, 
* lizard eats paper, 
* paper disproves Spock, 
* Spock vaporizes rock, 
* and as it always has, rock crushes scissors.

￼
