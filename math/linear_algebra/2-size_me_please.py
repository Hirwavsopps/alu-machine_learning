#!/usr/bin/env python3
"""Module to calculate matrix shape."""


def matrix_shape(matrix):
    """Calculate the shape of a matrix."""
    shape = []
    while isinstance(matrix, list):
        shape.append(len(matrix))
        if len(matrix) > 0:
            matrix = matrix[0]
        else:
            break
    return shape
