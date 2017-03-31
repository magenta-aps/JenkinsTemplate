"""Django app views."""
from django.http import HttpResponse


def index(_):
    """Index page from which everything happens."""
    return HttpResponse("Hello, world. You're at the app index.")
