#!/usr/bin/env bash -e

REGIONS=(
    "us-west-1"
    "us-west-2"
    "us-east-1"
    "us-east-2"
    "ap-south-1"
    "ap-northeast-1"
    "ap-northeast-2"
    "ap-southeast-1"
    "ap-southeast-2"
    "ca-central-1"
    "eu-central-1"
    "eu-north-1"
    "eu-west-1"
    "eu-west-2"
    "eu-west-3"
    "sa-east-1"
)
LAYER_NAME="chromeshot-layer"

sh build.sh

for region in ${REGIONS[@]}; do
    printf "Publishing layer to $region... "

    OUTPUT=$(aws lambda publish-layer-version --region $region --layer-name $LAYER_NAME --description "Lambda layer for @sinumo/chromeshot" --license MIT --zip-file fileb://export/layer.zip)
    LAYER_ARN=$(echo $OUTPUT | jq -r .LayerVersionArn)
    printf "$LAYER_ARN "
    LAYER_VERSION=$(echo $OUTPUT | jq -r .Version)
    POLICY=$(aws lambda add-layer-version-permission --region $region --layer-name $LAYER_NAME --version-number $LAYER_VERSION --statement-id $LAYER_NAME-public --action lambda:GetLayerVersion --principal \*)
    echo "OK"
done

echo "Successfully published to all regions"
