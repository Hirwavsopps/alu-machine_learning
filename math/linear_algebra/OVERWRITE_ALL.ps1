# OVERWRITE_ALL.ps1 - Creates all 15 linear algebra files with CORRECT docstrings
# Run this in your linear_algebra folder: .\OVERWRITE_ALL.ps1

$files = @{
    '0-slice_me_up.py' = @'
#!/usr/bin/env python3
arr = [9, 8, 2, 3, 9, 4, 1, 0, 3]
arr1 = arr[:2]
arr2 = arr[-5:]
arr3 = arr[1:6]
print("The first two numbers of the array are: {}".format(arr1))
print("The last five numbers of the array are: {}".format(arr2))
print("The 2nd through 6th numbers of the array are: {}".format(arr3))
'@

    '1-trim_me_down.py' = @'
#!/usr/bin/env python3
matrix = [[1, 3, 9, 4, 5, 8], [2, 4, 7, 3, 4, 0], [0, 3, 4, 6, 1, 5]]
the_middle = []
for row in matrix:
    the_middle.append([row[2], row[3]])
print("The middle columns of the matrix are: {}".format(the_middle))
'@

    '2-size_me_please.py' = @'
#!/usr/bin/env python3
"""Module to calculate matrix shape."""


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
'@

    '3-flip_me_over.py' = @'
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
'@

    '4-line_up.py' = @'
#!/usr/bin/env python3
"""Module for element-wise array addition."""


def add_arrays(arr1, arr2):
    """Add two arrays element-wise.

    Args:
        arr1: First list of ints/floats.
        arr2: Second list of ints/floats.

    Returns:
        list: New list with element-wise sums, or None if shapes differ.
    """
    if len(arr1) != len(arr2):
        return None
    return [arr1[i] + arr2[i] for i in range(len(arr1))]
'@

    '5-across_the_planes.py' = @'
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
'@

    '6-howdy_partner.py' = @'
#!/usr/bin/env python3
"""Module for array concatenation."""


def cat_arrays(arr1, arr2):
    """Concatenate two arrays.

    Args:
        arr1: First list of ints/floats.
        arr2: Second list of ints/floats.

    Returns:
        list: New list with arr2 appended to arr1.
    """
    return arr1 + arr2
'@

    '7-gettin_cozy.py' = @'
#!/usr/bin/env python3
"""Module for 2D matrix concatenation along an axis."""


def cat_matrices2D(mat1, mat2, axis=0):
    """Concatenate two 2D matrices along a specific axis.

    Args:
        mat1: First 2D matrix.
        mat2: Second 2D matrix.
        axis: 0 for vertical, 1 for horizontal.

    Returns:
        list: New concatenated matrix, or None if incompatible.
    """
    if axis == 0:
        if len(mat1[0]) != len(mat2[0]):
            return None
        return mat1 + mat2
    elif axis == 1:
        if len(mat1) != len(mat2):
            return None
        return [mat1[i] + mat2[i] for i in range(len(mat1))]
    return None
'@

    '8-ridin_bareback.py' = @'
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
'@

    '9-let_the_butcher_slice_it.py' = @'
#!/usr/bin/env python3
import numpy as np
matrix = np.array([[1, 2, 3, 4, 5, 6], [7, 8, 9, 10, 11, 12],
                   [13, 14, 15, 16, 17, 18], [19, 20, 21, 22, 23, 24]])
mat1 = matrix[1:3, :]
mat2 = matrix[:, 2:4]
mat3 = matrix[1:, 3:]
print("The middle two rows of the matrix are:\n{}".format(mat1))
print("The middle two columns of the matrix are:\n{}".format(mat2))
print("The bottom-right, square, 3x3 matrix is:\n{}".format(mat3))
'@

    '10-ill_use_my_scale.py' = @'
#!/usr/bin/env python3
"""Module for getting numpy array shape."""


def np_shape(matrix):
    """Calculate the shape of a numpy.ndarray.

    Args:
        matrix: A numpy.ndarray.

    Returns:
        tuple: Dimensions of the array.
    """
    return matrix.shape
'@

    '11-the_western_exchange.py' = @'
#!/usr/bin/env python3
"""Module for numpy transpose."""


def np_transpose(matrix):
    """Transpose a numpy.ndarray.

    Args:
        matrix: A numpy.ndarray.

    Returns:
        numpy.ndarray: Transposed array.
    """
    return matrix.transpose()
'@

    '12-bracin_the_elements.py' = @'
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
'@

    '13-cats_got_your_tongue.py' = @'
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
'@

    '14-saddle_up.py' = @'
#!/usr/bin/env python3
"""Module for numpy matrix multiplication."""
import numpy as np


def np_matmul(mat1, mat2):
    """Perform matrix multiplication on two numpy arrays.

    Args:
        mat1: First numpy.ndarray.
        mat2: Second numpy.ndarray.

    Returns:
        numpy.ndarray: Result of matrix multiplication.
    """
    return np.matmul(mat1, mat2)
'@

    'README.md' = @'
# Linear Algebra

This project contains linear algebra functions for machine learning.
'@
}

# Delete old files and create new ones with LF endings
Get-ChildItem *.py, README.md -ErrorAction SilentlyContinue | Remove-Item

foreach ($file in $files.GetEnumerator()) {
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($file.Value)
    [System.IO.File]::WriteAllBytes($file.Key, $bytes)
    Write-Host "Created $($file.Key)" -ForegroundColor Green
}

Write-Host "`nAll 16 files created with correct docstrings and LF line endings!" -ForegroundColor Cyan
Write-Host "Now run: git add . && git commit -m 'Fix docstrings' && git push" -ForegroundColor Yellow
