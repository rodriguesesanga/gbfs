import logging
#import boto3
#from botocore.exceptions import ClientError
import os
import csv
import json
import requests


def convert_csv_to_json(csvfilename, jsonfilename):
    print("[TRY] CONVERTING CSV FILE TO JSON FILE ...")
    data = {}
    with open(csvfilename, encoding='utf-8') as csv_file:
        csv_content = csv.DictReader(csv_file)

        for rows in csv_content:
            key = rows['Name']
            data[key] = rows

    with open(jsonfilename, 'w', encoding='utf-8') as json_file:
        json_file.write(json.dumps(data, indent=4))
    return jsonfilename


def get_gbfs_json(url_api):
    print("[TRY] RETRIEVE gbfs.json from " + url_api + " ...")
    try:
        r = requests.get(url_api)
        return json.loads(r.content)
    except:
        print("[ERROR] - The URL " + url_api + " is not yet implemented or is not detectable")
        pass
    return 1


def create_file_to_save(jsonfilename, json_content):
    with open("ingested-files/" + jsonfilename, 'w', encoding='utf-8') as json_file:
        json.dump(json_content, json_file)


def read_files_from_gbfs(csvfilename, to_json):
    print("[TRY] ========================== READING FILES FROM GBFS ===============================...")
    s3_files = []
    convert_csv_to_json(csvfilename, to_json)
    with open(to_json) as json_file:
        data = json.load(json_file)
    for link in data:
        result_api = get_gbfs_json(data[link]['Auto-Discovery URL'])
        if result_api != 1:
            print("[SUCCESS] The API " + data[link]['Auto-Discovery URL'] + " returns data ...")
            create_file_to_save(link + "-organization.json", result_api)
            s3_files.append(link + "-organization.json")
    return s3_files


def upload_file(file_name, bucket, object_name=None):
    """Upload a file to an S3 bucket

    :param file_name: File to upload
    :param bucket: Bucket to upload to
    :param object_name: S3 object name. If not specified then file_name is used
    :return: True if file was uploaded, else False
    """

    # If S3 object_name was not specified, use file_name
    if object_name is None:
        object_name = os.path.basename(file_name)
    # Upload the file
    s3_client = boto3.client('s3')
    try:
        response = s3_client.upload_file("ingested-files/" + file_name, bucket, object_name)
    except ClientError as e:
        logging.error(e)
        return False
    return True


if __name__ == '__main__':
    files_for_s3_bucket = read_files_from_gbfs("../systems.csv", "to_json")
    for json_file in files_for_s3_bucket:
        upload_file(json_file, "gbfs-bucket")
