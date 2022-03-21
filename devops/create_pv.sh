# relevant doc:
# https://docs.openshift.com/container-platform/3.11/dev_guide/volumes.html#adding-volumes
# https://stackoverflow.com/questions/46523054/how-to-mount-pvc-on-pod-in-openshift-online-3

# check mounted volume:
# oc set volume deployments/$APP_NAME

oc create -f ./pv.yaml
oc set volume deployments/${APP_NAME} --add pvc/${PVC_NAME} --path ${DATA_STORAGE_PATH}

DATA_FOLDER="/data"
 oc set volume deployments/${APP_NAME} --add --type=persistentVolumeClaim --claim-name=${PVC_NAME} --mount-path='/data' --name=${PVC_SURNAME}


oc create -f ./pv.yaml
oc set volume deployments/my-css-pod --add pvc/my-pvc --path /data
