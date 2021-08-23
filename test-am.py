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

import numpy as np
from associative import *

# Memory for 4 features of size 3
m = AssociativeMemory(4,3)

# 0: 1 1 1 1
# 1: 0 0 0 0
# 2: 0 0 0 0
v0 = np.array([0, 0, 0, 0])
v1 = np.array([1, 1, 1, 1])
v2 = np.array([2, 2, 2, 2])

# 0: 1 0 0 0
# 1: 0 1 0 1
# 2: 0 0 1 0
vd = np.array([0, 1, 2, 1])

# 0: 0 0 0 1
# 1: 1 0 1 0
# 2: 0 1 0 0

vi = np.array([1, 2, 1, 0])
