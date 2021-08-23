#! /bin/bash

# Copyright [2021] Rafael Morales Gamboa, Noé S. Hernández Sánchez,
# Carlos Ricardo Cruz Mendoza, Victor D. Cruz González, and
# Luis Alberto Pineda Cortés.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#############
## This script produces a text file with pairs of stage number and image id
## selected randomly among the results obtained by a given experiment. Such
## text file can be use as the input for the script select_imgs.sh

#############
## Notes:
# Argument 1 (mandatory) is the experiment number the images are chosen
#   from.
# Argument 2 (mandatory) is the name of the text file where the pairs of
#    stage number and image id, selected randomly for all classes in the
#    alphabet, are saved.
# Argument 3 (optional) is either 'occ_nnn', for experiments 5
#   through 8, or 'bar_mmm', for experiments 9 and 10; where
#   nnn is the occlusion percentage and mmm is the chosen bar type. 
# Argument 4 (optional) is 'tol_ppp' meaning the tolerance (>0) that
#   may be considered in experiments 5 through 10, where ppp is the
#   number of allowed failing features by an AMR when recognizing an image  


##
## Arguments
exp_no=$(printf "%03d" $1)
save_as=$2
occ_bar=$3
tol=$4
##
##

##
## Setting variables
runs_dir='runs'
imag_dir="${runs_dir}/images"
mems_dir="${imag_dir}/memories-${exp_no}"
##
##

if [ ! -z "$occ_bar" ]; then
    mems_dir="${mems_dir}-$occ_bar"
fi

if [ ! -z "$tol" ]; then
    mems_dir="${mems_dir}-$tol"
fi

if [ ! -d "$mems_dir" ]; then
    echo "Directory for $mems_dir does not exist!"
    exit 2
fi

## main loop here
##
for i in {0..35}; do
    random_stage=$(( RANDOM % 10 ))
    ms_dir="${mems_dir}/stage_${random_stage}/msize_6"

    img_name=`find ${ms_dir} -name "${i}_*".png -printf "%f\n" |sort -R|head -1`
    img_name=${img_name%".png"}
    echo "The selected stage and image are: ${random_stage},${img_name}"
    echo "${random_stage},${img_name}">>${save_as}
done
		
