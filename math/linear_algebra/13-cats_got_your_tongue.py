#!/usr/bin/env python3
"""Module for numpy concatenation."""
import numpy as np


def np_cat(mat1, mat2, axis=0):
    """Concatenate two numpy arrays along a specific axis.

    Args:
        mat1: First numpy.ndarray.
        mat2: Second numpy.ndarray.
        axis: Axis along which to concatenate.

    Returns:
        numpy.ndarray: Concatenated array.
    """
    return np.concatenate((mat1, mat2), axis=axis)
