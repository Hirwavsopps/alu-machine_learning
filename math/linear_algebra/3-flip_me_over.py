#!/usr/bin/env python3
"""Module for matrix transpose."""


def matrix_transpose(matrix):
    """Return the transpose of a 2D matrix.

    Args:
        matrix: A 2D list representing a matrix.

    Returns:
        list: A new matrix that is the transpose.
    """
    return [[row[i] for row in matrix] for i in range(len(matrix[0]))]
