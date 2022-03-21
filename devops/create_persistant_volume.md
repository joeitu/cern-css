# Create a persistant volume (PV) on okd4

[CERN's documentation](https://paas.docs.cern.ch/3._Storage/persistent-storage/)

## Option1:  manually

### 1. create a volume

Login to okd at paas.cern.ch

 1. Administrator -> Storage -> PersistantVolumeClaim

![](./imgs/pvc.png)

 2. Create PersistantVolumeClaim:

![](./imgs/create_pvc.png)

 Select the following options:

    - StorageClass: cephfs
    - Access mode: Shared access (RWX)
    - Volume mode: Filesystem


![](./imgs/create_pvc2.png)

### 2. mount volume to a given pod

 1. Administrator -> Workloads -> Deployments

  ![](./imgs/deployments.png)

 2. Select the deployment of the pod you want to attach the PV to

  ![](./imgs/select_dep.png)

 3. On the right teardown "Actions" menu, select "Add storage"

   ![](./imgs/add_storage.png)

 4. Select the previously created persistant volume claim ( PVC )

    ![](./imgs/use_existing_claim.png)

 5. Enter the path where you want the PV to be mounted and Save

   It should correspond to the path specified on you CSS's npm start script.
   For example,
   Fill the form with the value `/var/css_storage/`   if the start script of the CSS instance is
   `npm start -- ... -f /var/css_storage/`

## Option 2: with `oc` command line

 TODO
