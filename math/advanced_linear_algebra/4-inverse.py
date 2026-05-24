#!/usr/bin/env python3
"""Module to calculate matrix inverse."""


def inverse(matrix):
    """Calculate the inverse of a matrix.

    Args:
        matrix: A list of lists representing a square matrix.

    Returns:
        list or None: The inverse matrix, or None if singular.

    Raises:
        TypeError: If matrix is not a list of lists.
        ValueError: If matrix is not square or is empty.
    """
    if not isinstance(matrix, list) or not all(
            isinstance(row, list) for row in matrix):
        raise TypeError("matrix must be a list of lists")
    if len(matrix) == 0 or matrix == [[]]:
        raise ValueError("matrix must be a non-empty square matrix")
    n = len(matrix)
    for row in matrix:
        if len(row) != n:
            raise ValueError("matrix must be a non-empty square matrix")
    det = determinant(matrix)
    if det == 0:
        return None
    if n == 1:
        return [[1 / matrix[0][0]]]
    adj = adjugate(matrix)
    inverse = []
    for i in range(n):
        row = []
        for j in range(n):
            row.append(adj[i][j] / det)
        inverse.append(row)
    return inverse


def adjugate(matrix):
    """Calculate the adjugate matrix of a matrix.

    Args:
        matrix: A list of lists representing a square matrix.

    Returns:
        list: The adjugate matrix.
    """
    if not isinstance(matrix, list) or not all(
            isinstance(row, list) for row in matrix):
        raise TypeError("matrix must be a list of lists")
    if len(matrix) == 0 or matrix == [[]]:
        raise ValueError("matrix must be a non-empty square matrix")
    n = len(matrix)
    for row in matrix:
        if len(row) != n:
            raise ValueError("matrix must be a non-empty square matrix")
    if n == 1:
        return [[1]]
    cofactors = cofactor(matrix)
    adjugate = []
    for j in range(n):
        row = []
        for i in range(n):
            row.append(cofactors[i][j])
        adjugate.append(row)
    return adjugate


def cofactor(matrix):
    """Calculate the cofactor matrix of a matrix.

    Args:
        matrix: A list of lists representing a square matrix.

    Returns:
        list: The cofactor matrix.
    """
    if not isinstance(matrix, list) or not all(
            isinstance(row, list) for row in matrix):
        raise TypeError("matrix must be a list of lists")
    if len(matrix) == 0 or matrix == [[]]:
        raise ValueError("matrix must be a non-empty square matrix")
    n = len(matrix)
    for row in matrix:
        if len(row) != n:
            raise ValueError("matrix must be a non-empty square matrix")
    if n == 1:
        return [[1]]
    minors = minor(matrix)
    cofactors = []
    for i in range(n):
        row = []
        for j in range(n):
            sign = 1 if (i + j) % 2 == 0 else -1
            row.append(sign * minors[i][j])
        cofactors.append(row)
    return cofactors


def minor(matrix):
    """Calculate the minor matrix of a matrix.

    Args:
        matrix: A list of lists representing a square matrix.

    Returns:
        list: The minor matrix.
    """
    if not isinstance(matrix, list) or not all(
            isinstance(row, list) for row in matrix):
        raise TypeError("matrix must be a list of lists")
    if len(matrix) == 0 or matrix == [[]]:
        raise ValueError("matrix must be a non-empty square matrix")
    n = len(matrix)
    for row in matrix:
        if len(row) != n:
            raise ValueError("matrix must be a non-empty square matrix")
    if n == 1:
        return [[1]]
    minors = []
    for i in range(n):
        row = []
        for j in range(n):
            sub = []
            for r in range(n):
                if r != i:
                    new_row = []
                    for c in range(n):
                        if c != j:
                            new_row.append(matrix[r][c])
                    sub.append(new_row)
            row.append(determinant(sub))
        minors.append(row)
    return minors


def determinant(matrix):
    """Calculate the determinant of a matrix.

    Args:
        matrix: A list of lists representing a square matrix.

    Returns:
        int or float: The determinant of the matrix.
    """
    if matrix == [[]]:
        return 1
    n = len(matrix)
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
