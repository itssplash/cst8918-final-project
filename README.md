# cst8918-final-project-FP10


RESOURCE_GROUP_NAME="cst8918-final-project"
STORAGE_ACCOUNT_NAME="cst8918storagegroupfp10"  
CONTAINER_NAME="tfstate"


az group create --name $RESOURCE_GROUP_NAME --location "Canada Central"

az storage account create \
  --name $STORAGE_ACCOUNT_NAME \
  --resource-group $RESOURCE_GROUP_NAME \
  --location "Canada Central" \
  --sku Standard_LRS \
  --encryption-services blob

az storage container create \
  --name $CONTAINER_NAME \
  --account-name $STORAGE_ACCOUNT_NAME
