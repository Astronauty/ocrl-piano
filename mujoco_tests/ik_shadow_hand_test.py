from dm_control.utils import inverse_kinematics as ik
import numpy as np
# from dm_control import mujoco
import mujoco
from mujoco import viewer
import distutils.util
import os
import subprocess

import time
import itertools
import numpy as np

import numpy as np
from typing import Callable, Optional, Union, List
import scipy.linalg

import mediapy as media
import matplotlib.pyplot as plt
np.set_printoptions(precision=3, suppress=True, linewidth=100)

model = mujoco.MjModel.from_xml_path('/home/workstation4/daniel/ocrl-piano/single_finger_free_trajectories/models/scene_right_piano_hand.xml')
data = mujoco.MjData(model)

target = np.array([0, 0, 0])
target_quat = np.array([1, 0, 0, 0])

# mujoco.Physics.from_xml_path('/home/workstation4/daniel/ocrl-piano/single_finger_free_trajectories/models/scene_right_piano_hand.xml')

# mujoco.viewer.launch(model)

jac = np.zeros((6, model.nv))
# site_id = model.site("grasp_site").id
data.qpos[1] = 0.5
print(model.joint("rh_FFJ3"))

site_id = model.site("rh_ffdistal_tip").id
print(site_id)
mujoco.mj_jacSite(model, data, jac[:3], jac[3:], site_id)
print(jac)
print(jac.shape)
print(model.nq)