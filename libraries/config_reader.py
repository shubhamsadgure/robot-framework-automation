import yaml

def get_config(key):
    with open("Config/credentials.yaml") as file:
        data = yaml.safe_load(file)
    return data.get(key)