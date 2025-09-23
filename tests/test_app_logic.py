import sys
import os
import pytest

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from app_logic import add, is_even, reverse_string, capitalize_words, divide

def test_add():
    assert add(2, 3) == 5

def test_is_even():
    assert is_even(4)
    assert not is_even(3)

def test_reverse_string():
    assert reverse_string("abc") == "cba"

def test_capitalize_words():
    assert capitalize_words("hello world") == "Hello World"

def test_divide():
    with pytest.raises(ZeroDivisionError):
        divide(1, 0)
    assert divide(6, 3) == 2
