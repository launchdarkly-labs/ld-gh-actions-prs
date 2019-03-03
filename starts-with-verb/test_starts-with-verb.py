import pytest

import starts_with_verb


def test_fails_if_starts_with_a_noun():
    with pytest.raises(AssertionError):
        starts_with_verb.assert_starts_with_verb("Black dog")


def test_passes_with_a_negative_contraction():
    starts_with_verb.assert_starts_with_verb("Don't do it")


def test_fails_for_a_past_tense_verb():
    with pytest.raises(AssertionError):
        starts_with_verb.assert_starts_with_verb("Didn't do it")


def test_fails_when_starting_with_a_noun_that_is_also_verb():
    with pytest.raises(AssertionError):
        starts_with_verb.assert_starts_with_verb("Plan code works")


def test_lowercase_first_word():
    starts_with_verb.assert_starts_with_verb("Require pull requests to start with a verb")


def test_very_dry():
    starts_with_verb.assert_starts_with_verb("DRY up redundant code")
