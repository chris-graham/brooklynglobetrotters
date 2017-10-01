import boto3
from datetime import datetime, timedelta
import os

dt = datetime.today() - timedelta(hours=4)
fmt = '%Y%m%d'
filename = 'bk_globetrotters_backup_' + dt.strftime(fmt) + '.tar.gz'

s3 = boto3.resource('s3')
data = open(filename, 'rb')
s3.Bucket('brooklynglobetrotters').put_object(Key=filename, Body=data)

os.remove('~/backup_scripts/' + filename)
