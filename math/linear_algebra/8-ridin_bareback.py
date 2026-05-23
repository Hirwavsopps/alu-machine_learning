#!/usr/bin/env python3
"""Module for matrix multiplication."""


def mat_mul(mat1, mat2):
    """Multiply two 2D matrices.

    Args:
        mat1: First matrix (m x n).
        mat2: Second matrix (n x p).

    Returns:
        list: New matrix (m x p), or None if dimensions incompatible.
    """
    if len(mat1[0]) != len(mat2):
        return None
    result = []
    for i in range(len(mat1)):
        row = []
        for j in range(len(mat2[0])):
            val = 0
            for k in range(len(mat2)):
                val += mat1[i][k] * mat2[k][j]
            row.append(val)
        result.append(row)
    return result
