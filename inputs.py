import requests
import os
import argparse

# OK KIND OF LAME, Will have to auth to get inputs. 
def main():
    parser = argparse.ArgumentParser(
        prog='inputs',
        description='Get\'s inputs for Advent of Code 2024')
    parser.add_argument('-d', '--day', required=True)
    args = parser.parse_args()
    url = "https://adventofcode.com/2024/day/" + str(args.day) + "/input"
    save_as = "day" + str(args.day) + "/d" + str(args.day) + ".txt"
    directory = os.path.dirname(save_as)
    if not os.path.exists(directory):
        os.makedirs(directory)

    if os.path.exists(save_as):
        printf(f"The file '{save_as}' already exists.")
    else:
        response = requests.get(url)
        if response.status_code == 200:
            with open(save_as, 'wb') as file:
                file.write(response.content)
            print(f"File saved succesfully as {save_as}.")
        else:
            print(f"Failed to download the file. Status code: {response.status_code}")




if __name__ == "__main__":
    main()
