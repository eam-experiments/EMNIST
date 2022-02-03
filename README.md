# Entropic Associative Memory for Manuscript Symbols
This repository contains the data and procedures to replicate the experiments presented in the paper

Rafael Morales, Noé Hernández, Ricardo Cruz, Victor D. Cruz and Luis A. Pineda. 2021. “Entropic Associative Memory for Manuscript Symbols”.

The code was written in Python 3.8.10 and was run on an Alienware Aurora R5 computer with the following specifications:
* CPU: Intel Core i7-6700 at 3.40 GHz
* GPU: Nvidia GeForce GTX 1080
* OS: Ubuntu 16.04 Xenial
* RAM: 64GB

### Requeriments
The following libraries need to be installed beforehand:
* joblib
* matplotlib
* numpy
* png
* TensorFlow 2.4.1
* extra-keras-datasets 1.2.0 <- from where the EMNIST dataset was imported

The experiments were run using the Anaconda 3 distribution. This [link](https://www.osetc.com/en/how-to-install-anaconda-on-ubuntu-16-04-17-04-18-04.html) may be a good resource to install Anaconda, and these other two links ([link1](https://github.com/machinecurve/extra_keras_datasets#installation-procedure) and [link2](https://stackoverflow.com/a/43729857)) show how to install the ``extra-keras-datasets`` library in your system. You may clone the ``conda`` environment in the file [entropic_associative_mem_env.yml](https://github.com/eam-experiments/EMNIST/blob/main/entropic_associative_mem_env.yml), used to run the experiments, with the instruction ``$ conda env create -f entropic_associative_mem_env.yml``. The environment is activated with ``$ conda activate eam``.


### Use

All commands presented below are run in **this repository's source directory**. The output of the experiments is in several files and folders rooted in the ``runs/`` subdirectory, that is created as the experiments are executed. Moreover, within the ``runs/images/`` subdirectory a folder is created for experiment 3 and for the diferent conditions of experiment 4. Inside such folder, other ten are found corresponding to the 10 stages of the cross-validation procedure, each containing eight folders with the diferent levels of entropy holding the constructed images.

1. With the next instruction the neural network -i.e., the autoencoder and the classifier- is trained:

    ```shell
    python3 main_test_associative.py -n
    ```

1. The data features are extracted with the command:

    ```shell
    python3 main_test_associative.py -f
    ```

1. The experiment number 1 described in the paper is run with the two instructions shown next, but first the steps 1 and 2 of this `README` file are executed considering that in [constants.py](https://github.com/eam-experiments/EMNIST/blob/main/constants.py) the value of 47 is set to the number of labels, and in [convent.py](https://github.com/eam-experiments/EMNIST/blob/main/convnet.py) the EMNIST-47 dataset is loaded and 47 is passed as the number of units in the last ``Dense`` layer of the classifier:

    ```shell
    python3 main_test_associative.py -e 1
    python3 main_test_associative.py -e 3
    ```

1. Experiment number 2 described in the paper is also run with the two previous commands, but first the steps 1 and 2 of this `README` file are executed considering that in [constants.py](https://github.com/eam-experiments/EMNIST/blob/main/constants.py) the value of 36 is assigned to the number of labels, and in [convent.py](https://github.com/eam-experiments/EMNIST/blob/main/convnet.py) the EMNIST-36 dataset is loaded and 36 is passed as the number of units in the last ``Dense`` layer of the classifier. This is the default configuration of the files in the repository.

1. To run the experiment number 3 described in the paper the changes pointed out in the previous step are kept, and the next command is run:

    ```shell
    python3 main_test_associative.py -e 4
    ```

1. Experiment number 4 described in the paper keeps the configuration mentioned in step 4, and its execution can be divided in two parts.
    - The part corresponding to the retrieval of objects with a cue having the bottom half part occluded is run with the command:
    ```shell
    python3 main_test_associative.py -e 6 -o 0.5 -t 0
    ```
    The tolerance value can be modified to retrive objects by AMRs that are allowed to fail in some number of features when recognizing an image. Say, the tolerance value is 1, the command is now:
    ```shell
    python3 main_test_associative.py -e 6 -o 0.5 -t 1
    ```
    - The part corresponding to the retrieval of objects with a cue occluded by horizontal bars is run with the command:
    ```shell
    python3 main_test_associative.py -e 10 -b 1 -t 0
    ```
    As explained before, the tolerance value can be modified, so if the tolerance value is 1, the new command is:
    ```shell
    python3 main_test_associative.py -e 10 -b 1 -t 1
    ```

To see more information on how to use the code, just run the following command ```python3 main_test_associative.py -h```

Furthermore, the grid with the retrieved images from the AMRs shown in Figures 9 through 13 of the paper are obtained by:

- A text file with pairs of stage number (resulting from the ten-fold cross-validation procedure) and an image id produced by that particular stage, where such pairs are separated by line breaks and each dataset class is represented by exactly one image id in the text file. The way to select the images follows the corresponding method explained in the paper. An example of such text file is found in [stage_id_exp_10.txt](https://github.com/eam-experiments/EMNIST/blob/main/stage_id_exp_10.txt).
- Executing the script [select_imgs.sh](https://github.com/eam-experiments/EMNIST/blob/main/select_imgs.sh) in the source directory with arguments:
    - the number of experiment the selected images belong to, and
    - the text file created in the previous step with the selected images.

    For example,
    ```shell
    $ ./select_imgs.sh 4 stage_id_exp_10.txt
    ```
    produces a grid of images similar to the one in Figure 9 of the paper, assuming an appropriate selection of images within the argument file ``stage_id_exp_10.txt``.

    A third argument may be provided with the pattern ``occ_nnn`` for experiments 5 through 8, or ``bar_mmm``, for experiments 9 and 10, where ``nnn`` is the occlusion percentage and ``mmm`` is the chosen bar type. For example,

    ```shell
    $ ./select_imgs.sh 6 stage_id_exp_10.txt occ_050
    ```
    produces a grid of images similar to the one in Figure 12 (a) of the paper, assuming an appropriate selection of images.

    Given a third argument, a fourth one may be also included with the pattern ``tol_ppp``, where ``ppp`` is the number of allowed failing features by an AMR when recognizing an image. For example,

    ```shell
    $ ./select_imgs.sh 10 stage_id_exp_10_random.txt bar_001 tol_002
    ```
    produces a grid of images similar to the one in Figure 13 (c) of the paper, assuming an appropriate selection of images.

    The grid corresponding to the last example is saved in the file path ``runs/images/010/stage_id_exp_10-bar_001-tol_002/all.png``. Such path is formed by the prefix ``runs/images/``, followed by the experiment number ``010``, the text file name ``stage_id_exp_10``, the two optional patterns ``bar_001`` and ``tol_002``, which may be empty if the third and fourth script arguments are missing, and finally the predefined image name ``all.png``. All file paths of the grids of images generated by different executions of the script [select_imgs.sh](https://github.com/eam-experiments/EMNIST/blob/main/select_imgs.sh) are formed in an analogous way.

## License

Copyright [2021] Rafael Morales Gamboa, Noé S. Hernández Sánchez, Carlos Ricardo Cruz Mendoza, Victor D. Cruz González, and Luis Alberto Pineda Cortés.


Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.