import unittest

from app import is_prime
from app import calculate_nth_prime

class TestMethods(unittest.TestCase):
    def test_is_prime(self):
        self.assertEqual(is_prime(-1), True)
        self.assertEqual(is_prime(2), True)
        self.assertEqual(is_prime(100), False)
        self.assertEqual(is_prime(12345), False)

    def test_calculate_nth_prime(self):
        self.assertEqual(calculate_nth_prime(1), 1)
        self.assertEqual(calculate_nth_prime(2), 2)
        self.assertEqual(calculate_nth_prime(3), 3)
        self.assertEqual(calculate_nth_prime(10), 23)
        self.assertEqual(calculate_nth_prime(101), None)
        self.assertEqual(calculate_nth_prime(-1), None)

if __name__ == '__main__':
    unittest.main()
