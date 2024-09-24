import yaml
import sys
import os

scheduler = sys.argv[1]
file_list = sys.argv[2]

def write_to_yaml_file(file):
    
    with open(file, 'r') as f:
        data = yaml.safe_load(f)
        data["spec"]["template"]["spec"]["schedulerName"] = scheduler

    with open(file, 'w') as f:
        yaml.safe_dump(data, f)


def main():
    files:list[str] = []

    with open(file_list, 'r') as fl:
        while True:
            line = fl.readline()
            if not line:
                break
            files.append(line)

    for file in files:
        file = file.replace('\n','')
        write_to_yaml_file(file)


if __name__ == "__main__":
    main()
