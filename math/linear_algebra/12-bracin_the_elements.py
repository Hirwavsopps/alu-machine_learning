#!/usr/bin/env python3
"""Module for element-wise numpy operations."""


def np_elementwise(mat1, mat2):
    """Perform element-wise addition, subtraction, multiplication, division.

    Args:
        mat1: First numpy.ndarray.
        mat2: Second numpy.ndarray or scalar.

    Returns:
        tuple: (sum, difference, product, quotient).
    """
    return (mat1 + mat2, mat1 - mat2, mat1 * mat2, mat1 / mat2)
