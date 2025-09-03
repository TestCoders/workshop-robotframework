import random

def get_random_build_from_list(list):
    result = random.choice(list)
    print(f'Input: {list}, result: {result}')
    return result