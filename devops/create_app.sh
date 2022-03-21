# fill the follwing variables
# TODO: add fail message

APP_NAME="storage"
PROJECT_NAME="test"
GIT_REPO="https://github.com/joeitu/css-storage-test/"
DATA_STORAGE_PATH="" # path where the persitant volume is mounted

# CERN_USERNAME=""
# oc login https://api.paas.okd.cern.ch -u tmmeyer

PROJECT_DESC="desc.. $PROJECT_NAME" # required but doesnt need to be meaningfull
BASE_NAME="https://${APP_NAME}-${PROJECT_NAME}.app.cern.ch"

echo "remember to run sshuttle and login with oc"

# comment/uncomment the desired options:
Create app in a new project...
oc new-project "$PROJECT_NAME" \
  --description "$PROJECT_DESC"

# ... or form an existing one
# oc project $PROJECT_NAME

oc new-app "$GIT_REPO" \
  --name "$APP_NAME"

oc create route edge \
  --service=$APP_NAME \
  --insecure-policy='Redirect' \
  --port=8080

oc annotate route $APP_NAME \
  --overwrite haproxy.router.openshift.io/ip_whitelist=''

oc start-build $APP_NAME \
  --env=NPM_RUN="start -- -p 8080 -b $BASE_NAME -f $DATA_STORAGE_PATH"

# TODO:
# ask if special routing or default routing ( BASE_NAME) ?
# login to oc
# ask for data storage path ( with default valeu)
# ask to select project name ( with defautl CSS value ) or create a new one )A

