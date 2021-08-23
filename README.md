# Entropic Associative Memories for Manuscript Symbols
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

The experiments were run using the Anaconda 4 distribution.


### Use

To see how to use the code, just run the following command in the source directory

```shell
python3 main_test_associative.py -h
```



## License

Copyright [2021] Copyright [2021] Rafael Morales Gamboa, Noé S. Hernández Sánchez, Carlos Ricardo Cruz Mendoza, Victor D. Cruz González, and Luis Alberto Pineda Cortés.


Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.