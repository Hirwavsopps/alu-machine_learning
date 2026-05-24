#!/usr/bin/env python3
"""Module to calculate matrix determinant."""


def determinant(matrix):
    """Calculate the determinant of a matrix.

    Args:
        matrix: A list of lists representing a square matrix.

    Returns:
        int or float: The determinant of the matrix.

    Raises:
        TypeError: If matrix is not a list of lists.
        ValueError: If matrix is not square.
    """
    if not isinstance(matrix, list) or not all(isinstance(row, list) for row in matrix):
        raise TypeError("matrix must be a list of lists")
    if matrix == [[]]:
        return 1
    if len(matrix) == 0:
        raise TypeError("matrix must be a list of lists")
    n = len(matrix)
    for row in matrix:
        if len(row) != n:
            raise ValueError("matrix must be a square matrix")
    if n == 1:
        return matrix[0][0]
    if n == 2:
        return matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0]
    det = 0
    for j in range(n):
        sub = []
        for i in range(1, n):
            row = []
            for k in range(n):
                if k != j:
                    row.append(matrix[i][k])
            sub.append(row)
        sign = 1 if j % 2 == 0 else -1
        det += sign * matrix[0][j] * determinant(sub)
    return det