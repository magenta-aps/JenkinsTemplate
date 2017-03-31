from django.test import TestCase
from django.urls import reverse

class IndexPageTest(TestCase):
    """Unit-tests for the index page."""

    # pylint: disable=missing-docstring
    def test_index_view(self):
        response = self.client.get(reverse('index'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, "Hello, world. You're at the app index.")
