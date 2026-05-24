#!/usr/bin/env python3
"""Module to calculate matrix definiteness."""
import numpy as np


def definiteness(matrix):
    """Calculate the definiteness of a matrix.

    Args:
        matrix: A numpy.ndarray of shape (n, n).

    Returns:
        str or None: The definiteness classification, or None if invalid.

    Raises:
        TypeError: If matrix is not a numpy.ndarray.
    """
    if not isinstance(matrix, np.ndarray):
        raise TypeError("matrix must be a numpy.ndarray")
    if len(matrix.shape) != 2 or matrix.shape[0] != matrix.shape[1]:
        return None
    if matrix.size == 0:
        return None
    if not np.all(matrix.T == matrix):
        return None
    eigenvalues = np.linalg.eigvals(matrix)
    real_parts = np.real(eigenvalues)
    tol = 1e-10
    all_positive = all(r > tol for r in real_parts)
    all_nonnegative = all(r >= -tol for r in real_parts)
    all_negative = all(r < -tol for r in real_parts)
    all_nonpositive = all(r <= tol for r in real_parts)
    any_positive = any(r > tol for r in real_parts)
    any_negative = any(r < -tol for r in real_parts)
    if all_positive:
        return "Positive definite"
    if all_nonnegative and any(abs(r) < tol for r in real_parts):
        return "Positive semi-definite"
    if all_negative:
        return "Negative definite"
    if all_nonpositive and any(abs(r) < tol for r in real_parts):
        return "Negative semi-definite"
    if any_positive and any_negative:
        return "Indefinite"
    return None