import pandas_gbq 
from google.oauth2 import service_account


key_file_path = "../GBQ.json" # Chave de contas de serviço

SCOPES = [
    'https://www.googleapis.com/auth/cloud-platform'
]

credentials = service_account.Credentials.from_service_account_file(
    key_file_path, scopes=['https://www.googleapis.com/auth/cloud-platform']
)

pandas_gbq.context.credentials = credentials
pandas_gbq.context.project = "appoutsider" # Nome do projeto no bigquery

def connection_warehouse(df, table_name):
    pandas_gbq.to_gbq(df, f'appoutsider.{table_name}', project_id="appoutsider", if_exists="replace")
    print('Success')