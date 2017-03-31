"""Unit-tests for app."""
from django.test import TestCase
from django.urls import reverse


class IndexPageTest(TestCase):
    """Unit-tests for the index page."""

    def test_index_view(self):
        """Test that the index view works."""
        response = self.client.get(reverse('index'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, "Hello, world. You're at the app index.")
