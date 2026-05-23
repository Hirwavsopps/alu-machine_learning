#!/usr/bin/env python3
"""Module for element-wise 2D matrix addition."""


def add_matrices2D(mat1, mat2):
    """Add two 2D matrices element-wise.

    Args:
        mat1: First 2D matrix.
        mat2: Second 2D matrix.

    Returns:
        list: New matrix with element-wise sums, or None if shapes differ.
    """
    if matrix_shape(mat1) != matrix_shape(mat2):
        return None
    return [[mat1[i][j] + mat2[i][j] for j in range(len(mat1[0]))]
            for i in range(len(mat1))]


def matrix_shape(matrix):
    """Calculate the shape of a matrix.

    Args:
        matrix: A nested list representing a matrix.

    Returns:
        list: A list of integers representing the dimensions.
    """
    shape = []
    while isinstance(matrix, list):
        shape.append(len(matrix))
        if len(matrix) > 0:
            matrix = matrix[0]
        else:
            break
    return shape
