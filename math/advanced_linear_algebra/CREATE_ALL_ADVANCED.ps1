# CREATE_ALL_ADVANCED.ps1 - Creates all advanced linear algebra files
# Run: .\CREATE_ALL_ADVANCED.ps1

$files = @{
    '0-determinant.py' = @'
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
'@

    '1-minor.py' = @'
#!/usr/bin/env python3
"""Module to calculate minor matrix."""


def minor(matrix):
    """Calculate the minor matrix of a matrix.

    Args:
        matrix: A list of lists representing a square matrix.

    Returns:
        list: The minor matrix.

    Raises:
        TypeError: If matrix is not a list of lists.
        ValueError: If matrix is not square or is empty.
    """
    if not isinstance(matrix, list) or not all(isinstance(row, list) for row in matrix):
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
'@

    '2-cofactor.py' = @'
#!/usr/bin/env python3
"""Module to calculate cofactor matrix."""


def cofactor(matrix):
    """Calculate the cofactor matrix of a matrix.

    Args:
        matrix: A list of lists representing a square matrix.

    Returns:
        list: The cofactor matrix.

    Raises:
        TypeError: If matrix is not a list of lists.
        ValueError: If matrix is not square or is empty.
    """
    if not isinstance(matrix, list) or not all(isinstance(row, list) for row in matrix):
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
    if not isinstance(matrix, list) or not all(isinstance(row, list) for row in matrix):
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
'@

    '3-adjugate.py' = @'
#!/usr/bin/env python3
"""Module to calculate adjugate matrix."""


def adjugate(matrix):
    """Calculate the adjugate matrix of a matrix.

    Args:
        matrix: A list of lists representing a square matrix.

    Returns:
        list: The adjugate matrix.

    Raises:
        TypeError: If matrix is not a list of lists.
        ValueError: If matrix is not square or is empty.
    """
    if not isinstance(matrix, list) or not all(isinstance(row, list) for row in matrix):
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
    if not isinstance(matrix, list) or not all(isinstance(row, list) for row in matrix):
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
    if not isinstance(matrix, list) or not all(isinstance(row, list) for row in matrix):
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
'@

    '4-inverse.py' = @'
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
    if not isinstance(matrix, list) or not all(isinstance(row, list) for row in matrix):
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
    if not isinstance(matrix, list) or not all(isinstance(row, list) for row in matrix):
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
    if not isinstance(matrix, list) or not all(isinstance(row, list) for row in matrix):
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
    if not isinstance(matrix, list) or not all(isinstance(row, list) for row in matrix):
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
'@

    '5-definiteness.py' = @'
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
'@

    'README.md' = @'
# Advanced Linear Algebra

This project contains advanced linear algebra functions.
'@
}

# Delete old files and create new ones with LF endings
Get-ChildItem *.py, README.md -ErrorAction SilentlyContinue | Remove-Item

foreach ($file in $files.GetEnumerator()) {
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($file.Value)
    [System.IO.File]::WriteAllBytes($file.Key, $bytes)
    Write-Host "Created $($file.Key)" -ForegroundColor Green
}

Write-Host "`nAll 7 files created with correct docstrings and LF line endings!" -ForegroundColor Cyan
Write-Host "Now run: git add . && git commit -m 'Advanced linear algebra' && git push" -ForegroundColor Yellow
