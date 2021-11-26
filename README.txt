I needed a tool to update commodity prices in my GnuCash database.
For this to run you need an Alphavantage API key, see https://www.alphavantage.co/

Environment values:
DB_USER                 Username for postgres database
DB_PASSWORD             Password for postgres database
DB_ADDRESS              Address for postgres database. Defaults to localhost
DB_PORT                 Port for postgres database. Defaults to 5432
DB_DATABASE             Database name for postgres database. Defaults to gnucash
ALPHAVANTAGE_API_KEY    Alphavantage key, needed fo fetching prices