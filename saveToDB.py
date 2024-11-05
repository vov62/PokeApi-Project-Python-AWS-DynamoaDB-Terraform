from apiHandle import fetch_single_pokemon_details
from boto3.dynamodb.conditions import Key, Attr
import boto3
from datetime import datetime


# get table resource
dynamodb = boto3.resource('dynamodb', region_name='us-west-2')
table = dynamodb.Table('pokemonsDBTable')



def check_if_pokemon_in_database(random_pokemon_name):
    pokemon = None


    response = table.scan(
        FilterExpression=Attr('name').eq(random_pokemon_name)
    )   
    filtered_items  = response['Items']

    while 'LastEvaluatedKey' in response:
        response = table.scan(ExclusiveStartKey=response['LastEvaluatedKey'])
        filtered_items.extend(response['Items'])
    for item in filtered_items:
        pokemon = item

    if pokemon:
        print('Found match!')
        print('-----------Pokemon details from database------')
        print(f"Pokemon: {pokemon['name']}\nID: {pokemon['id']}\nHeight: {pokemon['height']}\nWeight: {pokemon['weight']}")
    else:
        print('Pokemon name is not found in DynamoDB database. Fetching details...')
        pokemon_details = fetch_single_pokemon_details(random_pokemon_name)
        save_pokemon_to_dynamoDB(pokemon_details)





def save_pokemon_to_dynamoDB(pokemon_details):

    if table is None:
        print("Failed to retrieve or create the table.")
        return
    
    try:
        response = table.put_item(
            Item={
                "id": pokemon_details['id'],
                "name": pokemon_details['name'],
                "height": pokemon_details['height'],
                "weight": pokemon_details['weight'],
                "types": [
                    pokemon_details['types']
                ],
                "created_date": datetime.now().isoformat()
            }
        )
        if response['ResponseMetadata']['HTTPStatusCode'] == 200:
            print(f'Success: Pokemon "{pokemon_details["name"]}" details saved to DynamoDB database!')
            print(f"Pokemon: {pokemon_details['name']}\nID: {pokemon_details['id']}\nHeight: {pokemon_details['height']}\nWeight: {pokemon_details['weight']}")

    except Exception as e:
        print(f"failed to create item: {str(e)}")

