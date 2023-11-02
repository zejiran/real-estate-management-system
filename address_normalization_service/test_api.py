import unittest
from unittest.mock import patch
from main import app
from api_handler import similarity


class TestAPI(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()

    @patch('api_handler.fetch_countries')
    def test_get_countries_with_match(self, mock_fetch_countries):
        mock_fetch_countries.return_value = [
            {
                'country_name': 'Niger',
                'country_short_name': 'NE',
                'country_phone_code': 227
            },
            {
                'country_name': 'Nigeria',
                'country_short_name': 'NG',
                'country_phone_code': 234
            }
        ]
        response = self.app.get('/countries?name=Nigeri')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Niger', response.data)
        self.assertIn(b'Nigeria', response.data)

    def test_similarity_with_valid_similarity(self):
        a = 'Colomvi'
        b = 'Colombia'
        result = similarity(a, b)
        self.assertGreaterEqual(result, 0.8)

    def test_similarity_with_invalid_similarity(self):
        a = 'abc'
        b = 'xyz'
        result = similarity(a, b)
        self.assertLess(result, 0.8)

    def test_get_countries_with_no_match(self):
        with patch('api_handler.fetch_countries', return_value=[]):
            response = self.app.get('/countries?name=XYZ')
            self.assertEqual(response.status_code, 200)
            self.assertNotIn(b'Niger', response.data)
            self.assertNotIn(b'Nigeria', response.data)

    def test_get_countries_with_exact_match(self):
        with patch('api_handler.fetch_countries', return_value=[{'country_name': 'Colombia'}]):
            response = self.app.get('/countries?name=Colombia')
            self.assertEqual(response.status_code, 200)
            self.assertIn(b'regions', response.data)

    def test_get_countries_with_partial_match(self):
        with patch('api_handler.fetch_countries', return_value=[{'country_name': 'ColombiaXYZ'}, {'country_name': 'ColombiaABC'}]):
            response = self.app.get('/countries?name=Colombia')
            self.assertEqual(response.status_code, 200)
            self.assertIn(b'ColombiaXYZ', response.data)
            self.assertIn(b'ColombiaABC', response.data)


if __name__ == '__main__':
    unittest.main()
