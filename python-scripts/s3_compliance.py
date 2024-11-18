import boto3

def check_s3_compliance():
    s3 = boto3.client("s3")
    buckets = s3.list_buckets()["Buckets"]
    for bucket in buckets:
        bucket_name = bucket["Name"]
        try:
            encryption = s3.get_bucket_encryption(Bucket=bucket_name)
            print(f"{bucket_name} is encrypted.")
        except:
            print(f"{bucket_name} is not encrypted. Fixing...")
            s3.put_bucket_encryption(
                Bucket=bucket_name,
                ServerSideEncryptionConfiguration={
                    "Rules": [
                        {
                            "ApplyServerSideEncryptionByDefault": {
                                "SSEAlgorithm": "AES256"
                            }
                        }
                    ]
                }
            )

if __name__ == "__main__":
    check_s3_compliance()
