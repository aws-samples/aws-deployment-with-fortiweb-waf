# ./build-s3-dist.sh iot-device-simulator  waf v1.0.0
#!/bin/bash
#
# This assumes all of the OS-level configuration has been completed and git repo has already been cloned
#
# This script should be run from the repo's deployment directory
# cd deployment
# ./build-s3-dist.sh source-bucket-base-name version-code
# ./build-s3-dist.sh  liuchunhua-csdc-code liuchunhua-csdc-code waf v1.0.0
#
# Paramenters:
#  - source-bucket-base-name: Name for the S3 bucket location where the template will source the Lambda
#    code from. The template will append '-[region_name]' to this bucket name.
#    For example: ./build-s3-dist.sh solutions v1.0.0
#    The template will then expect the source code to be located in the solutions-[region_name] bucket
#
#  - version-code: version of the package
# Change to three parameters
# Check to see if input has been provided:
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ] ; then
    echo "Please provide the base source bucket name, open-source bucket name, trademark approved solution name and version where the lambda code will eventually reside."
    echo "For example: ./build-s3-dist.sh solutions solutions-github trademarked-solution-name v1.0.0"
    exit 1
fi

# Get reference for all important folders
template_dir="$PWD"
template_dist_dir="$template_dir/global-s3-assets"
build_dist_dir="$template_dir/regional-s3-assets"
source_dir="$template_dir/../source"

echo "------------------------------------------------------------------------------"
echo "[Init] Clean old dist folders"
echo "------------------------------------------------------------------------------"
echo "rm -rf $template_dist_dir"
rm -rf $template_dist_dir
echo "mkdir -p $template_dist_dir"
mkdir -p $template_dist_dir
echo "rm -rf $build_dist_dir"
rm -rf $build_dist_dir
echo "mkdir -p $build_dist_dir"
mkdir -p $build_dist_dir
echo "mkdir -p $build_dist_dir/lambda"
mkdir -p $build_dist_dir/lambda

echo "------------------------------------------------------------------------------"
echo "[Packing] Templates"
echo "------------------------------------------------------------------------------"
echo "cp $template_dir/fwb-ha-vpc-alb-main.yaml $template_dist_dir/fwb-ha-vpc-alb-main.template"
cp $template_dir/fwb-ha-vpc-alb-main.yaml $template_dist_dir/fwb-ha-vpc-alb-main.template
cp $template_dir/fwb-ha-vpc-nlb-main.yaml $template_dist_dir/fwb-ha-vpc-nlb-main.template

echo "cp $template_dir/ha-instance-create-alb.yaml $template_dist_dir/ha-instance-create-alb.template"
cp $template_dir/ha-instance-create-alb.yaml $template_dist_dir/ha-instance-create-alb.template
cp $template_dir/ha-instance-create-nlb.yaml $template_dist_dir/ha-instance-create-nlb.template

echo "cp $template_dir/ha-vpc-create-alb.yaml $template_dist_dir/ha-vpc-create-alb.template"
cp $template_dir/ha-vpc-create-alb.yaml $template_dist_dir/ha-vpc-create-alb.template
cp $template_dir/ha-vpc-create-nlb.yaml $template_dist_dir/ha-vpc-create-nlb.template

echo "Updating template in template with $1"
replace="s/%%TEMPLATE_BUCKET_NAME%%/$1/g"
echo "sed -i '' -e $replace $template_dist_dir/fwb-ha-vpc-alb-main.template"
sed -i '' -e $replace $template_dist_dir/fwb-ha-vpc-alb-main.template
sed -i '' -e $replace $template_dist_dir/ha-instance-create-alb.template
sed -i '' -e $replace $template_dist_dir/ha-vpc-create-alb.template
sed -i '' -e $replace $template_dist_dir/fwb-ha-vpc-nlb-main.template
sed -i '' -e $replace $template_dist_dir/ha-instance-create-nlb.template
sed -i '' -e $replace $template_dist_dir/ha-vpc-create-nlb.template

echo "Updating code source bucket in template with $2"
replace="s/%%BUCKET_NAME%%/$2/g"
echo "sed -i '' -e $replace $template_dist_dir/fwb-ha-vpc-alb-main.template"
sed -i '' -e $replace $template_dist_dir/fwb-ha-vpc-alb-main.template
sed -i '' -e $replace $template_dist_dir/ha-instance-create-alb.template
sed -i '' -e $replace $template_dist_dir/ha-vpc-create-alb.template
sed -i '' -e $replace $template_dist_dir/fwb-ha-vpc-nlb-main.template
sed -i '' -e $replace $template_dist_dir/ha-instance-create-nlb.template
sed -i '' -e $replace $template_dist_dir/ha-vpc-create-nlb.template


echo "Updating code source bucket in template with $3"
replace="s/%%SOLUTION_NAME%%/$3/g"
echo "sed -i '' -e $replace $template_dist_dir/fwb-ha-vpc-alb-main.template"
sed -i '' -e $replace $template_dist_dir/fwb-ha-vpc-alb-main.template
sed -i '' -e $replace $template_dist_dir/ha-instance-create-alb.template
sed -i '' -e $replace $template_dist_dir/ha-vpc-create-alb.template
sed -i '' -e $replace $template_dist_dir/fwb-ha-vpc-nlb-main.template
sed -i '' -e $replace $template_dist_dir/ha-instance-create-nlb.template
sed -i '' -e $replace $template_dist_dir/ha-vpc-create-nlb.template

echo "Updating code source bucket in template with $4"
replace="s/%%VERSION%%/$4/g"
echo "sed -i '' -e $replace $template_dist_dir/fwb-ha-vpc-alb-main.template"
sed -i '' -e $replace $template_dist_dir/fwb-ha-vpc-alb-main.template
sed -i '' -e $replace $template_dist_dir/ha-instance-create-alb.template
sed -i '' -e $replace $template_dist_dir/ha-vpc-create-alb.template
sed -i '' -e $replace $template_dist_dir/fwb-ha-vpc-nlb-main.template
sed -i '' -e $replace $template_dist_dir/ha-instance-create-nlb.template
sed -i '' -e $replace $template_dist_dir/ha-vpc-create-nlb.template


echo "------------------------------------------------------------------------------"
echo "[Rebuild] Lambda - ALB"
echo "------------------------------------------------------------------------------"
cd $source_dir/lambda-alb
zip lambda-alb.zip cfnresponse.py index.py
cp lambda-alb.zip $build_dist_dir/lambda
rm lambda-alb.zip

echo "------------------------------------------------------------------------------"
echo "[Rebuild] Lambda - NLB"
echo "------------------------------------------------------------------------------"
cd $source_dir/lambda-nlb
zip lambda-nlb.zip cfnresponse.py index.py
cp lambda-nlb.zip $build_dist_dir/lambda
rm lambda-nlb.zip




