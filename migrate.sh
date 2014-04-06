DB_PATH="sqlite://shared/db/gameplans.sqlite3"
MIGRATIONS="models/migrations/"

if [[ $1 == "-h" ]]; then
  echo "Migrate up:"
  echo "  $0"
  echo "Migrate down:"
  echo "  $0 down <level>"
  exit 0
fi

if [[ $1 == 'down' ]]; then
  level=0
  if [[ ! -z $2 ]]; then
    level=$2
  fi

  echo "Migrating down to $level"
  sequel -E -m ${MIGRATIONS} -M $level $DB_PATH
else
  echo "Migrating up"
  sequel -E -m ${MIGRATIONS}  $DB_PATH
fi

